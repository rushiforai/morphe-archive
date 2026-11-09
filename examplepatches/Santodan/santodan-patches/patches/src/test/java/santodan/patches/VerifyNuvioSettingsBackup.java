package santodan.patches;

import java.io.IOException;
import java.util.*;
import org.json.*;
import software.santodan.extension.nuviomenu.PatchSettingsBackup;

/** Production codec/restore regression checks for the current beta.13 patch settings. */
public final class VerifyNuvioSettingsBackup {
    private static final String MERGED = "santodan_nuvio_merged_progress";
    private static final String STYLE = "santodan_nuvio_date_label_style";
    private static void check(boolean value) { if (!value) throw new AssertionError(); }
    private interface Action { void run() throws Exception; }
    private static void rejects(Action action) throws Exception {
        try { action.run(); } catch (IllegalArgumentException | JSONException expected) { return; }
        throw new AssertionError("Invalid backup accepted");
    }
    public static void main(String[] args) throws Exception {
        Map<String, Map<String, Object>> source = new LinkedHashMap<>();
        source.put(MERGED, new LinkedHashMap<>(Map.of("enabled", true, "strategy", "recent",
            "quick_startup_sync", false, "show_provider", true, "snapshot_v2_2_main", "TRAKT",
            "snapshot_v2_2_services", Set.of("TRAKT", "SIMKL"), "previous_source_2", "NUVIO_SYNC")));
        source.get(MERGED).put("snapshot_v2_2", "PRIVATE HISTORY MUST NOT EXPORT");
        source.get(MERGED).put("snapshot_v2_2_last_sync", "cached status");
        source.put(STYLE, Map.of("date_label_position", 8, "date_label_size_percent", 135,
            "date_label_foreground_color", 0xff1976d200000000L));
        source.put("santodan_nuvio_airing_series", Map.of("enabled", true, "finale_v1_show", 1234L));
        source.put("santodan_nuvio_remaining_episodes", Map.of("enabled", true, "count_show", 99));
        source.put("santodan_nuvio_finale_dates", Map.of("library", true, "collections", false, "only_airing", true));
        source.put("santodan_nuvio_movie_release_dates", Map.of("library", false, "collections", true));
        source.put("santodan_current_stream", Map.of("enabled", true));
        source.put("santodan_stream_preload", Map.of("continue_watching", true, "details", false, "next_episode", true));
        source.put("santodan_playback_buttons", Map.of("enabled", true, "order", "play,seek", "hidden", "", "more", "speed"));
        source.put("santodan_preferred_addon_2", Map.of("addon", "https://example.test/addon", "autoplay", true));
        source.put("santodan_preferred_addon_7", Map.of("addon", "", "autoplay", false));
        source.put("santodan_launcher_2", Map.of("selected", Set.of("library", "continue_watching"), "snapshot", "cache"));
        source.put("santodan_introdb", Map.of("enabled", true, "key", "test-key"));
        source.put("native_credentials", Map.of("token", "DO NOT EXPORT"));
        source.put("santodan_nuvio_merged_progress_local_2", Map.of("entry", "PRIVATE PLAYBACK"));
        String encoded = PatchSettingsBackup.encode(source);
        check(!encoded.contains("PRIVATE") && !encoded.contains("DO NOT EXPORT") && !encoded.contains("last_sync"));
        Map<String, Map<String, Object>> decoded = PatchSettingsBackup.decode(encoded);
        check(decoded.size() == 13);
        check(decoded.get(STYLE).get("date_label_foreground_color").equals(0xff1976d200000000L));
        check(decoded.get(MERGED).get("snapshot_v2_2_services").equals(Set.of("TRAKT", "SIMKL")));
        check(decoded.get("santodan_preferred_addon_7").get("autoplay").equals(false));
        check(decoded.equals(PatchSettingsBackup.decode(PatchSettingsBackup.encode(decoded))));
        check(PatchSettingsBackup.decode(PatchSettingsBackup.encode(Map.of("santodan_current_stream", Map.of())))
            .get("santodan_current_stream").isEmpty());
        System.out.println("PASS: all setting groups, multiple profiles, exact packed colors, defaults and sets round-trip; caches/accounts excluded");

        rejects(() -> PatchSettingsBackup.decode("{}"));
        rejects(() -> PatchSettingsBackup.decode("broken"));
        rejects(() -> PatchSettingsBackup.decode(new JSONObject(encoded).put("version", 2).toString()));
        rejects(() -> PatchSettingsBackup.decode(new JSONObject(encoded).put("format", "another-app").toString()));
        rejects(() -> PatchSettingsBackup.decode(" ".repeat(PatchSettingsBackup.MAX_BYTES + 1)));
        JSONObject bad = new JSONObject(encoded);
        bad.getJSONObject("stores").getJSONObject(MERGED).put("snapshot_v2_2", new JSONObject().put("type", "string").put("value", "history"));
        rejects(() -> PatchSettingsBackup.decode(bad.toString()));
        JSONObject wrong = new JSONObject(encoded);
        wrong.getJSONObject("stores").getJSONObject(MERGED).getJSONObject("enabled").put("value", "true");
        rejects(() -> PatchSettingsBackup.decode(wrong.toString()));
        JSONObject unknown = new JSONObject(encoded);
        unknown.getJSONObject("stores").put("../../native_credentials", new JSONObject());
        rejects(() -> PatchSettingsBackup.decode(unknown.toString()));
        JSONObject provider = new JSONObject(encoded);
        provider.getJSONObject("stores").getJSONObject(MERGED).getJSONObject("snapshot_v2_2_main").put("value", "INVALID");
        rejects(() -> PatchSettingsBackup.decode(provider.toString()));
        System.out.println("PASS: malformed, oversized, wrong-version, unknown-key/scope, invalid type and provider files rejected before restore");

        class Memory implements PatchSettingsBackup.Store {
            Map<String, Map<String, Object>> values = new LinkedHashMap<>();
            int writes, failAt = -1;
            public Map<String, Map<String, Object>> read() {
                Map<String, Map<String, Object>> copy = new LinkedHashMap<>();
                values.forEach((scope, entries) -> copy.put(scope, new LinkedHashMap<>(entries)));
                return copy;
            }
            public void replace(String scope, Map<String, Object> entries) throws IOException {
                values.put(scope, new LinkedHashMap<>(entries));
                if (++writes == failAt) throw new IOException("Simulated failed commit");
            }
        }
        Memory memory = new Memory();
        memory.values.put(MERGED, new LinkedHashMap<>(Map.of("enabled", false)));
        memory.values.put("unrelated", new LinkedHashMap<>(Map.of("keep", true)));
        PatchSettingsBackup.restore(memory, decoded);
        check(memory.values.get(MERGED).equals(decoded.get(MERGED)));
        check(memory.values.get("unrelated").equals(Map.of("keep", true)));
        PatchSettingsBackup.restore(memory, Map.of(MERGED, Map.of()));
        check(memory.values.get(MERGED).isEmpty());
        Map<String, Map<String, Object>> before = memory.read();
        memory.failAt = memory.writes + 2;
        try { PatchSettingsBackup.restore(memory, decoded); throw new AssertionError(); }
        catch (IOException expected) { check(expected.getMessage().equals("Simulated failed commit")); }
        check(memory.values.equals(before));
        System.out.println("PASS: confirmed restore replaces included settings, restores defaults, preserves unrelated groups and rolls back partial commit failure");
    }
}
