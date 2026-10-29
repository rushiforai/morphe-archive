package app.morphe.patches.maps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.logging.Logger

private const val PIP_CLASS = "Lapp/morphe/extension/maps/patches/PictureInPicturePatch;"
private const val MAPS_ACTIVITY = "Lcom/google/android/maps/MapsActivity;"
private const val ACTIVITY = "Landroid/app/Activity;"
private const val PARAMS = "Landroid/app/PictureInPictureParams;"
private const val PARAMS_BUILDER = "Landroid/app/PictureInPictureParams\$Builder;"
private const val ENTER = "enterPictureInPictureMode"
private const val AUTO_ENTER = "setAutoEnterEnabled"
private val virtualCalls = setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)
private val log = Logger.getLogger("app.morphe.patches.maps.PictureInPicturePatch")

private class PipCall(val method: Method, val index: Int, val call: MethodReference)

private fun pipGuard(ok: Boolean, why: String, at: Any) {
    if (!ok) throw PatchException("Unrecognized picture-in-picture layout: $why in $at")
}

/**
 * Maps enters picture-in-picture in two ways (inspected on 26.41 and 26.42). MapsActivity's onUserLeaveHint calls
 * enterPictureInPictureMode, the only path below Android 12. Navigation also requests auto-enter through
 * PictureInPictureParams.Builder.setAutoEnterEnabled on Android 12+. Each must be the app's only call of its API,
 * so no entry stays outside the switch. The extension only reads the switch; the framework calls stay in Maps.
 */
@Suppress("unused")
val pictureInPictureSettingPatch = bytecodePatch(
    name = "Picture-in-picture setting",
    description = "Adds a Picture-in-picture On/Off setting to Maps Settings. Turn it off so navigation does not " +
        "open a small window when you leave Maps; it starts on, as in Maps. Hooks inspected on Maps 26.41 and 26.42.",
    default = false,
) {
    compatibleWith(compatibility)
    dependsOn(googleMapsMicroGPatch, mapsSettingsRowsPatch)

    execute {
        // Both entry points must pass before any mutation.
        val leaveHint = findSuperclassHook(MAPS_ACTIVITY, "picture-in-picture leave hint") {
            it.name == "onUserLeaveHint" && it.returnType == "V" && it.parameterTypes.isEmpty()
        }
        val calls = pictureInPictureCalls()
        val enter = calls.only(ENTER)
        val autoEnter = calls.only(AUTO_ENTER)
        pipGuard(enter.method.toString() == leaveHint.toString(), "explicit entry outside onUserLeaveHint", enter.method)
        pipGuard(enter.call.parameterTypes.map { it.toString() } == listOf(PARAMS) && enter.call.returnType == "Z" &&
            isActivity(enter.call.definingClass), "explicit entry is not Activity.enterPictureInPictureMode(params)", enter.call)
        pipGuard(autoEnter.call.definingClass == PARAMS_BUILDER && autoEnter.call.returnType == PARAMS_BUILDER &&
            autoEnter.call.parameterTypes.map { it.toString() } == listOf("Z"), "auto-enter is not the framework builder setter",
            autoEnter.call)

        val enterMethod = mutable(enter.method)
        val enterCode = enterMethod.implementation!!.instructions
        val enterCall = enterCode[enter.index]
        val enterOperands = enterCall.invokeRegisters()
        pipGuard(enterCall.getReference<MethodReference>()?.toString() == enter.call.toString() &&
            enterCall.opcode in virtualCalls && enterOperands?.size == 2,
            "explicit entry is not a two-register virtual call at ${enter.index}", enterMethod)

        // The filtered value overwrites the setter's boolean operand, so that register must be dead after the call:
        // the setter's result has to be returned at once. Without a label here, no branch or try range skips the filter.
        val autoEnterMethod = mutable(autoEnter.method)
        val autoCode = autoEnterMethod.implementation!!.instructions
        val autoCall = autoCode[autoEnter.index]
        val autoOperands = autoCall.invokeRegisters()
        val result = autoCode.getOrNull(autoEnter.index + 1)
        val returned = autoCode.getOrNull(autoEnter.index + 2)
        pipGuard(autoCall.getReference<MethodReference>()?.toString() == autoEnter.call.toString() &&
            autoCall.opcode in virtualCalls && autoOperands?.size == 2 && autoOperands[1] <= 255 &&
            result?.opcode == Opcode.MOVE_RESULT_OBJECT && returned?.opcode == Opcode.RETURN_OBJECT &&
            (result as OneRegisterInstruction).registerA == (returned as OneRegisterInstruction).registerA,
            "auto-enter setter result is not returned at once", autoEnterMethod)
        pipGuard(autoCall.location.labels.isEmpty(),
            "branch or try boundary at the auto-enter call", autoEnterMethod)

        val enterSize = enterCode.size
        enterMethod.replaceInstruction(enter.index, staticCall(enterCall, enterOperands!!,
            "enterPictureInPictureMode(Landroid/app/Activity;Landroid/app/PictureInPictureParams;)Z"))
        val routed = enterMethod.implementation!!.instructions
        pipGuard(routed.size == enterSize && routed[enter.index].getReference<MethodReference>()?.toString() ==
            "$PIP_CLASS->enterPictureInPictureMode(Landroid/app/Activity;Landroid/app/PictureInPictureParams;)Z",
            "explicit entry routed in place", enterMethod)

        val value = autoOperands!![1]
        val autoSize = autoCode.size
        val filter = if (value <= 15) "invoke-static { v$value }" else "invoke-static/range { v$value .. v$value }"
        autoEnterMethod.addInstructions(autoEnter.index, """
            $filter, $PIP_CLASS->autoEnter(Z)Z
            move-result v$value
        """.trimIndent())
        val filtered = autoEnterMethod.implementation!!.instructions
        pipGuard(filtered.size == autoSize + 2 &&
            filtered[autoEnter.index].opcode == (if (value <= 15) Opcode.INVOKE_STATIC else Opcode.INVOKE_STATIC_RANGE) &&
            filtered[autoEnter.index + 1].opcode == Opcode.MOVE_RESULT &&
            filtered[autoEnter.index + 2].getReference<MethodReference>()?.toString() == autoEnter.call.toString(),
            "auto-enter value filtered before the setter", autoEnterMethod)

        enableSettingsRow("pictureInPictureRow")
        log.info("Picture-in-picture: explicit entry ${enter.method}@${enter.index}; " +
            "auto-enter ${autoEnter.method}@${autoEnter.index} (v$value); Settings row enabled")
    }
}

