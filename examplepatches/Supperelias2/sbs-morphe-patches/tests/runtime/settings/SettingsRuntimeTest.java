import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import dev.supperelias2.sbs.morphe.MorpheSettings;
import dev.supperelias2.sbs.morphe.features.GeneralHooks;

/** Semantic checks of actual runtime sources; no Activity or GUI is launched. */
public final class SettingsRuntimeTest {
    private static int assertions;

    private static final class FakeContext extends ContextWrapper {
        private final Map<String, InMemoryPreferences> stores = new HashMap<>();
        private int lastMode = -1;
        FakeContext() { super(null); }
        @Override public Context getApplicationContext() { return this; }
        @Override public SharedPreferences getSharedPreferences(String name, int mode) {
            lastMode = mode;
            return stores.computeIfAbsent(name, ignored -> new InMemoryPreferences());
        }
    }

    private static void eq(String reason, Object expected, Object actual) {
        assertions++;
        if (expected == null ? actual != null : !expected.equals(actual)) {
            throw new AssertionError(reason + ": expected " + expected + ", got " + actual);
        }
    }

    private static void defaultsAndStorage() {
        eq("uninitialized context", null, MorpheSettings.getContext());
        eq("uninitialized VOD ads default", true, GeneralHooks.removeVodAds());
        eq("uninitialized live ads default", true, GeneralHooks.removeLiveAds());
        eq("uninitialized skip fix default", true, MorpheSettings.enabled("fix_skip", true));
        eq("uninitialized telemetry default", false, GeneralHooks.reduceTelemetry());
        MorpheSettings.saveBoolean("before_initialization", true);

        FakeContext context = new FakeContext();
        MorpheSettings.initialize(context);
        eq("initialized application context", context, MorpheSettings.getContext());
        eq("pre-initialization save does not persist", false, MorpheSettings.enabled("before_initialization", false));
        eq("private preference mode", Context.MODE_PRIVATE, context.lastMode);
        eq("one named settings store", 1, context.stores.size());
        MorpheSettings.initialize(null);
        eq("null initialization retains context", context, MorpheSettings.getContext());

        eq("VOD ads on by default", true, GeneralHooks.removeVodAds());
        eq("live ads on by default", true, GeneralHooks.removeLiveAds());
        eq("skip fix on by default", true, MorpheSettings.enabled("fix_skip", true));
        MorpheSettings.saveBoolean("remove_vod_ads", false);
        MorpheSettings.saveBoolean("remove_live_ads", false);
        MorpheSettings.saveBoolean("fix_skip", false);
        eq("VOD ads saved toggle", false, GeneralHooks.removeVodAds());
        eq("live ads saved toggle", false, GeneralHooks.removeLiveAds());
        eq("skip fix saved toggle", false, MorpheSettings.enabled("fix_skip", true));

        MorpheSettings.saveBoolean("bool_key", true);
        MorpheSettings.saveInt("int_key", 17);
        MorpheSettings.saveFloat("float_key", 1.25f);
        MorpheSettings.saveString("string_key", "remember");
        eq("boolean persists", true, MorpheSettings.enabled("bool_key", false));
        eq("integer persists", 17, MorpheSettings.getInt("int_key", 0));
        eq("float persists", 1.25f, MorpheSettings.getFloat("float_key", 0f));
        eq("string persists", "remember", MorpheSettings.getString("string_key", "fallback"));
        MorpheSettings.saveInt("int_key", 19);
        eq("updating integer retains boolean", true, MorpheSettings.enabled("bool_key", false));
        eq("updating integer retains float", 1.25f, MorpheSettings.getFloat("float_key", 0f));
        eq("integer updates", 19, MorpheSettings.getInt("int_key", 0));
        eq("wrong boolean type safely falls back", false, MorpheSettings.enabled("int_key", false));
        eq("wrong integer type safely falls back", 23, MorpheSettings.getInt("bool_key", 23));
        eq("wrong float type safely falls back", .75f, MorpheSettings.getFloat("string_key", .75f));
        eq("wrong string type safely falls back", "fallback", MorpheSettings.getString("float_key", "fallback"));
    }

