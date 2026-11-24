package app.jofslash.extension.quora;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import android.webkit.WebView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

/**
 * Hide what you pick: Patch settings > More > Pick something to hide goes back to the page, where a
 * tap on a box offers to hide it and every box like it. A box counts as "like it" when it has the
 * same class name Quora marks its parts with (dom_annotate_… and puppeteer_test_…), which stay the
 * same while the rest of Quora's class names change. The picked selectors are kept in the app
 * (Filters lists them, to edit or remove) and hidden on every page while the patch is on.
 */
public final class Picker {

    private static final String TAG = "JoFSlashPatches";
    private static final String PREFS = "jofslash_patch_settings";

    /** The switch, registered by the Hide what you pick patch. */
    static final String KEY = "pickToHide";
    /** The picked selectors, one per line. */
    static final String LIST = "picked";

    static final int MAX = 100;

    // When picking was asked for. Closing Patch settings after changing a switch reloads the pages,
    // which drops the picking bar, so a page that finishes loading soon after starts it again.
    private static volatile long requested;

    private Picker() {
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /** The picked selectors that are still valid, in the order they were picked. */
    static List<String> list(SharedPreferences prefs) {
        return parse(prefs.getString(LIST, ""));
    }

    /** Lines that are valid selectors, without repeats, at most MAX. */
    static List<String> parse(String text) {
        List<String> out = new ArrayList<>();
        if (text == null) return out;
        for (String line : text.split("\n")) {
            String s = line.trim();
            if (s.isEmpty() || out.contains(s) || !FilterUpdates.valid(s)) continue;
            out.add(s);
            if (out.size() >= MAX) break;
        }
        return out;
    }

    /** One display:none rule per selector, so one this WebView doesn't understand drops only itself. */
    static String css(List<String> selectors) {
        StringBuilder css = new StringBuilder();
        for (String s : selectors) css.append(s).append("{display:none !important;}\n");
        return css.toString();
    }

    /** A selector for a class name the page marked, or null when it isn't one. */
    static String selector(String className) {
        if (className == null || !className.matches("(dom_annotate|puppeteer_test)_[A-Za-z0-9_-]{1,120}")) return null;
        return "." + className;
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished. Hides what was picked, and gets the
     * page ready for picking (Patch settings starts it).
     */
    public static void page(WebView webView) {
        if (!PatchSettings.active(webView, KEY, "Hide what you pick")) return;
        try {
            Context context = webView.getContext();
            String css = context == null ? "" : css(list(prefs(context)));
            webView.evaluateJavascript(PatchSettings.bridgeScript() + "(function(){"
                    + style(css)
                    + "if(!window.__jofslashPick){" + pickScript(Texts.t("Tap what to hide"), Texts.t("Cancel")) + "}"
                    + (pending(webView) ? "window.__jofslashPick();" : "")
                    + "})();", null);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to add the picked filters", ex);
        }
    }

    private static String style(String css) {
        return "var s=document.getElementById('jofslash-picked');"
                + "if(!s){s=document.createElement('style');s.id='jofslash-picked';(document.head||document.documentElement).appendChild(s);}"
                + "s.textContent=" + HideContentPatch.jsString(css) + ";";
    }

    /**
     * window.__jofslashPick(): a bar at the top says to tap what to hide; the tap doesn't do what it
     * would do otherwise. The tapped box's marked parts, from the smallest up, are the choices: the
     * app asks about the first, and Bigger (__jofslashPickLevel) moves to the next. Parts that would
     * match very many boxes, such as every link, are left out.
     */
    static String pickScript(String tapText, String cancelText) {
        return "var bar=null,cands=[],level=0,mark=null;"
                + "function cls(e){var out=[];(e.className&&e.className.baseVal===undefined?String(e.className):'').split(/\\s+/).forEach(function(c){"
                + "if(/^(dom_annotate|puppeteer_test)_[A-Za-z0-9_-]{1,120}$/.test(c)&&!/(^puppeteer_test_link$|_link$)/.test(c))out.push(c);});return out;}"
                + "function show(i){level=i;if(mark)mark.style.outline=mark.__jofslashOutline||'';"
                + "var c=cands[i];mark=c.el;mark.__jofslashOutline=mark.style.outline;mark.style.outline='3px solid #2e69ff';"
                + "var n=document.querySelectorAll('.'+c.cls).length;"
                + "var J=window.JoFSlashPatches;if(J&&J.ready())J.pickHide(c.cls,n,i,cands.length);}"
                + "function end(){document.removeEventListener('click',tap,true);if(bar)bar.remove();bar=null;"
                + "if(mark)mark.style.outline=mark.__jofslashOutline||'';mark=null;cands=[];}"
                + "function tap(ev){if(bar&&bar.contains(ev.target))return;ev.preventDefault();ev.stopPropagation();"
                + "cands=[];var seen={};for(var e=ev.target;e&&e!==document.body;e=e.parentElement){"
                + "cls(e).forEach(function(c){if(seen[c])return;seen[c]=1;"
                + "if(document.querySelectorAll('.'+c).length<=60)cands.push({el:e,cls:c});});}"
                + "if(!cands.length){var J=window.JoFSlashPatches;if(J&&J.ready())J.pickHide('',0,0,0);return;}"
                + "show(0);}"
                + "window.__jofslashPickLevel=function(i){if(cands[i])show(i);};"
                + "window.__jofslashPickEnd=end;"
                + "window.__jofslashPick=function(){if(bar)return;"
                + "bar=document.createElement('div');"
                + "bar.style.cssText='position:fixed;left:0;right:0;top:0;z-index:2147483647;display:flex;align-items:center;"
                + "justify-content:space-between;padding:12px 16px;background:#2e69ff;color:#fff;font:15px sans-serif';"
                + "var t=document.createElement('span');t.textContent=" + HideContentPatch.jsString(tapText) + ";"
                + "var x=document.createElement('span');x.textContent=" + HideContentPatch.jsString(cancelText) + ";"
                + "x.style.cssText='font-weight:bold;padding:4px 0 4px 16px';x.addEventListener('click',function(ev){ev.stopPropagation();end();},true);"
                + "bar.appendChild(t);bar.appendChild(x);document.body.appendChild(bar);"
                + "document.addEventListener('click',tap,true);};";
    }

    /** Whether this page should start picking as it loads: it shows, and picking was just asked for. */
    private static boolean pending(WebView webView) {
        if (System.currentTimeMillis() - requested > 15_000 || !webView.isShown()) return false;
        requested = 0;
        return true;
    }

    /** Patch settings > More > Pick something to hide: starts picking on the page that shows now. */
    static void start(Activity activity) {
        requested = System.currentTimeMillis();
        boolean started = false;
        for (WebView view : PatchSettings.webViews()) {
            if (view == null || !view.isShown()) continue;
            try {
                view.evaluateJavascript("window.__jofslashPick&&window.__jofslashPick();", null);
                started = true;
            } catch (Exception ex) {
                Log.e(TAG, "Failed to start picking", ex);
            }
        }
        Toast.makeText(activity, started ? Texts.t("Tap what to hide") : Texts.t("Open a page first."), Toast.LENGTH_SHORT).show();
    }

    /**
     * The page asks about one box: hide every box with this class, a bigger part of it, or nothing.
     *
     * @param count How many boxes on this page have it.
     * @param level Which of the tapped box's parts this is, from the smallest.
     * @param total How many parts there are to choose from.
     */
    static void ask(WebView view, String className, int count, int level, int total) {
        Activity activity = PatchSettings.activity(view.getContext());
        if (activity == null) return;
        String selector = selector(className);
        if (selector == null) {
            Toast.makeText(activity, Texts.t("Nothing here can be hidden this way. Try a bigger part of the page."),
                    Toast.LENGTH_LONG).show();
            return;
        }
        String message = count <= 1 ? Texts.t("Hide the marked box?")
                : Texts.t("Hide the marked box and the others like it?") + " (" + count + ")";
        AlertDialog.Builder builder = new AlertDialog.Builder(activity)
                .setMessage(message + "\n\n" + Texts.t("You can show it again under Filters."))
                .setPositiveButton(Texts.t("Hide"), (d, w) -> {
                    add(view.getContext(), selector);
                    end(view);
                    Toast.makeText(activity, Texts.t("Hidden."), Toast.LENGTH_SHORT).show();
                })
                .setNegativeButton(Texts.t("Cancel"), (d, w) -> end(view));
        if (level + 1 < total) {
            builder.setNeutralButton(Texts.t("Bigger"), (d, w) ->
                    view.evaluateJavascript("window.__jofslashPickLevel&&window.__jofslashPickLevel(" + (level + 1) + ");", null));
        }
        builder.setOnCancelListener((d) -> end(view));
        builder.show();
    }

    private static void end(WebView view) {
        try {
            view.evaluateJavascript("window.__jofslashPickEnd&&window.__jofslashPickEnd();", null);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to end picking", ex);
        }
    }

    /** Adds a selector to the list and hides it on every open page. */
    static void add(Context context, String selector) {
        SharedPreferences prefs = prefs(context);
        List<String> list = list(prefs);
        if (!list.contains(selector)) list.add(selector);
        save(context, list);
    }

    /** Keeps the list (Filters edits it too) and updates the open pages. */
    static void save(Context context, List<String> list) {
        while (list.size() > MAX) list.remove(0);
        StringBuilder text = new StringBuilder();
        for (String s : list) text.append(s).append('\n');
        prefs(context).edit().putString(LIST, text.toString().trim()).apply();
        String script = "(function(){" + style(PatchSettings.isOn(KEY) ? css(list) : "") + "})();";
        for (WebView view : PatchSettings.webViews()) {
            try {
                view.evaluateJavascript(script, null);
            } catch (Exception ex) {
                Log.e(TAG, "Failed to update the picked filters", ex);
            }
        }
    }
}
