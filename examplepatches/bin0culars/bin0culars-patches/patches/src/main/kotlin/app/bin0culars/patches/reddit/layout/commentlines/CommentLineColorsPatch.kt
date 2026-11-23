package app.bin0culars.patches.reddit.layout.commentlines

import app.bin0culars.patches.reddit.misc.settings.BinocularsModsChoice
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection.POSTS
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/CommentLineColorsPatch;"

@Suppress("unused")
val commentLineColorsPatch =
    patch(
        name = "Colorize comment indent lines",
        description = "Gives each reply level in a comment thread its own line colour. Turn it on in Settings → bin0culars mods.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)
        dependsOn(binocularsModsSettingsPatch)
        extendWith("extensions/extension.mpe")

        execute {
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "comment_line_colors",
                    section = POSTS,
                    title = "Coloured comment lines",
                    summary = "Gives each reply level its own line colour so long threads are easier to follow.",
                    default = false,
                ),
            )
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "comment_line_palette",
                    section = POSTS,
                    parentKey = "comment_line_colors",
                    title = "Line colours",
                    summary = "Rainbow is bright, Pastel is soft, Muted blends in with the page.",
                    choices = listOf(
                        BinocularsModsChoice("rainbow", "Rainbow"),
                        BinocularsModsChoice("pastel", "Pastel"),
                        BinocularsModsChoice("muted", "Muted"),
                    ),
                    defaultChoice = "rainbow",
                ),
            )

            val method = CommentLinesDrawFingerprint.method
            val drawIndex = CommentLinesDrawFingerprint.instructionMatches[3].index
            val r = method.getInstruction<RegisterRangeInstruction>(drawIndex).startRegister
            val depth = method.getInstruction<TwoRegisterInstruction>(
                CommentLinesDrawFingerprint.instructionMatches[4].index,
            ).registerA
            val color = r + 1
            val alpha = r + 10

            if (depth > 15 || color + 1 > 15 || alpha > 15) {
                throw PatchException("Register out of range for non-range invoke: depth=$depth, color=$color, alpha=$alpha")
            }

            method.addInstructions(
                drawIndex,
                """
                    invoke-static {v$depth, v$color, v${color + 1}}, $EXTENSION_CLASS->lineColor(IJ)J
                    move-result-wide v$color
                    invoke-static {v$alpha}, $EXTENSION_CLASS->lineAlpha(F)F
                    move-result v$alpha
                """.trimIndent(),
            )
        }
    }
