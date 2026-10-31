package app.morphe.patches.mapsautomotive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.logging.Logger

// BYD's GPS watchdog turns location off and on again within about 70 ms when it sees no
// satellites, and each flip made Maps show its location lockout for a moment. Maps' lockout
// controller keeps PROVIDERS_CHANGED and MODE_CHANGED in a static set, recomputes its lockouts from
// LocationManager.isLocationEnabled(), and its receiver calls that recomputation for those actions.
// The receiver first asks LocationLockoutPatch, which holds a location-off broadcast back for up to
// 3 s while its feature switch is on. A separate patch on top of the core one.
// Required: a missing anchor, an ambiguity or an unknown layout fails the patch.

private const val LOCATION_LOCKOUT_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/LocationLockoutPatch;"
private const val PROVIDERS_CHANGED = "android.location.PROVIDERS_CHANGED"
private const val MODE_CHANGED = "android.location.MODE_CHANGED"
private const val IS_LOCATION_ENABLED = "Landroid/location/LocationManager;->isLocationEnabled()Z"
private const val BROADCAST_RECEIVER = "Landroid/content/BroadcastReceiver;"
private const val LOCATION_MANAGER = "Landroid/location/LocationManager;"
private val onReceiveParameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;")
private val locationLockoutLogger = Logger.getLogger("app.morphe.patches.mapsautomotive.LocationLockoutPatch")

@Suppress("unused")
val bydLocationFlickerPatch = bytecodePatch(
    name = "BYD location flicker fix",
    description = "Holds back BYD's brief location off/on flips for up to 3 s, so Maps does not flash its location lockout.",
    default = true,
) {
    compatibleWith(compatibility)
    dependsOn(automotiveMicroGPatch)

    execute {
        delayLocationLockout()
        IncludedFeatures.features += "location_lockout_delay"
    }
}

private fun BytecodePatchContext.delayLocationLockout() {
    val extension = classDefByOrNull(LOCATION_LOCKOUT_CLASS)
        ?: throw PatchException("Missing extension class $LOCATION_LOCKOUT_CLASS")
    if (extension.methods.none {
            it.name == "deferLocationChange" && it.returnType == "Z" &&
                it.parameterTypes.map { type -> type.toString() } == listOf(BROADCAST_RECEIVER) + onReceiveParameters &&
                AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags)
        }
    ) {
        throw PatchException("LocationLockoutPatch lacks deferLocationChange")
    }

    val (controller, actions) = lockoutController()
    val receiver = lockoutReceiver(controller, actions)
    val instructions = receiver.implementation!!.instructions.toList()
    // The receiver starts by loading the action set, which writes a register without reading one;
    // that register holds the extension's answer.
    val first = instructions.first()
    if (first.opcode != Opcode.SGET_OBJECT) throw PatchException("$receiver does not start by reading $actions")
    val answer = (first as OneRegisterInstruction).registerA

    val mutable = mutableMethodOf(receiver)
    mutable.addInstructionsWithLabels(
        0,
        """
            invoke-static { p0, p1, p2 }, $LOCATION_LOCKOUT_CLASS->deferLocationChange($BROADCAST_RECEIVER${onReceiveParameters.joinToString("")})Z
            move-result v$answer
            if-eqz v$answer, :morphe_location_change
            return-void
        """.trimIndent(),
        ExternalLabel("morphe_location_change", mutable.implementation!!.instructions[0]),
    )
    locationLockoutLogger.info("Location lockout: receiver $receiver, controller ${controller.type}, actions $actions")
}

// The class whose static initializer puts PROVIDERS_CHANGED and MODE_CHANGED into one static field
// and which reads LocationManager.isLocationEnabled() (in 120003.E through an R8 API outline).
private fun BytecodePatchContext.lockoutController(): Pair<ClassDef, FieldReference> {
    val found = mutableListOf<Pair<ClassDef, FieldReference>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        val clinit = classDef.methods.firstOrNull { it.name == "<clinit>" && it.implementation != null } ?: return@classDefForEach
        val code = clinit.implementation!!.instructions.toList()
        val providers = code.indexOfFirst { it.stringValue() == PROVIDERS_CHANGED }
        if (providers < 0 || code.getOrNull(providers + 1)?.stringValue() != MODE_CHANGED) return@classDefForEach
        if (classDef.methods.none { readsLocationEnabled(it) }) return@classDefForEach
        val store = (providers + 2 until minOf(code.size, providers + 5)).firstOrNull { code[it].opcode == Opcode.SPUT_OBJECT }
            ?: throw PatchException("The location actions are not stored in a static field in ${classDef.type}")
        val field = (code[store] as ReferenceInstruction).reference as FieldReference
        if (field.definingClass != classDef.type) throw PatchException("Unexpected location action store $field")
        found += classDef to field
    }
    return found.singleOrNull()
        ?: throw PatchException("Expected one location lockout controller, found ${found.joinToString { it.first.type }}")
}

// A direct call, or a call of a static (LocationManager)Z method that makes it.
private fun BytecodePatchContext.readsLocationEnabled(method: Method) =
    method.implementation?.instructions?.any { instruction ->
        memberKey(instruction) == IS_LOCATION_ENABLED || instruction.opcode == Opcode.INVOKE_STATIC &&
            ((instruction as ReferenceInstruction).reference as MethodReference).let { call ->
                call.returnType == "Z" && call.parameterTypes.map { it.toString() } == listOf(LOCATION_MANAGER) &&
                    classDefByOrNull(call.definingClass)?.methods?.any { outline ->
                        outline.name == call.name && outline.parameterTypes == call.parameterTypes &&
                            outline.implementation?.instructions?.any { memberKey(it) == IS_LOCATION_ENABLED } == true
                    } == true
            }
    } == true

// The BroadcastReceiver whose onReceive reads [actions] and calls one no-argument method of [controller].
private fun BytecodePatchContext.lockoutReceiver(controller: ClassDef, actions: FieldReference): Method {
    val found = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.superclass != BROADCAST_RECEIVER) return@classDefForEach
        classDef.methods.filter {
            it.name == "onReceive" && it.returnType == "V" && it.implementation != null &&
                it.parameterTypes.map { type -> type.toString() } == onReceiveParameters
        }.forEach { method ->
            val code = method.implementation!!.instructions.toList()
            val readsActions = code.any {
                it.opcode == Opcode.SGET_OBJECT && ((it as ReferenceInstruction).reference as FieldReference).let { field ->
                    field.definingClass == actions.definingClass && field.name == actions.name && field.type == actions.type
                }
            }
            val recomputes = code.count {
                it.opcode == Opcode.INVOKE_VIRTUAL && ((it as ReferenceInstruction).reference as MethodReference).let { call ->
                    call.definingClass == controller.type && call.parameterTypes.isEmpty() && call.returnType == "V"
                }
            } == 1
            if (readsActions && recomputes) found += method
        }
    }
    return found.singleOrNull()
        ?: throw PatchException("Expected one location lockout receiver, found ${found.joinToString()}")
}

private fun Instruction.stringValue() =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
