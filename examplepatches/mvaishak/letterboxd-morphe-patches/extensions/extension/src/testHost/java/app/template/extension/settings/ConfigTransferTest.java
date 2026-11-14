package app.template.extension.settings;

import android.content.ContextWrapper;
import android.content.SharedPreferences;

import app.template.extension.artwork.ArtworkStore;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;

public final class ConfigTransferTest {
    private static final String HTTPS = "https://example.com/artwork.jpg";

    public static void main(String[] args) throws Exception {
        TestContext source = new TestContext();
        source.store(Prefs.NAME).put(Prefs.KEY_IMDB_TRIVIA, false);
        source.store(Prefs.NAME).put("tmdb_api_key", "example-secret");
        source.store("morphe_custom_artwork").put("film:1",
                new JSONObject().put("poster", HTTPS).put("backdrop", HTTPS).toString());
        source.store("morphe_custom_artwork").put("profile:alice", HTTPS);
        source.store("morphe_custom_artwork").put("profile:bob", HTTPS);
        String exported = ConfigTransfer.export(source);
        require(!exported.contains("example-secret"), "credential omitted");

        TestContext target = new TestContext();
        Map<String, Object> artwork = target.store("morphe_custom_artwork");
        artwork.put("film:1", new JSONObject().put("poster", "https://example.com/current.jpg").toString());
        artwork.put("film:other", new JSONObject().put("backdrop", HTTPS).toString());
        ConfigTransfer.ImportResult result = ConfigTransfer.importJson(target, exported);
        require(result.settings == 1 && result.artwork.imported == 3 && result.artwork.occupied == 1,
                "merged three empty slots and preserved one occupied slot");
        require(artwork.get("film:1").toString().contains("current.jpg"), "existing poster preserved");
        require(artwork.containsKey("film:other"), "unrelated artwork preserved");
        require(HTTPS.equals(artwork.get("profile:alice")) && HTTPS.equals(artwork.get("profile:bob")),
                "all profiles retained by member");

        String legacy = new JSONObject().put("format", 1).put("app", "letterboxd-morphe-patches")
                .put("settings", new JSONObject().put(Prefs.KEY_IMDB_TRIVIA, true)
                        .put(Prefs.KEY_ARTWORK_MODE, new JSONArray()).put("tmdb_api_key", "ignored")).toString();
        result = ConfigTransfer.importJson(target, legacy);
        require(result.settings == 1 && result.skippedSettings == 1, "legacy settings and type validation");
        require(artwork.size() == 4, "legacy import preserved artwork");
        require(!target.store(Prefs.NAME).containsKey("tmdb_api_key"), "import only allows known settings");

        JSONObject both = ConfigTransfer.readBackup(exported);
        for (boolean settingsOnly : new boolean[]{true, false}) {
            TestContext selected = new TestContext();
            result = ConfigTransfer.importJson(selected, both, settingsOnly, !settingsOnly);
            require(result.settings == (settingsOnly ? 1 : 0), "selected settings only");
            require(result.artwork.imported == (settingsOnly ? 0 : 4), "selected artwork only");

            JSONObject partial = ConfigTransfer.readBackup(
                    ConfigTransfer.export(source, settingsOnly, !settingsOnly));
            require(partial.has("settings") == settingsOnly && partial.has("artwork") != settingsOnly,
                    "export includes only the selected section");
            ConfigTransfer.importJson(new TestContext(), partial, true, true);
        }

        both.put("format", 2);
        result = ConfigTransfer.importJson(new TestContext(), both.toString());
        require(result.settings == 1 && result.artwork.imported == 4, "version 2 backup still restores");

        JSONObject corrupt = new JSONObject(exported);
        corrupt.getJSONObject("artwork").getJSONArray("films")
                .put(new JSONObject().put("id", "2").put("poster", "file:///not-an-image"));
        try {
            ConfigTransfer.importJson(target, corrupt.toString());
            throw new AssertionError("invalid URL accepted");
        } catch (JSONException expected) {
            require(!artwork.containsKey("film:2"), "invalid artwork skipped before commit");
            require(Boolean.TRUE.equals(target.store(Prefs.NAME).get(Prefs.KEY_IMDB_TRIVIA)),
                    "malformed artwork rejected before settings commit");
        }

        source.store(Prefs.NAME).put(Prefs.KEY_IMDB_TRIVIA, "bad type");
        try {
            ConfigTransfer.export(source);
            throw new AssertionError("corrupt settings returned a backup");
        } catch (JSONException expected) {
            require(expected.getMessage().contains(Prefs.KEY_IMDB_TRIVIA), "export reports the failed preference");
        }

        target.store(Prefs.NAME).put("welcome_build", "11");
        require(ConfigTransfer.resetSettings(target), "settings reset committed");
        require(!target.store(Prefs.NAME).containsKey(Prefs.KEY_IMDB_TRIVIA), "preference reset");
        require("11".equals(target.store(Prefs.NAME).get("welcome_build")), "welcome state preserved");
        require(artwork.size() == 4, "settings reset preserved artwork");
        target.store("native_test").put("session", "signed-in");
        require(new ArtworkStore(target).reset(), "artwork reset committed");
        require(artwork.isEmpty(), "artwork reset cleared all accounts");
        require("signed-in".equals(target.store("native_test").get("session")), "native store preserved");
        System.out.println("Backup and settings reset cases passed");
    }

    private static void require(boolean condition, String description) {
        if (!condition) throw new AssertionError(description);
    }

    private static final class TestContext extends ContextWrapper {
        private final Map<String, Map<String, Object>> stores = new HashMap<>();

        TestContext() {
            super(null);
        }

        Map<String, Object> store(String name) {
            return stores.computeIfAbsent(name, key -> new HashMap<>());
        }

        @Override public SharedPreferences getSharedPreferences(String name, int mode) {
            Map<String, Object> values = store(name);
            return (SharedPreferences) Proxy.newProxyInstance(getClass().getClassLoader(),
                    new Class<?>[]{SharedPreferences.class}, (proxy, method, arguments) -> {
                switch (method.getName()) {
                    case "getAll": return new HashMap<>(values);
                    case "contains": return values.containsKey(arguments[0]);
                    case "getString": return values.getOrDefault(arguments[0], arguments[1]);
                    case "edit": return editor(values);
                    default: throw new AssertionError(method.getName());
                }
            });
        }

        private SharedPreferences.Editor editor(Map<String, Object> values) {
            Map<String, Object> changes = new HashMap<>();
            boolean[] clear = {false};
            return (SharedPreferences.Editor) Proxy.newProxyInstance(getClass().getClassLoader(),
                    new Class<?>[]{SharedPreferences.Editor.class}, (proxy, method, arguments) -> {
                switch (method.getName()) {
                    case "putString":
                    case "putBoolean":
                        changes.put((String) arguments[0], arguments[1]);
                        return proxy;
                    case "remove":
                        changes.put((String) arguments[0], null);
                        return proxy;
                    case "clear":
                        clear[0] = true;
                        return proxy;
                    case "commit":
                        if (clear[0]) values.clear();
                        for (Map.Entry<String, Object> entry : changes.entrySet()) {
                            if (entry.getValue() == null) values.remove(entry.getKey());
                            else values.put(entry.getKey(), entry.getValue());
                        }
                        return true;
                    default: throw new AssertionError(method.getName());
                }
            });
        }
    }
}
