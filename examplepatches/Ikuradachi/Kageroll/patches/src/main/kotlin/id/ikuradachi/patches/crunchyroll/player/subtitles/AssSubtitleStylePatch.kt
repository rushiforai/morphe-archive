package id.ikuradachi.patches.crunchyroll.player.subtitles

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

private const val SUBTITLE_STYLE_HELPER_CLASS =
    "Lid/ikuradachi/kageroll/extension/crunchyroll/SubtitleStyleHelper;"

private val ASS_OR_HEX_COLOR_REGEX = Regex("^(&[Hh][0-9A-Fa-f]{8}|#([0-9A-Fa-f]{6}|[0-9A-Fa-f]{8}))$")

private fun isValidColorOption(raw: String?): Boolean {
    val trimmed = raw?.trim() ?: return false
    return trimmed.equals("default", ignoreCase = true) || ASS_OR_HEX_COLOR_REGEX.matches(trimmed)
}

private fun escapeSmaliString(value: String): String =
    buildString(value.length) {
        for (ch in value) {
            when (ch) {
                '\\' -> append("\\\\")
                '"' -> append("\\\"")
                '\n' -> append("\\n")
                '\r' -> append("\\r")
                '\t' -> append("\\t")
                else -> append(ch)
            }
        }
    }

private fun smaliConstInt(reg: Int, value: Int): String = when {
    value in -8..7 -> "const/4 v$reg, ${if (value < 0) "-0x${(-value).toString(16)}" else "0x${value.toString(16)}"}"
    value in Short.MIN_VALUE..Short.MAX_VALUE -> {
        val lit = if (value < 0) "-0x${(-value).toString(16)}" else "0x${value.toString(16)}"
        "const/16 v$reg, $lit"
    }
    value < 0 -> "const v$reg, -0x${(-value.toLong()).toString(16)}"
    else -> "const v$reg, 0x${value.toString(16)}"
}

