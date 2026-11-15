package app.hoitruyenchu.extension.itruyenchu.patches.tts;

import android.content.Context;
import android.media.AudioManager;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.os.SystemClock;
import android.speech.tts.TextToSpeech;
import android.speech.tts.UtteranceProgressListener;
import android.speech.tts.Voice;
import android.util.Log;

import com.facebook.react.bridge.ReadableArray;

import org.json.JSONObject;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * Replaces the TextToSpeech lifecycle of expo-speech (expo.modules.speech.SpeechModule).
 * <p>
 * The app reads a chapter line by line: JS calls Speech.speak(line, {onDone: speakNext}).
 * The whole chain depends on every utterance eventually producing an onDone event.
 * Stock expo-speech breaks that chain in several ways, which this class fixes:
 * <ul>
 *   <li>The engine is created once and never re-created. After the activity is destroyed
 *       (it calls shutdown()) or after the TTS engine process dies, every speak() fails silently
 *       and getVoices() throws, so the play button does nothing. Here the engine is re-created on demand.</li>
 *   <li>A phone call (or VoIP call) stops/kills the utterance and no onDone ever arrives.
 *       Here the reading is paused while a call is active and the interrupted line is spoken
 *       again afterwards, so JS just sees a slow onDone.</li>
 *   <li>If engine init fails, pending getVoices() promises never resolve. Here callers wait with a timeout.</li>
 *   <li>React Native pauses JS timers (including requestAnimationFrame) when the activity pauses,
 *       which stops the app from starting the next chapter with the screen off. While a reading
 *       session is active the pause of the timer manager is deferred.</li>
 *   <li>Changing the speed in the voice bar while reading had no effect until pause + play: the
 *       reading chain (speakLine -> onDone -> speakLine) keeps the speed of the render in which play
 *       was pressed. Here the speed saved by the voice bar store is used for every line, and the
 *       current line is started again at the new speed.</li>
 * </ul>
 * All public static methods are called from patched smali.
 */
@SuppressWarnings("unused")
public final class TtsController {
    private static final String TAG = "HTC-TtsFix";

    /** How long after the last speech activity the reading session is considered alive. */
    private static final long SESSION_GRACE_MS = 90_000;
    /** Ticks (1 s) the engine may be silent with an utterance in flight before it is considered dead. */
    private static final int STALL_TICKS = 20;
    /** Ticks (1 s) of normal audio mode needed before resuming after a call. */
    private static final int RESUME_TICKS = 2;
    private static final int MAX_RETRIES_PER_UTTERANCE = 2;
    private static final long INIT_WAIT_MS = 6_000;
    private static final long WAKELOCK_TIMEOUT_MS = 10 * 60_000;

    private static final Object lock = new Object();
    private static final Handler main = new Handler(Looper.getMainLooper());

    private static Context appContext;
    private static UtteranceProgressListener appListener;

    private static TextToSpeech tts;
    private static int generation;
    private static boolean ready;
    private static boolean initializing;
    private static int initFailures;
    private static long lastRecreateAt;
    private static int quickRecreates;

    private static final class Utterance {
        final String id;
        final String text;
        final String language;
        final Float pitch;
        final Float rate;
        final String voice;
        boolean sent;
        int retries;

        Utterance(String id, String text, String language, Float pitch, Float rate, String voice) {
            this.id = id;
            this.text = text;
            this.language = language;
            this.pitch = pitch;
            this.rate = rate;
            this.voice = voice;
        }
    }

    /** Utterances requested by JS that have not finished yet, in request order. */
    private static final LinkedHashMap<String, Utterance> pending = new LinkedHashMap<>();
    /** Utterances stopped by us (call interruption) whose onStop must not reach JS. */
    private static final Set<String> suppressStop = new HashSet<>();
    /** Utterances stopped by us after a speed change and already sent again: drop the old one's onStop/onError. */
    private static final Set<String> respoken = new HashSet<>();

    // Engine settings already applied to the current engine instance.
    private static Float appliedPitch;
    private static Float appliedRate;
    private static Locale appliedLocale;
    private static String appliedVoice;
    private static final Map<String, Locale> resolvedLocales = new HashMap<>();

    /** AsyncStorage key of the voice bar store (useTTSVoiceStore). */
    private static final String KEY_VOICE_STATE = "tts_voice_state";
    /** AsyncStorage key of the answers of the voice bar script to the media controls. */
    private static final String KEY_MEDIA_ANSWER = "htc_media_ack";
    /** Speed last saved by the voice bar, null until it saves one. */
    private static Float chosenRate;

