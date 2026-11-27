package app.jimaku.extension.menu;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import app.jimaku.extension.SharedCases;
import app.jimaku.extension.gateway.Lookup;

/** Runs every case of the extension's menu-model.json against the port, as tests/menu-model.test.ts runs them. */
@RunWith(Parameterized.class)
public class MenuModelTest {
    private static final Set<String> INPUTS = Set.of("lookup", "kept", "standardOriginal", "preferred", "showing", "me",
            "minutesKnown", "duration", "track", "trackUnknown", "live", "uploaded", "mode", "working");
    private static final Set<String> CHECKS = Set.of("rows", "rowsAt", "mainRows", "main", "row", "other", "otherAll", "otherRow",
            "otherCaption", "search", "pick", "plan", "mode", "questions", "minutesOwed", "percent", "seconds");
    private static final Locale LOCALE = Locale.ENGLISH;

    @Parameterized.Parameters(name = "{0}")
    public static Collection<Object[]> cases() throws Exception {
        JSONObject shared = SharedCases.read("menu-model.json");
        JSONArray cases = shared.getJSONArray("cases");
        List<Object[]> all = new ArrayList<>();
        for (int i = 0; i < cases.length(); i++) {
            JSONObject each = cases.getJSONObject(i);
            all.add(new Object[]{each.getString("name"), shared.getJSONObject("base"), each.getJSONObject("input"), each.getJSONObject("expect")});
        }
        assertFalse(all.isEmpty());
        return all;
    }

    private final JSONObject base;
    private final JSONObject change;
    private final JSONObject want;

    public MenuModelTest(String name, JSONObject base, JSONObject change, JSONObject want) {
        this.base = base;
        this.change = change;
        this.want = want;
    }

    @Test
    public void passes() throws JSONException {
        for (String key : keys(change)) assertTrue("unknown input " + key, INPUTS.contains(key));
        for (String key : keys(want)) assertTrue("unknown check " + key, CHECKS.contains(key));
        assertTrue("checks nothing", want.length() > 0);
        MenuInput menu = input();

        if (want.has("rows")) assertEquals(strings(want.getJSONArray("rows")), rows(menu));
        if (want.has("rowsAt")) {
            JSONObject at = want.getJSONObject("rowsAt");
            List<String> expected = strings(at.getJSONArray("rows"));
            List<String> rows = rows(menu);
            int from = at.getInt("from");
            assertEquals(expected, rows.subList(from, Math.min(rows.size(), from + expected.size())));
        }
        if (want.has("mainRows")) assertEquals(strings(want.getJSONArray("mainRows")), read(MenuModel.mainPanel(menu).rows));
        if (want.has("main")) matches("main", want.getJSONObject("main"), json(MenuModel.mainPanel(menu)));
        for (JSONObject each : objects(want.optJSONArray("row"))) {
            matches("row " + each.getString("name"), each.getJSONObject("is"), json(row(menu, each.getString("name"))));
        }
        if (want.has("other")) {
            JSONObject other = want.getJSONObject("other");
            List<String> listed = read(MenuModel.otherPanel(menu, "").rows);
            if (other.has("rows")) assertEquals(strings(other.getJSONArray("rows")), listed);
            if (other.has("start")) {
                List<String> start = strings(other.getJSONArray("start"));
                assertEquals(start, listed.subList(0, Math.min(listed.size(), start.size())));
            }
            for (String each : strings(other.optJSONArray("has"))) assertTrue("Other languages lacks " + each, listed.contains(each));
            for (String each : strings(other.optJSONArray("lacks"))) assertFalse("Other languages has " + each, listed.contains(each));
            for (String start : strings(other.optJSONArray("lacksStarting"))) {
                for (String each : listed) assertFalse("Other languages has " + each, each.startsWith(start));
            }
        }
        if (want.has("otherAll")) {
            for (LanguageRow each : MenuModel.otherPanel(menu, "").rows) matches("Other languages row " + each.lang, want.getJSONObject("otherAll"), json(each));
        }
        for (JSONObject each : objects(want.optJSONArray("otherRow"))) {
            LanguageRow found = null;
            for (LanguageRow row : MenuModel.otherPanel(menu, "").rows) {
                if (row.lang.equals(each.getString("lang"))) {
                    found = row;
                    break;
                }
            }
            assertNotNull("no Other languages row " + each.getString("lang"), found);
            matches("Other languages row " + found.lang, each.getJSONObject("is"), json(found));
        }
        if (want.has("otherCaption")) assertEquals(want.getString("otherCaption"), MenuModel.otherPanel(menu, "").caption);
        for (JSONObject each : objects(want.optJSONArray("search"))) {
            assertEquals("search " + each.getString("query"), strings(each.getJSONArray("rows")), read(MenuModel.otherPanel(menu, each.getString("query")).rows));
        }
        for (JSONObject each : objects(want.optJSONArray("pick"))) {
            Subtitle picked = MenuModel.pick(menu, each.getString("lang"));
            same("pick " + each.getString("lang"), each.get("is"), picked == null ? JSONObject.NULL : json(picked));
        }
        for (JSONObject each : objects(want.optJSONArray("plan"))) {
            Subtitle subtitle = subtitle(each.getJSONObject("subtitle"));
            same("plan " + subtitle, each.getJSONObject("is"), json(MenuModel.plan(menu, subtitle)));
        }
        if (want.has("mode")) assertEquals(Version.of(want.getString("mode")), MenuModel.effectiveMode(menu));
        if (want.has("questions")) assertEquals(strings(want.getJSONArray("questions")), MenuModel.questions(menu));
        if (want.has("minutesOwed")) assertEquals(want.getLong("minutesOwed"), MenuModel.minutesOwed(menu.me != null ? menu.me.balance : 0));
        for (JSONArray pair : pairs(want.optJSONArray("percent"))) assertEquals(pair.getString(1), MenuModel.percent(LOCALE, pair.getInt(0)));
        for (JSONArray pair : pairs(want.optJSONArray("seconds"))) assertEquals(pair.getString(1), MenuModel.seconds(LOCALE, pair.getDouble(0)));
    }

