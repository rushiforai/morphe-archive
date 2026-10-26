package io.github.pengusto.patches.messages

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private val visibleState = bytecodePatch {
    extendWith("extensions/extension.mpe")
    execute {
        val resume = Fingerprint(definingClass = "Lorg/fossify/messages/activities/ThreadActivity;", name = "onResume", returnType = "V", parameters = emptyList()).method
        val refs = resume.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        check("Lorg/fossify/messages/activities/ThreadActivity;->P:J" in refs && "Lorg/fossify/messages/activities/ThreadActivity;->R:Z" in refs) { "Unsupported visibility fields" }
        resume.addInstructions(1, """
            iget-wide v1, p0, Lorg/fossify/messages/activities/ThreadActivity;->P:J
            invoke-static {p0, v1, v2}, Lio/github/pengusto/patches/extension/messages/VisibleConversations;->resume(Landroid/app/Activity;J)V
        """.trimIndent())
        for (name in listOf("onPause", "onDestroy")) {
            Fingerprint(definingClass = "Lorg/fossify/messages/activities/ThreadActivity;", name = name, returnType = "V", parameters = emptyList()).method.addInstructions(0,
                "invoke-static/range {p0 .. p0}, Lio/github/pengusto/patches/extension/messages/VisibleConversations;->pause(Landroid/app/Activity;)V")
        }
    }
}

@Suppress("unused")
val backgroundReadPatch = bytecodePatch(name = "Keep background conversations unread", description = "Do not mark incoming messages read when their conversation is left in the background.", default = true) {
    compatibleWith(Compatibility(name = "Fossify Messages", packageName = "org.fossify.messages", targets = listOf(AppTarget(version = "1.10.1"))))
    dependsOn(visibleState)
    execute {
        val method = Fingerprint(definingClass = "Lorg/fossify/messages/activities/ThreadActivity;", name = "c0", returnType = "Ljava/util/List;", parameters = emptyList()).method
        val code = method.implementation!!.instructions
        check(code.size > 140 && (code[100] as? ReferenceInstruction)?.reference.toString() == "Lnw1;->g:Z" &&
            (code[102] as? ReferenceInstruction)?.reference.toString() == "Lnw1;->i:Z") { "Unsupported message read loop" }
        method.addInstructions(101, """
            invoke-static {v0, v4}, Lio/github/pengusto/patches/extension/messages/VisibleConversations;->skipRead(Landroid/app/Activity;Z)Z
            move-result v4
        """.trimIndent())
    }
}

@Suppress("unused")
val visibleNotificationsPatch = bytecodePatch(name = "Avoid notifications for visible conversations", description = "Check visible conversation on the main thread before posting an incoming-message notification.", default = true) {
    compatibleWith(Compatibility(name = "Fossify Messages", packageName = "org.fossify.messages", targets = listOf(AppTarget(version = "1.10.1"))))
    dependsOn(visibleState)
    execute {
        val run = Fingerprint(definingClass = "Lj80;", name = "run", returnType = "V", parameters = emptyList()).method
        val refs = run.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        check("Lj80;->e:J" in refs && "Lj80;->i:J" in refs && "Lj80;->f:Z" in refs) { "Unsupported notification runnable" }
        run.addInstructionsWithLabels(0, """
            iget-object v0, p0, Lj80;->d:Landroid/content/Context;
            iget-wide v1, p0, Lj80;->e:J
            iget-boolean v3, p0, Lj80;->f:Z
            iget-wide v4, p0, Lj80;->i:J
            move-object v6, p0
            invoke-static/range {v0 .. v6}, Lio/github/pengusto/patches/extension/messages/VisibleConversations;->suppress(Landroid/content/Context;JZJLjava/lang/Runnable;)Z
            move-result v0
            if-eqz v0, :original
            return-void
        """.trimIndent(), ExternalLabel("original", run.implementation!!.instructions[0]))
        // Scope provider marking to this exact message/thread; original refresh events
        // reconcile the conversation/message caches afterward.
        val bridge = Fingerprint(definingClass = "Lio/github/pengusto/patches/extension/messages/VisibleConversations;", name = "markRead", returnType = "V", parameters = listOf("Landroid/content/Context;", "J", "Z", "J")).method
        // Bind the version-specific original refresh events after the provider update.
        bridge.removeInstructions(0, bridge.implementation!!.instructions.size)
        bridge.addInstructions("""
            invoke-static/range {p0 .. p5}, Lio/github/pengusto/patches/extension/messages/VisibleMessageRead;->mark(Landroid/content/Context;JZJ)V
            invoke-static {}, Lec1;->M()V
            invoke-static {}, Lec1;->L()V
            return-void
        """.trimIndent())
    }
}