    /** Paused from the media widget / lock screen: like a call, the current line is read again on resume. */
    private static boolean userPaused;
    /** Last JS Speech.stop() and whether a line was requested since. */
    private static long lastStopAt;
    private static boolean spokeSinceStop = true;
    private static long lastDoneAt;
    /** What the voice bar says at the end of a chapter before it opens the next one. */
    private static final String END_OF_CHAPTER = "Hết chương";
    /** A reading stays "playing" for the widget this long after a line, while JS asks for the next one. */
    private static final long PLAYING_GRACE_MS = 4_000;

    private static boolean interrupted;
    private static int normalModeTicks;
    private static int stallTicks;
    private static long lastActivity;
    private static boolean ticking;

    private static PowerManager.WakeLock wakeLock;
    private static long wakeLockAcquiredAt;

    private static WeakReference<Object> deferredTimerManager;
    private static boolean bypassTimerDefer;
    /** JS timers paused by us in background (reading ended), resumed when a reading starts again. */
    private static WeakReference<Object> pausedTimerManager;
    private static boolean appInBackground;
    private static boolean selfResuming;

    private TtsController() {
    }

    // ---------------------------------------------------------------------------------------------
    // Hooks called from expo.modules.speech.SpeechModule

    /**
     * Replaces SpeechModule.getTextToSpeech(). Always returns a usable engine instance
     * (possibly still initializing).
     */
    public static TextToSpeech getTts(Context context, UtteranceProgressListener listener) {
        synchronized (lock) {
            if (context != null && appContext == null) {
                Context app = context.getApplicationContext();
                appContext = app != null ? app : context;
            }
            if (listener != null) appListener = listener;
            if (tts == null) createLocked("first use");
            return tts;
        }
    }

    /**
     * Replaces the body of SpeechModule.speakOut(id, text, options).
     */
    public static void speak(String id, String text, String language, Float pitch, Float rate, String voice) {
        synchronized (lock) {
            if (END_OF_CHAPTER.equals(text) && !spokeSinceStop
                    && SystemClock.elapsedRealtime() - lastStopAt < 2_000) {
                // The voice bar was mounted while its "playing" flag was still set from an earlier
                // reading: it stops the speech and reads its still empty text, i.e. says "Hết chương"
                // and then opens the NEXT chapter. Drop it; the chapter text arriving restarts the reading.
                Log.i(TAG, "dropping end-of-chapter spoken right after stop (reader just opened)");
                return;
            }
            spokeSinceStop = true;
            if (userPaused) {
                // Play pressed in the app (e.g. a voice bar mounted again, showing "play") while the
                // reading was paused from the media controls: the app reads from its line again, the
                // line kept for the resume is obsolete. Without this the new line stayed queued.
                Log.i(TAG, "new reading while paused from the media controls, dropping " + pending.size() + " kept line(s)");
                userPaused = false;
                pending.clear();
                suppressStop.clear();
                respoken.clear();
            }
            Utterance u = new Utterance(id, text, language, pitch, rate, voice);
            pending.put(id, u);
            touchLocked();
            if (tts == null) createLocked("speak without engine");
            if (!ready || blockedLocked()) {
                Log.d(TAG, "queued " + id + (blockedLocked() ? " (paused)" : " (engine not ready)"));
            } else {
                sendLocked(u);
            }
        }
        notifyMedia();
    }

    /** Replaces textToSpeech.stop() called by JS Speech.stop(). */
    public static int stop(TextToSpeech engine) {
        synchronized (lock) {
            pending.clear();
            suppressStop.clear();
            respoken.clear();
            interrupted = false;
            userPaused = false;
            normalModeTicks = 0;
            stallTicks = 0;
            lastStopAt = SystemClock.elapsedRealtime();
            spokeSinceStop = false;
        }
        ReadingProgress.onLineInterrupted();
        notifyMedia();
        try {
            return engine != null ? engine.stop() : TextToSpeech.SUCCESS;
        } catch (Throwable t) {
            Log.w(TAG, "stop failed", t);
            return TextToSpeech.ERROR;
        }
    }

