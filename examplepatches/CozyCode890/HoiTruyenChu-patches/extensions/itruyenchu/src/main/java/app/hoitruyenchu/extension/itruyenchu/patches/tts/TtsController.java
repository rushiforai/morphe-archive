package app.hoitruyenchu.extension.itruyenchu.patches.tts;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.media.AudioManager;
import android.os.Build;
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
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import app.hoitruyenchu.extension.itruyenchu.patches.shared.HtcPatches;
import app.hoitruyenchu.extension.itruyenchu.patches.shared.HtcSettings;
import app.hoitruyenchu.extension.itruyenchu.patches.shared.JsBridge;

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
    private static final long INIT_WAIT_MS = 6_000;
    /** A line started this soon after the previous one ended belongs to a reading going on by itself. */
    private static final long CONTINUOUS_MS = 20_000;
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
        /** The engine is given text.substring(offset): the line goes on from a word. */
        int offset;
        /** Start of the word being spoken (onRangeStart), index in text; -1 unknown. */
        int progress = -1;
        /** When the engine started this utterance (elapsedRealtime), 0 = not started. */
        long startedAt;
        /** Position the line was stopped at (before the "start from" setting), -1 none. */
        int parkedAt = -1;

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

    /** Engine package the current engine was created with ("" = system default). */
    private static String engineInUse = "";
    private static boolean settingsListening;
    private static boolean noisyRegistered;

    private TtsController() {
    }

    // ---------------------------------------------------------------------------------------------
    // Resume from the exact word
    //
    // The engine reports the word it is saying (onRangeStart). When a line is stopped in the middle
    // (pause button, media controls, call, headphones, sleep timer, speed change) the position is
    // kept: lines kept in "pending" are sent again from that word, and for a stop by the app
    // (Speech.stop(), the line is dropped) the position is remembered per line text, also across
    // restarts (SharedPreferences htc_word_points). The next time that line is the first one spoken
    // after a stop, it starts from the word. A line spoken as part of a running reading (the previous
    // line just ended) always starts at its beginning.

    private static final String WORD_PREFS = "htc_word_points";
    private static final int MAX_POINTS = 300;
    private static final long POINT_MAX_AGE_MS = 30L * 24 * 3600_000;
    private static final long HINT_MS = 8_000;
    /** Line key -> {pos, time}: where an app-stopped line was. Access order: oldest first. */
    private static LinkedHashMap<String, long[]> wordPoints;
    private static boolean pointsDirty;
    /** Positions asked by the scripts (tapped word, "read the line again") per line key: {pos, until}. */
    private static final HashMap<String, long[]> hints = new HashMap<>();
    /** Characters per second at speed 1 (measured on finished lines). */
    private static float charsPerSecond = 14f;
    private static final String WORD_EVENT = "htcWord";
    private static boolean rangeEventsSeen;

    private static boolean wordEnabled() {
        return HtcSettings.bool(HtcSettings.WORD_ENABLED);
    }

    private static String lineKey(String text) {
        String t = text == null ? "" : text.trim();
        return t.length() + ":" + t.hashCode();
    }

    /**
     * A script asks for the next time this line is spoken to start at pos (a tapped word; 0 = from
     * its start). Called from the AsyncStorage thread.
     */
    public static void hint(String text, int pos, boolean keep) {
        if (text == null || text.isEmpty()) return;
        synchronized (lock) {
            if (keep) {
                // A marked line, played later: like a line stopped at that word.
                hints.remove(lineKey(text));
                savePointLocked(text, Math.max(0, pos));
            } else {
                hints.put(lineKey(text), new long[]{Math.max(0, pos), SystemClock.elapsedRealtime() + HINT_MS});
            }
        }
        Log.i(TAG, (keep ? "marked line starts at " : "next start of the line at ") + pos + " (asked by the reader)");
    }

    private static LinkedHashMap<String, long[]> pointsLocked() {
        if (wordPoints != null) return wordPoints;
        wordPoints = new LinkedHashMap<>(64, 0.75f, true);
        try {
            Context c = appContext != null ? appContext : HtcSettings.context();
            if (c != null) {
                String json = c.getSharedPreferences(WORD_PREFS, Context.MODE_PRIVATE).getString("points", null);
                if (json != null) {
                    JSONObject o = new JSONObject(json);
                    long now = System.currentTimeMillis();
                    for (java.util.Iterator<String> it = o.keys(); it.hasNext(); ) {
                        String k = it.next();
                        org.json.JSONArray a = o.optJSONArray(k);
                        if (a == null || a.length() < 2) continue;
                        long t = a.optLong(1);
                        if (now - t > POINT_MAX_AGE_MS) continue;
                        wordPoints.put(k, new long[]{a.optLong(0), t});
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "could not read word positions", t);
        }
        return wordPoints;
    }

    private static void savePointLocked(String text, int pos) {
        LinkedHashMap<String, long[]> points = pointsLocked();
        String key = lineKey(text);
        if (pos <= 0 || pos >= text.trim().length() - 1) {
            if (points.remove(key) != null) schedulePointsSaveLocked();
            return;
        }
        points.put(key, new long[]{pos, System.currentTimeMillis()});
        while (points.size() > MAX_POINTS) {
            String oldest = points.keySet().iterator().next();
            points.remove(oldest);
        }
        schedulePointsSaveLocked();
    }

    private static void dropPointLocked(String text) {
        if (text == null) return;
        LinkedHashMap<String, long[]> points = pointsLocked();
        if (points.remove(lineKey(text)) != null) schedulePointsSaveLocked();
    }

    private static void schedulePointsSaveLocked() {
        if (pointsDirty) return;
        pointsDirty = true;
        main.postDelayed(() -> {
            String json;
            Context c;
            synchronized (lock) {
                pointsDirty = false;
                JSONObject o = new JSONObject();
                try {
                    for (Map.Entry<String, long[]> e : pointsLocked().entrySet()) {
                        o.put(e.getKey(), new org.json.JSONArray().put(e.getValue()[0]).put(e.getValue()[1]));
                    }
                } catch (Throwable ignored) {
                }
                json = o.toString();
                c = appContext != null ? appContext : HtcSettings.context();
            }
            try {
                if (c != null) c.getSharedPreferences(WORD_PREFS, Context.MODE_PRIVATE).edit().putString("points", json).apply();
            } catch (Throwable t) {
                Log.w(TAG, "could not save word positions", t);
            }
        }, 2_000);
    }

    private static boolean isWordChar(char c) {
        return !Character.isWhitespace(c);
    }

    private static int wordStart(String text, int pos) {
        int p = Math.max(0, Math.min(pos, text.length()));
        while (p > 0 && isWordChar(text.charAt(p - 1))) p--;
        return p;
    }

    private static int previousWord(String text, int start) {
        int p = start;
        while (p > 0 && !isWordChar(text.charAt(p - 1))) p--;
        return wordStart(text, p);
    }

    private static boolean isPhraseEnd(char c) {
        return ",.;:!?…—–\"“”()[]".indexOf(c) >= 0;
    }

    /** Where to go on from a line stopped at pos, by the "start from" setting. */
    private static int resumeFrom(String text, int pos, float rate, boolean exactWord) {
        if (text == null || pos <= 0) return 0;
        String mode = exactWord ? "word" : HtcSettings.string(HtcSettings.WORD_FROM);
        int p;
        switch (mode) {
            case "back":
                p = previousWord(text, previousWord(text, wordStart(text, pos)));
                break;
            case "phrase": {
                int i = Math.min(pos, text.length()) - 1;
                while (i >= 0 && !isPhraseEnd(text.charAt(i))) i--;
                p = i + 1;
                while (p < text.length() && (Character.isWhitespace(text.charAt(p)) || isPhraseEnd(text.charAt(p)))) p++;
                if (p >= pos) p = wordStart(text, pos);
                break;
            }
            case "seconds":
                p = wordStart(text, pos - Math.round(2f * charsPerSecond * Math.max(0.25f, rate)));
                break;
            default:
                p = wordStart(text, pos);
        }
        if (p >= text.trim().length() - 1) return 0;
        return Math.max(0, p);
    }

    /** Index in u.text the engine has reached. */
    private static int progressOfLocked(Utterance u) {
        if (!u.sent) return u.parkedAt >= 0 ? u.parkedAt : u.offset;
        if (u.progress >= 0) return u.progress;
        if (u.startedAt <= 0) return u.offset;
        // No word events from this engine: estimate from the time spoken.
        float rate = appliedRate != null ? appliedRate : 1f;
        long ms = SystemClock.elapsedRealtime() - u.startedAt;
        int chars = Math.round(ms / 1000f * charsPerSecond * rate);
        return Math.min(u.text.length(), u.offset + Math.max(0, chars - 2));
    }

    /**
     * The utterance was stopped by us and will be sent again: from the word reached (exactWord: a
     * speed change, no repeat) or by the "start from" setting.
     */
    private static void parkLocked(Utterance u, boolean exactWord) {
        if (!wordEnabled()) {
            u.offset = 0;
        } else {
            int at = progressOfLocked(u);
            u.parkedAt = at;
            u.offset = resumeFrom(u.text, at, appliedRate != null ? appliedRate : 1f, exactWord);
        }
        u.progress = -1;
        u.startedAt = 0;
    }

    private static void emitWord(final Utterance u, final int start, final int end) {
        if (u == null || "off".equals(HtcSettings.string(HtcSettings.WORD_KARAOKE))
                || !HtcSettings.bool(HtcSettings.WORD_ENABLED)) return;
        try {
            JSONObject o = new JSONObject().put("s", start).put("e", end).put("k", lineKey(u.text))
                    .put("c", (double) charsPerSecond);
            JsBridge.emit(WORD_EVENT, o.toString());
        } catch (Throwable ignored) {
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Settings (see HtcSettings)

    private static boolean enabled() {
        return HtcSettings.bool(HtcSettings.TTS_ENABLED);
    }

    private static int maxRetries() {
        if (!enabled()) return 0;
        return Math.max(0, Math.min(5, HtcSettings.integer(HtcSettings.TTS_RETRIES)));
    }

    /** "resume" (pause, read on after the call), "pause" (pause only) or "none". */
    private static String callMode() {
        return enabled() ? HtcSettings.string(HtcSettings.TTS_CALL) : "none";
    }

    private static boolean applySpeedNow() {
        return HtcSettings.on(HtcSettings.TTS_ENABLED, HtcSettings.TTS_APPLY_SPEED);
    }

    private static String chosenEngine() {
        return enabled() ? HtcSettings.string(HtcSettings.TTS_ENGINE) : "";
    }

    private static String chosenVoice() {
        return enabled() ? HtcSettings.string(HtcSettings.TTS_VOICE) : "";
    }

    private static void listenToSettingsLocked() {
        if (settingsListening) return;
        settingsListening = true;
        HtcSettings.addListener(() -> {
            synchronized (lock) {
                appliedVoice = null;
                if (tts != null && !chosenEngine().equals(engineInUse)) {
                    createLocked("engine changed in the settings");
                }
            }
        });
    }

    /** Headphones unplugged / Bluetooth audio disconnected: pause like the app's pause button. */
    private static void registerNoisyLocked() {
        if (noisyRegistered || appContext == null) return;
        noisyRegistered = true;
        try {
            BroadcastReceiver receiver = new BroadcastReceiver() {
                @Override
                public void onReceive(Context context, Intent intent) {
                    if (!AudioManager.ACTION_AUDIO_BECOMING_NOISY.equals(intent.getAction())) return;
                    if (!HtcSettings.on(HtcSettings.TTS_ENABLED, HtcSettings.TTS_NOISY) || !isReading()) return;
                    Log.i(TAG, "headphones / Bluetooth disconnected, pausing");
                    requestPause();
                }
            };
            IntentFilter filter = new IntentFilter(AudioManager.ACTION_AUDIO_BECOMING_NOISY);
            if (Build.VERSION.SDK_INT >= 33) {
                appContext.registerReceiver(receiver, filter, Context.RECEIVER_EXPORTED);
            } else {
                appContext.registerReceiver(receiver, filter);
            }
        } catch (Throwable t) {
            Log.w(TAG, "could not watch headphones", t);
        }
    }

    /**
     * Pauses the reading the way the app's pause button does: the engine stops at once (the line is
     * kept), and the scripts are asked to press the voice bar's pause button so the app shows it.
     */
    public static void requestPause() {
        pauseByUser();
        try {
            JSONObject command = new JSONObject().put("cmd", "pause").put("id", SystemClock.elapsedRealtime());
            JsBridge.emit(JsBridge.EVENT_COMMAND, command.toString());
        } catch (Throwable ignored) {
        }
    }

    static boolean isEndOfChapter(String text) {
        return END_OF_CHAPTER.equals(text);
    }

    /** "Chương 12: Tên chương", the first line of a chapter text. */
    private static final Pattern CHAPTER_HEADER = Pattern.compile(
            "^\\s*ch(?:ươ|uo|ư)ng\\s*\\d+(?:[.,]\\d+)?\\b.{0,200}$",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);

    private static boolean skipLine(String text) {
        if (text == null || !HtcPatches.chapterTitles()) return false;
        if (!HtcSettings.on(HtcSettings.TITLES_ENABLED, HtcSettings.TITLES_SKIP_HEADER)) return false;
        return CHAPTER_HEADER.matcher(Normalizer.normalize(text, Normalizer.Form.NFC)).matches();
    }

    /** The line is not spoken: the app gets its start / done events as if it had been. */
    private static void fakeSpoken(final String id) {
        main.post(() -> {
            UtteranceProgressListener l = appListener;
            if (l == null) return;
            l.onStart(id);
            l.onDone(id);
        });
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
            listenToSettingsLocked();
            registerNoisyLocked();
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
            if (skipLine(text)) {
                Log.i(TAG, "chapter title line not read aloud");
                spokeSinceStop = true;
                lastDoneAt = SystemClock.elapsedRealtime();
                touchLocked();
                fakeSpoken(id);
                return;
            }
            // A line ended a moment ago: the reading goes on (the app stops the speech itself when it
            // changes chapter, so a stop in between does not count).
            boolean continuous = !userPaused && lastDoneAt > 0
                    && SystemClock.elapsedRealtime() - lastDoneAt < CONTINUOUS_MS;
            if (HtcPatches.backgroundReading() && SleepTimer.shouldStop(continuous)) {
                // Sleep timer over: keep the line, stop here and let the app show "paused".
                spokeSinceStop = true;
                pending.put(id, new Utterance(id, text, language, pitch, rate, voice));
                stopForSleepLocked();
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
            u.offset = startOffsetLocked(text, continuous);
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

    /** Where a line the app asks for starts: a script's hint, or the word it was stopped at. */
    private static int startOffsetLocked(String text, boolean continuous) {
        if (text == null) return 0;
        String key = lineKey(text);
        long[] hint = hints.remove(key);
        if (hint != null && hint[1] >= SystemClock.elapsedRealtime()) {
            dropPointLocked(text);
            int pos = (int) Math.min(hint[0], text.length());
            int from = pos > 0 ? wordStart(text, pos) : 0;
            if (from >= text.trim().length() - 1) from = 0;
            Log.i(TAG, "line starts at " + from + " (asked by the reader)");
            return from;
        }
        // In a running reading the next line starts at its beginning: the previous one just ended
        // and nobody stopped the speech since.
        boolean chained = continuous && lastDoneAt > lastStopAt;
        if (chained || !wordEnabled()) return 0;
        long[] point = pointsLocked().get(key);
        if (point == null) return 0;
        int from = resumeFrom(text, (int) point[0], appliedRate != null ? appliedRate : 1f, false);
        if (from > 0) Log.i(TAG, "going on from character " + from + " of the line (stopped at " + point[0] + ")");
        return from;
    }

    /** Sleep timer over before a new line: the line stays queued, the app is asked to show "paused". */
    private static void stopForSleepLocked() {
        userPaused = true;
        final long id = SystemClock.elapsedRealtime();
        main.post(() -> {
            notifyMedia();
            try {
                JSONObject command = new JSONObject().put("cmd", "pause").put("id", id).put("sleep", true);
                JsBridge.emit(JsBridge.EVENT_COMMAND, command.toString());
            } catch (Throwable ignored) {
            }
        });
    }

    /** Replaces textToSpeech.stop() called by JS Speech.stop(). */
    public static int stop(TextToSpeech engine) {
        synchronized (lock) {
            // Remember where the lines in flight were (pause button, chapter change, tap on a line).
            if (wordEnabled()) {
                for (Utterance u : pending.values()) {
                    if (!u.sent && u.parkedAt < 0) continue;
                    int at = progressOfLocked(u);
                    if (at > 0) {
                        savePointLocked(u.text, at);
                        Log.i(TAG, "stopped at character " + at + "/" + u.text.length() + " of the line");
                    }
                }
            }
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
            if (!applySpeedNow()) return; // used from the next play, like the original app
            if (tts == null || !ready || blockedLocked()) return;
            // Speak the current line again at the new speed (the engine cannot change it mid-line).
            boolean restart = false;
            for (Utterance u : pending.values()) {
                if (!u.sent) continue;
                respoken.add(u.id);
                parkLocked(u, true);
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
            if (!HtcSettings.bool(HtcSettings.BG_ENABLED)) return false;
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
        for (Utterance u : pending.values()) {
            if (u.sent) parkLocked(u, true);
            u.sent = false;
        }
        suppressStop.clear();
        respoken.clear();

        if (old != null) {
            try {
                old.setOnUtteranceProgressListener(null);
                old.shutdown();
            } catch (Throwable ignored) {
            }
        }

        String engine = chosenEngine();
        engineInUse = engine;
        Log.i(TAG, "creating engine #" + gen + " (" + reason + ")" + (engine.isEmpty() ? "" : " " + engine));
        try {
            TextToSpeech.OnInitListener onInit = status -> main.post(() -> onInit(gen, status));
            tts = engine.isEmpty()
                    ? new TextToSpeech(appContext, onInit)
                    : new TextToSpeech(appContext, onInit, engine);
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
            String text = u.offset > 0 && u.offset < u.text.length() ? u.text.substring(u.offset) : u.text;
            if (text != u.text) Log.i(TAG, "speaking from character " + u.offset + "/" + u.text.length());
            result = tts.speak(text, TextToSpeech.QUEUE_ADD, null, u.id);
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
        Float rate = chosenRate != null && applySpeedNow() ? chosenRate : u.rate;
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
        // The voice picked in the settings wins over the one the app asks for.
        String wanted = chosenVoice();
        if (wanted.isEmpty()) wanted = u.voice;
        if (wanted != null && !wanted.equals(appliedVoice)) {
            Set<Voice> voices = tts.getVoices();
            boolean found = false;
            if (voices != null) {
                for (Voice v : voices) {
                    if (wanted.equals(v.getName())) {
                        tts.setVoice(v);
                        found = true;
                        break;
                    }
                }
            }
            if (!found && u.voice != null && !u.voice.equals(wanted) && voices != null) {
                // The chosen voice is not in this engine: use the app's.
                for (Voice v : voices) {
                    if (u.voice.equals(v.getName())) {
                        tts.setVoice(v);
                        break;
                    }
                }
            }
            appliedVoice = wanted;
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
            Utterance u;
            synchronized (lock) {
                stallTicks = 0;
                u = pending.get(id);
                text = u != null ? u.text : null;
                rate = appliedRate;
                if (u != null) {
                    u.startedAt = SystemClock.elapsedRealtime();
                    u.progress = -1;
                    u.parkedAt = -1;
                }
            }
            if (u != null) emitWord(u, u.offset, u.offset);
            ReadingProgress.onLineStarted(text, rate);
            notifyMedia();
            UtteranceProgressListener l = appListener;
            if (l != null) l.onStart(id);
        }

        @Override
        public void onDone(String id) {
            if (stale()) return;
            String text;
            synchronized (lock) {
                Utterance u = pending.remove(id);
                text = u != null ? u.text : null;
                suppressStop.remove(id);
                respoken.remove(id);
                touchLocked();
                lastDoneAt = SystemClock.elapsedRealtime();
                if (u != null) {
                    // The line was read to its end: no position to go on from any more.
                    dropPointLocked(u.text);
                    int chars = u.text.length() - u.offset;
                    long ms = u.startedAt > 0 ? lastDoneAt - u.startedAt : 0;
                    float rate = appliedRate != null ? appliedRate : 1f;
                    if (chars >= 20 && ms >= 1_000 && rate > 0) {
                        float cps = chars / (ms / 1000f) / rate;
                        if (cps > 3 && cps < 60) charsPerSecond = charsPerSecond * 0.8f + cps * 0.2f;
                    }
                }
            }
            if (HtcPatches.backgroundReading()) SleepTimer.onLineDone(text);
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
            Utterance u;
            synchronized (lock) {
                u = pending.get(id);
                if (u != null && u.sent) u.progress = Math.min(u.text.length(), u.offset + Math.max(0, start));
                if (!rangeEventsSeen) {
                    rangeEventsSeen = true;
                    Log.i(TAG, "the engine reports the word being spoken");
                }
            }
            if (u != null && u.sent) emitWord(u, u.offset + start, u.offset + end);
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
                if (u.retries < maxRetries()) {
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
                if (u.sent) {
                    suppressStop.add(u.id);
                    parkLocked(u, false);
                }
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
        String callMode = callMode();
        if ("none".equals(callMode) && !interrupted) return;
        if (inCall) {
            normalModeTicks = 0;
            if (!interrupted && !pending.isEmpty()) {
                Log.i(TAG, "call detected (audio mode " + mode + "), pausing speech");
                interrupted = true;
                for (Utterance u : pending.values()) {
                    if (u.sent) {
                        suppressStop.add(u.id);
                        parkLocked(u, false);
                    }
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
                interrupted = false;
                normalModeTicks = 0;
                lastActivity = SystemClock.elapsedRealtime();
                if ("pause".equals(callMode) && !userPaused && !pending.isEmpty()) {
                    // Stay paused: play (app, widget) reads the interrupted line again.
                    Log.i(TAG, "call ended, staying paused");
                    userPaused = true;
                    final long id = SystemClock.elapsedRealtime();
                    main.post(() -> {
                        try {
                            JSONObject command = new JSONObject().put("cmd", "pause").put("id", id);
                            JsBridge.emit(JsBridge.EVENT_COMMAND, command.toString());
                        } catch (Throwable ignored) {
                        }
                    });
                } else {
                    Log.i(TAG, "call ended, resuming " + pending.size() + " utterance(s)");
                }
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
