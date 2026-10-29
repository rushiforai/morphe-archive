package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.insertAt
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val KEYBOARD = "Lapp/mightymorphing/extension/joey/SearchKeyboard;"

@Suppress("unused")
val searchKeyboardPatch = bytecodePatch(
    name = "Search auto open keyboard",
    description = "Opens the keyboard automatically for homepage search and comment search.",
) {
    compatibleWith(JOEY)

    extendWith("extensions/extension.mpe")

    execute {
        SearchDialogShowFingerprint.method.insertAt(
            0,
            """
            invoke-static {p0}, $KEYBOARD->onSearchDialog(Ljava/lang/Object;)V
            """,
        )

        val created = CommentSearchCreateFingerprint.method
        val returning = created.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        created.insertAt(
            returning,
            """
            invoke-static {p0}, $KEYBOARD->onCommentSearch(Landroid/app/Activity;)V
            """,
        )
    }
}
