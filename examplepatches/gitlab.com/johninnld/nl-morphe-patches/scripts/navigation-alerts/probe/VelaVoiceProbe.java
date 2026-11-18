package nl.johninnl.warningprobe;

import android.app.Instrumentation;
import android.content.Context;
import android.os.Bundle;
import android.os.Looper;
import android.os.SystemClock;
import android.speech.tts.TextToSpeech;
import android.speech.tts.UtteranceProgressListener;
import android.speech.tts.Voice;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONArray;
import org.json.JSONObject;

/** Test-only instrumentation for the original Vela 0.5.2621 system voice path.
 * No compile-time Vela dependency, production scheduler, preferences or device volume changes.
 * Invoke from the instrumentation worker thread, with the original APK as the target.
 */
public final class VelaVoiceProbe {
    private static final String ORIGINAL_SHA256 =
            "f168bc730568b98ee8132131658d9220ef5be3557af41fd373bdaf104c31b20f";
    private final Instrumentation instrumentation;
    private final long originNanos = SystemClock.elapsedRealtimeNanos();
    private final ConcurrentHashMap<String, Observation> observations = new ConcurrentHashMap<>();
    private final List<JSONObject> events = new ArrayList<>();
    private Object guide;
    private Class<?> guideClass;
    private TextToSpeech engine;
    private UtteranceProgressListener nativeListener;
    private long timeoutMs;
    private Class<?> fenceClass;
    private boolean fenced;

    private VelaVoiceProbe(Instrumentation instrumentation) {
        this.instrumentation = instrumentation;
    }

    /** scenario: all (default), baseline, stop_during_lead, mute_during_lead, or fenced.
     * init_timeout_ms/case_timeout_ms: 1000..45000 (default 15000).
     */
    public static JSONObject run(Instrumentation probe, Bundle args) throws Exception {
        return new VelaVoiceProbe(probe).execute(args == null ? new Bundle() : args);
    }

