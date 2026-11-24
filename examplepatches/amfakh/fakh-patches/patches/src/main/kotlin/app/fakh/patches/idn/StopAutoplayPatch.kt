/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.idn

import app.fakh.patches.idn.shared.Constants.AUTOPLAY
import app.fakh.patches.idn.shared.Constants.COMPATIBILITY_IDN
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val CAROUSEL_PACKAGE = "Lmedia/idn/core/presentation/widget/imageslider"

/** The private autoPlay setter of the banner carousels; a carousel slides on its own while it is true. */
private fun autoPlaySetter(type: String) = Fingerprint(
    definingClass = "$CAROUSEL_PACKAGE/$type;",
    name = "setAutoPlay",
    returnType = "V",
    parameters = listOf("Z"),
)

/**
 * The bind method of a Nonton home carousel card: it starts the muted preview video, which is the only caller of setLowQualityTrailer.
 * R8 makes it an instance method or a static helper that takes the card binding first, so the parameter count varies.
 */
private object PreviewVideoBindFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Lmedia/idn/videoPlayer/ExoVideoPlayerView;",
            name = "setLowQualityTrailer",
            parameters = listOf("Z"),
            returnType = "V",
        )
    ),
)

@Suppress("unused")
val stopAutoplayPatch = patch(
    name = "Stop autoplay",
    description = "Adds a switch to stop the video previews and the automatic sliding of the home banners in Fakh Patches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Feature")
    dependsOn(settingsPatch)

    execute {
        register(AUTOPLAY)
        listOf(autoPlaySetter("carousel/Carousel"), autoPlaySetter("viewpager/CarouselViewPager")).forEach {
            it.method.addInstructions(
                0,
                """
                    invoke-static { p1 }, $EXTENSION_SETTINGS->autoPlay(Z)Z
                    move-result p1
                """,
            )
        }
        val binds = PreviewVideoBindFingerprint.matchAllOrNull().orEmpty().map { it.method }
        if (binds.size != 2) throw PatchException("IDN: expected 2 home carousel card previews, found ${binds.size}.")
        binds.forEach {
            it.apply {
                // The card shows its cover and plays nothing when the preview url is null. The url is the first String field the card data is read for.
                val url = instructions.indexOfFirst { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.type == "Ljava/lang/String;" &&
                        instruction.opcode == Opcode.IGET_OBJECT
                }
                if (url < 0) throw PatchException("IDN: the preview url of a home carousel card was not found.")
                val register = (instructions[url] as TwoRegisterInstruction).registerA
                addInstructions(
                    url + 1,
                    """
                        invoke-static { v$register }, $EXTENSION_SETTINGS->previewUrl(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v$register
                    """,
                )
            }
        }
    }
}
