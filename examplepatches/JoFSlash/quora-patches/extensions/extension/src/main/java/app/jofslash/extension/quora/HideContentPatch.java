package app.jofslash.extension.quora;

import android.util.Log;
import android.webkit.WebView;

@SuppressWarnings("unused")
public final class HideContentPatch {

    private static final String TAG = "JoFSlashPatches";

    // Quora's stable class names: "dom_annotate_*" mark answers, feed units and page sections.
    private static final String ANSWER = "[class*=\"dom_annotate_question_answer_item\"]";
    private static final String FEED_UNIT = "[class*=\"dom_annotate_multifeed_bundle_\"]";

    private static final String QUORA_PLUS_SELECTORS = String.join(",",
            paywalled(ANSWER),
            paywalled(FEED_UNIT)
    );

    private static final String RELATED_QUESTIONS_SELECTORS = String.join(",",
            "[class*=\"dom_annotate_related_questions\"]",
            // The box around the list at the bottom of a question page.
            ".qu-mt--small:has(> [class*=\"dom_annotate_related_questions\"])"
    );

    // "Tribe" is Quora's internal name for Spaces.
    private static final String SPACES_SUGGESTIONS_SELECTORS =
            "[class*=\"dom_annotate_multifeed_bundle_TribeSuggestionsBundle\"]";

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void hideQuoraPlusAnswers(WebView webView) {
        if (!PatchSettings.active(webView, "hideQuoraPlusAnswers", "Hide Quora+ answers")) return;
        injectStyle(webView, "jofslash-hide-quora-plus", QUORA_PLUS_SELECTORS);
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void hideRelatedQuestions(WebView webView) {
        if (!PatchSettings.active(webView, "hideRelatedQuestions", "Hide related questions")) return;
        injectStyle(webView, "jofslash-hide-related-questions", RELATED_QUESTIONS_SELECTORS);
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void hideSpacesSuggestions(WebView webView) {
        if (!PatchSettings.active(webView, "hideSpacesSuggestions", "Hide Spaces suggestions")) return;
        injectStyle(webView, "jofslash-hide-spaces-suggestions", SPACES_SUGGESTIONS_SELECTORS);
    }

    // Answers written by Poe bots show the bot's avatar from Poe's servers.
    private static final String POE_AVATAR =
            "img[src*=\"poe.multibot\"],img[src*=\"images.poe\"],img[src*=\"poe_\"]";

    private static final String AI_ANSWERS_SELECTORS = String.join(",",
            ANSWER + ":has(" + POE_AVATAR + ")",
            FEED_UNIT + ":has(" + POE_AVATAR + ")"
    );

    private static final String SUGGESTED_QUESTIONS_SELECTORS =
            "[class*=\"dom_annotate_multifeed_bundle_QuestionsBundle\"]";

    private static final String DOWNVOTE_SELECTORS = String.join(",",
            ".puppeteer_test_votable_downvote_button",
            "button[aria-label=\"Downvote\"]",
            "[role=\"button\"][aria-label=\"Downvote\"]"
    );

    private static final String TEXT_SELECTION_CSS = "body,body *{"
            + "-webkit-user-select:text !important;"
            + "user-select:text !important;"
            + "-webkit-touch-callout:default !important;}";

    // "Try Quora+" style buttons. Their markup has no stable class, so match the label.
    private static final String QUORA_PLUS_PROMOTIONS_SCRIPT = hideByLabelScript("QuoraPlusPromotions",
            "^(try|join|subscribe to|get|start free trial of) quora\\+$");

    // Links and buttons that open Poe or Quora's AI assistant.
    private static final String POE_SELECTORS = "a[href*=\"poe.com\"]";
    private static final String POE_SCRIPT = hideByLabelScript("Poe",
            "^(poe|try poe|open in poe|chat with poe|ask poe|continue in poe|ask assistant|assistant)$");

    // Vote, view and share counts. Like the buttons above, they only have generated class names,
    // so match the text: a number inside a vote or share button, or a "1.2K views" style label.
    private static final String COUNTS_SCRIPT = "(function(){"
            + "if(window.__jofslashCounts)return;"
            + "window.__jofslashCounts=true;"
            + "var num=/^[\\d.,]+\\s*[KMB]?$/i;"
            + "var label=/^(view\\s+)?[\\d.,]+\\s*[KMB]?\\s+(views?|upvotes?|shares?|followers?)$/i;"
            + "var buttons='.puppeteer_test_votable_upvote_button,.puppeteer_test_votable_downvote_button,"
            + "button[aria-label^=\"Upvote\"],button[aria-label^=\"Share\"],[role=\"button\"][aria-label^=\"Share\"]';"
            + "function hide(e){e.setAttribute('data-jofslash-hidden','');e.style.setProperty('display','none','important');}"
            + "function run(){"
            + "var b=document.querySelectorAll(buttons);"
            + "for(var i=0;i<b.length;i++){var s=b[i].querySelectorAll('span,div');"
            + "for(var j=0;j<s.length;j++){var e=s[j];"
            + "if(e.children.length||e.hasAttribute('data-jofslash-hidden'))continue;"
            + "if(num.test((e.textContent||'').trim()))hide(e);}}"
            + "var t=document.querySelectorAll('span,div,a');"
            + "for(var k=0;k<t.length;k++){var f=t[k];"
            + "if(f.children.length||f.hasAttribute('data-jofslash-hidden'))continue;"
            + "if(label.test((f.textContent||'').trim()))hide(f);}"
            + "}"
            + observeScript("run")
            + "})();";

    private static String hideByLabelScript(String name, String regex) {
        return "(function(){"
                + "if(window.__jofslash" + name + ")return;"
                + "window.__jofslash" + name + "=true;"
                + "var re=/" + regex + "/i;"
                + "function run(){"
                + "var c=document.querySelectorAll('a,button,[role=\"button\"]');"
                + "for(var i=0;i<c.length;i++){var e=c[i];"
                + "if(e.hasAttribute('data-jofslash-hidden'))continue;"
                + "var t=(e.getAttribute('aria-label')||e.textContent||'').trim();"
                + "if(re.test(t)){e.setAttribute('data-jofslash-hidden','');e.style.setProperty('display','none','important');}"
                + "}}"
                + observeScript("run")
                + "})();";
    }

    /**
     * Runs the function now and again, at most every 300 ms, whenever the page changes,
     * such as when more feed items load while scrolling.
     */
    private static String observeScript(String function) {
        return function + "();"
                + "var p=false;"
                + "new MutationObserver(function(){if(p)return;p=true;"
                + "setTimeout(function(){p=false;" + function + "();},300);})"
                + ".observe(document.documentElement,{childList:true,subtree:true});";
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void hideAiAnswers(WebView webView) {
        if (!PatchSettings.active(webView, "hideAiAnswers", "Hide AI answers")) return;
        injectStyle(webView, "jofslash-hide-ai-answers", AI_ANSWERS_SELECTORS);
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void hideSuggestedQuestions(WebView webView) {
        if (!PatchSettings.active(webView, "hideSuggestedQuestions", "Hide suggested questions")) return;
        injectStyle(webView, "jofslash-hide-suggested-questions", SUGGESTED_QUESTIONS_SELECTORS);
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void hideDownvoteButton(WebView webView) {
        if (!PatchSettings.active(webView, "hideDownvoteButton", "Hide downvote button")) return;
        injectStyle(webView, "jofslash-hide-downvote", DOWNVOTE_SELECTORS);
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void enableTextSelection(WebView webView) {
        if (!PatchSettings.active(webView, "enableTextSelection", "Enable text selection")) return;
        injectCss(webView, "jofslash-text-selection", TEXT_SELECTION_CSS);
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void hideQuoraPlusPromotions(WebView webView) {
        if (!PatchSettings.active(webView, "hideQuoraPlusPromotions", "Hide Quora+ promotions")) return;
        evaluate(webView, QUORA_PLUS_PROMOTIONS_SCRIPT, "Quora+ promotions");
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void hidePoe(WebView webView) {
        if (!PatchSettings.active(webView, "hidePoe", "Hide Poe")) return;
        injectStyle(webView, "jofslash-hide-poe", POE_SELECTORS);
        evaluate(webView, POE_SCRIPT, "Poe buttons");
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void hideCounts(WebView webView) {
        if (!PatchSettings.active(webView, "hideCounts", "Hide counts")) return;
        evaluate(webView, COUNTS_SCRIPT, "counts");
    }

    /**
     * A Quora+ answer shows the start of the text cut off, with a "continue reading" overlay
     * next to it. Requiring both keeps answers with other overlays, such as videos, visible.
     */
    private static String paywalled(String container) {
        return container + ":has(.qu-overflowY--hidden ~ .qu-zIndex--inline_overlay),"
                + container + ":has(.qu-zIndex--inline_overlay ~ .qu-overflowY--hidden)";
    }

    /**
     * Adds a stylesheet that hides the selectors, once per document. The style also applies
     * to content Quora loads later, such as more feed items while scrolling.
     */
    private static void injectStyle(WebView webView, String id, String selectors) {
        injectCss(webView, id, selectors + "{display:none !important;}");
    }

    private static void injectCss(WebView webView, String id, String css) {
        evaluate(webView, "(function(){"
                + "if(document.getElementById('" + id + "'))return;"
                + "var s=document.createElement('style');"
                + "s.id='" + id + "';"
                + "s.textContent='" + css.replace("'", "\\'") + "';"
                + "(document.head||document.documentElement).appendChild(s);"
                + "})();", id);
    }

    private static void evaluate(WebView webView, String script, String what) {
        if (webView == null) return;
        try {
            webView.evaluateJavascript(script, null);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to inject " + what, ex);
        }
    }
}