    private JSONObject execute(Bundle args) throws Exception {
        JSONObject result = new JSONObject();
        JSONArray cases = new JSONArray();
        result.put("source", "original Vela wy4 / vy4 classes, disposable probe-owned guide");
        result.put("voice_original", true);
        result.put("voice_original_scope", "Native constructor, engine selection, speech dispatch and listener behavior; host must verify target artifact provenance");
        result.put("reference_original_sha256", ORIGINAL_SHA256);
        result.put("original_bytes_verified_by_probe", false);
        result.put("runtime_acceptance", "test-only system-TTS lifecycle evidence; production warning feature not assessed");
        result.put("audio_evidence", "TTS engine playback callbacks; acoustic output and car routing not measured");
        result.put("global_volume_or_preferences_modified", false);
        result.put("cases", cases);
        try {
            if (Looper.myLooper() == Looper.getMainLooper()) {
                throw new IllegalStateException("Call VelaVoiceProbe.run on the instrumentation worker thread, not main: initialization and callback waits must not block main");
            }
            String scenario = args.getString("scenario", "all");
            if (!scenario.equals("all") && !scenario.equals("baseline")
                    && !scenario.equals("stop_during_lead") && !scenario.equals("mute_during_lead") && !scenario.equals("fenced")) {
                throw new IllegalArgumentException("Unknown scenario: " + scenario
                        + "; use all, baseline, stop_during_lead, mute_during_lead or fenced");
            }
            fenced = scenario.equals("fenced");
            timeoutMs = boundedMillis(args, "case_timeout_ms", 15000);
            final Context context = instrumentation.getTargetContext();
            result.put("target_package", context.getPackageName());
            result.put("target_apk", context.getApplicationInfo().sourceDir);
            if (!"app.vela".equals(context.getPackageName())) {
                throw new IllegalStateException("Expected original app.vela target context, got " + context.getPackageName());
            }
            guideClass = Class.forName("wy4", true, context.getClassLoader());
            if (fenced) {
                try { fenceClass = Class.forName("nl.johninnl.warningprobe.TaggedSpeechFence", true, context.getClassLoader()); }
                catch (ClassNotFoundException missing) {
                    throw new IllegalStateException("scenario=fenced requires the private three-method original-artifact hook candidate and target-loader TaggedSpeechFence", missing);
                }
                result.put("source", "Original Vela system voice with PRIVATE TEST ONLY pn1 constructor/invoke and wy4.n fence hooks");
                result.put("voice_original", false);
                result.put("native_voice_implementation_original", true);
                result.put("voice_original_scope", "Native system engine/speak/listener behavior retained; original voice bytecode contains three private test hook edits");
                result.put("fence_before_initial_reset", fenceSnapshot());
                fence("reset", new Class<?>[0]);
                result.put("fence_after_initial_reset", fenceSnapshot());
            }
            final Constructor<?> guideConstructor = guideClass.getDeclaredConstructor(Context.class);
            guideConstructor.setAccessible(true);
            main(() -> {
                guide = guideConstructor.newInstance(context);
                event("guide_created", null, new JSONObject().put("owned", true));
                invoke("d", new Class<?>[]{String.class}, (Object) null);
                engine = (TextToSpeech) field("b");
                if (engine == null) throw new IllegalStateException("wy4.d(null) produced no system TextToSpeech instance");
                // d(null) installs vy4. Android has no public listener getter. Construct exactly
                // the same original listener ABI and forward every callback to it exactly once.
                Class<?> listenerClass = Class.forName("vy4", true, context.getClassLoader());
                Constructor<?> constructor = listenerClass.getDeclaredConstructor(guideClass);
                constructor.setAccessible(true);
                nativeListener = (UtteranceProgressListener) constructor.newInstance(guide);
                int installed = engine.setOnUtteranceProgressListener(new ForwardingListener());
                if (installed != TextToSpeech.SUCCESS) {
                    throw new IllegalStateException("Probe callback wrapper installation failed: " + installed);
                }
                event("listener_attached", null, new JSONObject()
                        .put("native_listener_class", nativeListener.getClass().getName())
                        .put("same_native_listener_object_as_d", false)
                        .put("reconstructed_original_vy4", true));
            });
            result.put("listener_preservation", "Wrapper forwards to a new original vy4(ownedGuide); installed listener object identity is not preserved; production hooks must preserve identity");
            final long initDeadline = SystemClock.elapsedRealtime() + boundedMillis(args, "init_timeout_ms", 15000);
            while (true) {
                JSONObject state = snapshot();
                if (state.optBoolean("system_init_failed")) {
                    throw new IllegalStateException("Original wy4 received TTS initialization failure; install/configure a working default system TTS engine in the disposable emulator. State: " + state);
                }
                if (state.optBoolean("system_initialized") && state.optBoolean("dispatch_initialized")) break;
                if (SystemClock.elapsedRealtime() >= initDeadline) {
                    throw new IllegalStateException("Timed out awaiting actual original wy4.onInit success, not merely e dispatch readiness. State: " + state);
                }
                SystemClock.sleep(25);
            }
            JSONObject ready = snapshot();
            result.put("readiness", ready);
            if (ready.optInt("native_language_availability", TextToSpeech.LANG_NOT_SUPPORTED) < 0) {
                throw new IllegalStateException("Default system TTS lacks Vela native language "
                        + ready.optString("native_language") + "; install voice data. State: " + ready);
            }
            result.put("scenario", scenario);
            // Establish real engine callbacks before testing warm dispatch or lead cancellation.
            Observation warmup = runCase("warmup", "Synthetic voice test. Warm up the original Vela voice.", null);
            cases.put(warmup.toJson());
            if (!warmup.completed()) {
                throw new IllegalStateException("Native warmup did not produce speech onStart followed by onDone; inspect warmup callbacks and installed voice data");
            }
            boolean fencedExpectations = warmup.completed();
            if (scenario.equals("all") || scenario.equals("baseline") || fenced) {
                Observation baseline = runCase("warm_baseline", "Synthetic voice test. Warm speech lifecycle.", null);
                cases.put(baseline.toJson());
                fencedExpectations &= baseline.completed();
            }
            if (scenario.equals("all") || scenario.equals("stop_during_lead") || fenced) {
                Observation stopped = runCase("stop_during_lead", "Synthetic voice test. Delayed speech after native stop.", "stop");
                cases.put(stopped.toJson());
                if (fenced) fencedExpectations &= stopped.fenceSuppressed() && stopped.fenceDelta("focus_release_successes") == 0
                        && stopped.fenceDelta("native_invalidations") == 1;
            }
            if (scenario.equals("all") || scenario.equals("mute_during_lead") || fenced) {
                Observation mute = runCase("mute_during_lead", "Synthetic voice test. Delayed speech after native mute.", "mute");
                cases.put(mute.toJson());
                if (fenced) fencedExpectations &= mute.fenceSuppressed() && mute.fenceDelta("focus_release_successes") == 0
                        && mute.fenceDelta("native_invalidations") == 1;
            }
            if (fenced) {
                Observation cancelled = runCase("source_cancel_during_lead", "Synthetic voice test. Pending external warning cancelled without native stop.", "source_cancel");
                cases.put(cancelled.toJson());
                fencedExpectations &= cancelled.fenceSuppressed() && cancelled.fenceDelta("focus_release_successes") == 1
                        && cancelled.fenceDelta("native_invalidations") == 0;
                Observation selective = runCase("selective_source_cancel", "Synthetic voice test. Selectively cancel only this external warning.", "source_cancel");
                cases.put(selective.toJson());
                fencedExpectations &= selective.fenceSuppressed() && selective.fenceDelta("focus_release_successes") == 1
                        && selective.fenceDelta("native_invalidations") == 0
                        && selective.retained != null && selective.retained.completed();
                result.put("fenced_suite_expectations_met", fencedExpectations);
                result.put("fence_suite_scope", "Synthetic system-TTS closure tests; untagged prompt retention is not real route regeneration or production coexistence acceptance");
                result.put("fence_before_owned_cleanup", fenceSnapshot());
            }
            result.put("probe_status", "observations_collected");
        } catch (Throwable failure) {
            result.put("probe_status", "failed");
            result.put("error", error(failure));
        } finally {
            try {
                if (guide != null) {
                    main(() -> {
                        // This handler/engine belong exclusively to this disposable guide.
                        // Remove delayed closures before shutting down so the test cannot speak later.
                        try { invoke("n", new Class<?>[0]); }
                        finally {
                            ((android.os.Handler) field("u")).removeCallbacksAndMessages(null);
                            if (engine != null) engine.shutdown();
                        }
                        event("owned_guide_shutdown", null, null);
                    });
                }
            } catch (Throwable cleanupFailure) {
                result.put("cleanup_error", error(cleanupFailure));
                result.put("probe_status", "failed");
            }
            if (fenceClass != null) {
                try {
                    result.put("fence_before_final_reset", fenceSnapshot());
                    fence("reset", new Class<?>[0]);
                    result.put("fence_after_final_reset", fenceSnapshot());
                } catch (Throwable resetFailure) {
                    result.put("fence_reset_error", error(resetFailure));
                    result.put("probe_status", "failed");
                }
            }
            synchronized (events) { result.put("events", new JSONArray(events)); }
            result.put("elapsed_ms", (SystemClock.elapsedRealtimeNanos() - originNanos) / 1000000.0);
        }
        return result;
    }

