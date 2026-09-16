/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.overflowMenuButton.reels

import app.crimera.patches.instagram.entity.decoder.MEDIA_CLASS_NAME
import app.crimera.patches.instagram.entity.decoder.decoderEntity
import app.crimera.patches.instagram.utils.Constants.ADD_REEL_BTN_OVERFLOW_MENU_BUTTON_CLASS
import app.crimera.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.crimera.patches.instagram.utils.Constants.MEDIA_OPTIONS_CLASS
import app.crimera.utils.changeFirstString
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val CONTEXT = "Landroid/content/Context;"

/** The reel menu helper, named by the analytics tag it logs under. */
internal object ClipsOrganicMoreOptionsHelperFingerprint : Fingerprint(
    strings = listOf("ClipsOrganicMoreOptionsHelper"),
)

internal object ReelMediaFieldExtensionFingerprint : Fingerprint(
    definingClass = ADD_REEL_BTN_OVERFLOW_MENU_BUTTON_CLASS,
    name = "reelMediaFieldName",
)

/**
 * Adds the download row to a reel's options sheet.
 *
 * piko hooks a reel controller method that 446 no longer uses to build this menu — two methods on
 * that class carry the controller's name and it matches the wrong one — and then hands the app
 * four arguments out of registers too high to encode, so the call was dropped on the way into the
 * dex. Neither failure showed up as a patch error.
 *
 * The menu helper offers a better place anyway: it is called once per row with the context and the
 * sheet builder already in hand, as parameters, which is exactly what adding a row needs and
 * leaves nothing to compute out of the frame.
 */
@Suppress("unused")
val hookReelOverflowMenuButton =
    bytecodePatch(
        description = "This patch hooks reel overflow button list adder",
    ) {
        dependsOn(reelsOverflowMenuButtonEntity, decoderEntity)
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            val helperClass = ClipsOrganicMoreOptionsHelperFingerprint.classDef

            // The per-row method, as opposed to the one it delegates to, which takes the same
            // arguments plus the row's own label and position.
            val perRowMethod =
                helperClass.methods.singleOrNull { method ->
                    method.returnType == "V" &&
                        method.parameters.size == 4 &&
                        method.parameters[0].type == CONTEXT &&
                        method.parameters[1].type == MEDIA_OPTIONS_CLASS
                } ?: throw PatchException("Could not identify the reel menu row method")

            val mediaField =
                helperClass.fields.singleOrNull { it.type == MEDIA_CLASS_NAME }
                    ?: throw PatchException("Could not identify the media field on the reel menu helper")

            ReelMediaFieldExtensionFingerprint.changeFirstString(mediaField.name)

            mutableClassDefBy(helperClass)
                .methods
                .first { it.name == perRowMethod.name && it.parameters.size == 4 }
                .addInstructions(
                    0,
                    "invoke-static {p0, p1, p3}, " +
                        "$ADD_REEL_BTN_OVERFLOW_MENU_BUTTON_CLASS->" +
                        "addReelMenuDownloadRow(Ljava/lang/Object;$CONTEXT Ljava/lang/Object;)V",
                )
        }
    }
