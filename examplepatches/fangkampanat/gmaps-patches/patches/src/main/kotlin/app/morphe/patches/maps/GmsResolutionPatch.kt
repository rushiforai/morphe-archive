package app.morphe.patches.maps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.logging.Logger

private const val STATUS_CLASS = "Lcom/google/android/gms/common/api/Status;"
private const val ACTIVITY_CLASS = "Landroid/app/Activity;"
private const val GMS_RESOLUTION_CLASS = "Lapp/morphe/extension/maps/patches/GmsResolutionPatch;"
private const val SEND_INTENT_EXCEPTION = "Landroid/content/IntentSender\$SendIntentException;"
private const val INTENT_SENDER_REQUEST_ACTION = "androidx.activity.result.contract.action.INTENT_SENDER_REQUEST"
private const val INTENT_SENDER_REQUEST_EXTRA = "androidx.activity.result.contract.extra.INTENT_SENDER_REQUEST"
private val resolutionParameters = listOf(ACTIVITY_CLASS, "I")
private val startIntentSenderParameters = listOf(
    "Landroid/content/IntentSender;", "I", "Landroid/content/Intent;", "I", "I", "I", "Landroid/os/Bundle;",
)
// Handlers that would take a SendIntentException before a handler for its exact type.
private val sendIntentSupertypes = setOf(
    "Landroid/util/AndroidException;", "Ljava/lang/Exception;", "Ljava/lang/Throwable;",
)
private val logger = Logger.getLogger("app.morphe.patches.maps.GmsResolutionPatch")

/**
 * MicroG-RE 7.2.1 and 7.2.2 answer a location-settings check with a PendingIntent whose action the
 * provider does not declare. Starting it throws ActivityNotFoundException, while Maps expects only
 * SendIntentException (issue #15). Route both Activity launch points through the extension, which
 * reports the missing activity as SendIntentException. Resolutions that start keep the original call.
 */
internal fun BytecodePatchContext.patchGmsResolutionStart() {
    patchStatusResolution()
    patchRegistryIntentSenderLaunch()
}

/** Status.startResolutionForResult: every Maps caller catches SendIntentException and skips the dialog. */
private fun BytecodePatchContext.patchStatusResolution() {
    val status = classDefByOrNull(STATUS_CLASS) ?: throw PatchException("Missing $STATUS_CLASS")
    val resolution = status.methods.filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
            it.parameterTypes.map { type -> type.toString() } == resolutionParameters
    }.singleOrNull() ?: throw PatchException("Status resolution: expected one instance (Activity, int) method")
    mutableClassDefBy(STATUS_CLASS).methods.single {
        it.name == resolution.name && it.returnType == "V" && it.parameterTypes == resolution.parameterTypes
    }.guardActivityLaunch("Status resolution", caughtHere = false)
}

/**
 * Fragment.startIntentSenderForResult (location sharing) and the other IntentSender launchers go
 * through the AndroidX ActivityResultRegistry. Its onLaunch already turns SendIntentException into
 * RESULT_CANCELED for the requester, which also keeps FragmentManager's pending-result queue in order.
 */
private fun BytecodePatchContext.patchRegistryIntentSenderLaunch() {
    val onLaunch = uniqueMapsHook(Fingerprint(
        returnType = "V",
        parameters = listOf("I", "L", "Ljava/lang/Object;"),
        custom = { method, _ ->
            method.implementation?.instructions?.let { code ->
                val strings = code.mapNotNull { it.getReference<StringReference>()?.string }.toSet()
                INTENT_SENDER_REQUEST_ACTION in strings && INTENT_SENDER_REQUEST_EXTRA in strings &&
                    code.any {
                        it.getReference<MethodReference>()?.let { call ->
                            call.definingClass == ACTIVITY_CLASS && call.name == "startIntentSenderForResult"
                        } == true
                    }
            } == true
        },
    ), "ActivityResultRegistry IntentSender launch")!!
    onLaunch.guardActivityLaunch("ActivityResultRegistry IntentSender launch", caughtHere = true)
}

/**
 * Replace the method's single Activity.startIntentSenderForResult call with the extension wrapper.
 * With [caughtHere], the converted exception must reach this method's own SendIntentException handler.
 */
private fun MutableMethod.guardActivityLaunch(label: String, caughtHere: Boolean) {
    fun fail(reason: String): Nothing = throw PatchException("Unrecognized $label layout: $reason; method=$this")
    val implementation = implementation ?: fail("abstract method")
    val code = implementation.instructions.toList()

    // Count every startIntentSenderForResult overload so a second launch cannot stay unguarded.
    val launches = code.indices.filter {
        code[it].getReference<MethodReference>()?.name == "startIntentSenderForResult"
    }
    val index = launches.singleOrNull() ?: fail("expected one startIntentSenderForResult call, found $launches")
    val launch = code[index]
    val target = launch.getReference<MethodReference>()!!
    // Receiver plus seven arguments needs eight registers, so the call is always a range invoke.
    val range = launch as? RegisterRangeInstruction ?: fail("launch is not a range invoke: ${launch.opcode}")
    if (launch.opcode != Opcode.INVOKE_VIRTUAL_RANGE || range.registerCount != 8 ||
        target.definingClass != ACTIVITY_CLASS || target.returnType != "V" ||
        target.parameterTypes.map { it.toString() } != startIntentSenderParameters
    ) fail("unexpected launch $target via ${launch.opcode}")

    if (caughtHere) {
        val address = code.take(index).sumOf { it.codeUnits }
        val handlers = implementation.tryBlocks.filter {
            address >= it.startCodeAddress && address < it.startCodeAddress + it.codeUnitCount
        }.flatMap { block -> block.exceptionHandlers.map { it.exceptionType } }
        val first = handlers.firstOrNull { it == null || it == SEND_INTENT_EXCEPTION || it in sendIntentSupertypes }
        if (first != SEND_INTENT_EXCEPTION) fail("launch at $index is not handled as SendIntentException: $handlers")
    }

    replaceInstruction(
        index,
        "invoke-static/range { v${range.startRegister} .. v${range.startRegister + 7} }, " +
            "$GMS_RESOLUTION_CLASS->startIntentSenderForResult(Landroid/app/Activity;" +
            "Landroid/content/IntentSender;ILandroid/content/Intent;IIILandroid/os/Bundle;)V",
    )
    logger.info("GMS resolution: $label $this launch at $index guarded")
}
