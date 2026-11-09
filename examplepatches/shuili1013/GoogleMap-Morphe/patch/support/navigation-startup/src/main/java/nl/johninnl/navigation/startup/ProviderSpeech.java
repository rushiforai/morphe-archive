package nl.johninnl.navigation.startup;

import android.content.Context;
import android.media.AudioAttributes;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.speech.tts.TextToSpeech;
import android.speech.tts.UtteranceProgressListener;
import android.util.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Navigation text through the phone's selected speech engine. When DriveDeck is the
 * system engine this is the DriveDeck voice; when it is not, the same code speaks
 * with whatever engine the driver chose.
 *
 * <p>Waze and Flitsmeister hand us text that they already own (Waze voice-asset
 * chunks and Flitsmeister navigation-direction labels). We do not run speech
 * recognition on their recorded audio: the patch replaces the recorded playback
 * with text that is already in the app.
 *
 * <p>The helper is deliberately conservative. If the selected engine is not ready
 * yet, or it rejects the utterance, the caller falls through to its original
 * recorded prompt. Navigation therefore never goes silent because of this patch.
 */
public final class ProviderSpeech {
    private static final String TAG = "NavigationSpeech";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final AtomicLong IDS = new AtomicLong();
    private static final Object LOCK = new Object();
    private static final Map<String, Object> CALLBACKS = new HashMap<>();
    private static final AudioAttributes ATTRIBUTES = new AudioAttributes.Builder()
        .setUsage(AudioAttributes.USAGE_ASSISTANCE_NAVIGATION_GUIDANCE)
        .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
        .build();

    private static volatile Context app;
    private static volatile TextToSpeech engine;
    private static volatile boolean ready;

    /** Waze's bundled recorded prompt clips, by lower-case basename. */
    private static final Map<String, String> ASSET_TEXT = buildAssetText();

    private static Map<String, String> buildAssetText() {
        Map<String, String> map = new java.util.HashMap<>();
        map.put("turnleft", "Turn left");
        map.put("turnright", "Turn right");
        map.put("straight", "Continue straight");
        map.put("uturn", "Make a U-turn");
        map.put("exit", "Take the exit");
        map.put("exitleft", "Take the left exit");
        map.put("exitright", "Take the right exit");
        map.put("keepleft", "Keep left");
        map.put("keepright", "Keep right");
        map.put("roundabout", "At the roundabout");
        map.put("first", "Take the first exit");
        map.put("second", "Take the second exit");
        map.put("third", "Take the third exit");
        map.put("fourth", "Take the fourth exit");
        map.put("fifth", "Take the fifth exit");
        map.put("sixth", "Take the sixth exit");
        map.put("seventh", "Take the seventh exit");
        map.put("eighth", "Take the eighth exit");
        map.put("andthen", "and then");
        map.put("arrive", "You have arrived");
        map.put("200meters", "In 200 meters");
        map.put("400meters", "In 400 meters");
        map.put("800meters", "In 800 meters");
        map.put("1000meters", "In 1 kilometer");
        map.put("1500meters", "In 1.5 kilometers");
        map.put("200", "200");
        map.put("400", "400");
        map.put("800", "800");
        map.put("1000", "1,000");
        map.put("1500", "1,500");
        for (int i = 0; i <= 9; i++) map.put(i == 0 ? "startdrive" : "startdrive" + i, "Start driving");
        map.put("approachaccident", "Accident ahead");
        map.put("approachhazard", "Hazard ahead");
        map.put("approachredlightcam", "Red light camera ahead");
        map.put("approachspeedcam", "Speed camera ahead");
        map.put("approachtraffic", "Traffic ahead");
        map.put("police", "Police ahead");
        return map;
    }

    /** Text for a recorded Waze prompt path/key, or null when it is not a speech clip. */
    public static String assetText(String pathOrKey) {
        if (pathOrKey == null) return null;
        String value = pathOrKey;
        int slash = Math.max(value.lastIndexOf('/'), value.lastIndexOf('\\'));
        if (slash >= 0) value = value.substring(slash + 1);
        int dot = value.lastIndexOf('.');
        if (dot > 0) value = value.substring(0, dot);
        return ASSET_TEXT.get(value.toLowerCase(java.util.Locale.ROOT));
    }

    /** Speak a known recorded prompt instead of playing Waze's bundled clip. */
    public static boolean speakAsset(String pathOrKey, Object completion) {
        String text = assetText(pathOrKey);
        if (text == null) return false;
        return speak(text, completion);
    }

    private ProviderSpeech() {}

