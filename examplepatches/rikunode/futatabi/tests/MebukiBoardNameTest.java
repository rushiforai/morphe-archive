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
        check(defaults.length() == 6, "six initial boards");
        mebuki(defaults);
        String jun = "https://jun.2chan.net/jun/";
        int junIndex = -1;
        for (int i = 0; i < defaults.length(); i++) {
            JSONObject item = new JSONObject(defaults.getString(i));
            if (jun.equals(item.optString("url"))) {
                check(junIndex < 0, "one Jun board");
                junIndex = i;
                check("二次元裏（jun)".equals(item.optString("name")), "Jun name");
            }
        }
        check(junIndex >= 0, "Jun uses stock direct URL");
        JSONArray previous = new JSONArray();
        for (int i = 0; i < defaults.length(); i++) if (i != junIndex) previous.put(defaults.getString(i));
        String upgraded = FutatabiProvider.completeBoards(PREFIX + previous.toString(), false);
        JSONArray upgradeList = list(upgraded);
        check(upgradeList.length() == 6, "upgrade adds only Jun");
        for (int i = 0; i < previous.length(); i++) check(previous.getString(i).equals(upgradeList.getString(i)), "upgrade preserves every original entry and order");
        check(jun.equals(new JSONObject(upgradeList.getString(5)).optString("url")), "upgrade appended Jun");
        JSONObject customJun = new JSONObject(defaults.getString(junIndex)).put("name", "自分のjun").put("favorite", true).put("resuCount", 9);
        previous.put(customJun.toString());
        String preExisting = PREFIX + previous.toString();
        check(preExisting.equals(FutatabiProvider.completeBoards(preExisting, false)), "preserve existing Jun name, data and order");
        System.out.println("PASS fresh and upgraded registration: six boards, Jun direct URL, existing Jun preserved");

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
        // The stock backup reads/writes FlutterSharedPreferences.xml as a whole.
        // Model the restored preference payload, not Android system backup.
        android.content.Context restored=new android.content.Context();
        android.content.SharedPreferences prefs=restored.getSharedPreferences("FlutterSharedPreferences",0);
        prefs.edit().putString("flutter.itaList",migrated).commit();
        check(BridgePalette.DARK.equals(BridgePalette.get(restored)),"default dark");
        check(BridgePalette.save(restored,BridgePalette.LIGHT),"light save");
        check(BridgePalette.LIGHT.equals(prefs.getString(BridgePalette.KEY,"")),"palette in stock backup preference file");
        check(migrated.equals(FutatabiProvider.completeBoards(prefs.getString("flutter.itaList",null),true)),"restored list survives fresh migration");
        check(BridgePalette.decorate("<head></head><body></body>",BridgePalette.get(restored)).contains("#fafafa"),"light HTML");
        check(BridgePalette.decorate("<head></head><body></body>",BridgePalette.DARK).contains("#202124"),"dark HTML");
        check(!BridgePalette.save(restored,"invalid")&&BridgePalette.LIGHT.equals(BridgePalette.get(restored)),"invalid palette rejected");
        System.out.println("PASS existing migration: same count, fields, other boards and order; fresh restore, palette in stock preference file, dark/light");
    }
}
