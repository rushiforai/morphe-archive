package app.hoitruyenchu.extension.itruyenchu.patches.media;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

import androidx.media3.common.Player;

import org.json.JSONObject;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import app.hoitruyenchu.extension.itruyenchu.patches.shared.JsScripts;
import app.hoitruyenchu.extension.itruyenchu.patches.tts.TtsController;
import okhttp3.OkHttpClient;

/**
 * The voice bar plays a silent 6 s mp3 with expo-audio only to get a media notification; the
 * media widget / lock screen therefore showed that file (00:00 / 00:06, paused) and its buttons
 * controlled the silent file instead of the reading.
 * <p>
 * The player given to the MediaSession of expo-audio's AudioControlsService is replaced with
 * {@link TtsSessionPlayer}, which shows the TTS reading: playing / paused, the position in the
 * chapter. Its buttons (play, pause, next, previous) are sent to the app as a device event and done
 * by the voice bar's own buttons ({@link VoiceBarScript}); when the app does not answer (voice bar
 * not shown), play / pause fall back to pausing / resuming the TTS engine here.
 * All public static methods are called from patched smali or from TtsController.
 */
@SuppressWarnings("unused")
public final class TtsMediaSession {
    static final String TAG = "HTC-Media";

    private static final String EVENT = "htcMediaCommand";
    /** How long the app has to answer a command before the fallback runs. */
    private static final long ANSWER_TIMEOUT_MS = 2_000;
    /** How long the widget shows the requested play / pause while the app carries it out. */
    private static final long EXPECT_MS = 3_000;

    private static final Object lock = new Object();
    private static final ArrayList<WeakReference<TtsSessionPlayer>> players = new ArrayList<>();
    private static final Handler main = new Handler(Looper.getMainLooper());

    private static WeakReference<Object> reactContext;
    private static Method emitDeviceEvent;
    private static int lastCommandId;
    private static final HashMap<Integer, Runnable> fallbacks = new HashMap<>();

    private static boolean expectedPlaying;
    private static long expectedUntil;

    private TtsMediaSession() {
    }

    /**
     * AudioControlsService.setActivePlayerInternal(): the player the MediaSession is built with.
     *
     * @param service the AudioControlsService (holds the title / artwork set by the app)
     */
    public static Player wrap(Object service, Player player) {
        if (player == null) return null;
        try {
            TtsSessionPlayer wrapped = new TtsSessionPlayer(service, player);
            synchronized (lock) {
                prune();
                players.add(new WeakReference<>(wrapped));
            }
            Log.i(TAG, "media session shows the TTS reading");
            return wrapped;
        } catch (Throwable t) {
            Log.e(TAG, "could not wrap the media session player", t);
            return player;
        }
    }

    /** AudioMediaSessionCallback.onConnect(): expo-audio removes next / previous, add them back. */
    public static Player.Commands allowSkip(Player.Commands commands) {
        if (commands == null) return null;
        try {
            return commands.buildUpon()
                    .add(Player.COMMAND_SEEK_TO_PREVIOUS)
                    .add(Player.COMMAND_SEEK_TO_PREVIOUS_MEDIA_ITEM)
                    .add(Player.COMMAND_SEEK_TO_NEXT)
                    .add(Player.COMMAND_SEEK_TO_NEXT_MEDIA_ITEM)
                    .build();
        } catch (Throwable t) {
            Log.w(TAG, "could not allow next / previous", t);
            return commands;
        }
    }

    /** AudioControlsService.postOrStartForegroundNotification(): title / artwork may have changed. */
    public static void onNotificationUpdate() {
        notifyChanged(0);
    }

    /** OkHttpClientProvider.createClientBuilder(): capture the chapter texts. */
    public static void onCreateClientBuilder(OkHttpClient.Builder builder) {
        try {
            if (builder != null) builder.addInterceptor(new ChapterTextInterceptor());
        } catch (Throwable t) {
            Log.e(TAG, "could not add interceptor", t);
        }
    }

    /** End of ReactInstance.loadJSBundle(loader): queue the voice bar script after the app bundle. */
    public static void afterMainBundle(Object reactInstance) {
        Object context = JsScripts.load(reactInstance, VoiceBarScript.FILE_NAME, VoiceBarScript.SCRIPT, TAG);
        if (context == null) return;
        synchronized (lock) {
            reactContext = new WeakReference<>(context);
        }
    }

