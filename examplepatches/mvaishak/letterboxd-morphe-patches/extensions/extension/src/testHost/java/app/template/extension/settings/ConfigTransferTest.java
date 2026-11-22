package app.template.extension.settings;

import android.content.ContextWrapper;
import android.content.SharedPreferences;

import app.template.extension.artwork.ArtworkStore;
import app.template.extension.artwork.ProfileBackdrop.Schedule;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.time.LocalDate;

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
        source.store("morphe_where_to_watch").put("region", "GB");
        source.store("morphe_where_to_watch").put("services_GB", Set.of("8", "15"));
        source.store("morphe_where_to_watch").put("services_US", Set.of("2"));
        source.store("morphe_streaming_alerts").put("film1", streaming("Streaming film"));
        source.store("morphe_film_release_alerts").put(
                releaseKey("film2", LocalDate.now().plusDays(5)), release(LocalDate.now().plusDays(5)));
        source.store("morphe_film_release_alerts").put(
                releaseKey("old", LocalDate.now().minusDays(1)), release(LocalDate.now().minusDays(1)));
        String exported = ConfigTransfer.export(source);
        require(!exported.contains("example-secret"), "credential omitted");
        require(!exported.contains("source-token"), "device-specific alert token omitted");

        TestContext target = new TestContext();
        Map<String, Object> artwork = target.store("morphe_custom_artwork");
        artwork.put("film:1", new JSONObject().put("poster", "https://example.com/current.jpg").toString());
        artwork.put("film:other", new JSONObject().put("backdrop", HTTPS).toString());
        target.store("morphe_where_to_watch").put("services_CA", Set.of("20"));
        target.store("morphe_streaming_alerts").put("existing", streaming("Keep this streaming alert"));
        ConfigTransfer.ImportResult result = ConfigTransfer.importJson(target, exported);
        require(result.settings == 1 && result.artwork.imported == 3 && result.artwork.occupied == 1,
                "merged three empty slots and preserved one occupied slot");
        require(artwork.get("film:1").toString().contains("current.jpg"), "existing poster preserved");
        require(artwork.containsKey("film:other"), "unrelated artwork preserved");
        require(HTTPS.equals(artwork.get("profile:alice")) && HTTPS.equals(artwork.get("profile:bob")),
                "all profiles retained by member");
        require(result.streamingServices == 3 && result.streamingAlerts == 1 && result.releaseAlerts == 1,
                "streaming selections and pending alerts restored");
        require("GB".equals(target.store("morphe_where_to_watch").get("region"))
                && Set.of("2").equals(target.store("morphe_where_to_watch").get("services_US"))
                && !target.store("morphe_where_to_watch").containsKey("services_CA"), "exact service selection");
        require(target.store("morphe_streaming_alerts").size() == 2
                && target.store("morphe_film_release_alerts").size() == 1, "pending alerts merged");
        result = ConfigTransfer.importJson(target, exported);
        require(result.streamingAlerts == 0 && result.releaseAlerts == 0, "re-import adds no duplicates");

        String legacy = new JSONObject().put("format", 1).put("app", "letterboxd-morphe-patches")
                .put("settings", new JSONObject().put(Prefs.KEY_IMDB_TRIVIA, true)
                        .put(Prefs.KEY_ARTWORK_MODE, new JSONArray()).put("tmdb_api_key", "ignored")).toString();
        result = ConfigTransfer.importJson(target, legacy);
        require(result.settings == 1 && result.skippedSettings == 1, "legacy settings and type validation");
        require(artwork.size() == 4, "legacy import preserved artwork");
        require(!target.store(Prefs.NAME).containsKey("tmdb_api_key"), "import only allows known settings");
        require(target.store("morphe_streaming_alerts").size() == 2
                && Set.of("8", "15").equals(target.store("morphe_where_to_watch").get("services_GB")),
                "older backup preserves streaming sections");

        JSONObject both = ConfigTransfer.readBackup(exported);
        for (boolean settingsOnly : new boolean[]{true, false}) {
            TestContext selected = new TestContext();
            int section = settingsOnly ? ConfigTransfer.SETTINGS : ConfigTransfer.ARTWORK;
            result = ConfigTransfer.importJson(selected, both, section);
            require(result.settings == (settingsOnly ? 1 : 0), "selected settings only");
            require(result.artwork.imported == (settingsOnly ? 0 : 4), "selected artwork only");

            JSONObject partial = ConfigTransfer.readBackup(
                    ConfigTransfer.export(source, section));
            require(partial.has("settings") == settingsOnly && partial.has("artwork") != settingsOnly,
                    "export includes only the selected section");
            ConfigTransfer.importJson(new TestContext(), partial, ConfigTransfer.ALL);
        }

        for (int section : new int[]{ConfigTransfer.ALERTS, ConfigTransfer.STREAMING}) {
            TestContext selected = new TestContext();
            String partial = ConfigTransfer.export(source, section);
            require(ConfigTransfer.sections(ConfigTransfer.readBackup(partial)) == section,
                    "export includes only the selected viewing section");
            result = ConfigTransfer.importJson(selected, partial);
            require(result.streamingAlerts == (section == ConfigTransfer.ALERTS ? 1 : 0)
                    && result.releaseAlerts == (section == ConfigTransfer.ALERTS ? 1 : 0),
                    "alert-only selection");
            require(result.streamingServices == (section == ConfigTransfer.STREAMING ? 3 : -1),
                    "service-only selection");
        }

        JSONObject artworkV3 = ConfigTransfer.readBackup(ConfigTransfer.export(source, ConfigTransfer.ARTWORK));
        artworkV3.put("format", 3);
        require(ConfigTransfer.importJson(new TestContext(), artworkV3.toString()).artwork.imported == 4,
                "artwork-only version 3 restores");

        JSONObject invalidAlerts = ConfigTransfer.readBackup(exported);
        invalidAlerts.getJSONObject("alerts").getJSONObject("streaming").getJSONObject("film1")
                .getJSONObject("known").put("GB", new JSONArray().put(false));
        TestContext untouched = new TestContext();
        untouched.store("morphe_where_to_watch").put("region", "CA");
        try {
            ConfigTransfer.importJson(untouched, invalidAlerts.toString());
            throw new AssertionError("invalid service baseline accepted");
        } catch (JSONException expected) {
            require(untouched.store(Prefs.NAME).isEmpty(), "invalid alert rejected before settings restore");
            require("CA".equals(untouched.store("morphe_where_to_watch").get("region")),
                    "invalid alert rejected before streaming preferences restore");
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
        verifyProfileRotationBackup();
        System.out.println("Backup and settings reset cases passed");
    }

    private static void verifyProfileRotationBackup() throws Exception {
        String second = "https://example.com/second.jpg";
        long today = LocalDate.now().toEpochDay();
        for (Schedule schedule : Schedule.values()) {
            TestContext source = new TestContext();
            source.store("morphe_custom_artwork").put("profile:alice", new JSONObject()
                    .put("schedule", schedule.name()).put("images", new JSONArray().put(HTTPS).put(second))
                    .put("startDay", today - 1).put("position", 1).toString());
            String backup = ConfigTransfer.export(source, ConfigTransfer.ARTWORK);
            JSONObject profile = new JSONObject(backup).getJSONObject("artwork")
                    .getJSONArray("profiles").getJSONObject(0);
            require(HTTPS.equals(profile.getString("backdrop")), "older imports can use the first image");
            require(!profile.getJSONObject("rotation").has("position"), "per-device cursor is omitted");

            TestContext target = new TestContext();
            require(ConfigTransfer.importJson(target, backup).artwork.imported == 1, "rotation restored");
            ArtworkStore artwork = new ArtworkStore(target);
            require(artwork.profileChoice("alice").schedule == schedule, "schedule round trips");
            require(artwork.profileChoice("alice").images.equals(List.of(HTTPS, second)), "image order round trips");
            require((schedule == Schedule.DAILY ? second : HTTPS).equals(artwork.profile("alice")),
                    "daily keeps its start date and on-open restarts at the first image");
            require(ConfigTransfer.importJson(target, backup).artwork.occupied == 1, "rotation slot occupied");
        }
    }

    private static String streaming(String title) throws JSONException {
        return new JSONObject().put("title", title).put("year", 2000)
                .put("known", new JSONObject().put("GB", new JSONArray().put(8)))
                .put("token", "source-token").toString();
    }

    private static String releaseKey(String film, LocalDate date) {
        return film + "\n" + date + "\nDigital\nGB\n";
    }

    private static String release(LocalDate date) throws JSONException {
        return new JSONObject().put("date", date.toString()).put("type", "Digital")
                .put("label", "Digital").put("countryCode", "GB").put("country", "United Kingdom")
                .put("note", "").put("title", "Release film").put("url", "https://boxd.it/example").toString();
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
                    case "getStringSet": return values.getOrDefault(arguments[0], arguments[1]);
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
                    case "putStringSet":
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
