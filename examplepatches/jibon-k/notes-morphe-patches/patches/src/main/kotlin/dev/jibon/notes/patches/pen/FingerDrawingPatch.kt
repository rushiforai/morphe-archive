package dev.jibon.notes.patches.pen

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import dev.jibon.notes.patches.compat.frameworkCompatPatch
import dev.jibon.notes.patches.shared.Constants.COMPATIBILITY_NOTES
import dev.jibon.notes.patches.shared.MemoApplicationOnCreateFingerprint

private fun spenOnlyReadFingerprint(definingClass: String, name: String) = Fingerprint(
    definingClass = definingClass,
    name = name,
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("settings_spen_only_mode"),
        methodCall(name = "getBoolean", parameters = listOf("Ljava/lang/String;", "Z"), returnType = "Z"),
    ),
)

private val dataHandlerFingerprint = spenOnlyReadFingerprint(
    "Lcom/samsung/android/support/senl/nt/brush/executor/DataHandler;", "isSPenOnlyMode",
)
private val writingToolFingerprint = spenOnlyReadFingerprint(
    "Lcom/samsung/android/support/senl/nt/composer/main/base/model/composer/WritingToolManager;", "isSpenOnlyMode",
)

@Suppress("unused")
val fingerDrawingPatch = bytecodePatch(
    name = "Finger drawing",
    description = "Turns off \"S Pen only\" by default (once, at first start), so fingers can draw and " +
        "scroll. Without it, the app assumes an S Pen and ignores finger input in notes.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NOTES)
    dependsOn(frameworkCompatPatch)

    execute {
        // Default value of the "settings_spen_only_mode" read: the last argument of getBoolean(key, default).
        listOf(dataHandlerFingerprint, writingToolFingerprint).forEach { fingerprint ->
            val call = fingerprint.instructionMatches.last()
            val invoke = call.getInstruction<FiveRegisterInstruction>()
            val defaultRegister = when (invoke.registerCount) {
                3 -> invoke.registerE // prefs.getBoolean(key, default)
                else -> invoke.registerD // static helper getBoolean(key, default)
            }
            fingerprint.method.addInstruction(call.index, "const/4 v$defaultRegister, 0x0")
        }
        // One-time migration: users who already ran the app get the setting switched off once.
        MemoApplicationOnCreateFingerprint.let {
            it.method.addInstruction(
                it.instructionMatches.first().index + 1,
                "invoke-static {p0}, Lsamsungcompat/NotesBackup;->migrateTouchFriendlyMode(Landroid/content/Context;)V",
            )
        }
    }
}