    private Observation runCase(String name, String phrase, String cancellation) throws Exception {
        final Observation observation = new Observation(name, phrase, cancellation);
        observations.put(observation.id, observation);
        observations.put("vela-lead-" + phrase.hashCode(), observation);
        main(() -> {
            invoke("n", new Class<?>[0]);
            ((android.os.Handler) field("u")).removeCallbacksAndMessages(null);
            invoke("i", new Class<?>[]{boolean.class}, false);
            observation.before = snapshotOnMain();
            if (fenced) observation.fenceBefore = fenceSnapshot();
            observation.dispatchNanos = SystemClock.elapsedRealtimeNanos();
            event("native_j_call", observation, new JSONObject()
                    .put("synthetic_phrase", phrase).put("interrupt", false).put("ignore_mute", false));
            if (fenced) fence("begin", new Class<?>[]{Object.class}, guide);
            try { invoke("j", new Class<?>[]{String.class, boolean.class, boolean.class}, phrase, false, false); }
            finally { if (fenced) fence("end", new Class<?>[0]); }
            event("native_j_return", observation, snapshotOnMain());
            // Same main-thread turn: native delayed 350ms closure cannot have run yet.
            if (cancellation != null) {
                observation.cancelNanos = SystemClock.elapsedRealtimeNanos();
                String eventPrefix = cancellation.equals("source_cancel") ? "fence_source_cancel" : "native_" + cancellation;
                event(eventPrefix + "_call", observation, null);
                if (cancellation.equals("mute")) invoke("i", new Class<?>[]{boolean.class}, true);
                else if (cancellation.equals("source_cancel")) fence("cancel", new Class<?>[]{Object.class}, guide);
                else invoke("n", new Class<?>[0]);
                observation.afterCancel = snapshotOnMain();
                event(eventPrefix + "_return", observation, observation.afterCancel);
                if (name.equals("selective_source_cancel")) {
                    Observation retained = new Observation("retained_untagged_synthetic_prompt",
                            "Synthetic native prompt test. This unrelated synthetic prompt must finish after only the external warning has been cancelled.", null);
                    observation.retained = retained;
                    retained.before = snapshotOnMain();
                    observations.put(retained.id, retained);
                    observations.put("vela-lead-" + retained.phrase.hashCode(), retained);
                    retained.dispatchNanos = SystemClock.elapsedRealtimeNanos();
                    event("untagged_native_j_call", retained, new JSONObject().put("synthetic_phrase", retained.phrase)
                            .put("actual_route_guidance", false).put("scope_begin_called", false));
                    // Deliberately outside begin/end: original same-guide native work must remain inert.
                    invoke("j", new Class<?>[]{String.class, boolean.class, boolean.class}, retained.phrase, false, false);
                    event("untagged_native_j_return", retained, snapshotOnMain());
                }
            }
        });
        if (fenced && cancellation != null) {
            // Observe the real 350ms closure gate for two seconds. Absence of a callback
            // is NOT a completion or a successful rejection unless helper counters prove it.
            long deadline = SystemClock.elapsedRealtime() + 2000;
            synchronized (observation) {
                while (SystemClock.elapsedRealtime() < deadline) {
                    observation.wait(Math.max(1, deadline - SystemClock.elapsedRealtime()));
                }
            }
            observation.noStartWindowElapsed = true;
            observation.fenceAfter = fenceSnapshot();
            observation.fenceWindowState = snapshot();
            event("fence_no_start_window_end", observation,
                    new JSONObject().put("fence", observation.fenceAfter).put("native_state", observation.fenceWindowState));
            if (observation.retained != null) {
                awaitTerminal(observation.retained, timeoutMs);
                observation.retained.after = snapshot();
            }
        } else {
            awaitTerminal(observation, timeoutMs);
            if (fenced) observation.fenceAfter = fenceSnapshot();
        }
        // A callback is recorded only after native forwarding; snapshot therefore includes
        // the native focus-release counter update, not just the observer notification.
        observation.after = snapshot();
        event("case_observation_end", observation, observation.after);
        main(() -> {
            invoke("n", new Class<?>[0]);
            ((android.os.Handler) field("u")).removeCallbacksAndMessages(null);
        });
        return observation;
    }