    /** The reading state changed: refresh the widget (after delayMs). */
    public static void notifyChanged(long delayMs) {
        ArrayList<TtsSessionPlayer> targets = new ArrayList<>();
        synchronized (lock) {
            prune();
            for (WeakReference<TtsSessionPlayer> ref : players) {
                TtsSessionPlayer p = ref.get();
                if (p != null) targets.add(p);
            }
        }
        if (targets.isEmpty()) return;
        Runnable r = () -> {
            for (TtsSessionPlayer p : targets) p.refresh();
        };
        if (delayMs > 0) main.postDelayed(r, delayMs);
        else main.post(r);
    }

    private static void prune() {
        Iterator<WeakReference<TtsSessionPlayer>> it = players.iterator();
        while (it.hasNext()) {
            TtsSessionPlayer p = it.next().get();
            if (p == null || p.isReleased()) it.remove();
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Commands of the media widget / lock screen / headset

    /** Play / pause button. */
    static void onPlayPause(boolean play) {
        if (play) {
            // Paused here earlier (fallback): the app still shows "playing", just resume the engine.
            if (TtsController.resumeByUser()) return;
            expect(true);
            sendToApp("play", () -> Log.i(TAG, "play: nothing to resume"));
        } else {
            expect(false);
            sendToApp("pause", TtsController::pauseByUser);
        }
    }

    /** Next / previous button: change the chapter. */
    static void onSkip(boolean next) {
        sendToApp(next ? "next" : "prev", () -> Log.i(TAG, "no chapter to change (reader not shown)"));
    }

    /** What the widget shows: the requested state while the app carries it out, else the reading. */
    static boolean displayedPlaying(boolean reading) {
        synchronized (lock) {
            if (SystemClock.elapsedRealtime() < expectedUntil) return expectedPlaying;
        }
        return reading;
    }

    private static void expect(boolean playing) {
        synchronized (lock) {
            expectedPlaying = playing;
            expectedUntil = SystemClock.elapsedRealtime() + EXPECT_MS;
        }
        notifyChanged(0);
        notifyChanged(EXPECT_MS + 50);
    }

    private static void clearExpectation() {
        synchronized (lock) {
            expectedUntil = 0;
        }
        notifyChanged(0);
    }

    private static void sendToApp(String command, Runnable fallback) {
        // The JS timers may have been paused in background (needed by the voice bar).
        TtsController.wakeJsTimers();
        final int id;
        Object context;
        synchronized (lock) {
            id = ++lastCommandId;
            fallbacks.put(id, fallback);
            context = reactContext != null ? reactContext.get() : null;
        }
        boolean sent = false;
        if (context != null) {
            try {
                if (emitDeviceEvent == null) {
                    emitDeviceEvent = context.getClass().getMethod("emitDeviceEvent", String.class, Object.class);
                }
                emitDeviceEvent.invoke(context, EVENT, command + "#" + id);
                sent = true;
                Log.i(TAG, "sent " + command + " to the app");
            } catch (Throwable t) {
                Log.w(TAG, "could not send " + command + " to the app", t);
            }
        }
        if (!sent) {
            runFallback(id, "app not reachable");
            return;
        }
        main.postDelayed(() -> runFallback(id, "no answer"), ANSWER_TIMEOUT_MS);
    }

    private static void runFallback(int id, String why) {
        Runnable fallback;
        synchronized (lock) {
            fallback = fallbacks.remove(id);
        }
        if (fallback == null) return;
        Log.i(TAG, "command " + id + ": " + why + ", fallback");
        clearExpectation();
        main.post(() -> {
            try {
                fallback.run();
            } catch (Throwable t) {
                Log.w(TAG, "fallback failed", t);
            }
        });
    }

    /** AsyncStorage "htc_media_ack" written by the voice bar script: {"id":n,"ok":bool}. */
    public static void onAnswer(String json) {
        try {
            JSONObject answer = new JSONObject(json);
            int id = answer.optInt("id");
            if (answer.optBoolean("ok")) {
                synchronized (lock) {
                    fallbacks.remove(id);
                }
            } else {
                runFallback(id, "not done by the app");
            }
        } catch (Throwable t) {
            Log.w(TAG, "bad answer " + json, t);
        }
    }
}
