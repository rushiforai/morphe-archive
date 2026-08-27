package morningentree.morphe.patches.google.gboard.featureflags

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringsOption
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import morningentree.morphe.patches.google.gboard.detection.signature.bypassSignaturePatch
import morningentree.morphe.patches.google.gboard.shared.COMPATIBILITY_GBOARD
import java.util.logging.Logger

/**
 * Feature toggles for Gboard. Each option below is a simple on/off switch (a [booleanOption], so
 * the patch UI shows it as a toggle); flipping it on forces the corresponding Gboard feature flag
 * on. Every flag was verified to exist in Gboard 18.0.3; flags that aren't togglable on a given
 * build are skipped gracefully. Leave a switch off to leave that feature at its Gboard default.
 *
 * Gboard has thousands of internal/experimental flags with unknown or unstable effects, so only
 * recognisable user-facing features get a switch. Use the "Custom flags" fields for anything else.
 */
@Suppress("unused")
val toggleFeatureFlagsPatch = bytecodePatch(
    name = "Toggle feature flags",
    description = "Turn Gboard features on with individual switches. Each switch maps to a Gboard " +
        "feature flag; flip it on to enable that feature. Unknown or already-default flags are " +
        "skipped safely.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(bypassSignaturePatch)

    val logger = Logger.getLogger(this::class.java.name)

    // Each switch -> the Gboard flag it enables. Keys are stable; titles are what the user taps.
    val emailSuggestions by booleanOption(
        key = "gboardEmailSuggestions",
        default = false,
        title = "Email suggestions (from device accounts)",
        description = "On-device email autocomplete in email fields (flag: enable_email_provider_completion).",
    )
    val androidAutofill by booleanOption(
        key = "gboardAndroidAutofill",
        default = false,
        title = "Android Autofill in keyboard",
        description = "Show Android Autofill entries as a suggestion (flag: enable_autofill_ime_integration).",
    )
    val numberRow by booleanOption(
        key = "gboardNumberRow",
        default = false,
        title = "Number row",
        description = "Dedicated number row above the keyboard (flag: enable_number_row).",
    )
    val fastAccessBar by booleanOption(
        key = "gboardFastAccessBar",
        default = false,
        title = "Fast access bar (symbols row)",
        description = "Quick-access symbols/tools row (flag: enable_fast_access_bar).",
    )
    val grammarChecker by booleanOption(
        key = "gboardGrammarChecker",
        default = false,
        title = "Grammar checker",
        description = "Grammar checking and suggestions (flag: enable_grammar_checker).",
    )
    val multilingualTyping by booleanOption(
        key = "gboardMultilingualTyping",
        default = false,
        title = "Multilingual typing",
        description = "Type in multiple languages without switching (flag: enable_multilingual_typing).",
    )
    val settingsSearch by booleanOption(
        key = "gboardSettingsSearch",
        default = false,
        title = "Settings search",
        description = "Search bar in Gboard settings (flag: enable_settings_search).",
    )
    val aiWritingTools by booleanOption(
        key = "gboardAiWritingTools",
        default = false,
        title = "AI writing tools",
        description = "Proofread / rewrite writing tools (flag: enable_writing_tools_v2).",
    )
    val emojify by booleanOption(
        key = "gboardEmojify",
        default = false,
        title = "Emojify (text to emoji)",
        description = "Suggest emoji from your typed text (flag: enable_emojify).",
    )
    val semanticEmoji by booleanOption(
        key = "gboardSemanticEmoji",
        default = false,
        title = "Semantic emoji search",
        description = "Smarter emoji search by meaning (flag: enable_semantic_emoji).",
    )
    val emojiKitchen by booleanOption(
        key = "gboardEmojiKitchen",
        default = false,
        title = "Proactive Emoji Kitchen",
        description = "Emoji Kitchen sticker suggestions (flag: enable_proactive_emoji_kitchen).",
    )
    val expressionMoment by booleanOption(
        key = "gboardExpressionMoment",
        default = false,
        title = "Expression moment stickers",
        description = "Contextual expression/sticker moments (flag: enable_expression_moment).",
    )
    val stickerPredictions by booleanOption(
        key = "gboardStickerPredictions",
        default = false,
        title = "Sticker predictions while typing",
        description = "Suggest stickers as you type (flag: enable_sticker_predictions_while_typing).",
    )
    val dynamicArt by booleanOption(
        key = "gboardDynamicArt",
        default = false,
        title = "Dynamic art stickers",
        description = "Dynamic art sticker creation (flag: enable_dynamic_art).",
    )
    val trendingGifs by booleanOption(
        key = "gboardTrendingGifs",
        default = false,
        title = "Trending GIFs",
        description = "Trending GIFs in the GIF search (flag: enable_tenor_trending_gifs).",
    )
    val textConversion by booleanOption(
        key = "gboardTextConversion",
        default = false,
        title = "Text conversion (CJK)",
        description = "On-the-spot text conversion for CJK input (flag: enable_text_conversion).",
    )
    val splitKeyboard by booleanOption(
        key = "gboardSplitKeyboard",
        default = false,
        title = "Split keyboard (large tablet)",
        description = "Split keyboard layout on large tablets (flag: enable_split_keyboard_on_tablet_large).",
    )

    // Advanced escape hatches for any flag not covered by a switch above.
    val customEnableFlags by stringsOption(
        key = "gboardCustomEnableFlags",
        default = emptyList(),
        title = "Custom flags to enable (advanced)",
        description = "Enter any Gboard flag name(s) to force on.",
        required = false,
    ) { flags -> flags.isNullOrEmpty() || flags.all { it.matches(FLAG_REGEX) } }

    val customDisableFlags by stringsOption(
        key = "gboardCustomDisableFlags",
        default = emptyList(),
        title = "Custom flags to disable (advanced)",
        description = "Enter any Gboard flag name(s) to force off.",
        required = false,
    ) { flags -> flags.isNullOrEmpty() || flags.all { it.matches(FLAG_REGEX) } }

    execute {
        fun setFlag(flag: String, enable: Boolean) {
            val trimmed = flag.trim()
            if (trimmed.isEmpty()) return
            val fingerprint = featureFlagFingerprint(trimmed)
            runCatching {
                fingerprint.method.apply {
                    val index = fingerprint.instructionMatches.last().index
                    val register = getInstruction<OneRegisterInstruction>(index).registerA
                    replaceInstruction(
                        index = index,
                        smaliInstruction = "const/4 v$register, ${if (enable) "0x1" else "0x0"}",
                    )
                }
            }.onSuccess {
                logger.info("[Found] \"$trimmed\" toggled ${if (enable) "on" else "off"}.")
            }.onFailure {
                logger.info("[Skipped] \"$trimmed\" not found. No changes applied.")
            }
        }

        // Every switch that is on forces its flag on. Off = leave the feature at Gboard's default.
        val switches = listOf(
            emailSuggestions to "enable_email_provider_completion",
            androidAutofill to "enable_autofill_ime_integration",
            numberRow to "enable_number_row",
            fastAccessBar to "enable_fast_access_bar",
            grammarChecker to "enable_grammar_checker",
            multilingualTyping to "enable_multilingual_typing",
            settingsSearch to "enable_settings_search",
            aiWritingTools to "enable_writing_tools_v2",
            emojify to "enable_emojify",
            semanticEmoji to "enable_semantic_emoji",
            emojiKitchen to "enable_proactive_emoji_kitchen",
            expressionMoment to "enable_expression_moment",
            stickerPredictions to "enable_sticker_predictions_while_typing",
            dynamicArt to "enable_dynamic_art",
            trendingGifs to "enable_tenor_trending_gifs",
            textConversion to "enable_text_conversion",
            splitKeyboard to "enable_split_keyboard_on_tablet_large",
        )
        switches.forEach { (on, flag) -> if (on == true) setFlag(flag, enable = true) }

        customEnableFlags.orEmpty().forEach { setFlag(it, enable = true) }
        customDisableFlags.orEmpty().forEach { setFlag(it, enable = false) }
    }
}

private val FLAG_REGEX = """^[A-Za-z0-9_-]+$""".toRegex()
