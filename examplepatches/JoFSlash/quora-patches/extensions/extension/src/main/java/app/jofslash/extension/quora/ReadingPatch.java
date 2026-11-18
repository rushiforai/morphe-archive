package app.jofslash.extension.quora;

import android.net.Uri;
import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;

import java.io.ByteArrayInputStream;

/**
 * Page patches that change how answers read: filters, expanding, fonts, dark ground and images.
 */
@SuppressWarnings("unused")
public final class ReadingPatch {

    private static final String TAG = "JoFSlashPatches";

    // Answers, feed units and search results: what a filter hides as a whole.
    private static final String UNITS = "[class*=\"dom_annotate_question_answer_item\"],"
            + "[class*=\"dom_annotate_multifeed_bundle_\"],.puppeteer_test_question_component_base";

    private static final String ANSWER_TEXT = ".puppeteer_test_answer_content";

    // Paragraphs of answers and posts, also in the answer and post modals, which have no answer_content class.
    private static final String PARAGRAPH = "p.q-text";

    /** The query parameter the page adds to an image the reader tapped, so the request is let through. */
    private static final String LOAD_PARAM = "jofslash_load";

    // ---------------------------------------------------------------- filters

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     *
     * @param words Comma separated words or phrases. Feed items and answers containing one are hidden.
     */
    public static void filterKeywords(WebView webView, String words) {
        if (!PatchSettings.active(webView, "filterKeywords", "Filter keywords")) return;
        words = PatchSettings.text(webView, "keywords", "Keywords", words);
        String list = jsonList(words);
        if (list.equals("[]")) return;
        evaluate(webView, "(function(){"
                + "if(window.__jofslashKeywords)return;window.__jofslashKeywords=1;"
                + "var words=" + list + ";"
                + "var esc=function(w){return w.replace(/[.*+?^${}()|[\\]\\\\]/g,'\\\\$&').replace(/\\s+/g,'\\\\s+');};"
                + "var re=new RegExp('(^|[^\\\\p{L}\\\\p{N}])('+words.map(esc).join('|')+')(?=$|[^\\\\p{L}\\\\p{N}])','iu');"
                + "function run(){document.querySelectorAll('" + UNITS + "').forEach(function(u){"
                + "if(u.hasAttribute('data-jofslash-filtered'))return;"
                + "if(re.test(u.innerText||'')){u.setAttribute('data-jofslash-filtered','');u.style.setProperty('display','none','important');}"
                + "});}"
                + observe("run")
                + "})();", "keyword filter");
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     *
     * @param names Comma separated author names or Space names, as Quora shows them.
     */
    public static void blockAuthors(WebView webView, String names) {
        if (!PatchSettings.active(webView, "blockAuthors", "Block authors and Spaces")) return;
        names = PatchSettings.text(webView, "authors", "Authors and Spaces", names);
        String list = jsonList(names);
        if (list.equals("[]")) return;
        evaluate(webView, "(function(){"
                + "if(window.__jofslashAuthors)return;window.__jofslashAuthors=1;"
                + "var norm=function(s){return (s||'').toLowerCase().replace(/[-_]+/g,' ').replace(/\\s+/g,' ').trim();};"
                + "var names=" + list + ".map(norm);"
                + "function slug(a){var m=(a.getAttribute('href')||'').match(/\\/profile\\/([^/?#]+)/);return m?norm(decodeURIComponent(m[1]).replace(/-\\d+$/,'')):'';}"
                + "function space(a){try{var h=new URL(a.href).hostname.split('.');return h.length>2&&h[h.length-2]==='quora'&&!/^(www|[a-z]{2})$/.test(h[0])?norm(h[0]):'';}catch(e){return '';}}"
                + "function hit(u){var links=u.querySelectorAll('a[href]');for(var i=0;i<links.length;i++){var a=links[i];"
                + "var c=[norm(a.textContent),slug(a),space(a)];for(var j=0;j<c.length;j++)if(c[j]&&names.indexOf(c[j])>=0)return true;}"
                + "var t=u.querySelectorAll('.puppeteer_test_tribe_name');for(var k=0;k<t.length;k++)if(names.indexOf(norm(t[k].textContent))>=0)return true;"
                + "return false;}"
                + "function run(){document.querySelectorAll('" + UNITS + "').forEach(function(u){"
                + "if(u.hasAttribute('data-jofslash-filtered'))return;"
                + "if(hit(u)){u.setAttribute('data-jofslash-filtered','');u.style.setProperty('display','none','important');}"
                + "});}"
                + observe("run")
                + "})();", "author filter");
    }

    // ---------------------------------------------------------------- reading

    /**
     * Injection point: start of QWebViewClient.onPageFinished. Shows the whole answer preview in the feed.
     */
    public static void expandAnswers(WebView webView) {
        if (!PatchSettings.active(webView, "expandAnswers", "Expand answers")) return;
        // "Read more" opens the full answer in a new view in the app, so it is not clicked.
        // The feed holds a longer preview than the three lines it shows; show all of it.
        injectCss(webView, "jofslash-expand",
                ANSWER_TEXT + " [class*=\"qu-truncateLines--\"]{-webkit-line-clamp:unset !important;"
                        + "line-clamp:unset !important;max-height:none !important;}");
        // On question pages "Continue Reading" opens the answer in place, so it is clicked there.
        // It has no stable class, so it is found by its text, and never in the feed, where "Read more" opens a new view.
        evaluate(webView, "(function(){"
                + "if(window.__jofslashExpand)return;window.__jofslashExpand=1;"
                + "function run(){document.querySelectorAll('div,span').forEach(function(e){"
                + "if(e.children.length||e.hasAttribute('data-jofslash-expanded'))return;"
                + "if(!/^Continue Reading/.test((e.textContent||'').trim())||e.textContent.trim().length>20)return;"
                + "if(e.closest('[class*=\"dom_annotate_multifeed_bundle_\"]'))return;"
                + "e.setAttribute('data-jofslash-expanded','');try{e.click();}catch(x){}});}"
                + observe("run")
                + "})();", "expand answers");
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void hidePeopleSuggestions(WebView webView) {
        if (!PatchSettings.active(webView, "hidePeopleSuggestions", "Hide people suggestions")) return;
        injectCss(webView, "jofslash-hide-people",
                "[class*=\"dom_annotate_multifeed_bundle_\"][class*=\"SuggestionsBundle\"]:not([class*=\"Tribe\"])"
                        + "{display:none !important;}");
        evaluate(webView, "(function(){"
                + "if(window.__jofslashPeople)return;window.__jofslashPeople=1;"
                + "var re=/^(people you may know|suggested (people|profiles|for you)|who to follow|people to follow)$/i;"
                + "function run(){document.querySelectorAll('" + UNITS + "').forEach(function(u){"
                + "if(u.hasAttribute('data-jofslash-filtered'))return;"
                + "var h=u.querySelectorAll('div,span,h2,h3');for(var i=0;i<h.length&&i<40;i++){var t=(h[i].children.length?'':(h[i].textContent||'')).trim();"
                + "if(re.test(t)){u.setAttribute('data-jofslash-filtered','');u.style.setProperty('display','none','important');return;}}"
                + "});}"
                + observe("run")
                + "})();", "people suggestions");
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished. The page's own "Add question" button.
     */
    public static void hideAskButton(WebView webView) {
        if (!PatchSettings.active(webView, "hideAskButton", "Hide Ask button")) return;
        injectCss(webView, "jofslash-hide-ask", ".puppeteer_test_add_question_button,.puppeteer_test_ask_question_prompt,"
                + "[class*=\"dom_annotate_multifeed_bundle_AskQuestionPromptBundle\"]{display:none !important;}");
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished. Only applies while Quora's dark theme is on.
     */
    public static void amoledDark(WebView webView) {
        if (!PatchSettings.active(webView, "amoledDark", "AMOLED dark mode")) return;
        if (webView != null) {
            try {
                // The WebView shows its own background before the page paints.
                if (isDark(webView)) webView.setBackgroundColor(0xFF000000);
            } catch (Exception ex) {
                Log.e(TAG, "Failed to set background", ex);
            }
        }
        String dark = "body.q-color-mode--dark";
        injectCss(webView, "jofslash-amoled",
                "html:has(" + dark + ")," + dark + "," + dark + " #root,"
                        + dark + " [class*=\"qu-bg--raised\"]," + dark + " [class*=\"qu-bg--base\"],"
                        + dark + " [class*=\"qu-bg--gray_ultralight\"]," + dark + " [class*=\"qu-bg--white\"]"
                        + "{background-color:#000 !important;}");
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void comfortableReading(WebView webView) {
        if (!PatchSettings.active(webView, "comfortableReading", "Comfortable reading")) return;
        injectCss(webView, "jofslash-reading",
                ANSWER_TEXT + "," + ANSWER_TEXT + " .q-text," + PARAGRAPH
                        + "{line-height:1.75 !important;letter-spacing:.005em;}"
                        + ANSWER_TEXT + " p," + PARAGRAPH + "{margin-bottom:.8em !important;}");
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     *
     * @param font "serif" or "sans".
     */
    public static void answerFont(WebView webView, String font) {
        if (!PatchSettings.active(webView, "answerFont", "Answer font")) return;
        String family = "serif".equals(font)
                ? "Georgia,\"Noto Serif\",\"Droid Serif\",serif"
                : "Roboto,\"Noto Sans\",\"Helvetica Neue\",Arial,sans-serif";
        injectCss(webView, "jofslash-font",
                ANSWER_TEXT + "," + ANSWER_TEXT + " *:not(code):not(pre):not(kbd)," + PARAGRAPH + "," + PARAGRAPH
                        + " *:not(code):not(pre):not(kbd){font-family:" + family + " !important;}");
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void keepScreenOn(WebView webView) {
        if (!PatchSettings.active(webView, "keepScreenOn", "Keep screen on")) return;
        if (webView == null) return;
        try {
            webView.setKeepScreenOn(true);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to keep the screen on", ex);
        }
    }

    // ---------------------------------------------------------------- data saver

    /**
     * Injection point: start of QWebViewClient.onPageFinished. Blocked images become tap targets.
     */
    public static void dataSaverPage(WebView webView) {
        if (!PatchSettings.active(webView, "dataSaver", "Data saver")) return;
        injectCss(webView, "jofslash-data-saver",
                "img[data-jofslash-tap]{min-width:72px;min-height:56px;background:rgba(128,128,128,.22) !important;"
                        + "cursor:pointer;object-fit:contain;}"
                        // Pictures drawn as a CSS background (post images in the feed).
                        + "[data-jofslash-bgtap]{background-color:rgba(128,128,128,.22) !important;position:relative;cursor:pointer;}"
                        + "[data-jofslash-bgtap]::after{content:\"Tap to load image\";position:absolute;left:12px;top:10px;"
                        + "font:15px/1.3 sans-serif;opacity:.75;}");
        evaluate(webView, "(function(){"
                + "if(window.__jofslashData)return;window.__jofslashData=1;"
                + "var cdn=/(^|\\.)quoracdn\\.net$/;"
                + "var LABEL='data:image/svg+xml,'+encodeURIComponent('<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"320\" height=\"64\">"
                + "<text x=\"16\" y=\"38\" font-family=\"sans-serif\" font-size=\"18\" fill=\"#8a8a8a\">Tap to load image</text></svg>');"
                + "function mark(img){if(img.hasAttribute('data-jofslash-tap'))return;"
                + "try{if(!cdn.test(new URL(img.currentSrc||img.src).hostname))return;}catch(e){return;}"
                + "if(img.complete&&img.naturalWidth>0)return;"
                // Only images in answers and feed items become tap targets; blocked decorations are hidden.
                + "var src=img.currentSrc||img.src;"
                // Profile photos and Space icons are small; tapping them opens the profile, so just hide them.
                + "if(/thumb|profile_default/.test(src)||!img.closest('" + ANSWER_TEXT + "," + UNITS + ",.q-text')){img.style.setProperty('visibility','hidden','important');return;}"
                // Show a label instead of the browser's broken image icon; keep the real address for the tap.
                + "img.setAttribute('data-jofslash-tap',src);img.removeAttribute('srcset');img.src=LABEL;}"
                + "function bg(el){if(el.hasAttribute('data-jofslash-bgtap')||el.hasAttribute('data-jofslash-bgdone'))return;"
                + "var m=(el.getAttribute('style')||'').match(/url\\([\"']?([^\"')]*quoracdn\\.net[^\"')]*)[\"']?\\)/);if(!m)return;"
                + "if(/thumb|profile_default/.test(m[1]))return;"
                + "el.setAttribute('data-jofslash-bgtap',m[1]);}"
                // One listener on the window, in the capture phase, so it runs before Quora's own
                // handlers, which would open the post instead of loading the picture.
                + "function load(url){var u=new URL(url,location.href);u.searchParams.set('" + LOAD_PARAM + "','1');return u.toString();}"
                + "window.addEventListener('click',function(ev){"
                + "var t=ev.target&&ev.target.closest&&ev.target.closest('img[data-jofslash-tap],[data-jofslash-bgtap]');if(!t)return;"
                + "ev.preventDefault();ev.stopPropagation();ev.stopImmediatePropagation();"
                + "if(t.tagName==='IMG'){t.src=load(t.getAttribute('data-jofslash-tap'));t.removeAttribute('data-jofslash-tap');}"
                + "else{t.style.backgroundImage='url(\"'+load(t.getAttribute('data-jofslash-bgtap'))+'\")';"
                + "t.removeAttribute('data-jofslash-bgtap');t.setAttribute('data-jofslash-bgdone','');}},true);"
                + "function run(){document.querySelectorAll('img').forEach(function(img){"
                + "if(img.complete)mark(img);else img.addEventListener('error',function(){mark(img);},{once:true});});"
                + "document.querySelectorAll('[style*=\"quoracdn.net\"]').forEach(bg);}"
                + observe("run")
                + "})();", "data saver");
    }

    /**
     * Injection point: start of QWebViewClient.shouldInterceptRequest.
     *
     * @return An empty response for images from Quora's image CDN, unless the reader tapped them.
     */
    public static WebResourceResponse blockImage(WebResourceRequest request) {
        try {
            if (request == null || request.isForMainFrame() || !PatchSettings.isOn("dataSaver")) return null;
            Uri uri = request.getUrl();
            String host = uri.getHost();
            if (host == null) return null;
            host = host.toLowerCase();
            if (!host.equals("quoracdn.net") && !host.endsWith(".quoracdn.net")) return null;
            if (uri.getQueryParameter(LOAD_PARAM) != null) return null;
            String path = uri.getPath() == null ? "" : uri.getPath().toLowerCase();
            // Profile photos and Space icons ("main-thumb-…") are a few KB each; let them load.
            if (path.contains("main-thumb")) return null;
            boolean image = path.contains("qimg") || path.contains("thumb")
                    || path.matches(".*\\.(jpe?g|png|gif|webp|avif)$");
            if (!image) return null;
            return new WebResourceResponse("image/png", null, 404, "Blocked by Data saver", null,
                    new ByteArrayInputStream(new byte[0]));
        } catch (Exception ex) {
            Log.e(TAG, "Failed to check image request", ex);
            return null;
        }
    }

    // ---------------------------------------------------------------- helpers

    private static boolean isDark(WebView webView) {
        int mode = webView.getResources().getConfiguration().uiMode & android.content.res.Configuration.UI_MODE_NIGHT_MASK;
        return mode == android.content.res.Configuration.UI_MODE_NIGHT_YES;
    }

    /** Turns "a, b ,c" into a JSON array of strings: ["a","b","c"]. */
    static String jsonList(String csv) {
        StringBuilder out = new StringBuilder("[");
        if (csv != null) {
            boolean first = true;
            for (String part : csv.split(",")) {
                String item = part.trim();
                if (item.isEmpty()) continue;
                if (!first) out.append(',');
                first = false;
                out.append('"');
                for (char c : item.toCharArray()) {
                    if (c == '"' || c == '\\') out.append('\\').append(c);
                    else if (c < 0x20 || c == '<' || c == '>' || c == ' ' || c == ' ') out.append(String.format("\\u%04x", (int) c));
                    else out.append(c);
                }
                out.append('"');
            }
        }
        return out.append(']').toString();
    }

    /** Runs the function now and again, at most every 300 ms, whenever the page changes. */
    private static String observe(String function) {
        return function + "();"
                + "var p=false;"
                + "new MutationObserver(function(){if(p)return;p=true;"
                + "setTimeout(function(){p=false;" + function + "();},300);})"
                + ".observe(document.documentElement,{childList:true,subtree:true});";
    }

    private static void injectCss(WebView webView, String id, String css) {
        evaluate(webView, "(function(){"
                + "if(document.getElementById('" + id + "'))return;"
                + "var s=document.createElement('style');"
                + "s.id='" + id + "';"
                + "s.textContent='" + css.replace("\\", "\\\\").replace("'", "\\'") + "';"
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
