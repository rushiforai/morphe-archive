package app.jofslash.extension.quora;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.webkit.WebView;
import android.widget.Toast;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Checks that the feed and open answers still have what the page patches rely on. When Quora
 * changes its pages, those patches stop working without any error; this notices it and says which.
 */
@SuppressWarnings("unused")
public final class PageCheck {

    private static final String TAG = "JoFSlashPatches";
    private static final String PREFS = "jofslash_patch_settings";

    /** Loads of that kind of page in a row without an anchor before it counts as gone. */
    private static final int MISSES = 5;

    private static final String FEED = "feed";
    private static final String ANSWER = "answer";

    /** Something a page must have: the page it is on, a script that counts it, and the patches that need it. */
    private static final class Anchor {
        final String page, count;
        final String[] patches;

        Anchor(String page, String count, String... patches) {
            this.page = page;
            this.count = count;
            this.patches = patches;
        }
    }

    /** The place in this list is the anchor's key in the saved counters, so new anchors go at the end. */
    private static final List<Anchor> ANCHORS = new ArrayList<>();

    private static String all(String selector) {
        return "document.querySelectorAll('" + selector + "').length";
    }

    static {
        ANCHORS.add(new Anchor(FEED, all("[class*=\"dom_annotate_multifeed_bundle_\"]"), "Remove ads",
                "Filter keywords", "Block authors and Spaces", "Hide seen items", "Hide people suggestions",
                "Hide Spaces suggestions"));
        ANCHORS.add(new Anchor(FEED, all(".puppeteer_test_answer_content"), "Expand answers", "Data saver"));
        ANCHORS.add(new Anchor(FEED, all(".puppeteer_test_votable_upvote_button"), "Hide counts", "Hide downvote button"));
        ANCHORS.add(new Anchor(FEED, all(".puppeteer_test_question_title"), "Hide seen items"));
        ANCHORS.add(new Anchor(FEED, all(".dom_annotate_answer_action_bar_share"), "Copy answer text", "Share answer text"));
        // An open answer: its Share button, and Quora's data with the answer's address.
        ANCHORS.add(new Anchor(ANSWER, all(".dom_annotate_answer_action_bar_share"), "Copy answer text",
                "Share answer text", "Bookmarks"));
        ANCHORS.add(new Anchor(ANSWER, "(function(){var R=window.__RELAY_RECORDS__;if(!R)return 0;"
                + "for(var k in R){var x=R[k];if(x&&x.aid&&x.permaUrl)return 1;}return 0;})()",
                "Reading history", "Bookmarks"));
    }

    private PageCheck() {
    }

    /**
     * Injection point: start of QWebViewClient.onPageFinished. Checks the feed, or an open answer,
     * once it has loaded. The page says itself which one it is: open answers report about:blank as
     * their address to the app.
     */
    public static void onPageFinished(WebView webView) {
        if (webView == null) return;
        new Handler(Looper.getMainLooper()).postDelayed(() -> checkUpgradeNeeded(webView), 1_500);
        new Handler(Looper.getMainLooper()).postDelayed(() -> check(webView), 10_000);
    }

    private static boolean upgradeShown;
    // One string, so .github/scripts/check_texts.py finds it.
    private static final String UPGRADE_HELP = "It can't update from Google Play. Patch a newer Quora version with Morphe once these patches support it, and install it over this app: you stay signed in.";

    /**
     * Quora's servers refuse an app version they no longer support with an "Upgrade Needed" page
     * whose button goes to Google Play, where a patched app can't update. Says what to do instead,
     * once per start.
     */
    private static void checkUpgradeNeeded(WebView webView) {
        if (upgradeShown) return;
        try {
            webView.evaluateJavascript("(function(){var t=(document.body&&document.body.innerText)||'';"
                    + "return document.title==='Upgrade Needed'"
                    + "||/old version of Quora for Android that.s no longer supported/.test(t);})()", (value) -> {
                if (!"true".equals(value) || upgradeShown) return;
                upgradeShown = true;
                showUpgradeNeeded(webView.getContext());
            });
        } catch (Exception ex) {
            Log.e(TAG, "Failed to check for Quora's upgrade page", ex);
        }
    }

