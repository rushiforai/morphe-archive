package app.jofslash.extension.quora;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import android.webkit.WebView;

import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;

/**
 * Counts what the patches hid, for a line in Patch settings such as "Hidden in the last 7 days:
 * Ads: 42 · AI answers: 17". It shows that the patches work, and when a count drops to nothing
 * after a Quora update, which patch stopped. The counts are per day, stay on the phone, and are
 * kept for 31 days.
 *
 * <p>The page script counts each hidden thing once per page: what the patches' stylesheets hide
 * (found by the stylesheet's id) and the feed items and answers the filter scripts hide.
 */
@SuppressWarnings("unused")
public final class HiddenStats {

    private static final String TAG = "JoFSlashPatches";
    private static final String PREFS = "jofslash_patch_settings";
    private static final String KEY = "stats_days";
    private static final int KEEP_DAYS = 31;
    private static final int SHOW_DAYS = 7;

    /** The kinds, in the order the settings line shows them. */
    static final String[] KINDS = {"ads", "ai", "plus", "suggestions", "filters"};

    private static final String UNITS = "[class*=\"dom_annotate_question_answer_item\"],"
            + "[class*=\"dom_annotate_multifeed_bundle_\"],.puppeteer_test_question_component_base";

    /** The stylesheets of the patches that hide whole things, by id, and the kind they count as. */
    private static final String STYLES = "{"
            + "'jofslash-remove-ads':'ads','jofslash-update-removeAds':'ads',"
            + "'jofslash-hide-ai-answers':'ai','jofslash-update-hideAiAnswers':'ai',"
            + "'jofslash-hide-quora-plus':'plus','jofslash-update-hideQuoraPlusAnswers':'plus',"
            + "'jofslash-hide-suggested-questions':'suggestions','jofslash-update-hideSuggestedQuestions':'suggestions',"
            + "'jofslash-hide-spaces-suggestions':'suggestions','jofslash-update-hideSpacesSuggestions':'suggestions',"
            + "'jofslash-hide-people':'suggestions','jofslash-update-hidePeopleSuggestions':'suggestions',"
            + "'jofslash-hide-spaces-posts':'filters','jofslash-update-hideSpacesPosts':'filters'}";

    /**
     * Marks what it counted with data-jofslash-counted, so a thing counts once, and the things
     * inside it don't count again. Counts wait in the page until the bridge is there.
     */
    static final String SCRIPT = "(function(){"
            + "if(window.__jofslashStats)return;window.__jofslashStats=1;"
            + "var J=window.JoFSlashPatches,CAT=" + STYLES + ",UNITS='" + UNITS.replace("'", "\\'") + "',wait={},n=0;"
            + "function rules(){var out=[];for(var id in CAT){var s=document.getElementById(id);if(!s||!s.sheet)continue;"
            + "try{var r=s.sheet.cssRules;for(var i=0;i<r.length;i++)if(r[i].selectorText)out.push([r[i].selectorText,CAT[id]]);}catch(e){}}"
            + "return out;}"
            + "function hit(e,c){if(e.closest('[data-jofslash-counted]'))return;"
            + "e.setAttribute('data-jofslash-counted',c);wait[c]=(wait[c]||0)+1;n++;}"
            + "function run(){rules().forEach(function(p){var l;try{l=document.querySelectorAll(p[0]);}catch(e){return;}"
            + "for(var i=0;i<l.length;i++)hit(l[i],p[1]);});"
            + "document.querySelectorAll('[data-jofslash-filtered],[data-jofslash-hidden]').forEach(function(e){"
            + "if(e.matches(UNITS))hit(e,'filters');});"
            + "if(n&&J&&J.ready()){try{J.countHidden(JSON.stringify(wait));wait={};n=0;}catch(e){}}}"
            + "run();var p=false;"
            + "new MutationObserver(function(){if(p)return;p=true;setTimeout(function(){p=false;run();},1500);})"
            + ".observe(document.documentElement,{childList:true,subtree:true,attributes:true,attributeFilter:['data-jofslash-filtered','data-jofslash-hidden']});"
            + "})();";

    private HiddenStats() {
    }

    /** Injection point: start of QWebViewClient.onPageFinished. */
    public static void onPageFinished(WebView webView) {
        if (webView == null) return;
        try {
            webView.evaluateJavascript(PatchSettings.bridgeScript() + SCRIPT, null);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to inject the hidden counts", ex);
        }
    }

    private static String day(long time) {
        return new SimpleDateFormat("yyyyMMdd", Locale.ROOT).format(new Date(time));
    }

    /** Adds the counts a page sent, as {"ads":2,…}. Unknown kinds and odd numbers are left out. */
    static synchronized void add(Context context, String json) {
        if (context == null || json == null || json.length() > 500) return;
        try {
            JSONObject counts = new JSONObject(json);
            SharedPreferences prefs = context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            JSONObject days = new JSONObject(prefs.getString(KEY, "{}"));
            String today = day(System.currentTimeMillis());
            JSONObject now = days.optJSONObject(today);
            if (now == null) now = new JSONObject();
            boolean changed = false;
            for (String kind : KINDS) {
                int n = counts.optInt(kind, 0);
                if (n <= 0 || n > 1000) continue;
                now.put(kind, now.optInt(kind, 0) + n);
                changed = true;
            }
            if (!changed) return;
            days.put(today, now);
            // Only the last KEEP_DAYS days.
            String oldest = day(System.currentTimeMillis() - KEEP_DAYS * 24L * 60 * 60 * 1000);
            for (Iterator<String> it = days.keys(); it.hasNext(); ) {
                if (it.next().compareTo(oldest) < 0) it.remove();
            }
            prefs.edit().putString(KEY, days.toString()).apply();
        } catch (Exception ex) {
            Log.e(TAG, "Failed to add the hidden counts", ex);
        }
    }

    /** The counts of the last days, today included, in the order of KINDS. */
    static int[] lastDays(SharedPreferences prefs, int count) {
        int[] sums = new int[KINDS.length];
        try {
            JSONObject days = new JSONObject(prefs.getString(KEY, "{}"));
            Calendar calendar = Calendar.getInstance();
            for (int d = 0; d < count; d++) {
                JSONObject one = days.optJSONObject(day(calendar.getTimeInMillis()));
                if (one != null) {
                    for (int i = 0; i < KINDS.length; i++) sums[i] += one.optInt(KINDS[i], 0);
                }
                calendar.add(Calendar.DAY_OF_YEAR, -1);
            }
        } catch (Exception ex) {
            Log.e(TAG, "Failed to read the hidden counts", ex);
        }
        return sums;
    }

    private static String name(String kind) {
        switch (kind) {
            case "ads": return Texts.t("Ads");
            case "ai": return Texts.t("AI answers");
            case "plus": return Texts.t("Quora+ answers");
            case "suggestions": return Texts.t("Suggestions");
            default: return Texts.t("Your filters");
        }
    }

    /** One line for the settings page, or null when nothing was hidden in the last days. */
    static String status(SharedPreferences prefs) {
        int[] sums = lastDays(prefs, SHOW_DAYS);
        StringBuilder line = new StringBuilder();
        for (int i = 0; i < KINDS.length; i++) {
            if (sums[i] == 0) continue;
            if (line.length() > 0) line.append(" · ");
            line.append(name(KINDS[i])).append(": ").append(sums[i]);
        }
        return line.length() == 0 ? null : Texts.t("Hidden in the last 7 days: ") + line;
    }
}
