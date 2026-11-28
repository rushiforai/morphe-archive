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
        check(fresh.equals(upgraded), "upgrade inserts Jun between img and external boards");
        check(jun.equals(new JSONObject(upgradeList.getString(2)).optString("url")), "upgrade positions Jun");
        JSONObject customJun = new JSONObject(defaults.getString(junIndex)).put("name", "自分のjun").put("favorite", true).put("resuCount", 9);
        previous.put(customJun.toString());
        String preExisting = PREFIX + previous.toString();
        JSONArray reordered = list(FutatabiProvider.completeBoards(preExisting, false));
        check(customJun.toString().equals(reordered.getString(2)), "preserve existing Jun name and fields");
        String[] expected = {"https://may.2chan.net/b/", "https://img.2chan.net/b/", jun,
                URL, "http://127.0.0.1:18765/aimoge/", "http://127.0.0.1:18765/animanch/"};
        for (int i = 0; i < expected.length; i++)
            check(expected[i].equals(new JSONObject(defaults.getString(i)).getString("url")), "fresh order");
        // Exact beta.37 owner-reported order, with preserved record payloads.
        JSONArray beta37 = new JSONArray();
        for (int index : new int[]{0, 1, 4, 5, 3, 2}) beta37.put(defaults.getString(index));
        check(fresh.equals(FutatabiProvider.completeBoards(PREFIX + beta37.toString(), false)), "owner beta.37 order corrected");
        JSONArray mixed = new JSONArray();
        String custom1 = new JSONObject().put("name", "custom1").put("url", "https://example.invalid/a/").put("favorite", true).toString();
        String custom2 = new JSONObject().put("name", "custom2").put("url", "https://example.invalid/b/").put("resuCount", 77).toString();
        mixed.put(previous.getString(0)).put(custom1).put(previous.getString(1)).put(previous.getString(2))
                .put(custom2).put(previous.getString(3)).put(previous.getString(4)).put(previous.getString(5));
        String mixedResult = FutatabiProvider.completeBoards(PREFIX + mixed.toString(), false);
        JSONArray sorted = list(mixedResult);
        check(custom1.equals(sorted.getString(1)) && custom2.equals(sorted.getString(4)), "custom slots unchanged");
        int known = 0;
        for (int i = 0; i < sorted.length(); i++) {
            if (i == 1 || i == 4) continue;
            check(expected[known++].equals(new JSONObject(sorted.getString(i)).getString("url")), "known relative order");
        }
        java.util.List<String> before = new java.util.ArrayList<>(), after = new java.util.ArrayList<>();
        for (int i = 0; i < mixed.length(); i++) {before.add(mixed.getString(i));after.add(sorted.getString(i));}
        java.util.Collections.sort(before);java.util.Collections.sort(after);
        check(before.equals(after), "every record preserved");
        check(mixedResult.equals(FutatabiProvider.completeBoards(mixedResult, false)), "order idempotent");
        System.out.println("PASS F1 fresh/upgrade/custom slots, six known boards ordered, all records preserved");

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
        // Model whole-file replacement by the original restore, with the
        // extension's separate migration file intact.
        FutatabiProvider.registerBoards(restored);
        String mayRecord=new JSONObject(defaults.getString(0)).put("name","custom may").put("favorite",true).put("resuCount",41).toString();
        String imgRecord=new JSONObject(defaults.getString(1)).put("name","custom img").put("sureOpenCount",12).toString();
        JSONArray stockOnly=new JSONArray().put(imgRecord).put(custom1).put(mayRecord);
        String stockRaw=PREFIX+stockOnly.toString();
        prefs.edit().clear().putString("flutter.itaList",stockRaw).putLong("flutter.themeMode",2L).putString("flutter.unrelated","keep").commit();
        FutatabiProvider.registerBoards(restored);
        check(BridgePalette.repair(restored),"missing palette recovery");
        String fixed=prefs.getString("flutter.itaList","");
        JSONArray fixedList=list(fixed);
        check(fixedList.length()==7,"restore stock-only adds Jun and three external boards");
        check(mayRecord.equals(fixedList.getString(0))&&custom1.equals(fixedList.getString(1))&&imgRecord.equals(fixedList.getString(2)),"restored board records preserved");
        check(jun.equals(new JSONObject(fixedList.getString(3)).getString("url")),"restored Jun order");
        for(int i=3;i<expected.length;i++)
            check(expected[i].equals(new JSONObject(fixedList.getString(i+1)).getString("url")),"restored external order");
        check(prefs.getLong("flutter.themeMode",-1)==2L&&"keep".equals(prefs.getString("flutter.unrelated","")),"other settings unchanged");
        check(BridgePalette.LIGHT.equals(prefs.getString(BridgePalette.KEY,"")),"pre-restore palette recovered");
        FutatabiProvider.registerBoards(restored);
        check(fixed.equals(prefs.getString("flutter.itaList","")),"manual/cold start idempotent");
        // Legacy representation: feed the decoded list produced by stock
        // getAll, exactly as the new DEX hook will do.
        java.util.Map<String,Object> loaded=new java.util.HashMap<>();
        java.util.List<String> legacy=new java.util.ArrayList<>();
        for(int i=0;i<stockOnly.length();i++)legacy.add(stockOnly.getString(i));
        prefs.edit().putString("flutter.itaList",PREFIX.substring(0,PREFIX.length()-1)+"legacy-fixture").commit();
        loaded.put("flutter.itaList",legacy);
        loaded.put("flutter.unrelated","keep");
        FutatabiProvider.repairDecodedPreferences(prefs,loaded);
        check(fixed.equals(loaded.get("flutter.itaList"))&&fixed.equals(prefs.getString("flutter.itaList","")),"legacy decoded list persisted before Dart");
        FutatabiProvider.repairDecodedPreferences(prefs,loaded);
        check(fixed.equals(loaded.get("flutter.itaList")),"legacy idempotent");
        check("keep".equals(loaded.get("flutter.unrelated")),"unrelated loaded map untouched");
        loaded.put("flutter.itaList",java.util.Arrays.asList(123));
        FutatabiProvider.repairDecodedPreferences(prefs,loaded);
        check(fixed.equals(prefs.getString("flutter.itaList","")),"malformed legacy data not overwritten");
        prefs.edit().putString(BridgePalette.KEY,BridgePalette.DARK).commit();
        check(BridgePalette.repair(restored)&&BridgePalette.DARK.equals(BridgePalette.get(restored)),"explicit restored palette wins");
        prefs.edit().remove(BridgePalette.KEY).commit();
        check(BridgePalette.repair(restored)&&BridgePalette.DARK.equals(prefs.getString(BridgePalette.KEY,"")),"mirror follows restored choice");
        check(java.util.Arrays.equals(FutatabiProvider.externalBoardStatus(stockRaw),new boolean[]{false,false,false}),"manual status missing");
        check(java.util.Arrays.equals(FutatabiProvider.externalBoardStatus(fixed),new boolean[]{true,true,true}),"manual status registered");
        check(FutatabiProvider.externalBoardStatus("legacy")==null,"unknown format not misreported");
        System.out.println("PASS stock restore, legacy decoded restore, exact records, unrelated settings, idempotence, palette mirror precedence");
        System.out.println("PASS existing migration: same count, fields, other boards and order; fresh restore, palette in stock preference file, dark/light");
    }
}