    /** The case's input: the base with its changes, as the extension's runner builds it. */
    private MenuInput input() throws JSONException {
        JSONObject merged = new JSONObject(base.toString());
        for (String key : keys(change)) merged.put(key, change.get(key));
        MenuInput.Builder builder = new MenuInput.Builder(merged.getString("preferred")).locale(LOCALE);
        if (!merged.isNull("lookup")) {
            JSONObject lookup = merged.getJSONObject("lookup");
            builder.lookup(new Lookup(lookup.getString("original"), strings(lookup.getJSONArray("translations")), lookup.optBoolean("mixed")));
        }
        builder.kept(strings(merged.getJSONArray("kept")));
        if (merged.has("standardOriginal") && !merged.isNull("standardOriginal")) builder.standardOriginal(merged.getString("standardOriginal"));
        if (!merged.isNull("showing")) builder.showing(subtitle(merged.getJSONObject("showing")));
        if (!merged.isNull("me")) {
            JSONObject me = merged.getJSONObject("me");
            builder.me(new MenuInput.Account(me.getDouble("balance"), me.getBoolean("signedIn")));
        }
        builder.minutesKnown(merged.getBoolean("minutesKnown"));
        if (!merged.isNull("duration")) builder.duration(merged.getDouble("duration"));
        if (merged.optBoolean("trackUnknown")) builder.trackUnknown();
        else builder.track(merged.isNull("track") ? null : merged.getString("track"));
        builder.live(merged.optBoolean("live"));
        builder.uploaded(strings(merged.optJSONArray("uploaded")));
        if (!merged.isNull("mode")) builder.mode(Version.of(merged.getString("mode")));
        if (!merged.isNull("working")) {
            JSONObject working = merged.getJSONObject("working");
            builder.working(new MenuInput.Working(subtitle(working.getJSONObject("subtitle")), working.getString("step")));
        }
        return builder.build();
    }

    /** A row as a viewer reads it: the name, the spark on a Premium row, what sits beside it, and the check. */
    private static String read(LanguageRow row) {
        return row.name + (row.version == Version.PREMIUM ? " ✦" : "") + (row.value.isEmpty() ? "" : ": " + row.value) + (row.checked ? " ✓" : "");
    }

    private static List<String> read(List<LanguageRow> rows) {
        List<String> read = new ArrayList<>();
        for (LanguageRow row : rows) read.add(read(row));
        return read;
    }