    private void awaitTerminal(Observation observation, long waitMs) throws InterruptedException {
        long deadline = SystemClock.elapsedRealtime() + waitMs;
        synchronized (observation) {
            while (!observation.terminal) {
                long remaining = deadline - SystemClock.elapsedRealtime();
                if (remaining <= 0) { observation.timedOut = true; break; }
                observation.wait(remaining);
            }
        }
    }

    private Object fence(String method, Class<?>[] types, Object... arguments) throws Exception {
        if (fenceClass == null) throw new IllegalStateException("Private TaggedSpeechFence not loaded for fenced scenario");
        try { return fenceClass.getDeclaredMethod(method, types).invoke(null, arguments); }
        catch (InvocationTargetException failure) { throw new Exception("Private TaggedSpeechFence." + method + " failed", failure.getCause()); }
    }

    private JSONObject fenceSnapshot() throws Exception {
        Object value = fence("snapshot", new Class<?>[0]);
        if (!(value instanceof Map)) throw new IllegalStateException("TaggedSpeechFence.snapshot ABI must return Map");
        return new JSONObject((Map<?, ?>) value);
    }

    private JSONObject snapshot() throws Exception {
        final JSONObject[] result = new JSONObject[1];
        main(() -> result[0] = snapshotOnMain());
        return result[0];
    }

