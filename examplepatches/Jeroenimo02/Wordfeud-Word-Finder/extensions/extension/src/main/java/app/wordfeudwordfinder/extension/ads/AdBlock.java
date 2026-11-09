package app.wordfeudwordfinder.extension.ads;

import app.wordfeudwordfinder.extension.hooks.RouteTap;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Hook of the "Remove ads" patch, called first in {@code FlutterJNI.handlePlatformMessage}.
 *
 * <p>Wordfeud's Dart code drives ads through pigeon messages on {@code dev.flutter.pigeon.wordfeud.AdApi.<method>}.
 * For the methods in {@link #BLOCKED} this class replies "done" itself (the reply a void pigeon method sends) and
 * tells the hook to return, so the message never reaches the ad plugin. Dart sees a normal successful call.
 *
 * <p>Anything unexpected (another message, a missing FlutterJNI method) returns {@code false}: the app then handles
 * the message as usual, so a Wordfeud update can bring ads back but cannot break the app.
 */
public final class AdBlock {
    /** Channel prefix of Wordfeud's ad API (Dart → Java). */
    public static final String PREFIX = "dev.flutter.pigeon.wordfeud.AdApi.";

    /**
     * Blocked AdApi methods. All return void in Wordfeud 5.8.0 (checked in the app's code; see docs/UPDATING.md), so
     * {@link #VOID_REPLY} is the right answer for each. Not blocked: {@code reset}, {@code canShowPrivacyOptions}
     * (returns a bool), {@code showPrivacyOptions} and {@code showAdInspector} (only on user action).
     * {@code showConsentFormIfNeeded} starts the ad consent flow, and the ad SDKs are only initialised after it.
     */
    public static final Set<String> BLOCKED = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "setBannerAdUnitId", "setBannerVisible",
            "setInterstitialAdUnitId", "setAutoLoadInterstitial", "setInterstitialInterval",
            "setInterstitialPreloading", "showInterstitial",
            "setLeaderboardAdUnitId", "setLeaderboardVisible",
            "setMrecAdUnitId", "setMrecVisible",
            "showConsentFormIfNeeded")));

    /**
     * Pigeon's reply for a successful void call: the standard message codec encoding of {@code [null]}
     * (list type 12, length 1, null type 0).
     */
    static final byte[] VOID_REPLY = {12, 1, 0};

    private static final AtomicInteger BLOCKED_COUNT = new AtomicInteger();
    private static volatile Method replyMethod;
    private static volatile Method cleanupMethod;
    /** Where the reply is sent from; null = the main thread (created on first use). Tests replace it. */
    private static volatile Executor replyExecutor;

    private AdBlock() {
    }

    /** Whether {@code channel} is one of the blocked AdApi methods. */
    public static boolean isBlocked(String channel) {
        return channel != null && channel.startsWith(PREFIX)
                && BLOCKED.contains(channel.substring(PREFIX.length()));
    }

    /** Tests only: runs the replies on {@code e} instead of the main thread. */
    static void setReplyExecutorForTests(Executor e) {
        replyExecutor = e;
    }

    /** Number of ad calls answered since the app started (for "Copy details"). */
    public static int blockedCount() {
        return BLOCKED_COUNT.get();
    }

    /**
     * Hook entry point. {@code jni} is the FlutterJNI instance, then the parameters of
     * {@code handlePlatformMessage(String channel, ByteBuffer message, int replyId, long messageData)}.
     *
     * @return true when the message was answered here and the original method must return immediately
     */
    public static boolean onPlatformMessage(Object jni, String channel, ByteBuffer message, int replyId,
                                            long messageData) {
        if (jni == null || !isBlocked(channel)) return false;
        Method reply;
        Method cleanup;
        Executor executor;
        try {
            // Cached per class: looked up again if a different engine class ever shows up.
            reply = replyMethod;
            if (reply == null || !reply.getDeclaringClass().isInstance(jni)) {
                reply = jni.getClass().getMethod("invokePlatformMessageResponseCallback",
                        int.class, ByteBuffer.class, int.class);
                replyMethod = reply;
            }
            cleanup = cleanupMethod;
            if (cleanup == null || !cleanup.getDeclaringClass().isInstance(jni)) {
                cleanup = jni.getClass().getMethod("cleanupMessageData", long.class);
                cleanupMethod = cleanup;
            }
            executor = replyExecutor;
            if (executor == null) {
                // By name: MainThread uses android.os and is left out of the plain-JVM test build.
                executor = (Executor) Class.forName(AdBlock.class.getPackage().getName() + ".MainThread")
                        .getDeclaredConstructor().newInstance();
                replyExecutor = executor;
            }
        } catch (Throwable t) {
            return false; // methods not found or no main thread: let the app handle the message
        }
        // The word finder places its button higher while Dart shows the banner area, so it still needs to see
        // setBannerVisible. RouteTap only reads the message and never throws.
        if (message != null) RouteTap.onPlatformMessage(channel, message);
        // From here on the message counts as handled: answering it twice could crash the engine.
        //
        // The reply is posted, never sent from inside handlePlatformMessage. Flutter's own DartMessenger does the
        // same (it runs every handler from a posted task). Replying synchronously re-enters the engine while Dart is
        // still inside its send call (Flutter's UI and platform thread can be the same thread).
        final Method replyM = reply;
        final Method cleanupM = cleanup;
        final Runnable answer = () -> {
            try {
                if (replyId != 0) {
                    // Like DartMessenger: a direct buffer whose position is the length of the reply.
                    ByteBuffer buf = ByteBuffer.allocateDirect(VOID_REPLY.length);
                    buf.put(VOID_REPLY);
                    replyM.invoke(jni, replyId, buf, buf.position());
                }
            } catch (Throwable ignored) {
                // nothing else to do; the Dart call then never completes, like a slow ad call
            }
            try {
                // DartMessenger frees the native message after its handler ran; we skip it, so we free it here.
                cleanupM.invoke(jni, messageData);
            } catch (Throwable ignored) {
                // a small native leak at worst
            }
        };
        try {
            executor.execute(answer);
        } catch (Throwable t) {
            // Could not post (should not happen on a running app). The message is not answered or freed yet,
            // so the app can still handle it normally.
            return false;
        }
        BLOCKED_COUNT.incrementAndGet();
        return true;
    }
}
