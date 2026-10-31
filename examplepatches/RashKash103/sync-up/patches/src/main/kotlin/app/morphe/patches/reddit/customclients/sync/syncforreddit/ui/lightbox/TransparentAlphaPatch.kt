package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.lightbox

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/ui/lightbox/TransparentAlphaPatch;"

private const val PREFERRED_CONFIG_METHOD =
    "preferredConfig(Landroid/graphics/Bitmap\$Config;)Landroid/graphics/Bitmap\$Config;"

private const val TILE_BACKGROUND_METHOD = "tileBackground(I)I"

/** The zooming view a picture is opened in, which keeps the format to decode in statically. */
private const val ZOOMING_VIEW = "Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;"

@Suppress("unused")
val transparentAlphaPatch = bytecodePatch(
    name = "Keep transparency in a picture",
    description = "Draws the transparent parts of a picture opened in the viewer as the " +
            "background behind it rather than as white.",
    default = true
) {
    dependsOn(sharedExtensionPatch, transparentAlphaSettingsPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        Fingerprint(
            definingClass = EXTENSION_CLASS_DESCRIPTOR,
            name = "isPatchIncluded",
        ).method.returnEarly(true)

        // The decoders ask the view what to decode in and fall back to RGB_565, which has no
        // alpha channel, when it answers nothing. Answering here covers every one of them.
        Fingerprint(
            definingClass = ZOOMING_VIEW,
            name = "getPreferredBitmapConfig",
            parameters = listOf(),
            returnType = "Landroid/graphics/Bitmap\$Config;",
        ).method.apply {
            val returnIndex = instructions.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
            if (returnIndex < 0) {
                throw PatchException("The zooming view never answers what to decode in")
            }
            val register = getInstruction<OneRegisterInstruction>(returnIndex).registerA

            addInstructions(
                returnIndex,
                """
                invoke-static       { v$register }, $EXTENSION_CLASS_DESCRIPTOR->$PREFERRED_CONFIG_METHOD
                move-result-object  v$register
                """
            )
        }

        // The view fills every tile with a colour before drawing the picture over it, and the
        // viewer asks for opaque white, so transparency survived the decode and was painted
        // over anyway.
        Fingerprint(
            definingClass = ZOOMING_VIEW,
            name = "setTileBackgroundColor",
            parameters = listOf("I"),
            returnType = "V",
        ).method.addInstructions(
            0,
            """
            invoke-static       { p1 }, $EXTENSION_CLASS_DESCRIPTOR->$TILE_BACKGROUND_METHOD
            move-result         p1
            """
        )
    }
}