    private JSONObject snapshotOnMain() throws Exception {
        JSONObject state = new JSONObject();
        state.put("system_initialized", field("h"));
        state.put("system_init_failed", field("i"));
        state.put("dispatch_initialized", field("e"));
        state.put("neural_selected", field("m"));
        state.put("muted", field("n"));
        state.put("alerts_only", field("o"));
        state.put("native_stop_opener_token", field("B"));
        state.put("selected_engine", nullable(field("f")));
        state.put("requested_engine", "system_default via original d(null)");
        state.put("native_last_system_language", nullable(field("j")));
        Object pending = field("g");
        state.put("pending_count", pending instanceof Collection ? ((Collection<?>) pending).size() : JSONObject.NULL);
        synchronized (field("r")) {
            state.put("native_focus_count", field("s"));
            state.put("native_focus_held_flag", field("t"));
        }
        state.put("focus_grant_verified", false);
        if (engine != null) {
            state.put("platform_default_engine", nullable(engine.getDefaultEngine()));
            state.put("bound_engine_service", "not independently observed; public API reports default only");
            state.put("engine_is_speaking", engine.isSpeaking());
            String language = (String) invoke("o", new Class<?>[0]);
            state.put("native_language", language);
            state.put("native_language_availability", engine.isLanguageAvailable(new Locale(language)));
            Voice voice = engine.getVoice();
            if (voice != null) state.put("platform_voice", voice.getName()).put("platform_voice_locale", voice.getLocale().toLanguageTag());
        }
        return state;
    }

    private final class ForwardingListener extends UtteranceProgressListener {
        @Override public void onStart(String id) { callback("onStart", id, null, () -> nativeListener.onStart(id)); }
        @Override public void onDone(String id) { callback("onDone", id, null, () -> nativeListener.onDone(id)); }
        @Override public void onError(String id) { callback("onError", id, null, () -> nativeListener.onError(id)); }
        @Override public void onError(String id, int code) {
            // Base two-argument implementation invokes native vy4's one-argument override once.
            callback("onError", id, detail("error_code", code), () -> nativeListener.onError(id, code));
        }
        @Override public void onStop(String id, boolean interrupted) {
            callback("onStop", id, detail("interrupted", interrupted), () -> nativeListener.onStop(id, interrupted));
        }
        @Override public void onBeginSynthesis(String id, int rate, int format, int channels) {
            callback("onBeginSynthesis", id, detail("sample_rate", rate), () -> nativeListener.onBeginSynthesis(id, rate, format, channels));
        }
        @Override public void onAudioAvailable(String id, byte[] audio) {
            callback("onAudioAvailable", id, detail("audio_bytes", audio == null ? 0 : audio.length), () -> nativeListener.onAudioAvailable(id, audio));
        }
        @Override public void onRangeStart(String id, int start, int end, int frame) {
            callback("onRangeStart", id, detail("frame", frame), () -> nativeListener.onRangeStart(id, start, end, frame));
        }
    }

