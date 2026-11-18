package app.jofslash.patches.quora.reading

import app.jofslash.patches.quora.ads.InterceptRequestFingerprint
import app.jofslash.patches.quora.ads.PageFinishedFingerprint
import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.jofslash.patches.quora.shared.registerSetting
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/quora/ReadingPatch;"

/** Escapes text for a smali const-string. */
private fun smaliString(value: String) =
    value.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", " ").replace("\r", " ")

/** A patch that runs one ReadingPatch method, which takes only the WebView, on every page. */
private fun readingPatch(name: String, description: String, extensionMethod: String) = bytecodePatch(
    name = name,
    description = description,
    default = false
) {
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    execute {
        PageFinishedFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS->$extensionMethod(Landroid/webkit/WebView;)V"
        )
    }
}

/** A patch that runs one ReadingPatch method with the value of a text option on every page. */
private fun readingOptionPatch(
    name: String,
    description: String,
    extensionMethod: String,
    optionKey: String,
    optionTitle: String,
    optionDescription: String,
    optionDefault: String,
    optionValues: Map<String, String>? = null,
) = bytecodePatch(
    name = name,
    description = description,
    default = false
) {
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    val option = stringOption(
        key = optionKey,
        default = optionDefault,
        values = optionValues,
        title = optionTitle,
        description = optionDescription,
    )

    execute {
        val value = smaliString(option.value ?: "")
        // v0 is free at the start of onPageFinished.
        PageFinishedFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "$value"
                invoke-static { p1, v0 }, $EXTENSION_CLASS->$extensionMethod(Landroid/webkit/WebView;Ljava/lang/String;)V
            """
        )
    }
}

@Suppress("unused")
val filterKeywordsPatch = readingOptionPatch(
    name = "Filter keywords",
    description = "Hides answers, posts and questions that mention words you pick.",
    extensionMethod = "filterKeywords",
    optionKey = "keywords",
    optionTitle = "Keywords",
    optionDescription = "Words or phrases, separated by commas. Matching ignores case. Example: crypto, horoscope, Elon Musk",
    optionDefault = "",
)

@Suppress("unused")
val blockAuthorsPatch = readingOptionPatch(
    name = "Block authors and Spaces",
    description = "Hides answers and posts by the people and Spaces you pick.",
    extensionMethod = "blockAuthors",
    optionKey = "authors",
    optionTitle = "Authors and Spaces",
    optionDescription = "Names as Quora shows them, separated by commas. Example: Jane Doe, Cats of Quora",
    optionDefault = "",
)

@Suppress("unused")
val answerFontPatch = readingOptionPatch(
    name = "Answer font",
    description = "Sets answers in a serif or a sans-serif font of your phone.",
    extensionMethod = "answerFont",
    optionKey = "answerFont",
    optionTitle = "Font",
    optionDescription = "The kind of font answers are set in.",
    optionDefault = "serif",
    optionValues = mapOf("Serif" to "serif", "Sans-serif" to "sans"),
)

@Suppress("unused")
val expandAnswersPatch = readingPatch(
    name = "Expand answers",
    description = "Opens shortened answers on question pages, and shows the whole answer preview in the feed.",
    extensionMethod = "expandAnswers",
)

@Suppress("unused")
val hidePeopleSuggestionsPatch = readingPatch(
    name = "Hide people suggestions",
    description = "Hides \"People you may know\" and other people to follow in the feed.",
    extensionMethod = "hidePeopleSuggestions",
)

@Suppress("unused")
val amoledDarkPatch = readingPatch(
    name = "AMOLED dark mode",
    description = "Uses a pure black background when Quora's dark theme is on.",
    extensionMethod = "amoledDark",
)

@Suppress("unused")
val comfortableReadingPatch = readingPatch(
    name = "Comfortable reading",
    description = "More space between the lines and paragraphs of answers.",
    extensionMethod = "comfortableReading",
)

@Suppress("unused")
val keepScreenOnPatch = readingPatch(
    name = "Keep screen on",
    description = "Keeps the screen from turning off while a page is open.",
    extensionMethod = "keepScreenOn",
)

// Whether the native nav bar shows its Ask button.
internal object ShouldShowAskButtonFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/controls/QNavBar;",
    name = "getShouldShowAskButton",
    returnType = "Z",
    parameters = listOf(),
)

@Suppress("unused")
val hideAskButtonPatch = bytecodePatch(
    name = "Hide Ask button",
    description = "Hides the button for asking a question in the top bar and on pages.",
    default = false
) {
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    execute {
        registerSetting("hideAskButton", "Hide Ask button")
        ShouldShowAskButtonFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, Lapp/jofslash/extension/quora/NativeTweaksPatch;->hideAskButton()Z
                move-result v0
                if-eqz v0, :show
                const/4 v0, 0x0
                return v0
                :show
                nop
            """
        )
        PageFinishedFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS->hideAskButton(Landroid/webkit/WebView;)V"
        )
    }
}

@Suppress("unused")
val dataSaverPatch = bytecodePatch(
    name = "Data saver",
    description = "Images load only when you tap them.",
    default = false
) {
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    execute {
        InterceptRequestFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p2 }, $EXTENSION_CLASS->blockImage(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
                move-result-object v0
                if-eqz v0, :load
                return-object v0
                :load
                nop
            """
        )
        PageFinishedFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS->dataSaverPage(Landroid/webkit/WebView;)V"
        )
    }
}
