package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.assertEquals;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.os.LocaleList;

import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.io.File;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Locale;

/**
 * The text of the token cost audit, for states that reach every line of it, in the raw (export) form and in three
 * interface languages. The raw export has one oracle per state and must be locale-independent.
 * -Pgolden.write=<review-file> writes a proposed fixture and deliberately fails; review it before replacing expectations.
 */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class TokenCostAuditGoldenTest {
    private static final String GOLDEN = "golden/token-cost-audit.txt";

    private static final String[] COUNTERS = {
        "accepted_caption_units", "attempts", "background_alt_armed", "background_page_fallback_events",
        "blocks_completed", "cache_hit_tokens", "cache_miss_tokens", "cancelled_failures", "committed_atoms",
        "completion_tokens", "cost_nano_cny", "display_local_inconclusive", "display_local_success",
        "display_local_whole_sentence", "failures", "focus_miss_results", "http_429_failures", "http_4xx_failures",
        "http_5xx_failures", "http_ok", "http_other_failures", "internal_retries", "local_deferrals",
        "logical_requests", "network_failures", "other_failures", "priced_responses", "prompt_tokens",
        "quality_rejected_units", "rejected_caption_units", "request_bytes", "responses_without_usage",
        "semantic_core_atoms", "semantic_outside_atoms", "semantic_window_atoms", "sunk_prompt_bytes",
        "sunk_prompts", "timeout_failures", "total_tokens", "unit_cache_hit_units", "unit_cache_lookups",
        "unit_cache_miss_units", "unit_context_chars", "unit_context_units", "unit_target_chars",
        "unit_target_units", "usage_responses", "viewed_ms", "viewed_ms_event_rebuild_r2",
        "viewed_ms_semantic_ledger_v2", "viewed_ms_contextual_unit_v1",
    };
    private static final String[] BUCKETS = {
        "all", "priority", "priority_current", "priority_gap_rescue", "background", "background_page",
        "background_block", "background_alt", "unit_realtime", "unit_background", "core_semantic_ledger_v2",
        "core_contextual_unit_v1", "core_event_rebuild_r2", "display",
    };

    /** A state in which every counter is [value(index)]; [pricedFewer] makes priced responses fewer than used. */
    private static JSONObject state(java.util.function.IntUnaryOperator value, boolean pricedFewer) throws Exception {
        JSONObject counters = new JSONObject();
        for (int i = 0; i < COUNTERS.length; i++) counters.put(COUNTERS[i], (long) value.applyAsInt(i));
        if (pricedFewer) counters.put("priced_responses", 1).put("usage_responses", 3);
        JSONObject buckets = new JSONObject();
        for (String bucket : BUCKETS) buckets.put(bucket, new JSONObject(counters.toString()));
        JSONObject session = new JSONObject(counters.toString())
                .put("model", "model-x")
                .put("active_core", "event_rebuild_r2")
                .put("generation", 1)
                .put("video_id", "abc")
                .put("metrics", new JSONObject(counters.toString()))
                .put("buckets", buckets);
        return new JSONObject(counters.toString())
                .put("version", 1)
                .put("metrics", new JSONObject(counters.toString()))
                .put("buckets", buckets)
                .put("session", session);
    }

    /** The audit keeps its state in memory after the first read; the test sets the state through the preferences. */
    private static void forgetMemory() {
        try {
            java.lang.reflect.Field memory = TokenCostAudit.class.getDeclaredField("memoryState");
            memory.setAccessible(true);
            memory.set(null, null);
        } catch (ReflectiveOperationException e) {
            throw new AssertionError(e);
        }
    }

    private static Context installState(Activity activity, String tag, JSONObject state) {
        Configuration configuration = new Configuration(activity.getResources().getConfiguration());
        configuration.setLocales(new LocaleList(Locale.forLanguageTag(tag)));
        Context context = activity.createConfigurationContext(configuration);
        activity.getSharedPreferences("deepseek_caption_token_cost_audit", 0)
                .edit().putString("state_v1", state.toString()).commit();
        forgetMemory();
        TokenCostAudit.install(context);
        return context;
    }

    @Test
    public void everyLineOfTheAuditKeepsItsText() throws Exception {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        StringBuilder all = new StringBuilder();
        JSONObject[] states = {
            state(i -> 1_000 + i * 37, true),
            state(i -> 1, false),
            state(i -> i % 7 == 0 ? 5_000 + i : 0, false),
            state(i -> 50_000 + i * 1_234, false),
        };
        try {
            for (int variant = 0; variant < states.length; variant++) {
                all.append("## variant ").append(variant).append('\n');
                String raw = null;
                for (String tag : new String[] {"en", "zh-CN", "ar"}) {
                    Context context = installState(activity, tag, states[variant]);
                    all.append('[').append(tag).append("]\n").append(TokenCostAudit.uiText(context, true)).append('\n');
                    String current = TokenCostAudit.uiText(context, false);
                    if (raw == null) raw = current;
                    else assertEquals("raw export must not inherit " + tag, raw, current);
                }
                all.append("[raw]\n").append(raw).append('\n');
            }
        } finally {
            activity.finish();
        }
        String actual = all.toString();
        if (System.getProperty("golden.write") != null) {
            File out = new File(System.getProperty("golden.write"));
            out.getParentFile().mkdirs();
            Files.write(out.toPath(), actual.getBytes(StandardCharsets.UTF_8));
            org.junit.Assert.fail("Proposed golden written for review; regeneration is not a passing check");
        }
        try (InputStream in = getClass().getClassLoader().getResourceAsStream(GOLDEN)) {
            String expected = new String(in.readAllBytes(), StandardCharsets.UTF_8);
            assertEquals(expected, actual);
        }
    }
}