    private void callback(String kind, String id, JSONObject data, ThrowingRunnable forward) {
        final long observedNanos = SystemClock.elapsedRealtimeNanos();
        Observation observation = id == null ? null : observations.get(id);
        JSONObject details = data == null ? new JSONObject() : data;
        try {
            details.put("utterance_id", nullable(id));
            details.put("lead_silence", id != null && id.startsWith("vela-lead-"));
            details.put("callback_elapsed_realtime_nanos", observedNanos);
            forward.run();
            details.put("native_callback_forwarded", true);
        } catch (Throwable failure) {
            try { details.put("native_callback_forwarded", false).put("forward_error", error(failure)); }
            catch (Exception ignored) { /* JSONObject only contains supported scalar values. */ }
            if (observation != null) {
                synchronized (observation) { observation.forwardFailures++; }
            }
        }
        event(kind, observation, details);
        if (observation != null && observation.id.equals(id)) {
            synchronized (observation) {
                if (kind.equals("onStart")) observation.startNanos = observedNanos;
                if (kind.equals("onDone")) observation.doneNanos = observedNanos;
                if (kind.equals("onDone") || kind.equals("onError") || kind.equals("onStop")) {
                    observation.terminal = true;
                    observation.terminalKind = kind;
                }
                observation.notifyAll();
            }
        }
    }

    private void event(String kind, Observation observation, JSONObject data) {
        try {
            JSONObject value = new JSONObject().put("event", kind)
                    .put("elapsed_realtime_nanos", SystemClock.elapsedRealtimeNanos())
                    .put("offset_ms", (SystemClock.elapsedRealtimeNanos() - originNanos) / 1000000.0)
                    .put("thread", Thread.currentThread().getName());
            if (observation != null) value.put("case", observation.name);
            if (data != null) value.put("data", data);
            synchronized (events) { events.add(value); }
        } catch (Exception failure) { throw new IllegalStateException("Cannot encode probe event", failure); }
    }