    /** Keeps the application context and starts the selected engine once. */
    public static void init(Context context) {
        if (context == null) return;
        Context next = context.getApplicationContext();
        synchronized (LOCK) {
            if (app != next) app = next;
            if (engine != null) return;
            final TextToSpeech created = new TextToSpeech(next, status -> {
                if (status == TextToSpeech.SUCCESS) {
                    try {
                        engine.setAudioAttributes(ATTRIBUTES);
                        engine.setOnUtteranceProgressListener(LISTENER);
                    } catch (RuntimeException error) {
                        Log.w(TAG, "speech engine setup failed", error);
                        return;
                    }
                    ready = true;
                    Log.i(TAG, "navigation speech engine ready");
                } else {
                    ready = false;
                    Log.w(TAG, "speech engine unavailable: " + status);
                }
            });
            engine = created;
        }
    }

    /**
     * Google Maps constructs a TextToSpeech with an explicit engine package. Returning a
     * default-engine instance lets the system-selected voice take over without naming a
     * package in the patch.
     */
    public static TextToSpeech create(Context context, TextToSpeech.OnInitListener listener) {
        init(context);
        return new TextToSpeech(context, listener);
    }

    /**
     * Maps validates the engine that actually completed initialization. Accept the
     * system-selected engine instead of requiring Google's package.
     */
    public static boolean acceptedEngine(String engineName) {
        return engineName != null && !engineName.isEmpty();
    }

    /** Speak and invoke a Waze-style completion object exactly once when the audio ends. */
    public static boolean speak(String text, Object completion) {
        return speak(app, text, completion);
    }

    private static boolean speak(Context context, String text, Object completion) {
        if (text == null) return false;
        String phrase = text.trim();
        if (phrase.isEmpty()) return false;

        if (context != null) init(context);
        TextToSpeech tts = ready ? engine : null;
        if (tts == null) return false;

        String id = "navigation-" + IDS.incrementAndGet();
        if (completion != null) {
            synchronized (LOCK) { CALLBACKS.put(id, completion); }
        }
        Bundle params = new Bundle();
        params.putFloat(TextToSpeech.Engine.KEY_PARAM_VOLUME, 1.0f);
        int result;
        try {
            result = engine.speak(phrase, TextToSpeech.QUEUE_ADD, params, id);
        } catch (RuntimeException error) {
            Log.w(TAG, "speak failed", error);
            result = TextToSpeech.ERROR;
        }
        if (result != TextToSpeech.SUCCESS) {
            synchronized (LOCK) { CALLBACKS.remove(id); }
            return false;
        }
        return true;
    }

    /**
     * Synthesize [text] to [path] with the selected engine, blocking the caller until the
     * file is complete. Maps' navigation queue expects a file it can hand to MediaPlayer.
     * A PCM engine result is wrapped in a RIFF/WAVE header; an engine that already wrote
     * a container is copied unchanged. Returns false so the caller can fall back.
     */
    public static boolean synthesizeToFile(String text, String path) {
        return synthesizeToFile(text, path, null);
    }

    public static boolean synthesizeToFile(String text, String path, String languageTag) {
        if (text == null || path == null) return false;
        String phrase = text.trim();
        if (phrase.isEmpty()) return false;
        Context context = application();
        if (context == null) return false;

        File target = new File(path);
        File parent = target.getParentFile();
        if (parent != null && !parent.exists() && !parent.mkdirs()) return false;
        File temp;
        try {
            temp = File.createTempFile("navigation-speech-", ".audio", parent);
        } catch (IOException error) {
            Log.w(TAG, "could not create synthesis file", error);
            return false;
        }

        CountDownLatch initialized = new CountDownLatch(1);
        CountDownLatch finished = new CountDownLatch(1);
        AtomicInteger rate = new AtomicInteger(24_000);
        final boolean[] ok = {false};
        UtteranceProgressListener listener = new UtteranceProgressListener() {
            @Override public void onStart(String id) {}
            @Override public void onDone(String id) { ok[0] = true; finished.countDown(); }
            @Override public void onError(String id) { finished.countDown(); }
            @Override public void onStop(String id, boolean interrupted) { finished.countDown(); }
            @Override public void onBeginSynthesis(String id, int sampleRateInHz, int audioFormat, int channelCount) {
                rate.set(sampleRateInHz);
            }
        };
        try {
            TextToSpeech tts = new TextToSpeech(context, status -> initialized.countDown());
            if (!initialized.await(6, TimeUnit.SECONDS)) {
                tts.shutdown(); temp.delete(); return false;
            }
            try {
                tts.setAudioAttributes(ATTRIBUTES);
                tts.setOnUtteranceProgressListener(listener);
                if (languageTag != null && !languageTag.isEmpty()) {
                    tts.setLanguage(java.util.Locale.forLanguageTag(languageTag));
                }
            } catch (RuntimeException error) {
                Log.w(TAG, "synthesis engine setup failed", error);
            }
            Bundle params = new Bundle();
            params.putFloat(TextToSpeech.Engine.KEY_PARAM_VOLUME, 1.0f);
            int result = tts.synthesizeToFile(phrase, params, temp, "navigation-synthesis");
            if (result != TextToSpeech.SUCCESS || !finished.await(25, TimeUnit.SECONDS) || !ok[0]) {
                tts.shutdown(); temp.delete(); return false;
            }
            tts.shutdown();
            if (!wrapIfPcm(temp, target, rate.get())) {
                temp.delete(); return false;
            }
            temp.delete();
            return target.length() > 44;
        } catch (InterruptedException error) {
            Thread.currentThread().interrupt();
            temp.delete();
            return false;
        } catch (RuntimeException error) {
            Log.w(TAG, "synthesis failed", error);
            temp.delete();
            return false;
        }
    }

