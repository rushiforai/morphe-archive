package app.lchanc3.patches.jptt.image

import app.lchanc3.patches.jptt.shared.Constants.COMPATIBILITY_JPTT
import app.lchanc3.patches.jptt.shared.Constants.EXTENSION_ANIMATED_IMAGE_CLASS
import app.lchanc3.patches.jptt.shared.Constants.PICTURE_VIEW_CLASS
import app.lchanc3.patches.jptt.shared.extensionHookPatch
import app.lchanc3.patches.jptt.shared.newMethod
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val IMAGE_URL_FIELD = "imageUrl"

/** The method added to PictureView, named so it cannot collide with its own. */
private const val HELPER_METHOD = "patchOnPictureShown"

@Suppress("unused")
val playGifsPatch = bytecodePatch(
    name = "Play GIFs",
    description = "Plays animated GIFs and WebPs in articles, which the app shows as " +
        "their first frame. Needs Android 9 or later; the full size viewer still shows " +
        "the first frame.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JPTT)

    dependsOn(extensionHookPatch)

    execute {
        val listener = PictureShownFingerprint
        val pictureView = mutableClassDefBy(PICTURE_VIEW_CLASS)

        if (pictureView.fields.none { it.name == IMAGE_URL_FIELD && it.type == "Ljava/lang/String;" }) {
            throw PatchException("$PICTURE_VIEW_CLASS has no $IMAGE_URL_FIELD of type String.")
        }
        if (pictureView.methods.any { it.name == HELPER_METHOD }) {
            throw PatchException("$PICTURE_VIEW_CLASS already has a $HELPER_METHOD method.")
        }

        // Public, because the listener is a class of its own. The URL is private
        // to PictureView and is the one Fresco loaded.
        pictureView.methods.add(
            newMethod(
                PICTURE_VIEW_CLASS,
                HELPER_METHOD,
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                // v0 for the URL, and p0 for the view.
                registers = 2,
                """
                    iget-object v0, p0, $PICTURE_VIEW_CLASS->$IMAGE_URL_FIELD:Ljava/lang/String;
                    invoke-static { p0, v0 }, $EXTENSION_ANIMATED_IMAGE_CLASS->onPictureShown(Landroid/view/ViewGroup;Ljava/lang/String;)V
                    return-void
                """,
            ),
        )

        // The listener's onFinalImageSet() does nothing and has no register but
        // its parameters. Its first one, the controller id, is never read, so it
        // is free to hold the view.
        val method = listener.method
        if (method.instructions.any { it.opcode != Opcode.RETURN_VOID }) {
            throw PatchException(
                "The picture listener's onFinalImageSet() does something now, " +
                    "so its parameter registers can no longer be borrowed.",
            )
        }
        val outerField = listener.classDef.fields.singleOrNull { it.type == PICTURE_VIEW_CLASS }
            ?: throw PatchException("The picture listener no longer holds its view in one field.")

        method.addInstructions(
            0,
            """
                iget-object p1, p0, ${listener.classDef.type}->${outerField.name}:$PICTURE_VIEW_CLASS
                invoke-virtual { p1 }, $PICTURE_VIEW_CLASS->$HELPER_METHOD()V
            """,
        )
    }
}