    private static void registrationAndPreset() {
        eq("registry initially empty", Set.of(), MorpheSettings.getRegisteredFeatures());
        MorpheSettings.register(null);
        MorpheSettings.register("");
        eq("null and empty keys ignored", Set.of(), MorpheSettings.getRegisteredFeatures());
        for (String key : Arrays.asList("fix_skip", "auto_skip_intro", "next_episode_countdown", "binge_profile")) {
            MorpheSettings.register(key);
        }
        MorpheSettings.register("fix_skip");
        Set<String> installed = new HashSet<>(Arrays.asList("fix_skip", "auto_skip_intro", "next_episode_countdown", "binge_profile"));
        eq("only selected feature keys registered", installed, MorpheSettings.getRegisteredFeatures());
        eq("absent feature stays absent", false, MorpheSettings.isRegistered("auto_skip_recap"));
        Set<String> snapshot = MorpheSettings.getRegisteredFeatures();
        boolean immutable = false;
        try { snapshot.add("unexpected"); } catch (UnsupportedOperationException expected) { immutable = true; }
        eq("installed feature snapshot immutable", true, immutable);
        MorpheSettings.register("remove_live_ads");
        eq("earlier installed snapshot stable", installed, snapshot);
        installed.add("remove_live_ads");
        eq("later registration retained", installed, MorpheSettings.getRegisteredFeatures());

        MorpheSettings.resetDefaults();
        MorpheSettings.saveBoolean("external_player", true);
        MorpheSettings.applyBingePreset();
        eq("preset enables installed skip fix", true, MorpheSettings.enabled("fix_skip", false));
        eq("preset enables installed intro skipping", true, MorpheSettings.enabled("auto_skip_intro", false));
        eq("preset enables installed countdown", true, MorpheSettings.enabled("next_episode_countdown_enabled", false));
        eq("preset countdown three seconds", 3, GeneralHooks.nextEpisodeCountdown());
        eq("preset retains unrelated preference", true, MorpheSettings.enabled("external_player", false));
        eq("preset never writes missing recap feature", false, MorpheSettings.getPreferences().contains("auto_skip_recap"));
        eq("preset never writes missing inactivity feature", false, MorpheSettings.getPreferences().contains("disable_still_watching"));
        eq("preset only writes installed features", Set.of("fix_skip", "auto_skip_intro", "next_episode_countdown_enabled", "next_episode_delay_seconds", "external_player"), MorpheSettings.getPreferences().getAll().keySet());

        MorpheSettings.resetDefaults();
        eq("reset removes saved values", Map.of(), MorpheSettings.getPreferences().getAll());
        eq("reset retains installed feature registry", installed, MorpheSettings.getRegisteredFeatures());
        eq("reset restores VOD default", true, GeneralHooks.removeVodAds());
        eq("reset restores live default", true, GeneralHooks.removeLiveAds());
        eq("reset restores skip fix default", true, MorpheSettings.enabled("fix_skip", true));
        eq("reset restores intro experiment off", false, MorpheSettings.enabled("auto_skip_intro", false));
        eq("reset restores telemetry off", false, GeneralHooks.reduceTelemetry());
        eq("reset restores default countdown", 9, GeneralHooks.nextEpisodeCountdown());
    }

    private static void timeoutsAndTelemetry() {
        MorpheSettings.resetDefaults();
        MorpheSettings.saveInt("controls_timeout_seconds", 12);
        eq("disabled timeout preserves caller duration", 4_321L, GeneralHooks.controlsTimeout(4_321L));
        eq("disabled timeout preserves zero", 0L, GeneralHooks.controlsTimeout(0L));
        MorpheSettings.saveBoolean("controls_timeout_enabled", true);
        eq("enabled timeout converts seconds", 12_000L, GeneralHooks.controlsTimeout(4_321L));
        MorpheSettings.saveInt("controls_timeout_seconds", -5);
        eq("timeout lower clamp", 1_000L, GeneralHooks.controlsTimeout(4_321L));
        MorpheSettings.saveInt("controls_timeout_seconds", Integer.MAX_VALUE);
        eq("timeout upper clamp", 30_000L, GeneralHooks.controlsTimeout(4_321L));
        MorpheSettings.saveString("controls_timeout_seconds", "wrong type");
        eq("timeout wrong-type default", 3_000L, GeneralHooks.controlsTimeout(4_321L));
        MorpheSettings.saveBoolean("controls_timeout_enabled", false);
        eq("turning timeout off restores original", 4_321L, GeneralHooks.controlsTimeout(4_321L));

        MorpheSettings.saveInt("next_episode_delay_seconds", 25);
        eq("disabled countdown remains nine", 9, GeneralHooks.nextEpisodeCountdown());
        MorpheSettings.saveBoolean("next_episode_countdown_enabled", true);
        eq("enabled countdown selected duration", 25, GeneralHooks.nextEpisodeCountdown());
        MorpheSettings.saveInt("next_episode_delay_seconds", 0);
        eq("countdown lower clamp", 1, GeneralHooks.nextEpisodeCountdown());
        MorpheSettings.saveInt("next_episode_delay_seconds", Integer.MAX_VALUE);
        eq("countdown upper clamp", 60, GeneralHooks.nextEpisodeCountdown());
        MorpheSettings.saveString("next_episode_delay_seconds", "wrong type");
        eq("countdown wrong-type default", 9, GeneralHooks.nextEpisodeCountdown());
        MorpheSettings.saveBoolean("next_episode_countdown_enabled", false);
        eq("turning countdown off restores nine", 9, GeneralHooks.nextEpisodeCountdown());

        eq("telemetry off by default", false, GeneralHooks.reduceTelemetry());
        MorpheSettings.saveBoolean("minimal_telemetry", true);
        eq("telemetry enabled only explicitly", true, GeneralHooks.reduceTelemetry());
        MorpheSettings.saveBoolean("minimal_telemetry", false);
        eq("telemetry can be disabled again", false, GeneralHooks.reduceTelemetry());
        MorpheSettings.resetDefaults();
        eq("reset clears all runtime overrides", Map.of(), MorpheSettings.getPreferences().getAll());
    }

    public static void main(String[] args) {
        defaultsAndStorage();
        registrationAndPreset();
        timeoutsAndTelemetry();
        System.out.println("Settings runtime semantic checks passed: " + assertions + " assertions");
    }
}
