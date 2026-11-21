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
     * Injection point: start of QWebViewClient.onPageFinished. The "What do you want to ask or share?"
     * box with Ask, Answer and Post at the top of the feed.
     */
    public static void hideAskBox(WebView webView) {
        if (!PatchSettings.active(webView, "hideAskBox", "Hide ask box")) return;
        injectStyle(webView, "jofslash-hide-ask-box", "[class*=\"dom_annotate_multifeed_bundle_AskQuestionPromptBundle\"]");
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished. The "Add a comment…" field under
     * answers and posts. It has no class of its own, so it is found by its text, and only the
     * smallest box that holds nothing else is hidden. Comments still open from the comment button.
     */
    public static void hideCommentBox(WebView webView) {
        if (!PatchSettings.active(webView, "hideCommentBox", "Hide comment box")) return;
        evaluate(webView, "(function(){"
                + "if(window.__jofslashCommentBox)return;window.__jofslashCommentBox=1;"
                + "var re=/^Add a comment(\\.\\.\\.|\\u2026)?$/;"
                + "function t(e){return (e.textContent||'').replace(/\\s+/g,' ').trim();}"
                + "function run(){document.querySelectorAll('div,span').forEach(function(e){"
                + "if(e.children.length||e.hasAttribute('data-jofslash-hidden')||!re.test(t(e)))return;"
                // Up to the box with the avatar and the field, but nothing else with text or buttons.
                + "var box=e;while(box.parentElement&&box.parentElement!==document.body"
                + "&&re.test(t(box.parentElement))&&!box.parentElement.querySelector('button,a[href]'))box=box.parentElement;"
                + "box.setAttribute('data-jofslash-hidden','');box.style.setProperty('display','none','important');});}"
                + observeScript("run")
                + "})();", "comment box");
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished. When you close a feed item with its ×
     * and pick "Not interested in this question", remembers that question and hides the feed's
     * answers to it from then on. Undo forgets it again. The list is kept by the app (Patch settings
     * > Dismissed questions shows and clears it).
     */
    public static void hideDismissedQuestions(WebView webView) {
        if (!PatchSettings.active(webView, "hideDismissedQuestions", "Hide dismissed questions")) return;
        evaluate(webView, "(function(){"
                + "if(window.__jofslashDismissed)return;window.__jofslashDismissed=1;"
                + "var J=window.JoFSlashPatches;if(!J)return;"
                + "function text(e){return (e&&(e.innerText||e.textContent)||'').replace(/\\s+/g,' ').trim();}"
                + "function title(u){return text(u.querySelector('.puppeteer_test_question_title'));}"
                // Read again until the bridge is there; a page can run this before it is.
                + "var list=[],loaded=false;function load(){if(!J.ready())return;"
                + "try{list=JSON.parse(J.dismissedQuestions())||[];loaded=true;}catch(e){list=[];}}"
                + "document.addEventListener('click',function(ev){var t=ev.target;if(!t||!t.closest)return;"
                // The ×: note the question now, as Quora replaces the item with a menu.
                + "var x=t.closest('.dom_annotate_negative_feedback_hide');"
                + "if(x){var u=x.closest('" + FEED_UNIT + "');var q=u?title(u):'';if(q)u.setAttribute('data-jofslash-q',q);return;}"
                + "var m=t.closest('[data-jofslash-q]');if(!m)return;var q2=m.getAttribute('data-jofslash-q');"
                // The menu option that was tapped: the nearest box with a short label.
                + "var label='';for(var e=t;e&&e!==m;e=e.parentElement){var s=text(e);if(s){label=s;break;}}"
                + "if(!J.ready())return;"
                + "if(/^Not interested in this question$/i.test(label)){J.dismissQuestion(q2);load();}"
                + "else if(/^Undo$/i.test(label)){J.undismissQuestion(q2);load();}},true);"
                + "function run(){if(!loaded)load();if(!list.length)return;"
                + "document.querySelectorAll('" + FEED_UNIT + "').forEach(function(u){"
                + "if(u.hasAttribute('data-jofslash-hidden'))return;var q=title(u).toLowerCase();"
                + "if(q&&list.indexOf(q)>=0){u.setAttribute('data-jofslash-hidden','');u.style.setProperty('display','none','important');}});}"
                + "load();"
                + observeScript("run")
                + "})();", "dismissed questions");
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
            // A count, or the "·" between a button's label and its count.
            + "var num=/^([\\d.,]+\\s*[KMB]?|\\u00b7)$/i;"
            + "var label=/^(view\\s+)?[\\d.,]+\\s*[KMB]?\\s+(views?|upvotes?|shares?|followers?)$/i;"
            + "var buttons='.puppeteer_test_votable_upvote_button,.puppeteer_test_votable_downvote_button,"
            + "button[aria-label^=\"Upvote\"],button[aria-label^=\"Share\"],[role=\"button\"][aria-label^=\"Share\"],"
            + ".dom_annotate_answer_action_bar_comment,.dom_annotate_answer_action_bar_share,"
            // Compact counts next to an icon, as in "Featured In" boxes.
            + "[aria-label$=\" upvote\"],[aria-label$=\" upvotes\"],[aria-label$=\" comment\"],[aria-label$=\" comments\"],"
            + "[aria-label$=\" share\"],[aria-label$=\" shares\"]';"
            + "function hide(e){e.setAttribute('data-jofslash-hidden','');e.style.setProperty('display','none','important');}"
            // The outermost wrapper holding only this text; its ::before may draw a "·".
            + "function outer(e){var t=(e.textContent||'').trim();"
            + "while(e.parentElement&&e.parentElement!==document.body&&(e.parentElement.textContent||'').trim()===t"
            + "&&!e.parentElement.querySelector('svg,img'))e=e.parentElement;return e;}"
            // Hides wrappers left with nothing to show, such as the span whose ::before draws the "·".
            + "function gone(e){if(e.hasAttribute('data-jofslash-hidden'))return true;var c=e.childNodes;"
            + "for(var i=0;i<c.length;i++){var n=c[i];if(n.nodeType===3){if(n.textContent.trim())return false;}"
            + "else if(n.nodeType===1&&!gone(n)&&getComputedStyle(n).display!=='none')return false;}return true;}"
            + "function up(p,stop){while(p&&p!==stop&&!p.querySelector('svg,img')&&gone(p)){hide(p);p=p.parentElement;}}"
            + "function run(){"
            + "var b=document.querySelectorAll(buttons);"
            + "for(var i=0;i<b.length;i++){var s=b[i].querySelectorAll('span,div');"
            + "for(var j=0;j<s.length;j++){var e=s[j];"
            + "if(e.children.length||e.hasAttribute('data-jofslash-hidden'))continue;"
            // Also hide the outermost wrapper holding only the count: its ::before draws the "·".
            + "if(num.test((e.textContent||'').trim())){var w=e;"
            // Stop below anything holding the button's icon.
            + "while(w.parentElement&&w.parentElement!==b[i]&&num.test((w.parentElement.textContent||'').trim())"
            + "&&!w.parentElement.querySelector('svg,img'))w=w.parentElement;"
            + "hide(w);up(w.parentElement,b[i]);}}}"
            + "var t=document.querySelectorAll('span,div,a');"
            + "for(var k=0;k<t.length;k++){var f=t[k];"
            + "if(f.children.length||f.hasAttribute('data-jofslash-hidden'))continue;"
            + "if(label.test((f.textContent||'').trim()))hide(outer(f));}"
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
     * Injection point: start of QWebViewClient.onPageFinished. Hides the feed's "Update Available"
     * card. It has no stable class, so it is found by its title and button.
     */
    public static void hideUpdateCard(WebView webView) {
        evaluate(webView, "(function(){"
                + "if(window.__jofslashUpdateCard)return;window.__jofslashUpdateCard=1;"
                + "function run(){var t=[].slice.call(document.querySelectorAll('div,span')).filter(function(e){"
                + "return !e.children.length&&(e.textContent||'').trim()==='Update Available';});"
                + "t.forEach(function(e){for(var p=e.parentElement;p&&p!==document.body;p=p.parentElement){"
                + "if(/Download Update/.test(p.textContent||'')){if(p.getBoundingClientRect().height<600){"
                + "p.setAttribute('data-jofslash-hidden','');p.style.setProperty('display','none','important');}return;}}});}"
                + observeScript("run")
                + "})();", "update card");
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

    // The "823 comments from Jane Doe and more" row under an answer. It has no stable class, so it is
    // found by its text and hidden with its wrappers. Comments still open from the comment button.
    private static final String COMMENT_PREVIEWS_SCRIPT = "(function(){"
            + "if(window.__jofslashComments)return;window.__jofslashComments=1;"
            + "var re=/^[\\d.,]+\\s*[KMB]?\\s+comments?\\s+from\\s.+\\sand more$/i;"
            + "function flat(e){return (e.textContent||'').replace(/\\s+/g,' ').trim();}"
            + "function run(){document.querySelectorAll('div').forEach(function(d){"
            + "if(d.hasAttribute('data-jofslash-hidden'))return;"
            + "var t=flat(d);if(t.length>160||!re.test(t))return;"
            + "for(var i=0;i<d.children.length;i++)if(re.test(flat(d.children[i])))return;"
            + "var w=d;while(w.parentElement&&w.parentElement!==document.body&&flat(w.parentElement)===t)w=w.parentElement;"
            + "w.setAttribute('data-jofslash-hidden','');w.style.setProperty('display','none','important');});}"
            + observeScript("run")
            + "})();";

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void hideCommentPreviews(WebView webView) {
        if (!PatchSettings.active(webView, "hideCommentPreviews", "Hide comment previews")) return;
        evaluate(webView, COMMENT_PREVIEWS_SCRIPT, "comment previews");
    }

    // Posts from Spaces in the feed, so that it shows answers to questions only.
    private static final String SPACES_POSTS_SELECTORS =
            "[class*=\"dom_annotate_multifeed_bundle_PostBundle\"],"
                    + "[class*=\"dom_annotate_multifeed_bundle_ExplorePostBundle\"]";

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void hideSpacesPosts(WebView webView) {
        if (!PatchSettings.active(webView, "hideSpacesPosts", "Hide Spaces posts")) return;
        injectStyle(webView, "jofslash-hide-spaces-posts", SPACES_POSTS_SELECTORS);
    }

    // The blue "Follow" next to author and Space names, and the "·" before it.
    private static final String FOLLOW_SCRIPT = "(function(){"
            + "if(window.__jofslashFollow)return;window.__jofslashFollow=1;"
            + "function hide(e){e.setAttribute('data-jofslash-hidden','');e.style.setProperty('display','none','important');}"
            + "function run(){document.querySelectorAll('.q-click-wrapper').forEach(function(c){"
            + "if(c.hasAttribute('data-jofslash-follow'))return;"
            + "if(!/^Follow(ing)?$/.test((c.textContent||'').trim()))return;c.setAttribute('data-jofslash-follow','');"
            // Only the small inline one in a header, not Follow buttons on profiles and Space pages.
            + "var box=c.parentElement;if(!box||(box.textContent||'').trim()!==(c.textContent||'').trim())return;"
            + "if(getComputedStyle(box).display.indexOf('inline')<0)return;"
            + "hide(box);var dot=box.previousElementSibling;"
            + "if(dot&&(dot.textContent||'').trim()==='·')hide(dot);});}"
            + observeScript("run")
            + "})();";

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void hideFollowButtons(WebView webView) {
        if (!PatchSettings.active(webView, "hideFollowButtons", "Hide Follow buttons")) return;
        evaluate(webView, FOLLOW_SCRIPT, "Follow buttons");
    }

    // The line under an author's name ("Lives in Vienna", "Knows English") and "Upvoted by" lines.
    // The credential sits before the date, separated by a "·"; the date stays.
    private static final String CREDENTIALS_SCRIPT = "(function(){"
            + "if(window.__jofslashCredentials)return;window.__jofslashCredentials=1;"
            + "var date=/^(\\d+[smhdwy]|[A-Z][a-z]{2} \\d{1,2}(, \\d{4})?|Mon|Tue|Wed|Thu|Fri|Sat|Sun|Updated .+)$/;"
            + "function hide(e){e.setAttribute('data-jofslash-hidden','');e.style.setProperty('display','none','important');}"
            + "function text(e){return (e.textContent||'').replace(/\\s+/g,' ').trim();}"
            + "function run(){"
            + "document.querySelectorAll('a.answer_timestamp,a.puppeteer_test_link').forEach(function(a){"
            + "if(a.hasAttribute('data-jofslash-cred')||!date.test(text(a)))return;a.setAttribute('data-jofslash-cred','');"
            // Up to the row that holds the credential, the "·" and the date.
            + "var w=a;while(w.parentElement&&text(w.parentElement)===text(a))w=w.parentElement;"
            + "var dot=w.previousElementSibling;if(!dot||text(dot)!=='·')return;"
            + "var cred=dot.previousElementSibling;if(!cred||/^Posted by/.test(text(cred))||!text(cred))return;"
            + "hide(cred);hide(dot);});"
            + "document.querySelectorAll('div,span').forEach(function(e){"
            + "if(e.children.length>2||e.hasAttribute('data-jofslash-hidden'))return;var t=text(e);"
            + "if(!/^Upvoted by .+/.test(t)||t.length>200)return;"
            + "var w=e;while(w.parentElement&&text(w.parentElement)===t)w=w.parentElement;hide(w);});}"
            + observeScript("run")
            + "})();";

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void hideCredentials(WebView webView) {
        if (!PatchSettings.active(webView, "hideCredentials", "Hide credentials")) return;
        evaluate(webView, CREDENTIALS_SCRIPT, "credentials");
    }

    // "How satisfied are you with your home feed experience today?", "Was this worth your time?" and similar boxes.
    private static final String SURVEYS_SCRIPT = "(function(){"
            + "if(window.__jofslashSurveys)return;window.__jofslashSurveys=1;"
            + "var re=/^(How (satisfied|likely|would you rate)|Rate your experience|Help us improve|Was this worth your time)/i;"
            + "function text(e){return (e.textContent||'').replace(/\\s+/g,' ').trim();}"
            + "function run(){document.querySelectorAll('div').forEach(function(d){"
            + "if(d.hasAttribute('data-jofslash-hidden'))return;var t=text(d);if(!re.test(t))return;"
            + "for(var i=0;i<d.children.length;i++)if(re.test(text(d.children[i])))return;"
            // The whole box: its wrappers start with the same question and stay short.
            + "var w=d;while(w.parentElement&&w.parentElement!==document.body){var p=text(w.parentElement);"
            + "if(p.indexOf(t)!==0||p.length>400)break;w=w.parentElement;}"
            // "Was this worth your time?" under answers sits in a box that starts with "Your response is private".
            + "while(w.parentElement&&w.parentElement!==document.body){var q=text(w.parentElement);"
            + "if(!/^Your response is private/i.test(q)||q.indexOf(t)<0||q.length>300)break;w=w.parentElement;}"
            + "w.setAttribute('data-jofslash-hidden','');w.style.setProperty('display','none','important');});}"
            + observeScript("run")
            + "})();";

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void hideSurveys(WebView webView) {
        if (!PatchSettings.active(webView, "hideSurveys", "Hide surveys")) return;
        evaluate(webView, SURVEYS_SCRIPT, "surveys");
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
            // The bridge for our scripts, with its key; see PatchSettings.bridgeScript.
            webView.evaluateJavascript(PatchSettings.bridgeScript() + script, null);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to inject " + what, ex);
        }
    }
}