    /** Current application without requiring a patch hook in every app's Application class. */
    private static Context application() {
        Context context = app;
        if (context != null) return context;
        try {
            Class<?> threadClass = Class.forName("android.app.ActivityThread");
            Object thread = threadClass.getMethod("currentActivityThread").invoke(null);
            if (thread == null) return null;
            Object value = thread.getClass().getMethod("getApplication").invoke(thread);
            if (value instanceof Context) {
                Context found = ((Context) value).getApplicationContext();
                if (found != null) { app = found; return found; }
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
        }
        return null;
    }

    private static boolean wrapIfPcm(File source, File target, int rate) {
        try {
            byte[] data = new byte[(int) source.length()];
            try (FileInputStream input = new FileInputStream(source)) {
                int at = 0;
                while (at < data.length) {
                    int read = input.read(data, at, data.length - at);
                    if (read < 0) break;
                    at += read;
                }
                if (at != data.length) return false;
            }
            boolean riff = data.length >= 12 && data[0] == 'R' && data[1] == 'I' && data[2] == 'F' && data[3] == 'F';
            boolean mp3 = data.length >= 2 && (data[0] & 0xff) == 0xff && (data[1] & 0xe0) == 0xe0;
            boolean id3 = data.length >= 3 && data[0] == 'I' && data[1] == 'D' && data[2] == '3';
            boolean ogg = data.length >= 4 && data[0] == 'O' && data[1] == 'g' && data[2] == 'g' && data[3] == 'S';
            try (FileOutputStream output = new FileOutputStream(target)) {
                if (!riff && !mp3 && !id3 && !ogg) {
                    int byteRate = rate * 2;
                    writeAscii(output, "RIFF");
                    writeInt(output, 36 + data.length);
                    writeAscii(output, "WAVEfmt ");
                    writeInt(output, 16);
                    writeShort(output, 1);
                    writeShort(output, 1);
                    writeInt(output, rate);
                    writeInt(output, byteRate);
                    writeShort(output, 2);
                    writeShort(output, 16);
                    writeAscii(output, "data");
                    writeInt(output, data.length);
                }
                output.write(data);
            }
            return true;
        } catch (IOException | RuntimeException error) {
            Log.w(TAG, "could not write synthesized audio", error);
            return false;
        }
    }

    private static void writeAscii(FileOutputStream out, String value) throws IOException {
        for (int i = 0; i < value.length(); i++) out.write(value.charAt(i));
    }
    private static void writeInt(FileOutputStream out, int value) throws IOException {
        out.write(value & 0xff); out.write((value >> 8) & 0xff);
        out.write((value >> 16) & 0xff); out.write((value >> 24) & 0xff);
    }
    private static void writeShort(FileOutputStream out, int value) throws IOException {
        out.write(value & 0xff); out.write((value >> 8) & 0xff);
    }

    /** Stop queued navigation speech, for example when the route is cancelled. */
    public static void stop() {
        TextToSpeech tts = engine;
        if (tts != null) {
            try { tts.stop(); } catch (RuntimeException error) { Log.w(TAG, "stop failed", error); }
        }
        synchronized (LOCK) { CALLBACKS.clear(); }
    }

    private static final UtteranceProgressListener LISTENER = new UtteranceProgressListener() {
        @Override public void onStart(String utteranceId) {}

        @Override public void onDone(String utteranceId) { complete(utteranceId); }

        @Override public void onError(String utteranceId) { complete(utteranceId); }

        @Override public void onStop(String utteranceId, boolean interrupted) { complete(utteranceId); }
    };

    private static void complete(String utteranceId) {
        Object callback;
        synchronized (LOCK) { callback = CALLBACKS.remove(utteranceId); }
        if (callback == null) return;
        Object value = callback;
        MAIN.post(() -> invoke(value));
    }

    private static void invoke(Object callback) {
        try {
            Method method = callback.getClass().getMethod("invoke");
            method.setAccessible(true);
            method.invoke(callback);
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w(TAG, "prompt completion callback failed", error);
        }
    }
}
