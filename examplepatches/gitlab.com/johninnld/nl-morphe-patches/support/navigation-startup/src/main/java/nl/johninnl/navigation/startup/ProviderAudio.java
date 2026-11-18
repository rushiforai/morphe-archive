package nl.johninnl.navigation.startup;

import android.content.Context;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.provider.Settings;
import android.speech.tts.TextToSpeech;
import android.speech.tts.UtteranceProgressListener;
import android.util.Log;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Queue;
import java.util.WeakHashMap;
import java.lang.ref.WeakReference;
import java.io.File;
import java.util.concurrent.atomic.AtomicLong;

/** Provider-local playback gate. Never adjusts a device stream or saved sound preference. */
public final class ProviderAudio {
    private ProviderAudio() {}
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<Object, float[]> PLAYERS = new WeakHashMap<>();
    private static final Map<TextToSpeech, SpeechRecord> SPEECH = new WeakHashMap<>();
    private static final AtomicLong UTTERANCES = new AtomicLong();
    private static final Map<Object, Boolean> QUEUES = new WeakHashMap<>();
    private static final Map<Object, String> FOCUS = new WeakHashMap<>();
    private static volatile Context app;
    private static volatile int boot;
    private static boolean applied;

    public static void init(Context context) {
        Context next = context.getApplicationContext();
        synchronized (ProviderAudio.class) {
            if (app != next) {
                if (app != null) { PLAYERS.clear(); SPEECH.clear(); QUEUES.clear(); FOCUS.clear(); }
                applied = false;
                app = next; boot = Settings.Global.getInt(app.getContentResolver(), Settings.Global.BOOT_COUNT, -1);
            }
        }
        MAIN.removeCallbacks(PULSE); MAIN.post(PULSE);
    }
    public static boolean muted() {
        if (ProviderLifecycle.stopping()) return true;
        Context context = app;
        if (context == null) return false;
        android.content.SharedPreferences prefs = context.getSharedPreferences("navigation_startup_lease", Context.MODE_PRIVATE);
        long remaining = prefs.getLong("until", 0) - SystemClock.elapsedRealtime();
        return remaining > 0 && remaining <= StartupProtocol.LEASE_MS && prefs.getInt("boot", -2) == boot;
    }
    private static void invoke(Object owner, String method) {
        if (owner == null) return;
        try { Method action = owner.getClass().getMethod(method); action.setAccessible(true); action.invoke(owner); }
        catch (ReflectiveOperationException | RuntimeException error) { Log.w("NavigationAudio", "Provider completion/cleanup failed", error); }
    }
    /** Complete suppressed native sounds exactly as the provider's own muted path does. */
    public static boolean skip(Object completion) {
        if (!muted()) return false;
        invoke(completion, "invoke"); return true;
    }
    public static boolean skipItems(Object items) {
        if (!muted()) return false;
        for (int i = 0; i < java.lang.reflect.Array.getLength(items); i++) {
            Object item = java.lang.reflect.Array.get(items, i);
            try { invoke(item.getClass().getField("f").get(item), "invoke"); }
            catch (ReflectiveOperationException error) { Log.w("NavigationAudio", "Provider batch callback unavailable", error); }
        }
        return true;
    }
    public static void volume(Object player, float requested) {
        synchronized (ProviderAudio.class) { PLAYERS.put(player, new float[]{requested, requested}); }
        apply(player, muted() ? new float[]{0, 0} : new float[]{requested, requested});
    }
    public static void mediaVolume(MediaPlayer player, float left, float right) {
        synchronized (ProviderAudio.class) { PLAYERS.put(player, new float[]{left, right}); }
        boolean mute = muted(); player.setVolume(mute ? 0 : left, mute ? 0 : right);
    }
    public static void start(MediaPlayer player) {
        float[] requested;
        synchronized (ProviderAudio.class) {
            requested = PLAYERS.get(player);
            if (requested == null) { requested = new float[]{1, 1}; PLAYERS.put(player, requested); }
        }
        apply(player, muted() ? new float[]{0, 0} : requested); player.start();
    }
    private static void apply(Object player, float[] volume) {
        try {
            if (player instanceof MediaPlayer) ((MediaPlayer) player).setVolume(volume[0], volume[1]);
            else { Method setter = player.getClass().getMethod("setVolume", float.class); setter.setAccessible(true); setter.invoke(player, volume[0]); }
        } catch (ReflectiveOperationException | RuntimeException error) { Log.w("NavigationAudio", "Provider player no longer available", error); }
    }
    public static int speak(TextToSpeech speech, CharSequence text, int queueMode, Bundle params, String id) {
        Bundle copy = params == null ? new Bundle() : new Bundle(params);
        if (muted()) copy.putFloat(TextToSpeech.Engine.KEY_PARAM_VOLUME, 0f);
        String token = utterance(speech, id);
        int result = speech.speak(text, queueMode, copy, token);
        if (result == TextToSpeech.ERROR) discard(speech, token);
        return result;
    }
    @SuppressWarnings("deprecation")
    public static int legacySpeak(TextToSpeech speech, String text, int queueMode, HashMap<String, String> params) {
        HashMap<String, String> copy = params == null ? new HashMap<>() : new HashMap<>(params);
        if (muted()) copy.put(TextToSpeech.Engine.KEY_PARAM_VOLUME, "0.0");
        String token = utterance(speech, copy.get(TextToSpeech.Engine.KEY_PARAM_UTTERANCE_ID));
        copy.put(TextToSpeech.Engine.KEY_PARAM_UTTERANCE_ID, token);
        int result = speech.speak(text, queueMode, copy);
        if (result == TextToSpeech.ERROR) discard(speech, token);
        return result;
    }
    public static int synthesize(TextToSpeech speech, CharSequence text, Bundle params, File file, String id) {
        String token = utterance(speech, id);
        int result = speech.synthesizeToFile(text, params, file, token);
        if (result == TextToSpeech.ERROR) discard(speech, token);
        return result;
    }
    private static final class SpeechRecord {
        volatile WeakReference<Progress> listener = new WeakReference<>(null);
        final Map<String, String> pending = new HashMap<>();
    }
    public static int setListener(TextToSpeech speech, UtteranceProgressListener listener) {
        SpeechRecord record;
        synchronized (ProviderAudio.class) {
            record = SPEECH.get(speech);
            if (record == null) { record = new SpeechRecord(); SPEECH.put(speech, record); }
            record.pending.clear();
        }
        Progress progress = listener == null ? null : new Progress(record, listener);
        record.listener = new WeakReference<>(progress);
        return speech.setOnUtteranceProgressListener(progress);
    }
    private static String utterance(TextToSpeech speech, String id) {
        synchronized (ProviderAudio.class) {
            SpeechRecord record = SPEECH.get(speech);
            if (record == null || record.listener.get() == null) return id;
            String token = "navigation-audio-" + UTTERANCES.incrementAndGet();
            record.pending.put(token, id); return token;
        }
    }
    private static void discard(TextToSpeech speech, String token) {
        synchronized (ProviderAudio.class) { SpeechRecord record = SPEECH.get(speech); if (record != null) record.pending.remove(token); }
    }
    private static final class Progress extends UtteranceProgressListener {
        final SpeechRecord record;
        final UtteranceProgressListener nativeListener;
        Progress(SpeechRecord record, UtteranceProgressListener listener) { this.record = record; nativeListener = listener; }
        private String id(String token, boolean remove) {
            synchronized (ProviderAudio.class) { return remove ? record.pending.remove(token) : record.pending.get(token); }
        }
        @Override public void onStart(String token) { String value = id(token, false); if (value != null) nativeListener.onStart(value); }
        @Override public void onDone(String token) { String value = id(token, true); if (value != null) nativeListener.onDone(value); }
        @Override public void onError(String token) { String value = id(token, true); if (value != null) nativeListener.onError(value); }
        @Override public void onError(String token, int code) { String value = id(token, true); if (value != null) nativeListener.onError(value, code); }
        @Override public void onStop(String token, boolean interrupted) { String value = id(token, true); if (value != null) nativeListener.onStop(value, interrupted); }
        @Override public void onBeginSynthesis(String token, int rate, int format, int channels) { String value = id(token, false); if (value != null) nativeListener.onBeginSynthesis(value, rate, format, channels); }
        @Override public void onAudioAvailable(String token, byte[] bytes) { String value = id(token, false); if (value != null) nativeListener.onAudioAvailable(value, bytes); }
        @Override public void onRangeStart(String token, int start, int end, int frame) { String value = id(token, false); if (value != null) nativeListener.onRangeStart(value, start, end, frame); }
    }
    /** Cancel with a native error, never mark a partial synthesized file as successfully generated. */
    private static void cancelSpeech(TextToSpeech speech) {
        ArrayList<String> ids;
        Progress listener;
        synchronized (ProviderAudio.class) {
            SpeechRecord record = SPEECH.get(speech);
            if (record == null || record.pending.isEmpty() || (listener = record.listener.get()) == null) return;
            ids = new ArrayList<>(record.pending.values()); record.pending.clear();
        }
        try { speech.stop(); } catch (RuntimeException error) { Log.w("NavigationAudio", "Provider TTS stop failed", error); }
        for (String id : ids) try { listener.nativeListener.onError(id); }
        catch (RuntimeException error) { Log.w("NavigationAudio", "Provider TTS cancellation callback failed", error); }
    }
    public static void trackQueue(Object queue) {
        synchronized (ProviderAudio.class) { QUEUES.put(queue, Boolean.TRUE); }
        // Called just after the native constructor's superclass call, before its queue fields exist.
        // New requests are gated separately; a later handover cleans this fully constructed owner.
    }
    public static void trackFocus(Object owner, String abandonMethod) {
        synchronized (ProviderAudio.class) { FOCUS.put(owner, abandonMethod); }
        if (muted()) MAIN.post(() -> invoke(owner, abandonMethod));
    }
    public static void trackWazeFocus(Object owner) { trackFocus(owner, "a"); }
    public static void trackMapFocus(Object owner) { trackFocus(owner, "abandonFocus"); }
    /** Flitsmeister's queue fields and cleanup ABI are guarded by its patch. */
    public static boolean silenceQueue(Object owner) {
        if (!muted()) return false;
        try {
            Queue<?> queue = (Queue<?>) owner.getClass().getField("f").get(owner);
            ArrayList<Object> pending = new ArrayList<>();
            Object item; while ((item = queue.poll()) != null) pending.add(item);
            owner.getClass().getField("g").setBoolean(owner, false);
            Object holder = owner.getClass().getField("e").get(owner);
            Object speech = holder.getClass().getField("b").get(holder);
            if (speech instanceof TextToSpeech) cancelSpeech((TextToSpeech) speech);
            for (Object sound : pending) invoke(sound.getClass().getField("f").get(sound), "invoke");
            invoke(owner, "k");
        } catch (ReflectiveOperationException | RuntimeException error) { Log.w("NavigationAudio", "Provider queue cleanup failed", error); }
        return true;
    }
    private static final Runnable PULSE = new Runnable() {
        @Override public void run() {
            boolean mute = muted();
            if (mute != applied) {
                Map<Object, float[]> players;
                Map<Object, String> focus;
                ArrayList<TextToSpeech> speech;
                ArrayList<Object> queues;
                synchronized (ProviderAudio.class) {
                    players = new HashMap<>(PLAYERS); focus = new HashMap<>(FOCUS);
                    speech = new ArrayList<>(SPEECH.keySet()); queues = new ArrayList<>(QUEUES.keySet());
                }
                // Set before native callbacks: a callback can enqueue another sound synchronously.
                applied = mute;
                for (Map.Entry<Object, float[]> entry : players.entrySet()) apply(entry.getKey(), mute ? new float[]{0, 0} : entry.getValue());
                if (mute) {
                    for (TextToSpeech tts : speech) cancelSpeech(tts);
                    for (Object queue : queues) silenceQueue(queue);
                    for (Map.Entry<Object, String> entry : focus.entrySet()) invoke(entry.getKey(), entry.getValue());
                }
            }
            MAIN.postDelayed(this, 1000);
        }
    };
}