    /**
     * Start of AsyncStorageModule.multiSet([[key, value], ...]). The voice bar store is saved as
     * {"state":{"spead":1.5,"isVoiceBarOpen":true},"version":0} ("spead" sic) whenever it changes.
     */
    public static void onStorageSet(ReadableArray pairs) {
        try {
            if (pairs == null) return;
            for (int i = 0; i < pairs.size(); i++) {
                ReadableArray pair = pairs.getArray(i);
                if (pair == null || pair.size() < 2 || pair.isNull(0) || pair.isNull(1)) continue;
                String key = pair.getString(0);
                if (KEY_MEDIA_ANSWER.equals(key)) {
                    notifyMediaAnswer(pair.getString(1));
                    continue;
                }
                if (!KEY_VOICE_STATE.equals(key)) continue;
                JSONObject state = new JSONObject(pair.getString(1)).optJSONObject("state");
                if (state == null) continue;
                Object speed = state.has("speed") ? state.opt("speed") : state.opt("spead");
                if (speed instanceof Number) onSpeedChosen(((Number) speed).floatValue());
            }
        } catch (Throwable t) {
            Log.w(TAG, "onStorageSet failed", t);
        }
    }

    private static void onSpeedChosen(float rate) {
        if (!(rate > 0) || rate > 10) return;
        synchronized (lock) {
            Float previous = chosenRate != null ? chosenRate : appliedRate;
            chosenRate = rate;
            if (previous == null || previous == rate) return;
            Log.i(TAG, "speed changed to " + rate);
            if (tts == null || !ready || blockedLocked()) return;
            // Speak the current line again at the new speed (the engine cannot change it mid-line).
            boolean restart = false;
            for (Utterance u : pending.values()) {
                if (!u.sent) continue;
                respoken.add(u.id);
                u.sent = false;
                restart = true;
            }
            if (!restart) return;
            try {
                tts.stop();
            } catch (Throwable ignored) {
            }
            flushLocked();
        }
    }

    /**
     * Called at the start of SpeechModule.getVoices(). Waits (off the main thread) until the
     * engine is ready and healthy, re-creating it if needed.
     */
    public static void awaitReady() {
        if (Looper.myLooper() == Looper.getMainLooper()) return;
        synchronized (lock) {
            for (int attempt = 0; attempt < 2; attempt++) {
                if (attempt > 0) createLocked("not ready after " + INIT_WAIT_MS + " ms");
                long deadline = SystemClock.elapsedRealtime() + INIT_WAIT_MS;
                while (true) {
                    if (ready) {
                        if (isHealthyLocked()) return;
                        createLocked("engine unhealthy");
                    } else if (tts == null && !initializing) {
                        createLocked("await");
                    }
                    long left = deadline - SystemClock.elapsedRealtime();
                    if (left <= 0) break;
                    try {
                        lock.wait(left);
                    } catch (InterruptedException e) {
                        return;
                    }
                }
            }
            Log.w(TAG, "engine still not ready, giving up waiting");
        }
    }

