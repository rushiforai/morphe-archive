/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.overflowMenuButton.reels

import app.crimera.patches.instagram.entity.decoder.MEDIA_CLASS_NAME
import app.crimera.patches.instagram.entity.decoder.decoderEntity
import app.crimera.patches.instagram.utils.Constants.ADD_REEL_BTN_OVERFLOW_MENU_BUTTON_CLASS
import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.crimera.patches.instagram.utils.Constants.MEDIA_OPTIONS_CLASS
import app.crimera.utils.changeFirstString
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.crimera.patches.shared.declaredParameterRegister
import app.crimera.patches.shared.parameterRegisterStart
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.morphe.library.instagram.patches.instagramExtensionPatch

private const val CONTEXT = "Landroid/content/Context;"

/**
 * The reel menu helper's per-row method: (context, option, sheet builder, row) -> void, on the
 * class that logs under "ClipsOrganicMoreOptionsHelper". The tag alone is in some fifty methods
 * across several classes, so the row method is what is matched.
 */
internal object ReelMenuRowFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(CONTEXT, MEDIA_OPTIONS_CLASS, "L", "L"),
    custom = { _, classDef ->
        classDef.methods.any { method ->
            method.implementation?.instructions?.any { instruction ->
                instruction.getReference<StringReference>()?.string == "ClipsOrganicMoreOptionsHelper"
            } == true
        }
    },
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
        dependsOn(instagramExtensionPatch)
        dependsOn(reelsOverflowMenuButtonEntity, decoderEntity)
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            val helperClass = ReelMenuRowFingerprint.classDef

            val mediaField =
                helperClass.fields.singleOrNull { it.type == MEDIA_CLASS_NAME }
                    ?: throw PatchException("Could not identify the media field on the reel menu helper")

            ReelMediaFieldExtensionFingerprint.changeFirstString(mediaField.name)

            ReelMenuRowFingerprint.method.apply {
                val self = parameterRegisterStart(this)
                val context = declaredParameterRegister(this, 0)
                val sheetBuilder = declaredParameterRegister(this, 2)
                // Not consecutive, so the call is four-bit.
                if (maxOf(self, context, sheetBuilder) > 15) {
                    throw PatchException("The reel menu row method keeps its parameters above v15")
                }

                addInstructions(
                    0,
                    "invoke-static { v$self, v$context, v$sheetBuilder }, " +
                        "$ADD_REEL_BTN_OVERFLOW_MENU_BUTTON_CLASS->" +
                        "addReelMenuDownloadRow(Ljava/lang/Object;$CONTEXT Ljava/lang/Object;)V",
                )
            }
        }
    }
