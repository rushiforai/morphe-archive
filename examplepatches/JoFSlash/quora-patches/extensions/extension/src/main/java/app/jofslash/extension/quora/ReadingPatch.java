package app.jofslash.extension.quora;

import android.annotation.SuppressLint;
import android.content.Context;
import android.net.ConnectivityManager;
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

    /**
     * Injection point: start of QWebViewClient.onPageFinished. Remembers the feed items you tap and
     * dims or hides them when the feed shows them again. The list stays in the app's own storage.
     *
     * @param mode "dim" or "hide".
     */
    public static void hideSeen(WebView webView, String mode) {
        if (!PatchSettings.active(webView, "hideSeen", "Hide seen items")) return;
        mode = PatchSettings.choice("hideSeen", "seenMode", "Seen items", mode,
                new String[]{"Dim", "Hide"}, new String[]{"dim", "hide"}, false);
        boolean hide = "hide".equals(mode);
        injectCss(webView, "jofslash-seen", "[data-jofslash-seen]{opacity:.45 !important;}");
        evaluate(webView, "(function(){"
                + "if(window.__jofslashSeen)return;window.__jofslashSeen=1;"
                + "var KEY='jofslash_seen',HIDE=" + hide + ",SEL='[class*=\"dom_annotate_multifeed_bundle_\"]';"
                + "var list;try{list=JSON.parse(localStorage.getItem(KEY)||'[]');}catch(e){list=[];}"
                + "if(!Array.isArray(list))list=[];"
                + "var seen={};list.forEach(function(k){seen[k]=1;});"
                // The author or Space and the question or post title: stable while counts and dates change.
                + "function text(e){return e?(e.textContent||'').replace(/\\s+/g,' ').trim():'';}"
                // The first named profile link (the avatar link has no text), or the Space of a post.
                + "function key(u){var a='',b='',i,l=u.querySelectorAll('.puppeteer_test_tribe_name,a[href*=\"/profile/\"]');"
                + "for(i=0;i<l.length&&!a;i++)a=text(l[i]).slice(0,60);"
                + "var q=u.querySelector('.puppeteer_test_question_title');if(q)b=text(q);"
                // Posts have no question: take the first longer text that is not the author or Space name.
                + "else{var t=u.querySelectorAll('.q-text');for(i=0;i<t.length&&!b;i++){if(t[i].querySelector('.q-text'))continue;"
                + "var s=text(t[i]);if(s.length>=20&&(!a||s.indexOf(a)!==0)&&!/^Posted by/.test(s))b=s;}}"
                + "b=b.slice(0,100);return !a||b.length<8?'':a+'|'+b;}"
                + "function remember(k){if(!k||seen[k])return;seen[k]=1;list.push(k);"
                + "if(list.length>2000)list=list.slice(-2000);try{localStorage.setItem(KEY,JSON.stringify(list));}catch(e){}}"
                + "window.addEventListener('click',function(ev){var u=ev.target&&ev.target.closest&&ev.target.closest(SEL);"
                + "if(!u)return;var k=key(u);if(!k)return;remember(k);u.setAttribute('data-jofslash-seen','');},true);"
                + "function run(){document.querySelectorAll(SEL).forEach(function(u){"
                + "if(u.hasAttribute('data-jofslash-seen-checked'))return;var k=key(u);if(!k)return;"
                + "u.setAttribute('data-jofslash-seen-checked','');if(!seen[k])return;"
                + "if(HIDE){u.setAttribute('data-jofslash-filtered','');u.style.setProperty('display','none','important');}"
                + "else u.setAttribute('data-jofslash-seen','');});}"
                + observe("run")
                + "})();", "seen items");
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished. Hides feed items and answers older than
     * the given number of years, read from the date Quora shows ("6y", or "Mar 3, 2019").
     *
     * @param years Whole years, such as "3".
     */
    public static void hideOldAnswers(WebView webView, String years) {
        if (!PatchSettings.active(webView, "hideOldAnswers", "Hide old answers")) return;
        years = PatchSettings.choice("hideOldAnswers", "maxAge", "Older than", years,
                new String[]{"1 year", "2 years", "3 years", "5 years", "10 years"},
                new String[]{"1", "2", "3", "5", "10"}, false);
        int limit;
        try {
            limit = Integer.parseInt(years == null ? "" : years.trim());
        } catch (NumberFormatException ex) {
            return;
        }
        if (limit < 1) return;
        evaluate(webView, "(function(){"
                + "if(window.__jofslashOld)return;window.__jofslashOld=1;"
                + "var LIMIT=" + limit + ",now=new Date().getFullYear();"
                + "function age(t){var m=t.match(/^(\\d+)y$/);if(m)return +m[1];"
                + "m=t.match(/^[A-Z][a-z]{2} \\d{1,2}, (\\d{4})$/);if(m)return now-(+m[1]);return 0;}"
                + "function run(){document.querySelectorAll('" + UNITS + "').forEach(function(u){"
                + "if(u.hasAttribute('data-jofslash-age'))return;"
                // The first date in the item is its own; later ones belong to comments or shares.
                + "var links=u.querySelectorAll('a.answer_timestamp,a.puppeteer_test_link');var t='';"
                // An edited answer shows "Updated 6y".
                + "for(var i=0;i<links.length&&!t;i++){var s=(links[i].textContent||'').trim().replace(/^Updated /,'');"
                + "if(/^(\\d+[smhdwy]|[A-Z][a-z]{2} \\d{1,2}(, \\d{4})?|Mon|Tue|Wed|Thu|Fri|Sat|Sun)$/.test(s))t=s;}"
                + "if(!t)return;u.setAttribute('data-jofslash-age',t);"
                + "if(age(t)>=LIMIT){u.setAttribute('data-jofslash-filtered','');u.style.setProperty('display','none','important');}"
                + "});}"
                + observe("run")
                + "})();", "old answers");
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished. Adds a Copy button after Share under
     * answers and posts; it copies their text without formatting.
     */
    public static void copyAnswerText(WebView webView) {
        if (!PatchSettings.active(webView, "copyAnswerText", "Copy answer text")) return;
        evaluate(webView, "(function(){"
                + "if(window.__jofslashCopy)return;window.__jofslashCopy=1;"
                + "var ICON='<svg width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\">"
                + "<g class=\"icon_svg-stroke\" stroke=\"#666\" stroke-width=\"1.5\" fill=\"none\" stroke-linecap=\"round\" stroke-linejoin=\"round\">"
                + "<rect x=\"8.5\" y=\"8.5\" width=\"11\" height=\"12\" rx=\"2\"></rect>"
                + "<path d=\"M15.5 8.5V6a2 2 0 0 0-2-2h-7a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h2\"></path></g></svg>';"
                // The answer's text: the answer content in the feed, or the block holding its paragraphs.
                + "function text(bar){for(var a=bar.parentElement;a&&a!==document.body;a=a.parentElement){"
                + "var c=a.querySelector('" + ANSWER_TEXT + "');if(c)return c.innerText;"
                + "var p=a.querySelector('p.q-text');if(p){var box=p.closest('div.q-text')||p.parentElement;return box.innerText;}}"
                + "return '';}"
                + "function copy(t){t=(t||'').trim();if(!t)return;"
                + "if(window.JoFSlashPatches&&window.JoFSlashPatches.copyText)window.JoFSlashPatches.copyText(t);"
                + "else if(navigator.clipboard)navigator.clipboard.writeText(t);}"
                + "function run(){document.querySelectorAll('.dom_annotate_answer_action_bar_share').forEach(function(s){"
                + "if(s.hasAttribute('data-jofslash-copy'))return;s.setAttribute('data-jofslash-copy','');"
                + "var item=s.parentElement&&s.parentElement.children.length===1?s.parentElement:s;"
                // The copy must not count as a Share button, or it would be copied again.
                + "var b=item.cloneNode(true);b.setAttribute('data-jofslash-copy','');"
                + "[b].concat([].slice.call(b.querySelectorAll('*'))).forEach(function(e){"
                + "e.classList.remove('dom_annotate_answer_action_bar_share','puppeteer_test_answer_quora_share_button','sprig_share_button');});"
                + "var svg=b.querySelector('svg');if(!svg)return;svg.outerHTML=ICON;"
                // The share count, if any, doesn't belong to Copy.
                + "b.querySelectorAll('.q-text').forEach(function(e){e.remove();});"
                + "var btn=b.querySelector('button')||b;btn.setAttribute('aria-label','Copy text');"
                + "b.addEventListener('click',function(ev){ev.preventDefault();ev.stopPropagation();copy(text(item));},true);"
                + "item.parentElement.insertBefore(b,item.nextSibling);});}"
                + observe("run")
                + "})();", "copy answer text");
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
        font = PatchSettings.choice("answerFont", "answerFontStyle", "Font", font,
                new String[]{"Serif", "Sans-serif"}, new String[]{"serif", "sans"}, false);
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
        if (loadOnThisNetwork()) return;
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
            if (loadOnThisNetwork()) return null;
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

    /**
     * With the "Load images on Wi-Fi" option, images load as usual unless the connection is metered,
     * such as mobile data or a phone's hotspot.
     */
    @SuppressLint("MissingPermission") // Quora declares ACCESS_NETWORK_STATE.
    private static boolean loadOnThisNetwork() {
        if (!PatchSettings.isRegistered(WIFI_KEY) || !PatchSettings.isOn(WIFI_KEY)) return false;
        try {
            Context context = PatchSettings.context();
            if (context == null) return false;
            ConnectivityManager manager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
            return manager != null && manager.getActiveNetwork() != null && !manager.isActiveNetworkMetered();
        } catch (Exception ex) {
            return false;
        }
    }

    private static final String WIFI_KEY = "dataSaverOnWifi";

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