    /** The main panel as a viewer reads it, from the switch down to Other languages. */
    private static List<String> rows(MenuInput menu) {
        MainPanel main = MenuModel.mainPanel(menu);
        String state = !main.signedIn ? "signed out" : main.premium ? "on" : "off";
        List<String> rows = new ArrayList<>();
        rows.add("Premium " + state + (main.value.isEmpty() ? "" : ": " + main.value));
        if (main.note != null) rows.add("(" + main.note + ")");
        else rows.addAll(read(main.rows));
        if (main.other) rows.add("Other languages ›");
        return rows;
    }

    private static LanguageRow row(MenuInput menu, String name) {
        for (LanguageRow row : MenuModel.mainPanel(menu).rows) if (row.name.equals(name)) return row;
        throw new AssertionError("no row " + name);
    }

    private static Subtitle subtitle(JSONObject json) throws JSONException {
        return new Subtitle(json.getString("lang"), Version.of(json.getString("version")));
    }

    private static JSONObject json(Subtitle subtitle) throws JSONException {
        return new JSONObject().put("lang", subtitle.lang).put("version", subtitle.version.id());
    }

    private static JSONObject json(LanguageRow row) throws JSONException {
        Object ask = row.ask == null ? JSONObject.NULL : new JSONObject().put("question", row.ask.question).put("yes", row.ask.yes);
        return new JSONObject().put("lang", row.lang).put("version", row.version.id()).put("name", row.name).put("value", row.value)
                .put("checked", row.checked).put("ask", ask).put("press", row.press.name().toLowerCase(Locale.ROOT));
    }

    private static JSONObject json(MainPanel main) throws JSONException {
        return new JSONObject().put("signedIn", main.signedIn).put("premium", main.premium).put("value", main.value)
                .put("other", main.other).put("note", main.note == null ? JSONObject.NULL : main.note).put("original", main.original);
    }

    /** A plan as the extension's object has it: the method, then the minutes or what is missing. */
    private static JSONObject json(Plan plan) throws JSONException {
        JSONObject json = new JSONObject().put("method", plan.method.name().toLowerCase(Locale.ROOT));
        if (plan.method == Plan.Method.PREMIUM) json.put("minutes", plan.minutes == null ? JSONObject.NULL : plan.minutes);
        if (plan.method == Plan.Method.NONE) json.put("why", plan.why.name().toLowerCase(Locale.ROOT));
        return json;
    }

    /** As toMatchObject: every field {@code expected} names is there, objects matched the same way. */
    private static void matches(String where, Object expected, Object actual) throws JSONException {
        if (expected instanceof JSONObject fields) {
            if (!(actual instanceof JSONObject object)) {
                fail(where + ": expected " + expected + " but was " + actual);
                return;
            }
            for (String key : keys(fields)) {
                if (!object.has(key)) fail(where + ": no " + key + " in " + actual);
                matches(where + "." + key, fields.get(key), object.get(key));
            }
            return;
        }
        assertEquals(where, scalar(expected), scalar(actual));
    }

    /** As toEqual: the same fields, no more. */
    private static void same(String where, Object expected, Object actual) throws JSONException {
        if (expected instanceof JSONObject fields && actual instanceof JSONObject object) {
            assertEquals(where + " fields", new HashSet<>(keys(fields)), new HashSet<>(keys(object)));
        }
        matches(where, expected, actual);
    }

    /** Numbers by value, whichever type org.json read them as. */
    private static Object scalar(Object value) {
        if (value instanceof Number number) return number.doubleValue();
        return value;
    }

    /** The object's keys; Android's org.json, first on the classpath, has no keySet(). */
    private static List<String> keys(JSONObject object) {
        List<String> keys = new ArrayList<>();
        for (Iterator<String> each = object.keys(); each.hasNext(); ) keys.add(each.next());
        return keys;
    }

    private static List<String> strings(JSONArray array) throws JSONException {
        List<String> strings = new ArrayList<>();
        if (array != null) for (int i = 0; i < array.length(); i++) strings.add(array.getString(i));
        return strings;
    }

    private static List<JSONObject> objects(JSONArray array) throws JSONException {
        List<JSONObject> objects = new ArrayList<>();
        if (array != null) for (int i = 0; i < array.length(); i++) objects.add(array.getJSONObject(i));
        return objects;
    }

    private static List<JSONArray> pairs(JSONArray array) throws JSONException {
        List<JSONArray> pairs = new ArrayList<>();
        if (array != null) for (int i = 0; i < array.length(); i++) pairs.add(array.getJSONArray(i));
        return pairs;
    }
}
