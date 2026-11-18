package dev.jason.gboardpatches.extension.rambler;

import android.os.SystemClock;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.List;

/**
 * Stops Rambler after a chosen number of seconds without new speech.
 *
 * <p>Gboard's voice input manager stops listening when its timeout runs out; for Rambler that
 * timer is a fixed five-minute session limit. With a silence time chosen under Voice typing →
 * Rambler, the patch gives that timer the chosen seconds and restarts it while you speak, so
 * Rambler stops and keeps the text as when ✓ is tapped.
 *
 * <p>Rambler sends no transcript text while you dictate (only after it stops), so speech is
 * detected from Gboard's speech level instead: 0..100, measured against an adaptive background
 * noise floor (about 17 at the floor, 100 at 10 dB above it). Gboard itself treats a level below
 * {@link #SPEECH_LEVEL} as silence for its animation; steady background noise stays near the floor.
 */
public final class GboardRamblerSilenceRuntime {
    /** Preference written by the Stop after silence list under Rambler settings. */
    public static final String PREF_KEY = "morphe_rambler_silence_stop";
    /** Three seconds unless the user picks another time or Off. */
    public static final String DEFAULT_VALUE = "3";
    static final long MAX_SECONDS = 60L;
    static final String TAG = "MorpheRamblerSilence";
    /** Gboard's own speech threshold (agentic_dictation_min_speech_level_for_animation). */
    static final int SPEECH_LEVEL = 50;
    private static final long RESTART_INTERVAL_MS = 250L;

    private static final Object LOCK = new Object();
    private static long sessionSeconds;
    private static boolean sessionActive;
    private static String lastText = "";
    private static long sessionStartMs;
    private static long lastNewSpeechMs;
    private static int updates;
    private static int newText;
    private static int withoutNewText;
    private static long lastRestartMs;
    private static int levels;
    private static int levelSum;
    private static int levelMin = Integer.MAX_VALUE;
    private static int levelMax;
    private static int levelsAtSpeech;

    private GboardRamblerSilenceRuntime() {
    }

    /** The stored choice in seconds; 0 (off) for anything missing or unexpected. */
    public static long silenceSeconds(String stored) {
        if (stored == null) {
            return 0L;
        }
        try {
            long seconds = Long.parseLong(stored.trim());
            return seconds > 0L && seconds <= MAX_SECONDS ? seconds : 0L;
        } catch (NumberFormatException invalid) {
            return 0L;
        }
    }

    /**
     * Called when a voice session starts listening. Returns the timeout to arm in seconds, or 0
     * to leave Gboard's own timer alone (not a Rambler session, or the setting is off).
     */
    public static long onSessionStart(boolean ramblerSession, String stored) {
        long seconds = ramblerSession ? silenceSeconds(stored) : 0L;
        synchronized (LOCK) {
            sessionSeconds = seconds;
            sessionActive = ramblerSession;
            lastText = "";
            sessionStartMs = now();
            lastNewSpeechMs = sessionStartMs;
            updates = 0;
            newText = 0;
            withoutNewText = 0;
            lastRestartMs = 0L;
            resetLevels();
        }
        if (ramblerSession) {
            log("Rambler session started; setting=" + stored + ", silence timeout "
                    + (seconds > 0L ? seconds + " s" : "off"));
        }
        return seconds;
    }

    /** The timeout armed for the current session, in seconds; 0 when off. */
    public static long sessionSeconds() {
        synchronized (LOCK) {
            return sessionSeconds;
        }
    }

