package app.xperia.patches.sony.camera

import app.xperia.patches.sony.SONY_CAMERA
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/xperia/extension/sony/camera/XperiaFix;"
private const val HOLDER_CLASS = "Ljp/co/sony/mc/camera/device/CaptureRequestHolder;"
private const val BUILDER = "Landroid/hardware/camera2/CaptureRequest\$Builder;"
private const val KEY = "Landroid/hardware/camera2/CaptureRequest\$Key;"

/**
 * CaptureRequestHolder.setRequest(Builder, Key): every request key the app sends passes through here.
 * Original body (private, .locals 0): value = this.get(key); builder.set(key, value) inside a
 * try/catch IllegalArgumentException. Registers: p0=this(->value), p1=builder, p2=key.
 */
@Suppress("unused")
val xperia1VCameraCompatPatch = bytecodePatch(
    name = "Xperia 1 V camera HAL compatibility",
    description = "Makes the Xperia 1 VI camera app work on the Xperia 1 V camera HAL: truncates " +
            "objectSelectTriggerArea to the 4 ints the 1 V HAL defines and sends conditionDetectMode " +
            "alongside sceneDetectMode, which the 1 V HAL validates together.",
) {
    compatibleWith(SONY_CAMERA)

    extendWith("extensions/sony-camera.mpe")

    execute {
        val method = Fingerprint(
            definingClass = HOLDER_CLASS,
            name = "setRequest",
            parameters = listOf(BUILDER, KEY),
            returnType = "V",
        ).method

        val instructions = method.implementation!!.instructions.toList()
        val setIndex = instructions.indexOfFirst { insn ->
            insn.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((insn as ReferenceInstruction).reference as MethodReference).let {
                        it.definingClass == BUILDER && it.name == "set"
                    }
        }
        require(setIndex >= 0) { "CaptureRequest.Builder.set call not found in setRequest" }

        val registerCount = method.implementation!!.registerCount
        val paramStart = registerCount - 3 // this, builder, key
        val valueReg = paramStart      // p0 is reused for the value by the original code
        val builderReg = paramStart + 1
        val keyReg = paramStart + 2

        // After Builder.set: companion key.
        method.addInstructions(
            setIndex + 1,
            "invoke-static { v$builderReg, v$keyReg }, $EXTENSION_CLASS->afterSet($BUILDER$KEY)V",
        )
        // Before Builder.set: value shim.
        method.addInstructions(
            setIndex,
            """
                invoke-static { v$keyReg, v$valueReg }, $EXTENSION_CLASS->fixValue(${KEY}Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$valueReg
            """,
        )
    }
}
