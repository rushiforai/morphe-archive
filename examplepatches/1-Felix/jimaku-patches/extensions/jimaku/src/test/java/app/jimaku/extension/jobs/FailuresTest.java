package app.jimaku.extension.jobs;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

import app.jimaku.extension.SharedCases;

/** Runs the extension's failure-wording cases (tests/shared/explain.json). */
public class FailuresTest {
    private static JSONObject cases() throws Exception {
        return SharedCases.read("explain.json");
    }

    private static Failures.Explained say(JSONObject all, String code, JSONObject extra, JSONObject change) throws Exception {
        JSONObject context = new JSONObject(all.getJSONObject("base").getJSONObject("context").toString());
        if (change != null) {
            for (Iterator<String> keys = change.keys(); keys.hasNext(); ) {
                String key = keys.next();
                context.put(key, change.get(key));
            }
        }
        Map<String, Object> given = new HashMap<>();
        if (extra != null) {
            for (Iterator<String> keys = extra.keys(); keys.hasNext(); ) {
                String key = keys.next();
                given.put(key, extra.get(key));
            }
        }
        return Failures.explain(Locale.ENGLISH, code, given, new Failures.Context(
                context.getBoolean("standardAvailable"),
                context.isNull("runningTitle") ? null : context.getString("runningTitle"),
                context.isNull("balance") ? null : context.getDouble("balance")));
    }

    @Test
    public void passesTheSharedCases() throws Exception {
        JSONObject all = cases();
        JSONArray list = all.getJSONArray("cases");
        for (int i = 0; i < list.length(); i++) {
            JSONObject c = list.getJSONObject(i);
            String name = c.getString("name");
            Failures.Explained said = say(all, c.getString("code"), c.optJSONObject("extra"), c.optJSONObject("context"));
            JSONObject is = c.optJSONObject("is");
            if (is != null) {
                assertEquals(name, is.getString("text"), said.text);
                assertEquals(name, is.getBoolean("standard"), said.standard);
                assertEquals(name, is.optBoolean("buy", false), said.buy);
            }
            if (c.has("text")) assertEquals(name, c.getString("text"), said.text);
        }
    }

    @Test
    public void endsWhatCanSucceedLaterWithTryAgainLater() throws Exception {
        JSONObject all = cases();
        JSONArray later = all.getJSONArray("tryAgainLater");
        for (int i = 0; i < later.length(); i++) assertTrue(later.getString(i), say(all, later.getString(i), null, null).text.endsWith("Try again later."));
        JSONArray never = all.getJSONArray("neverTryAgain");
        for (int i = 0; i < never.length(); i++) assertFalse(never.getString(i), say(all, never.getString(i), null, null).text.contains("Try again"));
    }

    @Test
    public void cutsALongTitle() throws Exception {
        JSONArray titles = cases().getJSONArray("shortTitle");
        for (int i = 0; i < titles.length(); i++) {
            JSONArray pair = titles.getJSONArray(i);
            assertEquals(pair.getString(1), Failures.shortTitle(pair.getString(0)));
        }
        String cut = Failures.shortTitle(titles.getJSONArray(0).getString(0));
        assertEquals(24, cut.codePointCount(0, cut.length()));
    }
}