    /**
     * Called with every speech level (0..100). Returns true when the silence timer should restart:
     * a Rambler session with the timer armed, a level at or above {@link #SPEECH_LEVEL}, and no
     * restart in the last {@link #RESTART_INTERVAL_MS} ms.
     */
    public static boolean onSpeechLevel(boolean ramblerSession, int level) {
        if (!ramblerSession) {
            return false;
        }
        boolean restart = false;
        synchronized (LOCK) {
            if (!sessionActive) {
                return false;
            }
            long at = now();
            levels++;
            levelSum += level;
            levelMin = Math.min(levelMin, level);
            levelMax = Math.max(levelMax, level);
            if (level >= SPEECH_LEVEL) {
                levelsAtSpeech++;
                lastNewSpeechMs = at;
                if (sessionSeconds > 0L && at - lastRestartMs >= RESTART_INTERVAL_MS) {
                    lastRestartMs = at;
                    restart = true;
                }
            }
        }
        return restart;
    }

    /**
     * Called for every transcript update; counted for the log only. Rambler sends its text when it
     * stops, so updates cannot tell speech from silence. Returns whether the update had new text.
     */
    public static boolean onTranscriptionUpdate(boolean ramblerSession, Object update) {
        if (!ramblerSession) {
            return false;
        }
        String text = transcriptText(update);
        synchronized (LOCK) {
            boolean fresh = !text.trim().isEmpty() && !text.equals(lastText);
            if (fresh) {
                lastText = text;
                newText++;
            } else {
                withoutNewText++;
            }
            updates++;
            return fresh;
        }
    }

    private static void resetLevels() {
        levels = 0;
        levelSum = 0;
        levelMin = Integer.MAX_VALUE;
        levelMax = 0;
        levelsAtSpeech = 0;
    }

    /** Called with Gboard's reason whenever its voice input manager stops listening. */
    public static void onStopListening(Object reason) {
        String line;
        synchronized (LOCK) {
            if (!sessionActive) {
                return;
            }
            long at = now();
            line = "stop listening: " + reason + " (timeout " + (sessionSeconds > 0L ? sessionSeconds + " s" : "off") + ") after " + seconds(at - sessionStartMs) + " s, "
                    + seconds(at - lastNewSpeechMs) + " s since speech (levels=" + levels + " atSpeech=" + levelsAtSpeech
                    + " max=" + levelMax + ", updates=" + updates
                    + " newText=" + newText + " withoutNewText=" + withoutNewText + ")";
            sessionActive = false;
        }
        log(line);
    }

    /**
     * The text strings of a transcript update, joined: the String fields of each result in the
     * update's result list. Proto field names are obfuscated, so they are read by type.
     */
    static String transcriptText(Object update) {
        if (update == null) {
            return "";
        }
        StringBuilder text = new StringBuilder();
        try {
            for (Field listField : declaredFields(update.getClass())) {
                if (!List.class.isAssignableFrom(listField.getType())) {
                    continue;
                }
                Object results = listField.get(update);
                if (!(results instanceof List)) {
                    continue;
                }
                for (Object result : (List<?>) results) {
                    if (result == null) {
                        continue;
                    }
                    for (Field field : declaredFields(result.getClass())) {
                        if (field.getType() == String.class) {
                            Object value = field.get(result);
                            if (value != null) {
                                text.append(value).append('\u0001');
                            }
                        }
                    }
                }
            }
        } catch (Throwable unreadable) {
            return "";
        }
        return text.toString().replace('\u0001', ' ').trim().isEmpty() ? "" : text.toString();
    }

    private static Field[] declaredFields(Class<?> type) {
        Field[] fields = type.getDeclaredFields();
        int kept = 0;
        for (Field field : fields) {
            if (!Modifier.isStatic(field.getModifiers())) {
                field.setAccessible(true);
                fields[kept++] = field;
            }
        }
        Field[] instance = new Field[kept];
        System.arraycopy(fields, 0, instance, 0, kept);
        return instance;
    }

    private static String seconds(long millis) {
        return String.valueOf(Math.round(millis / 100.0) / 10.0);
    }

    private static long now() {
        try {
            return SystemClock.elapsedRealtime();
        } catch (Throwable jvm) {
            return System.nanoTime() / 1_000_000L;
        }
    }

    private static void log(String message) {
        try {
            Log.i(TAG, message);
        } catch (Throwable jvm) {
            // Unit tests run without Android's logger.
        }
    }
}
