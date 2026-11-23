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

    /**
     * shareButtons(): the Share buttons under answers (marked by Quora) and under Spaces posts (only
     * their icon is labelled "Share"), leaving out the Copy and Share text buttons made from them.
     */
    private static final String SHARE_BUTTONS_JS = "function shareButtons(){"
            + "var out=[].slice.call(document.querySelectorAll('.dom_annotate_answer_action_bar_share'));"
            + "document.querySelectorAll('button [aria-label=\"Share\"]').forEach(function(x){var b=x.closest('button');"
            + "if(b&&!b.closest('.dom_annotate_answer_action_bar_share')&&!b.closest('[data-jofslash-clone]')"
            + "&&out.indexOf(b)<0)out.push(b);});"
            + "return out;}";

    /**
     * text(bar): the text of the answer or post a button bar belongs to. In the feed and on question
     * pages it only looks inside that one item; a Spaces post in the feed has a title and a preview.
     * A shortened item gets "Read more" at the end, which preview() then takes off again.
     */
    private static final String ITEM_TEXT_JS = "function text(bar){"
            + "var unit=bar.closest('[class*=\"dom_annotate_multifeed_bundle_\"],[class*=\"dom_annotate_question_answer_item\"]');"
            + "if(unit){var t='',c=unit.querySelector('" + ANSWER_TEXT + "');"
            + "if(c)t=c.innerText;"
            + "else{var p=unit.querySelector('p.q-text');"
            + "if(p){t=(p.closest('div.q-text')||p.parentElement).innerText;}"
            + "else{var h=unit.querySelector('[class*=\"regular_title\"]'),b=unit.querySelector('[class*=\"qu-truncateLines--3\"]');"
            + "t=[h&&h.innerText,b&&b.innerText].filter(Boolean).join('\\n\\n');}}"
            + "if(!/(read more|\\(more\\))\\s*$/i.test(t)&&/\\bRead more\\b/.test(unit.innerText))t+='\\nRead more';"
            + "return t;}"
            // An open answer or post: the first text above the button.
            + "for(var a=bar.parentElement;a&&a!==document.body;a=a.parentElement){"
            + "var c2=a.querySelector('" + ANSWER_TEXT + "');if(c2)return c2.innerText;"
            + "var p2=a.querySelector('p.q-text');if(p2){return (p2.closest('div.q-text')||p2.parentElement).innerText;}}"
            + "return '';}";

    /**
     * preview(t): the text without the "Read more" link a shortened answer in the feed ends with,
     * and whether it was shortened; a shortened text ends with "…".
     */
    private static final String PREVIEW_JS = "function preview(t){t=(t||'').trim();"
            + "var re=/\\s*(\\(more\\)|read more|continue reading)\\s*$/i,cut=re.test(t);"
            + "t=t.replace(re,'').trim();if(cut&&t)t=t.replace(/[.…]+$/,'')+'…';return {text:t,cut:cut};}";

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
                // People in "Upvoted by …" lines didn't write the item.
                + "function upvoter(a,u){for(var e=a.parentElement,i=0;e&&e!==u&&i<3;e=e.parentElement,i++){"
                + "if(/^Upvoted by /.test((e.textContent||'').trim()))return true;}return false;}"
                + "function hit(u){var links=u.querySelectorAll('a[href]');for(var i=0;i<links.length;i++){var a=links[i];"
                + "if(upvoter(a,u))continue;"
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
     * Injection point: start of QWebViewClient.onPageFinished. Hides answers in the feed and on
     * question pages whose author is "Anonymous". The author is the first bold name of an item;
     * an anonymous one is plain text, without a link to a profile. Names in "Upvoted by" lines and
     * in comments come later, so an anonymous commenter doesn't hide the answer.
     */
    public static void hideAnonymousAnswers(WebView webView) {
        if (!PatchSettings.active(webView, "hideAnonymousAnswers", "Hide anonymous answers")) return;
        evaluate(webView, "(function(){"
                + "if(window.__jofslashAnon)return;window.__jofslashAnon=1;"
                + "function anon(u){var b=u.querySelector('span.q-text.qu-bold');if(!b)return false;"
                + "if(b.querySelector('a[href*=\"/profile/\"]'))return false;"
                + "return (b.textContent||'').trim()==='Anonymous';}"
                + "function run(){document.querySelectorAll('" + UNITS + "').forEach(function(u){"
                + "if(u.hasAttribute('data-jofslash-filtered')||u.hasAttribute('data-jofslash-anon-checked'))return;"
                // Feed items fill in as they load: check again until the author is there.
                + "if(!u.querySelector('span.q-text.qu-bold'))return;"
                + "u.setAttribute('data-jofslash-anon-checked','');"
                + "if(anon(u)){u.setAttribute('data-jofslash-filtered','');u.style.setProperty('display','none','important');}"
                + "});}"
                + observe("run")
                + "})();", "anonymous answers");
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
                + ITEM_TEXT_JS
                + PREVIEW_JS
                + "function copy(t){var r=preview(t);if(!r.text)return;var J=window.JoFSlashPatches;if(J&&!J.ready())J=null;"
                + "if(r.cut&&J&&J.copyPreview)J.copyPreview(r.text);"
                + "else if(J&&J.copyText)J.copyText(r.text);"
                + "else if(navigator.clipboard)navigator.clipboard.writeText(r.text);}"
                + SHARE_BUTTONS_JS
                + "function run(){shareButtons().forEach(function(s){"
                + "if(s.hasAttribute('data-jofslash-copy'))return;s.setAttribute('data-jofslash-copy','');"
                + "var item=s.parentElement&&s.parentElement.children.length===1?s.parentElement:s;"
                // The copy must not count as a Share button, or it would be copied again.
                + "var b=item.cloneNode(true);b.setAttribute('data-jofslash-copy','');b.setAttribute('data-jofslash-clone','');"
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
    // ------------------------------------------------------------------ sort answers

    private static final String[] SORT_ORDERS = {"Recent", "Upvotes"};
    private static volatile String pendingSort;
    private static volatile long pendingSortAt;

    private static String sortOrder(String value) {
        for (String order : SORT_ORDERS) {
            if (order.equalsIgnoreCase(value)) return order;
        }
        return SORT_ORDERS[0];
    }

    /** Called by the page through the bridge right before it opens the sort menu. */
    static void requestSort(String order) {
        pendingSort = sortOrder(order);
        pendingSortAt = android.os.SystemClock.uptimeMillis();
    }

    /**
     * Injection point: start of QBaseActivity.showPopoverMenu. When the page just asked for a sort
     * order, answers the sort menu with it instead of showing the menu.
     *
     * @return Whether the menu was answered and must not show.
     */
    public static boolean pickSortSheet(org.json.JSONObject data, Object webViewController) {
        String order = pendingSort;
        pendingSort = null;
        if (order == null || data == null || webViewController == null) return false;
        if (android.os.SystemClock.uptimeMillis() - pendingSortAt > 3000) return false;
        try {
            org.json.JSONArray titles = data.optJSONArray("buttonTitles");
            if (titles == null) return false;
            int index = -1;
            boolean sortMenu = false;
            for (int i = 0; i < titles.length(); i++) {
                // The current order carries a check mark.
                String title = titles.optString(i, "").replaceAll("[^A-Za-z ]", "").trim();
                if (title.equalsIgnoreCase(order)) index = i;
                if (title.equalsIgnoreCase("Recommended")) sortMenu = true;
            }
            if (!sortMenu || index < 0) return false;
            org.json.JSONObject result = new org.json.JSONObject();
            result.put("buttonIndex", index);
            webViewController.getClass()
                    .getMethod("sendMessageToJavaScript", String.class, org.json.JSONObject.class)
                    .invoke(webViewController, "actionSheetDismissed", result);
            return true;
        } catch (Exception ex) {
            Log.e(TAG, "Failed to pick the sort order", ex);
            return false;
        }
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished. On question pages, switches the
     * answers to the order set (once per page; you can still change it).
     */
    public static void sortAnswers(WebView webView, String order) {
        if (!PatchSettings.active(webView, "sortAnswers", "Sort answers")) return;
        order = sortOrder(PatchSettings.choice("sortAnswers", "sortOrder", "Order", sortOrder(order),
                SORT_ORDERS, SORT_ORDERS, false));
        evaluate(webView, "(function(){"
                + "if(window.__jofslashSort===location.href)return;window.__jofslashSort=location.href;"
                + "var T='" + order + "',n=0;"
                + "function run(){var b=document.querySelector('button.sprig_sort_dropdown');"
                + "if(!b){if(++n<40)setTimeout(run,250);return;}"
                + "if((b.innerText||'').trim()===T)return;"
                + "if(!window.JoFSlashPatches||!window.JoFSlashPatches.ready())return;"
                + "window.JoFSlashPatches.sortNext(T);b.click();}"
                + "run();})();", "sort answers");
    }

    // ------------------------------------------------------------------ share answer text

    /**
     * Injection point: start of QWebViewClient.onPageFinished. Adds a Share text button after Share
     * under answers and posts; it shares their text without formatting.
     */
    public static void shareAnswerText(WebView webView) {
        if (!PatchSettings.active(webView, "shareAnswerText", "Share answer text")) return;
        evaluate(webView, "(function(){"
                + "if(window.__jofslashShareText)return;window.__jofslashShareText=1;"
                // Lines of text with an arrow: share as text.
                + "var ICON='<svg width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\">"
                + "<g class=\"icon_svg-stroke\" stroke=\"#666\" stroke-width=\"1.5\" fill=\"none\" stroke-linecap=\"round\" stroke-linejoin=\"round\">"
                + "<path d=\"M4 6h10M4 10h10M4 14h6\"></path><path d=\"M14 18h6M17 15l3 3-3 3\"></path></g></svg>';"
                + ITEM_TEXT_JS
                + PREVIEW_JS
                + "function share(t){var r=preview(t);if(!r.text)return;var J=window.JoFSlashPatches;if(J&&!J.ready())J=null;"
                + "if(r.cut&&J&&J.sharePreview)J.sharePreview(r.text);"
                + "else if(J&&J.shareText)J.shareText(r.text);}"
                + SHARE_BUTTONS_JS
                + "function run(){shareButtons().forEach(function(s){"
                + "if(s.hasAttribute('data-jofslash-sharetext'))return;s.setAttribute('data-jofslash-sharetext','');"
                + "var item=s.parentElement&&s.parentElement.children.length===1?s.parentElement:s;"
                // The copy must not count as a Share button, or it would be copied again.
                + "var b=item.cloneNode(true);b.setAttribute('data-jofslash-sharetext','');b.setAttribute('data-jofslash-copy','');"
                + "b.setAttribute('data-jofslash-clone','');"
                + "[b].concat([].slice.call(b.querySelectorAll('*'))).forEach(function(e){"
                + "e.classList.remove('dom_annotate_answer_action_bar_share','puppeteer_test_answer_quora_share_button','sprig_share_button');});"
                + "var svg=b.querySelector('svg');if(!svg)return;svg.outerHTML=ICON;"
                + "b.querySelectorAll('.q-text').forEach(function(e){e.remove();});"
                + "var btn=b.querySelector('button')||b;btn.setAttribute('aria-label','Share text');"
                + "b.addEventListener('click',function(ev){ev.preventDefault();ev.stopPropagation();share(text(item));},true);"
                + "item.parentElement.insertBefore(b,item.nextSibling);});}"
                + observe("run")
                + "})();", "share answer text");
    }

    // ------------------------------------------------------------------ translate

    /** The languages offered in Patch settings, as Google Translate's codes. "device" is the phone's language. */
    private static final String[] TRANSLATE_LABELS = {"Phone's language", "Slovak", "Czech", "English", "German",
            "Hungarian", "Polish", "Ukrainian", "Russian", "French", "Spanish", "Italian", "Portuguese", "Dutch",
            "Chinese", "Japanese", "Korean", "Arabic", "Hindi", "Turkish"};
    private static final String[] TRANSLATE_CODES = {"device", "sk", "cs", "en", "de", "hu", "pl", "uk", "ru", "fr",
            "es", "it", "pt", "nl", "zh-CN", "ja", "ko", "ar", "hi", "tr"};

    /** The language set under Translate button in Patch settings, as a Google Translate code. */
    static String translateTarget() {
        String code = PatchSettings.choice("translateAnswerText", "translateTo", "Translate to", "device",
                TRANSLATE_LABELS, TRANSLATE_CODES, false);
        if (code == null || code.isEmpty() || "device".equals(code)) return java.util.Locale.getDefault().getLanguage();
        return code;
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished. Adds a Translate button after Share
     * under answers and posts; it opens their text in the phone's translator.
     */
    public static void translateAnswerText(WebView webView) {
        if (!PatchSettings.active(webView, "translateAnswerText", "Translate button")) return;
        translateTarget(); // Lists the option in Patch settings.
        evaluate(webView, "(function(){"
                + "if(window.__jofslashTranslate)return;window.__jofslashTranslate=1;"
                // An "A" and a character from another script: translate.
                + "var ICON='<svg width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\">"
                + "<g class=\"icon_svg-stroke\" stroke=\"#666\" stroke-width=\"1.5\" fill=\"none\" stroke-linecap=\"round\" stroke-linejoin=\"round\">"
                + "<path d=\"M3 6h8M7 4v2M5 6c0 3 2 5 5 6M9 6c0 3-2 5-5 6\"></path>"
                + "<path d=\"M12 20l4-9 4 9M13.5 17h5\"></path></g></svg>';"
                + ITEM_TEXT_JS
                + PREVIEW_JS
                + "function translate(t){var r=preview(t);if(!r.text)return;var J=window.JoFSlashPatches;if(J&&!J.ready())J=null;"
                + "if(J&&J.translateText)J.translateText(r.text);}"
                + SHARE_BUTTONS_JS
                + "function run(){shareButtons().forEach(function(s){"
                + "if(s.hasAttribute('data-jofslash-translate'))return;s.setAttribute('data-jofslash-translate','');"
                + "var item=s.parentElement&&s.parentElement.children.length===1?s.parentElement:s;"
                + "var b=item.cloneNode(true);b.setAttribute('data-jofslash-translate','');b.setAttribute('data-jofslash-clone','');"
                + "[b].concat([].slice.call(b.querySelectorAll('*'))).forEach(function(e){"
                + "e.classList.remove('dom_annotate_answer_action_bar_share','puppeteer_test_answer_quora_share_button','sprig_share_button');});"
                + "var svg=b.querySelector('svg');if(!svg)return;svg.outerHTML=ICON;"
                + "b.querySelectorAll('.q-text').forEach(function(e){e.remove();});"
                + "var btn=b.querySelector('button')||b;btn.setAttribute('aria-label','Translate');"
                + "b.addEventListener('click',function(ev){ev.preventDefault();ev.stopPropagation();translate(text(item));},true);"
                + "item.parentElement.insertBefore(b,item.nextSibling);});}"
                + observe("run")
                + "})();", "translate");
    }

    // ------------------------------------------------------------------ read aloud

    /**
     * Injection point: start of QWebViewClient.onPageFinished. Adds a Read aloud button after Share
     * under answers and posts; it reads their text with the phone's text-to-speech. Tapping it again
     * stops; the button shows a stop square while it reads.
     */
    public static void readAloud(WebView webView) {
        if (!PatchSettings.active(webView, "readAloud", "Read aloud")) return;
        evaluate(webView, "(function(){"
                + "if(window.__jofslashSpeak)return;window.__jofslashSpeak=1;"
                + "var HEAD='<svg width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\">"
                + "<g class=\"icon_svg-stroke\" stroke=\"#666\" stroke-width=\"1.5\" fill=\"none\" stroke-linecap=\"round\" stroke-linejoin=\"round\">';"
                // A speaker with sound waves: read aloud. A square: stop.
                + "var PLAY=HEAD+'<path d=\"M4 9.5h3l4.5-4v13L7 14.5H4z\"></path><path d=\"M15 9a4 4 0 0 1 0 6M17.5 6.5a7.5 7.5 0 0 1 0 11\"></path></g></svg>';"
                + "var STOP=HEAD+'<rect x=\"6.5\" y=\"6.5\" width=\"11\" height=\"11\" rx=\"1.5\"></rect></g></svg>';"
                + ITEM_TEXT_JS
                + PREVIEW_JS
                + SHARE_BUTTONS_JS
                + "var active=null;"
                + "function mark(b,on){var s=b.querySelector('svg');if(s)s.outerHTML=on?STOP:PLAY;"
                + "var btn=b.querySelector('button')||b;btn.setAttribute('aria-label',on?'Stop reading':'Read aloud');}"
                // Puts the button back once the reading ends by itself.
                + "function watch(){if(!active)return;var J=window.JoFSlashPatches;"
                + "if(!J||!J.ready()||!J.isReadingAloud()){mark(active,false);active=null;return;}setTimeout(watch,1000);}"
                + "function speak(b,t){var J=window.JoFSlashPatches;if(!J||!J.ready())return;var r=preview(t);if(!r.text)return;"
                + "var again=b===active;if(active)mark(active,false);active=null;"
                + "if(J.readAloud(r.text,r.cut,again)){active=b;mark(b,true);setTimeout(watch,1500);}}"
                + "function run(){shareButtons().forEach(function(s){"
                + "if(s.hasAttribute('data-jofslash-speak'))return;s.setAttribute('data-jofslash-speak','');"
                + "var item=s.parentElement&&s.parentElement.children.length===1?s.parentElement:s;"
                + "var b=item.cloneNode(true);b.setAttribute('data-jofslash-speak','');b.setAttribute('data-jofslash-clone','');"
                + "[b].concat([].slice.call(b.querySelectorAll('*'))).forEach(function(e){"
                + "e.classList.remove('dom_annotate_answer_action_bar_share','puppeteer_test_answer_quora_share_button','sprig_share_button');});"
                + "if(!b.querySelector('svg'))return;"
                + "b.querySelectorAll('.q-text').forEach(function(e){e.remove();});"
                + "mark(b,false);"
                + "b.addEventListener('click',function(ev){ev.preventDefault();ev.stopPropagation();speak(b,text(item));},true);"
                + "item.parentElement.insertBefore(b,item.nextSibling);});}"
                + observe("run")
                + "})();", "read aloud");
    }

    // ------------------------------------------------------------------ reading history

    /**
     * pageItem(): the answer, post or question this page shows, as {url, title, author}; the
     * author line reads "Answer by …", "Post by …" or "Question". {other: true} on other pages.
     * The url or title may still be empty while the page loads.
     */
    private static final String PAGE_ITEM_JS = "function pageItem(){"
            + "function txt(e){return e?(e.innerText||'').trim():'';}"
            + "var u=location.href,url='',title='',author='';"
            + "var m=/[?&]props=([^&#]+)/.exec(u),props=null;"
            + "if(m){try{props=JSON.parse(decodeURIComponent(m[1]));}catch(e){}}"
            + "var q=txt(document.querySelector('.puppeteer_test_question_title'));"
            // The first profile link with a name; the avatar before it is a link too.
            + "var p=[].slice.call(document.querySelectorAll('a[href*=\"/profile/\"]')).map(txt)"
            + ".filter(Boolean).map(function(s){return s.split('\\n')[0];})[0]||'';"
            // Answers and posts open in pages without their own address; Quora's data has it.
            + "if(props&&/rootCls=(AnswerModalPage|PostModalPage)/.test(u)){"
            + "var R=window.__RELAY_RECORDS__||{},r=null;"
            + "for(var k in R){var x=R[k];if(!x)continue;"
            + "if((props.aid&&x.aid===props.aid)||(props.pid&&x.pid===props.pid)){r=x;break;}}"
            + "if(r)url=r.permaUrl||r.url||'';"
            // A post's title is rich text: {"sections":[{"spans":[{"text":…}]}]}.
            + "var pt='';if(r&&typeof r.title==='string'){try{pt=JSON.parse(r.title).sections.map(function(s){"
            + "return s.spans.map(function(x){return x.text;}).join('');}).join(' ').trim();}catch(e){}}"
            + "title=q||pt||txt(document.querySelector('" + ANSWER_TEXT + "')).split('\\n')[0].slice(0,140);"
            // The line under the title in History.
            + "var post=/PostModalPage/.test(u);"
            + "author=(post?'Post':'Answer')+(p?' by '+p:'');"
            + "}else if(/^https:\\/\\/www\\.quora\\.com\\/[^?#\\/]+\\/answer\\/[^?#\\/]+/.test(u)){"
            + "url=u.split(/[?#]/)[0];title=q;author='Answer'+(p?' by '+p:'');"
            // A question page: its answers have the sort and filter menus.
            + "}else if(/^https:\\/\\/www\\.quora\\.com\\/[^?#\\/]+([?#].*)?$/.test(u)"
            + "&&document.querySelector('button.sprig_sort_dropdown,button.sprig_all_related_dropdown')){"
            + "url=u.split(/[?#]/)[0];title=q;author='Question';}"
            + "else return {other:true};"
            + "if(url&&url.charAt(0)==='/')url='https://www.quora.com'+url;"
            + "return {url:url,title:title,author:author};}";

    /**
     * Injection point: start of QWebViewClient.onPageFinished. Adds a bookmark button next to Share
     * under an open answer or post; Patch settings > Bookmarks lists what you saved.
     */
    public static void bookmarks(WebView webView) {
        if (!PatchSettings.active(webView, "bookmarks", "Bookmarks")) return;
        evaluate(webView, "(function(){"
                + "if(window.__jofslashBookmark===location.href)return;window.__jofslashBookmark=location.href;"
                + "var OUTLINE='<path d=\"M7 4.5h10a1 1 0 0 1 1 1V20l-6-4-6 4V5.5a1 1 0 0 1 1-1z\"></path>';"
                + "var FILLED='<path fill=\"currentColor\" d=\"M7 4.5h10a1 1 0 0 1 1 1V20l-6-4-6 4V5.5a1 1 0 0 1 1-1z\"></path>';"
                + "function icon(on){return '<svg width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\">"
                + "<g class=\"icon_svg-stroke\" stroke=\"#666\" stroke-width=\"1.5\" fill=\"none\" stroke-linejoin=\"round\""
                + "'+(on?' style=\"color:#666\"':'')+'>'+(on?FILLED:OUTLINE)+'</g></svg>';}"
                + PAGE_ITEM_JS
                + SHARE_BUTTONS_JS
                + ITEM_TEXT_JS
                + "var n=0;"
                // Waits up to 20 s for the bridge, the page's data and its Share button.
                // retry: keep trying for up to 20 s while the bridge, the page's data or Share is missing.
                + "function run(retry){if(document.querySelector('[data-jofslash-bookmark]'))return;"
                + "function later(){if(retry&&++n<40)setTimeout(function(){run(true);},500);}"
                + "var J=window.JoFSlashPatches;if(!J||!J.ready()){later();return;}"
                + "var it=pageItem();"
                // Only an open answer or post: questions and the feed have no address for one item.
                + "if(it.other||/^Question/.test(it.author||''))return;"
                + "var s=shareButtons()[0];"
                + "if(!it.url||!it.title||!s){later();return;}"
                + "var item=s.parentElement&&s.parentElement.children.length===1?s.parentElement:s;"
                + "var b=item.cloneNode(true);b.setAttribute('data-jofslash-bookmark','');b.setAttribute('data-jofslash-clone','');"
                + "[b].concat([].slice.call(b.querySelectorAll('*'))).forEach(function(e){"
                + "e.classList.remove('dom_annotate_answer_action_bar_share','puppeteer_test_answer_quora_share_button','sprig_share_button');});"
                + "var svg=b.querySelector('svg');if(!svg)return;"
                + "b.querySelectorAll('.q-text').forEach(function(e){e.remove();});"
                + "var btn=b.querySelector('button')||b;"
                + "function show(on){var g=b.querySelector('svg');if(g)g.outerHTML=icon(on);"
                + "btn.setAttribute('aria-label',on?'Remove bookmark':'Bookmark');btn.setAttribute('aria-pressed',on?'true':'false');}"
                // The text of a bookmarked page is kept to read offline (Bookmarks in Patch settings).
                // The Share button as it is now: a redraw may have replaced the one this run found.
                + "function keep(x){try{var s2=shareButtons()[0],at=s2?(s2.parentElement&&s2.parentElement.children.length===1?s2.parentElement:s2):item;"
                + "J.saveOffline(x.url,x.title,x.author,text(at));}catch(e){}}"
                + "var on=J.isBookmarked(it.url);show(on);"
                // Opening a bookmarked page again refreshes its copy, once the text has loaded.
                // Once per page: Quora redraws the action bar, which runs this again.
                + "if(on&&window.__jofslashKept!==location.href){window.__jofslashKept=location.href;"
                + "setTimeout(function(){keep(it);},1500);}"
                + "b.addEventListener('click',function(ev){ev.preventDefault();ev.stopPropagation();"
                + "var now=pageItem(),x={url:now.url||it.url,title:now.title||it.title,author:now.author||it.author};"
                + "var saved=J.toggleBookmark(x.url,x.title,x.author);show(saved);if(saved)keep(x);},true);"
                + "item.parentElement.insertBefore(b,item.nextSibling);}"
                // Quora redraws the action bar now and then, which drops the button: add it again.
                + "run(true);var p=false;new MutationObserver(function(){if(p)return;p=true;"
                + "setTimeout(function(){p=false;run(false);},300);})"
                + ".observe(document.documentElement,{childList:true,subtree:true});"
                + "})();", "bookmarks");
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished. Remembers the answers, posts and
     * questions you open; Patch settings > History lists them.
     */
    public static void readingHistory(WebView webView) {
        if (!PatchSettings.active(webView, "readingHistory", "Reading history")) return;
        evaluate(webView, "(function(){"
                + "if(window.__jofslashHistory===location.href)return;window.__jofslashHistory=location.href;"
                + PAGE_ITEM_JS
                + "var n=0;"
                + "function rec(){var it=pageItem();"
                // Other pages: give up after a few tries (a question page may still be loading).
                + "if(it.other){if(n>=6)return;}"
                + "else if(it.url&&it.title&&window.JoFSlashPatches&&window.JoFSlashPatches.ready()){"
                + "window.JoFSlashPatches.addHistory(it.url,it.title,it.author);return;}"
                + "if(++n<20)setTimeout(rec,500);}"
                + "rec();})();", "reading history");
    }

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
            // The bridge for our scripts, with its key; see PatchSettings.bridgeScript.
            webView.evaluateJavascript(PatchSettings.bridgeScript() + script, null);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to inject " + what, ex);
        }
    }
}
