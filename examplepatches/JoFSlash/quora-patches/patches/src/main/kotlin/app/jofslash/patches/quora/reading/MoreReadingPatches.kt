package app.jofslash.patches.quora.reading

import app.jofslash.patches.quora.ads.PageFinishedFingerprint
import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.jofslash.patches.quora.shared.registerSetting
import app.jofslash.patches.quora.video.InitWebViewFingerprint
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption

private const val READING = "Lapp/jofslash/extension/quora/ReadingPatch;"
private const val FULLSCREEN = "Lapp/jofslash/extension/quora/FullscreenReading;"

/** Adds the bridge these patches use to reach the app; only our own page scripts hold its key. */
private fun BytecodePatchContext.bindBridge() {
    InitWebViewFingerprint.method.addInstruction(
        0,
        "invoke-static { p1 }, Lapp/jofslash/extension/quora/PatchSettings;->bind(Landroid/webkit/WebView;)V"
    )
}

@Suppress("unused")
val shareAnswerTextPatch = bytecodePatch(
    name = "Share answer text",
    description = "Adds a Share text button next to Share under answers and posts. " +
            "It shares their text without formatting, for example to a notes app.",
    default = true
) {
    category("Reading")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    execute {
        PageFinishedFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $READING->shareAnswerText(Landroid/webkit/WebView;)V"
        )
        bindBridge()
    }
}

// Shows the menu a page asks for, such as the sort order of answers.
internal object ShowPopoverMenuFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/components/activities/QBaseActivity;",
    name = "showPopoverMenu",
    returnType = "V",
    parameters = listOf("Lorg/json/JSONObject;", "Lcom/quora/android/fragments/qwvf/QWebViewController;"),
)

@Suppress("unused")
val sortAnswersPatch = bytecodePatch(
    name = "Sort answers",
    description = "Opens questions with their answers sorted by the order you pick instead of Recommended. " +
            "You can still change the order on the page.",
    default = false
) {
    category("Reading")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    val order = stringOption(
        key = "sortOrder",
        default = "Recent",
        values = mapOf("Recent" to "Recent", "Upvotes" to "Upvotes"),
        title = "Order",
        description = "Recent or Upvotes. Can be changed later in Patch settings.",
    )

    execute {
        val value = if (order.value.equals("Upvotes", ignoreCase = true)) "Upvotes" else "Recent"
        // v0 is free at the start of onPageFinished.
        PageFinishedFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "$value"
                invoke-static { p1, v0 }, $READING->sortAnswers(Landroid/webkit/WebView;Ljava/lang/String;)V
            """
        )
        // The page opens the sort menu itself; the app answers it with the order instead of showing it.
        // p1 is the menu, p2 the page's controller; v0 is free at the start.
        ShowPopoverMenuFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p1, p2 }, $READING->pickSortSheet(Lorg/json/JSONObject;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :show_menu
                return-void
                :show_menu
                nop
            """
        )
        bindBridge()
    }
}

@Suppress("unused")
val readingHistoryPatch = bytecodePatch(
    name = "Reading history",
    description = "Remembers the answers, posts and questions you open, so you can find them again " +
            "under History in Patch settings. The list stays on your phone.",
    default = true
) {
    category("Reading")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    execute {
        PageFinishedFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $READING->readingHistory(Landroid/webkit/WebView;)V"
        )
        bindBridge()
    }
}

internal object WebViewScrollChangedFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/fragments/qwvf/QWebView;",
    name = "onScrollChanged",
    returnType = "V",
    parameters = listOf("I", "I", "I", "I"),
)

@Suppress("unused")
val fullscreenReadingPatch = bytecodePatch(
    name = "Fullscreen reading",
    description = "Hides the top bar and the tabs while you scroll down, and shows them again when you " +
            "scroll up. On answer and question pages it hides their top bar.",
    default = false
) {
    category("Reading")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    execute {
        registerSetting("fullscreenReading", "Fullscreen reading")
        // p0 is the web view, p2 the new and p4 the old scroll position.
        WebViewScrollChangedFingerprint.method.addInstruction(
            0,
            "invoke-static { p0, p2, p4 }, $FULLSCREEN->onScroll(Landroid/view/View;II)V"
        )
    }
}

@Suppress("unused")
val bookmarksPatch = bytecodePatch(
    name = "Bookmarks",
    description = "Adds a bookmark button next to Share under an open answer or post, to read it later. " +
            "Saved items are listed under Bookmarks in Patch settings and stay on your phone.",
    default = true
) {
    category("Reading")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    execute {
        PageFinishedFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $READING->bookmarks(Landroid/webkit/WebView;)V"
        )
        bindBridge()
    }
}

@Suppress("unused")
val translateButtonPatch = bytecodePatch(
    name = "Translate button",
    description = "Adds a Translate button next to Share under answers and posts. It shows their text " +
            "translated by Google Translate inside the app, into your phone's language or the one you pick. " +
            "The text is sent to Google only when you tap the button.",
    default = false
) {
    category("Reading")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    execute {
        PageFinishedFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $READING->translateAnswerText(Landroid/webkit/WebView;)V"
        )
        bindBridge()
    }
}