    private static void showUpgradeNeeded(android.content.Context context) {
        try {
            String version = "?";
            try {
                version = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
            } catch (Exception ignored) {
                // The version is only for the message.
            }
            new android.app.AlertDialog.Builder(context)
                    .setTitle(Texts.t("Quora no longer accepts this version"))
                    .setMessage(Texts.t("This patched app is Quora ") + version + ". "
                            + Texts.t(UPGRADE_HELP))
                    .setPositiveButton(Texts.t("How to update"), (d, w) -> {
                        try {
                            android.content.Intent open = new android.content.Intent(android.content.Intent.ACTION_VIEW,
                                    android.net.Uri.parse("https://github.com/JoFSlash/quora-patches#updating"));
                            open.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
                            context.startActivity(open);
                        } catch (Exception ex) {
                            Log.e(TAG, "Failed to open the update guide", ex);
                        }
                    })
                    .setNegativeButton(Texts.t("Close"), null)
                    .show();
        } catch (Exception ex) {
            Log.e(TAG, "Failed to show the upgrade note", ex);
        }
    }

    private static void check(WebView webView) {
        StringBuilder script = new StringBuilder("(function(){var u=location.href,p=null,r={};");
        script.append("if(/^https:\\/\\/www\\.quora\\.com\\/?([?#].*)?$/.test(u))p='").append(FEED).append("';");
        script.append("else if(/^https:\\/\\/www\\.quora\\.com\\/[^?#]*\\?(.*&)?rootCls=AnswerModalPage/.test(u))p='")
                .append(ANSWER).append("';");
        script.append("if(!p)return null;");
        // Only a page that has loaded counts, not an error page or one still loading.
        script.append("var len=((document.body&&document.body.innerText)||'').length;");
        script.append("if(len<(p==='").append(FEED).append("'?1500:300))return null;");
        script.append("r.page=p;");
        for (int i = 0; i < ANCHORS.size(); i++) {
            Anchor anchor = ANCHORS.get(i);
            script.append("if(p==='").append(anchor.page).append("')r['a").append(i).append("']=")
                    .append(anchor.count).append(";");
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
            for (int i = 0; i < ANCHORS.size(); i++) {
                // Anchors of the other kind of page aren't in this result: leave them as they are.
                if (!counts.has("a" + i)) continue;
                String key = "check_miss_a" + i;
                editor.putInt(key, counts.optInt("a" + i, 0) > 0 ? 0 : prefs.getInt(key, 0) + 1);
            }
            editor.putLong("check_time", System.currentTimeMillis());
            editor.commit();
            List<String> now = broken(prefs);
            if (!wasBroken && !now.isEmpty()) {
                Toast.makeText(context, Texts.t("Quora changed its pages, so some patches may not work. Long-press Home for details."), Toast.LENGTH_LONG).show();
            }
        } catch (Exception ex) {
            Log.e(TAG, "Failed to record the page check", ex);
        }
    }

    /** The patches whose anchors the pages no longer have. */
    static List<String> broken(SharedPreferences prefs) {
        List<String> names = new ArrayList<>();
        for (int i = 0; i < ANCHORS.size(); i++) {
            if (prefs.getInt("check_miss_a" + i, 0) >= MISSES) {
                for (String name : ANCHORS.get(i).patches) if (!names.contains(name)) names.add(name);
            }
        }
        return names;
    }

    /** One line for the settings dialog, or null before the first check. */
    static String status(SharedPreferences prefs) {
        long time = prefs.getLong("check_time", 0);
        if (time == 0) return null;
        List<String> names = broken(prefs);
        if (names.isEmpty()) return Texts.t("Page check: the feed and answers look as the patches expect.");
        return Texts.t("Page check: Quora changed its pages. These may not work: ") + android.text.TextUtils.join(", ", names)
                + Texts.t(". Please report it on GitHub.");
    }
}