/** Every Maps call of the two PiP entry APIs, by method name so an added overload is counted too. */
private fun BytecodePatchContext.pictureInPictureCalls(): Map<String, List<PipCall>> {
    val calls = mapOf(ENTER to mutableListOf<PipCall>(), AUTO_ENTER to mutableListOf())
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        classDef.methods.forEach { method ->
            method.implementation?.instructions?.forEachIndexed { index, instruction ->
                val call = instruction.getReference<MethodReference>() ?: return@forEachIndexed
                calls[call.name]?.add(PipCall(method, index, call))
            }
        }
    }
    return calls
}

private fun Map<String, List<PipCall>>.only(name: String): PipCall = getValue(name).let { found ->
    found.singleOrNull() ?: throw PatchException(
        "Picture-in-picture: expected one $name call, found ${found.map { "${it.method}@${it.index}" }}")
}

private fun BytecodePatchContext.isActivity(type: String): Boolean {
    var current: String? = type
    val seen = mutableSetOf<String>()
    while (current != null && seen.add(current)) {
        if (current == ACTIVITY) return true
        current = classDefByOrNull(current)?.superclass
    }
    return false
}

private fun BytecodePatchContext.mutable(method: Method): MutableMethod =
    mutableClassDefBy(method.definingClass).methods.single { it.toString() == method.toString() }

/** Same operands as the replaced virtual call, receiver first, so result and exceptions keep their flow. */
private fun staticCall(call: Instruction, operands: List<Int>, target: String): String =
    if (call.opcode == Opcode.INVOKE_VIRTUAL_RANGE) {
        "invoke-static/range { v${operands.first()} .. v${operands.last()} }, $PIP_CLASS->$target"
    } else {
        "invoke-static { ${operands.joinToString { "v$it" }} }, $PIP_CLASS->$target"
    }