@Suppress("unused")
val assSubtitleStylePatch = bytecodePatch(
    name = "ASS subtitle style & margin override",
    description = "Customizes ASS subtitle font scale, bottom margin, outline, shadow, and colors, and adapts subtitle viewport margins to the active video aspect ratio and resize mode.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    category("Player")
    extendWith("extensions/extension.mpe")

    val fontScale = stringOption(
        key = "fontScale",
        default = "1.0",
        values = mapOf(
            "0.75x" to "0.75",
            "0.85x" to "0.85",
            "1.0x (default)" to "1.0",
            "1.15x" to "1.15",
            "1.25x" to "1.25",
            "1.5x" to "1.5",
            "2.0x" to "2.0",
        ),
        title = "Subtitle font scale",
        description = "Multiplier applied to ASS subtitle font sizes (0.25 to 4.0).",
        validator = { raw ->
            val parsed = raw?.trim()?.toFloatOrNull()
            parsed != null && parsed in 0.25f..4.0f
        },
    )
    val scaleInlineFontTags = booleanOption(
        key = "scaleInlineFontTags",
        default = true,
        title = "Scale inline \\fs tags",
        description = "Also scales inline {\\fsN} tags on non-positioned dialogue lines (skips lines using \\pos or \\move).",
    )
    val bottomMarginOffset = intOption(
        key = "bottomMarginOffset",
        default = 0,
        title = "ASS bottom MarginV offset",
        description = "Vertical offset added to bottom-aligned ASS styles and events (normalized to 720p PlayResY; positive moves subtitles up).",
        validator = { it != null && it in -300..500 },
    )
    val bottomSafeMarginDp = intOption(
        key = "bottomSafeMarginDp",
        default = 0,
        title = "Extra bottom screen margin (dp)",
        description = "Additional bottom viewport margin in dp passed to the subtitle renderer (positive moves subtitles up).",
        validator = { it != null && it in -100..250 },
    )
    val outlineThickness = stringOption(
        key = "outlineThickness",
        default = "default",
        values = mapOf(
            "Script default" to "default",
            "None (0.0)" to "0.0",
            "Thin (1.5)" to "1.5",
            "Medium (2.0)" to "2.0",
            "Thick (3.0)" to "3.0",
            "Extra thick (4.0)" to "4.0",
        ),
        title = "Outline thickness",
        description = "Overrides ASS style Outline thickness (0.0 to 10.0), or 'default' to keep script values.",
        validator = { raw ->
            val trimmed = raw?.trim() ?: return@stringOption false
            if (trimmed.equals("default", ignoreCase = true)) return@stringOption true
            val parsed = trimmed.toFloatOrNull()
            parsed != null && parsed in 0.0f..10.0f
        },
    )
    val shadowDepth = stringOption(
        key = "shadowDepth",
        default = "default",
        values = mapOf(
            "Script default" to "default",
            "None (0.0)" to "0.0",
            "Subtle (1.0)" to "1.0",
            "Medium (2.0)" to "2.0",
            "Deep (3.0)" to "3.0",
        ),
        title = "Shadow depth",
        description = "Overrides ASS style Shadow depth (0.0 to 10.0), or 'default' to keep script values.",
        validator = { raw ->
            val trimmed = raw?.trim() ?: return@stringOption false
            if (trimmed.equals("default", ignoreCase = true)) return@stringOption true
            val parsed = trimmed.toFloatOrNull()
            parsed != null && parsed in 0.0f..10.0f
        },
    )
    val primaryColor = stringOption(
        key = "primaryColor",
        default = "default",
        values = mapOf(
            "Script default" to "default",
            "White (#FFFFFF)" to "#FFFFFF",
            "Warm Yellow (#FFF066)" to "#FFF066",
            "Soft Cyan (#99FFFF)" to "#99FFFF",
        ),
        title = "Primary text color",
        description = "Overrides ASS PrimaryColour (#RRGGBB, #AARRGGBB, or ASS &HAABBGGRR), or 'default' to keep script values.",
        validator = { isValidColorOption(it) },
    )
    val outlineColor = stringOption(
        key = "outlineColor",
        default = "default",
        values = mapOf(
            "Script default" to "default",
            "Black (#000000)" to "#000000",
            "Charcoal (#202020)" to "#202020",
        ),
        title = "Outline color",
        description = "Overrides ASS OutlineColour (#RRGGBB, #AARRGGBB, or ASS &HAABBGGRR), or 'default' to keep script values.",
        validator = { isValidColorOption(it) },
    )
    val adaptMarginsToResizeMode = booleanOption(
        key = "adaptMarginsToResizeMode",
        default = true,
        title = "Adapt margins to aspect & resize mode",
        description = "Replaces Crunchyroll's hardcoded 16:9 Fit margin math with true video aspect ratio and Fit/Zoom/Fill resize-mode awareness, refreshing immediately when resize mode changes.",
    )

    execute {
        fun Fingerprint.patchStaticIntGetter(value: Int) {
            matchAll(1..1).single().method.addInstructions(
                0,
                """
                    ${smaliConstInt(0, value)}
                    return v0
                """.trimIndent(),
            )
        }

        fun Fingerprint.patchStaticBooleanGetter(value: Boolean) {
            val flag = if (value) 1 else 0
            matchAll(1..1).single().method.addInstructions(
                0,
                """
                    const/4 v0, 0x$flag
                    return v0
                """.trimIndent(),
            )
        }

        fun Fingerprint.patchStaticFloatGetter(value: Float) {
            val bits = java.lang.Float.floatToRawIntBits(value)
            matchAll(1..1).single().method.addInstructions(
                0,
                """
                    ${smaliConstInt(0, bits)}
                    return v0
                """.trimIndent(),
            )
        }

        fun Fingerprint.patchStaticStringGetter(value: String) {
            matchAll(1..1).single().method.addInstructions(
                0,
                """
                    const-string v0, "${escapeSmaliString(value)}"
                    return-object v0
                """.trimIndent(),
            )
        }

        val scaleValue = requireNotNull(fontScale.value?.trim()?.toFloatOrNull()?.takeIf { it in 0.25f..4.0f }) {
            "Subtitle font scale must be between 0.25 and 4.0"
        }
        val scaleInlineValue = scaleInlineFontTags.value != false
        val marginVValue = requireNotNull(bottomMarginOffset.value?.takeIf { it in -300..500 }) {
            "ASS bottom MarginV offset must be between -300 and 500"
        }
        val bottomSafeDpValue = requireNotNull(bottomSafeMarginDp.value?.takeIf { it in -100..250 }) {
            "Extra bottom screen margin must be between -100 and 250 dp"
        }
        val outlineRaw = outlineThickness.value?.trim().orEmpty()
        val outlineValue = if (outlineRaw.isEmpty() || outlineRaw.equals("default", ignoreCase = true)) {
            -1.0f
        } else {
            requireNotNull(outlineRaw.toFloatOrNull()?.takeIf { it in 0.0f..10.0f }) {
                "Outline thickness must be 'default' or between 0.0 and 10.0"
            }
        }
        val shadowRaw = shadowDepth.value?.trim().orEmpty()
        val shadowValue = if (shadowRaw.isEmpty() || shadowRaw.equals("default", ignoreCase = true)) {
            -1.0f
        } else {
            requireNotNull(shadowRaw.toFloatOrNull()?.takeIf { it in 0.0f..10.0f }) {
                "Shadow depth must be 'default' or between 0.0 and 10.0"
            }
        }
        val primaryRaw = primaryColor.value?.trim().orEmpty()
        val primaryValue = if (primaryRaw.isEmpty() || primaryRaw.equals("default", ignoreCase = true)) {
            ""
        } else {
            check(isValidColorOption(primaryRaw)) { "Invalid primaryColor: $primaryRaw" }
            primaryRaw
        }
        val outlineColorRaw = outlineColor.value?.trim().orEmpty()
        val outlineColorValue = if (outlineColorRaw.isEmpty() || outlineColorRaw.equals("default", ignoreCase = true)) {
            ""
        } else {
            check(isValidColorOption(outlineColorRaw)) { "Invalid outlineColor: $outlineColorRaw" }
            outlineColorRaw
        }
        val adaptResizeValue = adaptMarginsToResizeMode.value != false

        // Bake build-time defaults into SubtitleStyleHelper.
        SubtitleHelperDefaultFontScaleFingerprint.patchStaticFloatGetter(scaleValue)
        SubtitleHelperScaleInlineFsFingerprint.patchStaticBooleanGetter(scaleInlineValue)
        SubtitleHelperDefaultAssMarginVOffsetFingerprint.patchStaticIntGetter(marginVValue)
        SubtitleHelperDefaultBottomSafeMarginDpFingerprint.patchStaticIntGetter(bottomSafeDpValue)
        SubtitleHelperDefaultOutlineWidthFingerprint.patchStaticFloatGetter(outlineValue)
        SubtitleHelperDefaultShadowDepthFingerprint.patchStaticFloatGetter(shadowValue)
        SubtitleHelperDefaultPrimaryColorFingerprint.patchStaticStringGetter(primaryValue)
        SubtitleHelperDefaultOutlineColorFingerprint.patchStaticStringGetter(outlineColorValue)
        SubtitleHelperAdaptResizeModeFingerprint.patchStaticBooleanGetter(adaptResizeValue)

        // Target 1A: SubtitlesRendererImpl.loadTrack(String) -> rewriteAssScript(context, subtitlesText).
        val loadTrackMatch = SubtitlesRendererLoadTrackFingerprint.matchAll(1..1).single()
        val rendererClass = loadTrackMatch.classDef
        val contextField = rendererClass.fields.singleOrNull { it.type == "Landroid/content/Context;" }
            ?: error("Failed to locate Context field on ${rendererClass.type}")
        val sgetCharsetIdx = loadTrackMatch.instructionMatches[1].index
        loadTrackMatch.method.addInstructions(
            sgetCharsetIdx,
            """
                iget-object v0, p0, ${rendererClass.type}->${contextField.name}:Landroid/content/Context;
                invoke-static {v0, p1}, $SUBTITLE_STYLE_HELPER_CLASS->rewriteAssScript(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
                move-result-object p1
            """.trimIndent(),
        )

        // Target 2A: SubtitlesControllerImpl.setFrameSize(II) -> applyFrameSizeAndMargins(renderer, view, width, height).
        val setFrameSizeMatch = SubtitlesControllerSetFrameSizeFingerprint.matchAll(1..1).single()
        val controllerClass = setFrameSizeMatch.classDef
        val rendererField = controllerClass.fields.singleOrNull {
            it.type == "Lcom/crunchyroll/subtitles/SubtitlesRenderer;"
        } ?: error("Failed to locate SubtitlesRenderer field on ${controllerClass.type}")
        val viewField = controllerClass.fields.singleOrNull {
            it.type == "Lcom/crunchyroll/subtitles/SubtitlesRendererView;"
        } ?: error("Failed to locate SubtitlesRendererView field on ${controllerClass.type}")

        val setFrameMethod = setFrameSizeMatch.method
        val setFrameImpl = requireNotNull(setFrameMethod.implementation) {
            "Missing implementation for SubtitlesControllerImpl.setFrameSize"
        }
        check(setFrameImpl.registerCount >= 11) {
            "Unexpected register count in SubtitlesControllerImpl.setFrameSize: ${setFrameImpl.registerCount}"
        }
        setFrameMethod.addInstructions(
            0,
            """
                iget-object v0, p0, ${controllerClass.type}->${rendererField.name}:Lcom/crunchyroll/subtitles/SubtitlesRenderer;
                iget-object v1, p0, ${controllerClass.type}->${viewField.name}:Lcom/crunchyroll/subtitles/SubtitlesRendererView;
                invoke-static {v0, v1, p1, p2}, $SUBTITLE_STYLE_HELPER_CLASS->applyFrameSizeAndMargins(Ljava/lang/Object;Ljava/lang/Object;II)V
                return-void
            """.trimIndent(),
        )

        // Target 2B: gv0.m.invoke(Object) (case 2, after PlayerView.setResizeMode(I)) -> refreshSubtitlesLayout(playerView).
        val resizeMatch = SubtitlesPlayerViewResizeInvokeFingerprint.matchAll(1..1).single()
        val setResizeMatch = resizeMatch.instructionMatches[2]
        val setResizeInstr = setResizeMatch.instruction as FiveRegisterInstruction
        val viewReg = setResizeInstr.registerC
        check(viewReg in 0..15) {
            "PlayerView register out of range in gv0.m: v$viewReg"
        }
        resizeMatch.method.addInstructions(
            setResizeMatch.index + 1,
            "invoke-static {v$viewReg}, $SUBTITLE_STYLE_HELPER_CLASS->refreshSubtitlesLayout(Landroid/view/View;)V",
        )
    }
}
