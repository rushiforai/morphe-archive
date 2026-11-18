package app.afterglow.patches.tweaks.navigation

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.video.addPublicMethod
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val PROGRESS = "$EXTENSION_PACKAGE/navigation/ShortsProgress;"
private const val CONTROLLER = "$EXTENSION_PACKAGE/navigation/ShortsProgress\$Controller;"

/** Keep the native mode model immutable and preserve panel, player and seek guards. */
internal val shortsProgressHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)
    execute {
        val policies = Fingerprint(returnType = "V", parameters = emptyList(), filters = listOf(
            fieldAccess(opcode = Opcode.IGET, definingClass = "Lblhh;", name = "c", type = "I"),
            methodCall(smali = "La;->bd(I)I", location = MatchAfterImmediately())
        ), custom = { method, cls -> cls.type == "Lmqp;" && method.name in setOf("v", "t") }).matchAll()
        require(policies.size == 2 && policies.map { it.method.name }.toSet() == setOf("v", "t"))
        policies.forEach { policy ->
            val read = policy.instructionMatches.first()
            val register = (read.instruction as OneRegisterInstruction).registerA
            policy.method.addInstructions(read.index + 1, """
                ${invokeStatic(register, method = "$PROGRESS->displayMode(I)I")}
                move-result v$register
            """)
        }
        val update = Fingerprint(returnType = "V", parameters = listOf("Lblhh;"), filters = listOf(
            fieldAccess(opcode = Opcode.IPUT_OBJECT, definingClass = "Lmqp;", name = "i", type = "Lblhh;"),
            methodCall(smali = "Lmqp;->C()Z", location = MatchAfterImmediately())
        ), custom = { method, cls -> cls.type == "Lmqp;" && method.name == "A" })
        val host = update.classDef
        require(host.fields.any { it.name == "B" && it.type == "Landroid/view/View;" })
        require(host.fields.any { it.name == "u" && it.type == "Z" })
        host.interfaces.add(CONTROLLER)
        host.addPublicMethod("afterglow_refreshProgress", emptyList(), "Z", 2, """
            iget-object v0, p0, ${host.type}->B:Landroid/view/View;
            if-eqz v0, :inactive
            invoke-virtual { v0 }, Landroid/view/View;->isAttachedToWindow()Z
            move-result v0
            if-eqz v0, :inactive
            iget-object v0, p0, ${host.type}->i:Lblhh;
            if-eqz v0, :inactive
            invoke-virtual { p0 }, ${host.type}->v()V
            iget-boolean v0, p0, ${host.type}->u:Z
            if-eqz v0, :updated
            invoke-virtual { p0 }, ${host.type}->t()V
            :updated
            const/4 v0, 0x1
            return v0
            :inactive
            const/4 v0, 0x0
            return v0
        """)
        update.method.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed()
            .forEach { index -> update.method.addInstructionsAtControlFlowLabel(index,
                "invoke-static/range { p0 .. p0 }, $PROGRESS->observe($CONTROLLER)V") }
        println("Afterglow Shorts progress: ${host.type}, native policy reads ${policies.map { it.method.name }}")
    }
}
