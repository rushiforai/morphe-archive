package dev.rikunode.futatabi.bridge;

import org.json.JSONArray;
import org.json.JSONObject;

/** Focused host test of the production saved-board transformation. */
public final class MebukiBoardNameTest {
    private static final String PREFIX = "VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu!";
    private static final String URL = "http://127.0.0.1:18765/mebuki/";
    private static final String OLD = "めぶき";
    private static final String NAME = "めぶきちゃんねる";

    private static void check(boolean ok, String message) {
        if (!ok) throw new AssertionError(message);
    }

    private static JSONArray list(String raw) throws Exception {
        return new JSONArray(raw.substring(PREFIX.length()));
    }

    private static JSONObject mebuki(JSONArray items) throws Exception {
        JSONObject found = null;
        for (int i = 0; i < items.length(); i++) {
            JSONObject entry = new JSONObject(items.getString(i));
            if (!URL.equals(entry.optString("url"))) continue;
            check(found == null, "duplicate Mebuki URL");
            found = entry;
        }
        check(found != null && NAME.equals(found.optString("name")), "official name");
        return found;
    }

    public static void main(String[] args) throws Exception {
        String fresh = FutatabiProvider.completeBoards(null, true);
        JSONArray defaults = list(fresh);
        check(defaults.length() == 5, "five initial boards");
        mebuki(defaults);
        System.out.println("PASS fresh registration: five boards, one official Mebuki name");

        JSONObject old = mebuki(defaults);
        old.put("name", OLD).put("favorite", true).put("resuCount", 17);
        JSONObject custom = new JSONObject().put("name", OLD).put("url", "https://example.invalid/custom/");
        JSONArray saved = new JSONArray();
        for (int i = 0; i < defaults.length(); i++) {
            String entry = defaults.getString(i);
            saved.put(URL.equals(new JSONObject(entry).optString("url")) ? old.toString() : entry);
        }
        saved.put(custom.toString());
        String migrated = FutatabiProvider.completeBoards(PREFIX + saved.toString(), false);
        JSONArray result = list(migrated);
        check(result.length() == saved.length(), "migration must not add a duplicate");
        JSONObject actual = mebuki(result);
        old.put("name", NAME);
        check(old.toString().equals(actual.toString()), "preserve every existing Mebuki field");
        for (int i = 0; i < saved.length(); i++) {
            String entry = saved.getString(i);
            if (!URL.equals(new JSONObject(entry).optString("url"))) {
                check(entry.equals(result.getString(i)), "preserve unrelated board and order");
            }
        }
        check(migrated.equals(FutatabiProvider.completeBoards(migrated, false)), "idempotent migration");
        System.out.println("PASS existing migration: same count, fields, other boards and order; idempotent");
    }
}
