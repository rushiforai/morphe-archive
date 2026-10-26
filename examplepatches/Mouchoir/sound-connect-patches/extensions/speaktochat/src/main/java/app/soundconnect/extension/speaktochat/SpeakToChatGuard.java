package app.soundconnect.extension.speaktochat;

import android.os.SystemClock;
import android.util.Log;

import java.lang.reflect.Method;

/**
 * Keeps Speak-to-Chat off unless it was switched on from the app.
 * <p>
 * Some headsets (the WH-1000XM4 among them) toggle Speak-to-Chat by themselves when two fingers
 * rest on the right touch panel, which happens easily when taking the headset off or putting it down.
 * The headset then notifies the app of the new state. This guard sees that notification and sends
 * "off" right back, unless the user asked for "on" in the app a moment before.
 * <p>
 * The patch wires the hooks below into the app's Speak-to-Chat state holder and command sender.
 */
@SuppressWarnings("unused")
public final class SpeakToChatGuard {
    private static final String TAG = "SpeakToChatGuard";

    /** How long after an in-app "on" request a headset "on" notification is trusted. */
    private static final long APP_REQUEST_GRACE_MS = 5_000;

    private static volatile Object sender;
    private static volatile boolean appWantsOn;
    private static volatile long appRequestedOnAt;

    private SpeakToChatGuard() {
    }

    /**
     * Name of the sender's "set Speak-to-Chat on/off" method.
     * The app is obfuscated, so the patch replaces this body with the name it matched.
     */
    private static String setterName() {
        return "PLACEHOLDER";
    }

    /** Injected at the end of the command sender's constructor. */
    public static void registerSender(Object instance) {
        sender = instance;
    }

    /** Injected at the start of the sender's on/off method, so in-app requests are recognized. */
    public static void onAppRequest(Object instance, boolean on) {
        sender = instance;
        appWantsOn = on;
        if (on) {
            appRequestedOnAt = SystemClock.elapsedRealtime();
        }
    }

    /** Injected where the app reads the Speak-to-Chat state right after connecting. */
    public static void onInitialState(Object value) {
        if (isOn(value) && !appWantsOn) {
            turnOff("on at connection, not requested from the app");
        }
    }

    /** Injected where the headset notifies an on/off change. */
    public static void onNotifiedState(Object value) {
        if (!isOn(value)) {
            appWantsOn = false;
            return;
        }

        boolean requested = appWantsOn
                && SystemClock.elapsedRealtime() - appRequestedOnAt < APP_REQUEST_GRACE_MS;
        if (!requested) {
            turnOff("turned on by the headset");
        }
    }

    private static boolean isOn(Object value) {
        return value instanceof Enum && "ON".equals(((Enum<?>) value).name());
    }

    private static void turnOff(String reason) {
        final Object target = sender;
        if (target == null) {
            Log.w(TAG, "Speak-to-Chat " + reason + ", but no sender is known yet");
            return;
        }

        Log.i(TAG, "Speak-to-Chat " + reason + ", turning it back off");

        // The notification arrives on the connection's receive thread; sending from it would wait
        // for an acknowledgement that thread has to read, so send from a thread of our own.
        new Thread(() -> {
            try {
                Method setter = target.getClass().getMethod(
                        setterName(), boolean.class, boolean.class, String.class);
                setter.invoke(target, false, false, "");
            } catch (Throwable t) {
                Log.e(TAG, "Failed to turn Speak-to-Chat off", t);
            }
        }, TAG).start();
    }
}