    /** Replaces textToSpeech.shutdown() called when the activity is destroyed. */
    public static void onActivityDestroyed(TextToSpeech engine) {
        synchronized (lock) {
            if (sessionActiveLocked()) {
                Log.i(TAG, "activity destroyed while reading, keeping engine alive");
                return;
            }
            if (engine == tts) {
                generation++;
                tts = null;
                ready = false;
                initializing = false;
            }
            pending.clear();
            suppressStop.clear();
            respoken.clear();
            interrupted = false;
            userPaused = false;
        }
        notifyMedia();
        try {
            if (engine != null) engine.shutdown();
        } catch (Throwable ignored) {
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Hooks called from com.facebook.react.modules.core.JavaTimerManager

    /**
     * Called at the start of JavaTimerManager.onHostPause().
     *
     * @return true to skip pausing JS timers because a reading session is active.
     */
    public static boolean shouldDeferHostPause(Object timerManager) {
        synchronized (lock) {
            if (bypassTimerDefer || timerManager == null) return false;
            appInBackground = true;
            if (!sessionActiveLocked()) return false;
            Log.i(TAG, "app paused while reading, keeping JS timers running");
            deferredTimerManager = new WeakReference<>(timerManager);
            ensureTickingLocked();
            return true;
        }
    }

    /** Called at the start of JavaTimerManager.onHostResume(). */
    public static void onHostResume() {
        synchronized (lock) {
            if (selfResuming) return;
            appInBackground = false;
            deferredTimerManager = null;
            pausedTimerManager = null;
        }
    }

    /**
     * A command of the media controls is about to be sent to the app: the JS timers (needed by the
     * voice bar, e.g. requestAnimationFrame when a chapter starts) must run even in background.
     */
    public static void wakeJsTimers() {
        synchronized (lock) {
            touchLocked();
        }
    }

    private static void resumeTimerManager(Object timerManager) {
        synchronized (lock) {
            if (!appInBackground) return;
            selfResuming = true;
        }
        Log.i(TAG, "reading again in background, resuming JS timers");
        try {
            timerManager.getClass().getMethod("onHostResume").invoke(timerManager);
        } catch (Throwable t) {
            Log.w(TAG, "could not resume JS timers", t);
        } finally {
            synchronized (lock) {
                selfResuming = false;
                // Paused again when the reading session ends.
                deferredTimerManager = new WeakReference<>(timerManager);
                ensureTickingLocked();
            }
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Engine management

    private static void createLocked(String reason) {
        if (appContext == null) {
            Log.e(TAG, "no context, cannot create engine");
            return;
        }
        long now = SystemClock.elapsedRealtime();
        quickRecreates = (now - lastRecreateAt < 60_000) ? quickRecreates + 1 : 0;
        lastRecreateAt = now;

        TextToSpeech old = tts;
        final int gen = ++generation;
        tts = null;
        ready = false;
        initializing = true;
        appliedPitch = null;
        appliedRate = null;
        appliedLocale = null;
        appliedVoice = null;
        resolvedLocales.clear();
        for (Utterance u : pending.values()) u.sent = false;
        suppressStop.clear();
        respoken.clear();

        if (old != null) {
            try {
                old.setOnUtteranceProgressListener(null);
                old.shutdown();
            } catch (Throwable ignored) {
            }
        }

        Log.i(TAG, "creating engine #" + gen + " (" + reason + ")");
        try {
            tts = new TextToSpeech(appContext, status -> main.post(() -> onInit(gen, status)));
        } catch (Throwable t) {
            Log.e(TAG, "engine constructor failed", t);
            tts = null;
            initializing = false;
            scheduleRecreateLocked(gen);
        }
    }

    private static void onInit(int gen, int status) {
        ArrayList<String> failed = null;
        synchronized (lock) {
            if (gen != generation || tts == null) return;
            initializing = false;
            if (status == TextToSpeech.SUCCESS) {
                Log.i(TAG, "engine #" + gen + " ready, pending=" + pending.size());
                ready = true;
                initFailures = 0;
                tts.setOnUtteranceProgressListener(new Listener(gen));
                lock.notifyAll();
                if (!blockedLocked()) flushLocked();
                return;
            }
            initFailures++;
            Log.w(TAG, "engine #" + gen + " init failed (" + status + "), failures=" + initFailures);
            lock.notifyAll();
            if (initFailures <= 3) {
                scheduleRecreateLocked(gen);
            } else {
                failed = new ArrayList<>(pending.keySet());
                pending.clear();
            }
        }
        if (failed != null) for (String id : failed) forwardError(id);
    }

    private static void scheduleRecreateLocked(final int gen) {
        main.postDelayed(() -> {
            synchronized (lock) {
                if (gen == generation) createLocked("retry init");
            }
        }, 1500L * Math.max(1, initFailures));
    }

    /** Called when the engine looks dead: re-send everything unfinished on a new engine. */
    private static void engineLostLocked(String reason) {
        if (quickRecreates >= 5) {
            Log.e(TAG, "engine keeps dying, dropping pending speech (" + reason + ")");
            final ArrayList<String> failed = new ArrayList<>(pending.keySet());
            pending.clear();
            quickRecreates = 0;
            main.post(() -> {
                for (String id : failed) forwardError(id);
            });
            return;
        }
        createLocked(reason);
    }

    private static boolean isHealthyLocked() {
        if (tts == null) return false;
        try {
            return tts.getVoices() != null;
        } catch (Throwable t) {
            return false;
        }
    }

    private static void flushLocked() {
        for (Utterance u : new ArrayList<>(pending.values())) {
            if (u.sent) continue;
            if (!sendLocked(u)) return;
        }
    }

    private static boolean sendLocked(Utterance u) {
        if (tts == null || !ready) return false;
        int result;
        try {
            applyOptionsLocked(u);
            result = tts.speak(u.text, TextToSpeech.QUEUE_ADD, null, u.id);
        } catch (Throwable t) {
            Log.w(TAG, "speak threw", t);
            result = TextToSpeech.ERROR;
        }
        if (result == TextToSpeech.SUCCESS) {
            u.sent = true;
            stallTicks = 0;
            return true;
        }
        Log.w(TAG, "speak(" + u.id + ") failed, engine is gone");
        engineLostLocked("speak failed");
        return false;
    }

    private static void applyOptionsLocked(Utterance u) {
        if (u.pitch != null && !u.pitch.equals(appliedPitch)) {
            tts.setPitch(u.pitch);
            appliedPitch = u.pitch;
        }
        Float rate = chosenRate != null ? chosenRate : u.rate;
        if (rate != null && !rate.equals(appliedRate)) {
            tts.setSpeechRate(rate);
            appliedRate = rate;
        }
        Locale locale = resolveLocaleLocked(u.language);
        boolean localeChanged = !locale.equals(appliedLocale);
        if (localeChanged) {
            tts.setLanguage(locale);
            appliedLocale = locale;
            appliedVoice = null;
        }
        if (u.voice != null && !u.voice.equals(appliedVoice)) {
            Set<Voice> voices = tts.getVoices();
            if (voices != null) {
                for (Voice v : voices) {
                    if (u.voice.equals(v.getName())) {
                        tts.setVoice(v);
                        break;
                    }
                }
            }
            appliedVoice = u.voice;
        }
    }

    /**
     * Stock expo-speech uses new Locale("vi-VN"), which is not a valid language and silently
     * falls back to the phone language. Prefer the BCP-47 interpretation.
     */
    private static Locale resolveLocaleLocked(String language) {
        if (language == null) return Locale.getDefault();
        Locale cached = resolvedLocales.get(language);
        if (cached != null) return cached;
        Locale result = Locale.getDefault();
        Locale[] candidates = {Locale.forLanguageTag(language.replace('_', '-')), new Locale(language)};
        for (Locale candidate : candidates) {
            int availability;
            try {
                availability = tts.isLanguageAvailable(candidate);
            } catch (Throwable t) {
                availability = TextToSpeech.LANG_NOT_SUPPORTED;
            }
            if (availability != TextToSpeech.LANG_MISSING_DATA
                    && availability != TextToSpeech.LANG_NOT_SUPPORTED) {
                result = candidate;
                break;
            }
        }
        resolvedLocales.put(language, result);
        return result;
    }

    // ---------------------------------------------------------------------------------------------
    // Engine callbacks

    private static final class Listener extends UtteranceProgressListener {
        private final int gen;

        Listener(int gen) {
            this.gen = gen;
        }

        private boolean stale() {
            synchronized (lock) {
                return gen != generation;
            }
        }

        @Override
        public void onStart(String id) {
            if (stale()) return;
            String text;
            Float rate;
            synchronized (lock) {
                stallTicks = 0;
                Utterance u = pending.get(id);
                text = u != null ? u.text : null;
                rate = appliedRate;
            }
            ReadingProgress.onLineStarted(text, rate);
            notifyMedia();
            UtteranceProgressListener l = appListener;
            if (l != null) l.onStart(id);
        }

        @Override
        public void onDone(String id) {
            if (stale()) return;
            synchronized (lock) {
                pending.remove(id);
                suppressStop.remove(id);
                respoken.remove(id);
                touchLocked();
                lastDoneAt = SystemClock.elapsedRealtime();
            }
            ReadingProgress.onLineDone();
            notifyMedia();
            notifyMediaLater(PLAYING_GRACE_MS + 200);
            UtteranceProgressListener l = appListener;
            if (l != null) l.onDone(id);
        }

        @Override
        public void onStop(String id, boolean wasInterrupted) {
            if (stale()) return;
            synchronized (lock) {
                if (respoken.remove(id) || suppressStop.remove(id)) return;
                pending.remove(id);
            }
            UtteranceProgressListener l = appListener;
            if (l != null) l.onStop(id, wasInterrupted);
        }

        @Override
        public void onRangeStart(String id, int start, int end, int frame) {
            if (stale()) return;
            UtteranceProgressListener l = appListener;
            if (l != null) l.onRangeStart(id, start, end, frame);
        }

        @SuppressWarnings("deprecation")
        @Override
        public void onError(String id) {
            handleError(gen, id, TextToSpeech.ERROR);
        }

        @Override
        public void onError(String id, int errorCode) {
            handleError(gen, id, errorCode);
        }
    }

    private static void handleError(final int gen, String id, final int code) {
        synchronized (lock) {
            if (gen != generation) return;
            if (respoken.remove(id)) return;
            Utterance u = pending.get(id);
            if (u != null) {
                if (blockedLocked() || suppressStop.remove(id)) {
                    // Caused by our own call interruption, it will be spoken again.
                    u.sent = false;
                    return;
                }
                if (u.retries < MAX_RETRIES_PER_UTTERANCE) {
                    u.retries++;
                    u.sent = false;
                    Log.w(TAG, "utterance " + id + " failed (" + code + "), retry " + u.retries);
                    final boolean serviceGone = code == TextToSpeech.ERROR_SERVICE
                            || code == TextToSpeech.ERROR_NOT_INSTALLED_YET;
                    main.postDelayed(() -> {
                        synchronized (lock) {
                            if (gen != generation) return;
                            if (serviceGone) engineLostLocked("utterance error " + code);
                            else if (ready && !blockedLocked()) flushLocked();
                        }
                    }, 800);
                    return;
                }
                pending.remove(id);
            }
        }
        forwardError(id);
    }

    @SuppressWarnings("deprecation")
    private static void forwardError(String id) {
        UtteranceProgressListener l = appListener;
        if (l != null) l.onError(id);
    }

    // ---------------------------------------------------------------------------------------------
    // Session, call interruption, stall watchdog, wake lock, deferred JS timer pause

    private static boolean blockedLocked() {
        return interrupted || userPaused;
    }

    // ---------------------------------------------------------------------------------------------
    // Media widget / lock screen (see TtsMediaSession)

    /** True while a reading is going on and not paused, as shown by the media widget. */
    public static boolean isReading() {
        synchronized (lock) {
            if (blockedLocked()) return false;
            if (!pending.isEmpty()) return true;
            return lastDoneAt > lastStopAt
                    && SystemClock.elapsedRealtime() - lastDoneAt < PLAYING_GRACE_MS;
        }
    }

    /** Pause button of the media widget: stop the engine but keep the line to read it again later. */
    public static void pauseByUser() {
        synchronized (lock) {
            if (userPaused || pending.isEmpty()) return;
            Log.i(TAG, "paused from the media controls");
            userPaused = true;
            for (Utterance u : pending.values()) {
                if (u.sent) suppressStop.add(u.id);
                u.sent = false;
            }
            try {
                if (tts != null) tts.stop();
            } catch (Throwable ignored) {
            }
        }
        ReadingProgress.onLineInterrupted();
        notifyMedia();
    }

    /**
     * Play button of the media widget.
     *
     * @return false when there is nothing to resume (the reading was stopped in the app).
     */
    public static boolean resumeByUser() {
        synchronized (lock) {
            if (!userPaused) return false;
            Log.i(TAG, "resumed from the media controls, " + pending.size() + " utterance(s)");
            userPaused = false;
            touchLocked();
            if (!interrupted) {
                if (tts == null) createLocked("resume from media controls");
                else if (ready) flushLocked();
            }
        }
        notifyMedia();
        return true;
    }

    private static void notifyMediaAnswer(String json) {
        try {
            app.hoitruyenchu.extension.itruyenchu.patches.media.TtsMediaSession.onAnswer(json);
        } catch (Throwable ignored) {
        }
    }

    private static void notifyMedia() {
        try {
            app.hoitruyenchu.extension.itruyenchu.patches.media.TtsMediaSession.notifyChanged(0);
        } catch (Throwable ignored) {
        }
    }

    private static void notifyMediaLater(long delayMs) {
        try {
            app.hoitruyenchu.extension.itruyenchu.patches.media.TtsMediaSession.notifyChanged(delayMs);
        } catch (Throwable ignored) {
        }
    }

    private static boolean sessionActiveLocked() {
        if (!pending.isEmpty() || interrupted) return true;
        return lastActivity != 0 && SystemClock.elapsedRealtime() - lastActivity < SESSION_GRACE_MS;
    }

    private static void touchLocked() {
        lastActivity = SystemClock.elapsedRealtime();
        ensureTickingLocked();
        if (pausedTimerManager != null) {
            final Object timerManager = pausedTimerManager.get();
            pausedTimerManager = null;
            if (timerManager != null) main.post(() -> resumeTimerManager(timerManager));
        }
    }

    private static void ensureTickingLocked() {
        if (ticking) return;
        ticking = true;
        main.postDelayed(TtsController::tick, 1000);
    }

    private static void tick() {
        Object timerManagerToPause = null;
        synchronized (lock) {
            checkCallStateLocked();
            checkStallLocked();

            boolean active = sessionActiveLocked();
            if (active && !userPaused) {
                holdWakeLockLocked();
            } else {
                releaseWakeLockLocked();
                if (deferredTimerManager != null) {
                    timerManagerToPause = deferredTimerManager.get();
                    deferredTimerManager = null;
                }
            }
            if (active || deferredTimerManager != null) {
                main.postDelayed(TtsController::tick, 1000);
            } else {
                ticking = false;
            }
        }
        if (timerManagerToPause != null) pauseTimerManager(timerManagerToPause);
    }

    private static void checkCallStateLocked() {
        if (appContext == null) return;
        int mode;
        try {
            AudioManager am = (AudioManager) appContext.getSystemService(Context.AUDIO_SERVICE);
            mode = am.getMode();
        } catch (Throwable t) {
            return;
        }
        boolean inCall = mode != AudioManager.MODE_NORMAL;
        if (inCall) {
            normalModeTicks = 0;
            if (!interrupted && !pending.isEmpty()) {
                Log.i(TAG, "call detected (audio mode " + mode + "), pausing speech");
                interrupted = true;
                for (Utterance u : pending.values()) {
                    if (u.sent) suppressStop.add(u.id);
                    u.sent = false;
                }
                try {
                    if (tts != null) tts.stop();
                } catch (Throwable ignored) {
                }
                ReadingProgress.onLineInterrupted();
                notifyMedia();
            }
        } else if (interrupted) {
            if (++normalModeTicks >= RESUME_TICKS) {
                Log.i(TAG, "call ended, resuming " + pending.size() + " utterance(s)");
                interrupted = false;
                normalModeTicks = 0;
                lastActivity = SystemClock.elapsedRealtime();
                if (!userPaused) {
                    if (tts == null) createLocked("resume after call");
                    else if (ready) flushLocked();
                }
                notifyMedia();
            }
        }
    }

    private static void checkStallLocked() {
        boolean inFlight = false;
        for (Utterance u : pending.values()) {
            if (u.sent) {
                inFlight = true;
                break;
            }
        }
        if (blockedLocked() || !ready || tts == null || !inFlight) {
            stallTicks = 0;
            return;
        }
        boolean speaking;
        try {
            speaking = tts.isSpeaking();
        } catch (Throwable t) {
            speaking = false;
        }
        stallTicks = speaking ? 0 : stallTicks + 1;
        if (stallTicks >= STALL_TICKS) {
            stallTicks = 0;
            Log.w(TAG, "engine silent with speech in flight, re-creating");
            engineLostLocked("stalled");
        }
    }

    private static void holdWakeLockLocked() {
        if (appContext == null) return;
        try {
            if (wakeLock == null) {
                PowerManager pm = (PowerManager) appContext.getSystemService(Context.POWER_SERVICE);
                wakeLock = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "itruyenchu:tts");
                wakeLock.setReferenceCounted(false);
            }
            long now = SystemClock.elapsedRealtime();
            if (!wakeLock.isHeld() || now - wakeLockAcquiredAt > WAKELOCK_TIMEOUT_MS / 2) {
                wakeLock.acquire(WAKELOCK_TIMEOUT_MS);
                wakeLockAcquiredAt = now;
            }
        } catch (Throwable t) {
            // WAKE_LOCK permission missing; reading still works while audio keeps the CPU awake.
        }
    }

    private static void releaseWakeLockLocked() {
        try {
            if (wakeLock != null && wakeLock.isHeld()) wakeLock.release();
        } catch (Throwable ignored) {
        }
    }

    private static void pauseTimerManager(Object timerManager) {
        Log.i(TAG, "reading session ended in background, pausing JS timers");
        synchronized (lock) {
            bypassTimerDefer = true;
        }
        try {
            timerManager.getClass().getMethod("onHostPause").invoke(timerManager);
            synchronized (lock) {
                pausedTimerManager = new WeakReference<>(timerManager);
            }
        } catch (Throwable t) {
            Log.w(TAG, "could not pause JS timers", t);
        } finally {
            synchronized (lock) {
                bypassTimerDefer = false;
            }
        }
    }
}
