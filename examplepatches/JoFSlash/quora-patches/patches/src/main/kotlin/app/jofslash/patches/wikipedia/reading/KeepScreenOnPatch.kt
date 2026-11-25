package app.jofslash.patches.wikipedia.reading

import app.jofslash.patches.wikipedia.shared.Constants.COMPATIBILITY_WIKIPEDIA
import app.jofslash.patches.wikipedia.shared.methodOf
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val PAGE_ACTIVITY = "Lorg/wikipedia/page/PageActivity;"

// WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON
private const val FLAG_KEEP_SCREEN_ON = 0x80

@Suppress("unused")
val keepScreenOnPatch = bytecodePatch(
    name = "Keep screen on while reading",
    description = "Keeps the screen from turning off while an article is open, so it doesn't go dark " +
            "while you read a long article. The screen turns off as usual elsewhere in the app.",
    default = false
) {
    category("Reading")
    compatibleWith(COMPATIBILITY_WIKIPEDIA)

    execute {
        // Articles open in PageActivity. The flag belongs to its window, so Android drops it when
        // the activity is left or closed.
        methodOf(PAGE_ACTIVITY, "onCreate", listOf("Landroid/os/Bundle;")).addInstructions(
            0,
            """
                move-object/from16 v0, p0
                invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                move-result-object v0
                const/16 v1, $FLAG_KEEP_SCREEN_ON
                invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V
            """
        )
    }
}
