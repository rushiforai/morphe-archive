package app.afterglow.patches.menus

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.shared.smali
import app.afterglow.patches.video.videoStatePatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val TOOLS = "$EXTENSION_PACKAGE/menus/LongPressTools;"

internal val longPressToolsHookPatch = bytecodePatch {
    // Text-copy routing remains experimental after build109 runtime failures.
    dependsOn(videoStatePatch)
    execute {
        installLongPressTimestamp()
    }
}

/** 21.43.523 native UI Pause only. Automatic pauses and the Play branch never enter it. */
private fun BytecodePatchContext.installLongPressTimestamp() {
    val click = Fingerprint(definingClass = "Loka;", name = "onClick",
        parameters = listOf("Landroid/view/View;"), returnType = "V", filters = listOf(
            fieldAccess(smali = "Lokb;->i:Larrs;"),
            fieldAccess(smali = "Larrr;->b:Larrr;"),
            methodCall(smali = "Larrt;->a()V"),
            fieldAccess(smali = "Larrr;->c:Larrr;"),
            methodCall(smali = "Larrt;->b()V"),
        )).method
    Fingerprint(definingClass = "Larrt;", name = "a", parameters = listOf(), returnType = "V",
        filters = listOf(fieldAccess(smali = "Larrt;->c:Z"), methodCall(smali = "Lassj;->c()V"))).method
    val bridge = "$EXTENSION_PACKAGE/menus/LongPressTools\$PauseCommand;"
    val command = mutableClassDefBy("Larrt;")
    command.interfaces.add(bridge)
    command.addMethod("afterglow_canPause", "Z", 2, """
        iget-boolean v0, p0, Larrt;->c:Z
        return v0
    """)
    val pause = click.implementation!!.instructions.withIndex().single { (_, instruction) ->
        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.smali == "Larrt;->a()V"
    }
    val register = pause.value.invokeRegisters.single()
    require(click.implementation!!.instructions[pause.index + 1].opcode == Opcode.RETURN_VOID) {
        "Native Pause click no longer returns immediately after its command"
    }
    click.addInstructions(pause.index + 1,
        "invoke-static/range { v$register .. v$register }, $TOOLS->pauseClicked($bridge)V")
    println("Afterglow timestamp copy: Loka.onClick, after native ready-gated Pause command")
}
