/*
 * Adapted from gmaps-patches by fangkampanat, https://github.com/fangkampanat/gmaps-patches
 * See the included NOTICE file for the GPLv3 section 7 terms that apply to this code.
 */

package io.github.hyperstown.patches.maps.misc.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.hyperstown.patches.maps.shared.Constants.EXTENSION_PACKAGE
import io.github.hyperstown.patches.util.invokeStaticWithSameRegisters
import io.github.hyperstown.patches.util.parameterTypeNames
import io.github.hyperstown.patches.util.signatureEquals
import io.github.hyperstown.patches.util.uniqueMethod
import java.util.logging.Logger

private const val EXTENSION_CLASS = "${EXTENSION_PACKAGE}GmsResolution;"
private const val STATUS_CLASS = "Lcom/google/android/gms/common/api/Status;"
private const val ACTIVITY_CLASS = "Landroid/app/Activity;"
private const val SEND_INTENT_EXCEPTION = "Landroid/content/IntentSender\$SendIntentException;"
private const val INTENT_SENDER_REQUEST_ACTION = "androidx.activity.result.contract.action.INTENT_SENDER_REQUEST"
private const val INTENT_SENDER_REQUEST_EXTRA = "androidx.activity.result.contract.extra.INTENT_SENDER_REQUEST"

private val START_INTENT_SENDER_PARAMETERS = listOf(
    "Landroid/content/IntentSender;", "I", "Landroid/content/Intent;", "I", "I", "I", "Landroid/os/Bundle;",
)

/** Exception handlers that would catch a SendIntentException before a handler for its exact type. */
private val SEND_INTENT_EXCEPTION_SUPERTYPES = setOf(
    "Landroid/util/AndroidException;",
    "Ljava/lang/Exception;",
    "Ljava/lang/Throwable;",
)

/**
 * MicroG-RE answers a location settings check with a resolution that no activity handles.
 * Starting it throws ActivityNotFoundException, but Maps only expects SendIntentException, and crashes
 * when "My location" or directions from the current location are used. Both places that start
 * resolutions now report a missing activity as SendIntentException, which Maps already handles.
 */
internal val gmsResolutionPatch = bytecodePatch {
    dependsOn(sharedExtensionPatch)

    execute {
        // Status.startResolutionForResult(Activity, int). Every caller catches SendIntentException.
        val status = classDefByOrNull(STATUS_CLASS) ?: throw PatchException("Could not find $STATUS_CLASS")
        val startResolution = status.methods.singleOrNull {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
                it.parameterTypeNames() == listOf(ACTIVITY_CLASS, "I")
        } ?: throw PatchException("Could not find Status.startResolutionForResult")
        mutableClassDefBy(STATUS_CLASS).methods.single { it.signatureEquals(startResolution) }
            .guardStartIntentSender(caughtHere = false)

        // The AndroidX ActivityResultRegistry launch, used by Fragment.startIntentSenderForResult.
        // It already turns SendIntentException into RESULT_CANCELED for the requester.
        uniqueMethod(IntentSenderRequestLaunchFingerprint, "ActivityResultRegistry IntentSender launch")
            .guardStartIntentSender(caughtHere = true)
    }
}

/**
 * Replace the single Activity.startIntentSenderForResult call with the extension.
 * With [caughtHere], the method must itself handle SendIntentException around the call.
 */
private fun MutableMethod.guardStartIntentSender(caughtHere: Boolean) {
    fun fail(reason: String): Nothing = throw PatchException("Unrecognized resolution launch in $this: $reason")

    val implementation = implementation ?: fail("abstract method")
    val code = implementation.instructions.toList()

    // Every overload counts, so that a second launch cannot stay unguarded.
    val index = code.indices.filter { code[it].getReference<MethodReference>()?.name == "startIntentSenderForResult" }
        .singleOrNull() ?: fail("expected one startIntentSenderForResult call")
    val launch = code[index]
    val target = launch.getReference<MethodReference>()!!

    // The receiver and seven arguments need eight registers, so the call is always a range invoke.
    if (launch.opcode != Opcode.INVOKE_VIRTUAL_RANGE || (launch as RegisterRangeInstruction).registerCount != 8 ||
        target.definingClass != ACTIVITY_CLASS || target.returnType != "V" ||
        target.parameterTypeNames() != START_INTENT_SENDER_PARAMETERS
    ) {
        fail("unexpected call $target via ${launch.opcode}")
    }

    if (caughtHere) {
        val address = code.take(index).sumOf { it.codeUnits }
        val handlers = implementation.tryBlocks
            .filter { address >= it.startCodeAddress && address < it.startCodeAddress + it.codeUnitCount }
            .flatMap { block -> block.exceptionHandlers.map { it.exceptionType } }
        val firstHandler = handlers.firstOrNull {
            it == null || it == SEND_INTENT_EXCEPTION || it in SEND_INTENT_EXCEPTION_SUPERTYPES
        }
        if (firstHandler != SEND_INTENT_EXCEPTION) fail("SendIntentException is not handled: $handlers")
    }

    replaceInstruction(
        index,
        invokeStaticWithSameRegisters(
            launch,
            "$EXTENSION_CLASS->startIntentSenderForResult(Landroid/app/Activity;Landroid/content/IntentSender;" +
                "ILandroid/content/Intent;IIILandroid/os/Bundle;)V",
        ),
    )

    Logger.getLogger("io.github.hyperstown.patches.maps.misc.gms").info("Guarded resolution launch in $this")
}

private object IntentSenderRequestLaunchFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I", "L", "Ljava/lang/Object;"),
    strings = listOf(INTENT_SENDER_REQUEST_ACTION, INTENT_SENDER_REQUEST_EXTRA),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            it.getReference<MethodReference>()?.let { call ->
                call.definingClass == ACTIVITY_CLASS && call.name == "startIntentSenderForResult"
            } == true
        } == true
    },
)
