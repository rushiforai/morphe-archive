package app.jofslash.patches.quora.reading

import app.jofslash.patches.quora.ads.InterceptRequestFingerprint
import app.jofslash.patches.quora.ads.PageFinishedFingerprint
import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.jofslash.patches.quora.shared.registerSetting
import app.jofslash.patches.quora.video.InitWebViewFingerprint
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/quora/ReadingPatch;"

/** Escapes text for a smali const-string. */
private fun smaliString(value: String) =
    value.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", " ").replace("\r", " ")

/** A patch that runs one ReadingPatch method, which takes only the WebView, on every page. */
private fun readingPatch(
    patchCategory: String,
    name: String,
    description: String,
    extensionMethod: String,
    default: Boolean = false,
) = bytecodePatch(
    name = name,
    description = description,
    default = default
) {
    category(patchCategory)
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/quora.mpe")

    execute {
        PageFinishedFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS->$extensionMethod(Landroid/webkit/WebView;)V"
        )
    }
}

/** A patch that runs one ReadingPatch method with the value of a text option on every page. */
private fun readingOptionPatch(
    patchCategory: String,
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
    category(patchCategory)
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/quora.mpe")

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
    patchCategory = "Feed",
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
    patchCategory = "Feed",
    description = "Hides answers and posts by the people and Spaces you pick.",
    extensionMethod = "blockAuthors",
    optionKey = "authors",
    optionTitle = "Authors and Spaces",
    optionDescription = "Names as Quora shows them, separated by commas. Example: Jane Doe, Cats of Quora",
    optionDefault = "",
)

@Suppress("unused")
val hideSeenItemsPatch = readingOptionPatch(
    name = "Hide seen items",
    patchCategory = "Feed",
    description = "Dims or hides feed items you already opened when the feed shows them again. " +
            "The list of opened items stays on your phone.",
    extensionMethod = "hideSeen",
    optionKey = "seenMode",
    optionTitle = "Seen items",
    optionDescription = "Whether items you already opened are dimmed or hidden.",
    optionDefault = "dim",
    optionValues = mapOf("Dim" to "dim", "Hide" to "hide"),
)

@Suppress("unused")
val hideOldAnswersPatch = readingOptionPatch(
    name = "Hide old answers",
    patchCategory = "Feed",
    description = "Hides answers and posts older than the number of years you pick, in the feed and on question pages.",
    extensionMethod = "hideOldAnswers",
    optionKey = "maxAge",
    optionTitle = "Older than",
    optionDescription = "Answers and posts at least this many years old are hidden.",
    optionDefault = "3",
    optionValues = mapOf("1 year" to "1", "2 years" to "2", "3 years" to "3", "5 years" to "5", "10 years" to "10"),
)

@Suppress("unused")
val answerFontPatch = readingOptionPatch(
    name = "Answer font",
    patchCategory = "Reading",
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
    patchCategory = "Reading",
    description = "Opens shortened answers on question pages, and shows the whole answer preview in the feed.",
    extensionMethod = "expandAnswers",
    default = true,
)

@Suppress("unused")
val copyAnswerTextPatch = bytecodePatch(
    name = "Copy answer text",
    description = "Adds a Copy button next to Share under answers and posts. It copies their text without formatting.",
    default = true
) {
    category("Reading")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/quora.mpe")

    execute {
        PageFinishedFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS->copyAnswerText(Landroid/webkit/WebView;)V"
        )
        // The button hands the text to the app, which puts it on the clipboard.
        InitWebViewFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, Lapp/jofslash/extension/quora/PatchSettings;->bind(Landroid/webkit/WebView;)V"
        )
    }
}

@Suppress("unused")
val hidePeopleSuggestionsPatch = readingPatch(
    name = "Hide people suggestions",
    patchCategory = "Feed",
    description = "Hides \"People you may know\" and other people to follow in the feed.",
    extensionMethod = "hidePeopleSuggestions",
)

@Suppress("unused")
val hideAnonymousAnswersPatch = readingPatch(
    name = "Hide anonymous answers",
    patchCategory = "Feed",
    description = "Hides answers written as \"Anonymous\" in the feed and on question pages.",
    extensionMethod = "hideAnonymousAnswers",
)

@Suppress("unused")
val amoledDarkPatch = readingPatch(
    name = "AMOLED dark mode",
    patchCategory = "Reading",
    description = "Uses a pure black background when Quora's dark theme is on.",
    extensionMethod = "amoledDark",
)

@Suppress("unused")
val comfortableReadingPatch = readingPatch(
    name = "Comfortable reading",
    patchCategory = "Reading",
    description = "More space between the lines and paragraphs of answers.",
    extensionMethod = "comfortableReading",
)

@Suppress("unused")
val keepScreenOnPatch = readingPatch(
    name = "Keep screen on",
    patchCategory = "Reading",
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
    category("App")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/quora.mpe")

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
    description = "Images load only when you tap them. By default only on mobile data; on Wi-Fi they load as usual.",
    default = false
) {
    category("Reading")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/quora.mpe")

    val loadOnWifi = booleanOption(
        key = "loadOnWifi",
        default = true,
        title = "Load images on Wi-Fi",
        description = "Images load as usual on Wi-Fi and wait for a tap only on mobile data or a hotspot. " +
                "Can also be switched in Patch settings.",
    )

    execute {
        if (loadOnWifi.value == true) registerSetting("dataSaverOnWifi", "Data saver: load images on Wi-Fi")
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
