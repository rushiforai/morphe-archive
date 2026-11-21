package app.keyboardspeed.patches.reddit.swipe

import app.keyboardspeed.patches.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/keyboardspeed/extension/reddit/MouseSwipePatch;"

internal object FrontpageApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/frontpage/FrontpageApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val mouseSwipePatch = bytecodePatch(
    name = "Mouse and arrow key swipes",
    description = "Makes dragging with a mouse swipe like a finger, such as between the images of a post, " +
        "and makes the left and right arrow keys of a keyboard swipe once under the mouse pointer.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    extendWith("extensions/extension.mpe")

    execute {
        FrontpageApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS->onApplicationCreate(Landroid/app/Application;)V",
        )
    }
}