    private static final class Observation {
        final String name, phrase, id, cancellation;
        long dispatchNanos, cancelNanos, startNanos, doneNanos;
        boolean terminal, timedOut, noStartWindowElapsed;
        int forwardFailures;
        String terminalKind;
        JSONObject before, afterCancel, after;
        JSONObject fenceBefore, fenceAfter, fenceWindowState;
        Observation retained;
        Observation(String name, String phrase, String cancellation) {
            this.name = name; this.phrase = phrase; this.id = "vela-" + phrase.hashCode();
            this.cancellation = cancellation;
        }
        synchronized boolean completed() { return startNanos > 0 && doneNanos >= startNanos && forwardFailures == 0; }
        synchronized long fenceDelta(String key) {
            return fenceBefore == null || fenceAfter == null ? 0 : fenceAfter.optLong(key) - fenceBefore.optLong(key);
        }
        synchronized boolean fenceSuppressed() {
            return noStartWindowElapsed && startNanos == 0 && !terminal && forwardFailures == 0
                    && fenceDelta("captured") == 1 && fenceDelta("rejected") == 1;
        }
        synchronized JSONObject toJson() throws Exception {
            JSONObject value = new JSONObject().put("name", name).put("synthetic_phrase", phrase)
                    .put("native_utterance_id", id).put("before", before).put("after", after)
                    .put("j_return_is_playback_start", false).put("speech_start_callback_observed", startNanos > 0)
                    .put("speech_done_after_start_observed", completed()).put("terminal_callback", nullable(terminalKind))
                    .put("native_callback_forward_failures", forwardFailures)
                    .put("observation_timed_out", timedOut).put("dispatch_elapsed_realtime_nanos", dispatchNanos);
            if (startNanos > 0) value.put("start_delay_ms", (startNanos - dispatchNanos) / 1000000.0);
            if (doneNanos > 0) value.put("done_delay_ms", (doneNanos - dispatchNanos) / 1000000.0);
            if (fenceBefore != null) {
                value.put("fence_before", fenceBefore).put("fence_after", fenceAfter)
                        .put("fence_rejection_observed", fenceDelta("rejected") == 1)
                        .put("fence_capture_delta", fenceDelta("captured"))
                        .put("fence_focus_release_delta", fenceDelta("focus_release_successes"))
                        .put("fence_native_stop_invalidation_delta", fenceDelta("native_invalidations"))
                        .put("fence_no_start_observation_ms", noStartWindowElapsed ? 2000 : 0)
                        .put("fence_window_native_state", nullable(fenceWindowState))
                        .put("pending_outcome", fenceSuppressed() ? "NOT_STARTED"
                                : completed() ? "ENGINE_CALLBACK_START_AND_DONE" : "UNKNOWN")
                        .put("pending_outcome_basis", "NOT_STARTED requires one captured token and one helper rejection, no speech callbacks, and completed bounded observation; no-start alone is insufficient");
            }
            if (retained != null) value.put("retained_untagged_synthetic_prompt", retained.toJson())
                    .put("real_route_guidance_validated", false);
            if (cancellation != null) {
                value.put("cancellation", cancellation).put("after_cancel", afterCancel)
                        .put("cancel_delay_ms", (cancelNanos - dispatchNanos) / 1000000.0)
                        .put("speech_start_after_cancel_observed", startNanos > cancelNanos && cancelNanos > 0)
                        .put("stale_delayed_dispatch_reproduced", startNanos > cancelNanos && cancelNanos > 0)
                        .put("negative_result_scope", "No observed start within bounded window does not prove fencing");
            }
            return value;
        }
    }

    private Object field(String name) throws Exception {
        Field field = guideClass.getDeclaredField(name);
        field.setAccessible(true);
        return field.get(guide);
    }
    private Object invoke(String name, Class<?>[] types, Object... values) throws Exception {
        Method method = guideClass.getDeclaredMethod(name, types);
        method.setAccessible(true);
        try { return method.invoke(guide, values); }
        catch (InvocationTargetException failure) { throw new Exception("Original wy4." + name + " failed", failure.getCause()); }
    }
    private interface ThrowingRunnable { void run() throws Exception; }
    private void main(ThrowingRunnable operation) throws Exception {
        final Throwable[] failure = new Throwable[1];
        instrumentation.runOnMainSync(() -> {
            try { operation.run(); } catch (Throwable thrown) { failure[0] = thrown; }
        });
        if (failure[0] != null) throw new Exception("Native main-thread probe operation failed", failure[0]);
    }
    private static Object nullable(Object value) { return value == null ? JSONObject.NULL : value; }
    private static JSONObject detail(String key, Object value) {
        try { return new JSONObject().put(key, value); }
        catch (Exception failure) { throw new IllegalStateException(failure); }
    }
    private static JSONObject error(Throwable failure) throws Exception {
        StringWriter stack = new StringWriter();
        failure.printStackTrace(new PrintWriter(stack));
        return new JSONObject().put("type", failure.getClass().getName())
                .put("message", nullable(failure.getMessage())).put("stack_trace", stack.toString());
    }
    private static long boundedMillis(Bundle args, String key, long fallback) {
        Object supplied = args.get(key);
        long value = supplied == null ? fallback : Long.parseLong(supplied.toString());
        if (value < 1000 || value > 45000) throw new IllegalArgumentException(key + " must be 1000..45000 milliseconds");
        return value;
    }
}
