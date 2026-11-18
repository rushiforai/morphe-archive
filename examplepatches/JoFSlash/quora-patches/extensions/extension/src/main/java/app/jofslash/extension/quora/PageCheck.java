package app.jofslash.extension.quora;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.webkit.WebView;
import android.widget.Toast;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Checks that the feed still has the class names the page patches rely on. When Quora changes
 * its pages, those patches stop working without any error; this notices it and says which ones.
 */
@SuppressWarnings("unused")
public final class PageCheck {

    private static final String TAG = "JoFSlashPatches";
    private static final String PREFS = "jofslash_patch_settings";

    /** Feed loads in a row without a class before it counts as gone. */
    private static final int MISSES = 5;

    /** Class names on the feed, and the patches that need each one. */
    private static final Map<String, String[]> ANCHORS = new LinkedHashMap<>();

    static {
        ANCHORS.put("[class*=\"dom_annotate_multifeed_bundle_\"]", new String[]{"Remove ads", "Filter keywords",
                "Block authors and Spaces", "Hide seen items", "Hide people suggestions", "Hide Spaces suggestions"});
        ANCHORS.put(".puppeteer_test_answer_content", new String[]{"Expand answers", "Data saver"});
        ANCHORS.put(".puppeteer_test_votable_upvote_button", new String[]{"Hide counts", "Hide downvote button"});
        ANCHORS.put(".puppeteer_test_question_title", new String[]{"Hide seen items"});
    }

    private PageCheck() {
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished. Checks the feed once it has loaded.
     */
    public static void onPageFinished(WebView webView) {
        if (webView == null) return;
        try {
            Uri uri = Uri.parse(webView.getUrl() == null ? "" : webView.getUrl());
            String path = uri.getPath() == null ? "" : uri.getPath();
            if (!"www.quora.com".equals(uri.getHost()) || !(path.isEmpty() || path.equals("/"))) return;
        } catch (Exception ex) {
            return;
        }
        new Handler(Looper.getMainLooper()).postDelayed(() -> check(webView), 10_000);
    }

    private static void check(WebView webView) {
        StringBuilder script = new StringBuilder("(function(){var r={};");
        // Only a feed that has loaded counts, not an error page or one still loading.
        script.append("if(((document.body&&document.body.innerText)||'').length<1500)return null;");
        int i = 0;
        for (String selector : ANCHORS.keySet()) {
            script.append("r['a").append(i++).append("']=document.querySelectorAll('")
                    .append(selector).append("').length;");
        }
        script.append("return r;})()");
        try {
            webView.evaluateJavascript(script.toString(), (value) -> record(webView.getContext(), value));
        } catch (Exception ex) {
            Log.e(TAG, "Failed to check the page", ex);
        }
    }

    private static void record(Context context, String value) {
        if (context == null || value == null || value.equals("null")) return;
        try {
            JSONObject counts = new JSONObject(value);
            SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            boolean wasBroken = !broken(prefs).isEmpty();
            SharedPreferences.Editor editor = prefs.edit();
            int i = 0;
            for (String selector : ANCHORS.keySet()) {
                String key = "check_miss_a" + i;
                editor.putInt(key, counts.optInt("a" + i, 0) > 0 ? 0 : prefs.getInt(key, 0) + 1);
                i++;
            }
            editor.putLong("check_time", System.currentTimeMillis());
            editor.commit();
            List<String> now = broken(prefs);
            if (!wasBroken && !now.isEmpty()) {
                Toast.makeText(context, "Quora changed its pages, so some patches may not work. "
                        + "Long-press Home for details.", Toast.LENGTH_LONG).show();
            }
        } catch (Exception ex) {
            Log.e(TAG, "Failed to record the page check", ex);
        }
    }

    /** The patches whose class names the feed no longer has. */
    static List<String> broken(SharedPreferences prefs) {
        List<String> names = new ArrayList<>();
        int i = 0;
        for (String[] patches : ANCHORS.values()) {
            if (prefs.getInt("check_miss_a" + i, 0) >= MISSES) {
                for (String name : patches) if (!names.contains(name)) names.add(name);
            }
            i++;
        }
        return names;
    }

    /** One line for the settings dialog, or null before the first check. */
    static String status(SharedPreferences prefs) {
        long time = prefs.getLong("check_time", 0);
        if (time == 0) return null;
        List<String> names = broken(prefs);
        if (names.isEmpty()) return "Page check: the feed looks as the patches expect.";
        return "Page check: Quora changed its feed. These may not work: " + android.text.TextUtils.join(", ", names)
                + ". Please report it on GitHub.";
    }
}
