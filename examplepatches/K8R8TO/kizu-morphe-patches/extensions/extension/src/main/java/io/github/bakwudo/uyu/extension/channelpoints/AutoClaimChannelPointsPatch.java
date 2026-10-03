package io.github.bakwudo.uyu.extension.channelpoints;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

import java.util.Objects;

import io.github.bakwudo.uyu.extension.settings.Settings;

public final class AutoClaimChannelPointsPatch {
    private static final long POLL_INTERVAL_MS = 3_000L;
    private static final long RETRY_DELAY_MS = 3_000L;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static String lastClaimId;
    private static long lastClaimTime;
    private static volatile Object activeProvider;
    private static volatile String pendingClaimId;
    private static boolean polling;

    private static final Runnable POLL = new Runnable() {
        @Override
        public void run() {
            Object provider = activeProvider;
            String claimId = pendingClaimId;
            if (provider == null || claimId == null || !Settings.AUTO_CLAIM_CHANNEL_POINTS.get()) {
                synchronized (AutoClaimChannelPointsPatch.class) {
                    polling = false;
                }
                return;
            }

            try {
                invokeClaim(provider, claimId);
            } catch (Throwable ignored) {
            }

            synchronized (AutoClaimChannelPointsPatch.class) {
                if (polling && activeProvider == provider && Objects.equals(pendingClaimId, claimId)) {
                    MAIN.postDelayed(this, POLL_INTERVAL_MS);
                }
            }
        }
    };

    private AutoClaimChannelPointsPatch() {
    }

    public static synchronized boolean shouldClaim(String claimId) {
        if (!Settings.AUTO_CLAIM_CHANNEL_POINTS.get() || claimId == null || claimId.isEmpty()) {
            return false;
        }

        long now = SystemClock.elapsedRealtime();
        if (Objects.equals(claimId, lastClaimId) && now - lastClaimTime < RETRY_DELAY_MS) {
            return false;
        }

        lastClaimId = claimId;
        lastClaimTime = now;
        return true;
    }

    public static synchronized void startPolling(Object provider, String claimId) {
        if (provider == null || claimId == null || claimId.isEmpty()) {
            return;
        }

        activeProvider = provider;
        pendingClaimId = claimId;
        if (polling) {
            return;
        }

        polling = true;
        MAIN.removeCallbacks(POLL);
        MAIN.postDelayed(POLL, POLL_INTERVAL_MS);
    }

    public static synchronized void stopPolling() {
        activeProvider = null;
        pendingClaimId = null;
        polling = false;
        MAIN.removeCallbacks(POLL);
    }

    private static void invokeClaim(Object provider, String claimId) throws Exception {
        for (java.lang.reflect.Method method : provider.getClass().getMethods()) {
            Class<?>[] params = method.getParameterTypes();
            if (params.length == 2 &&
                    params[0] == String.class &&
                    "tv.twitch.android.shared.one.chat.pub.ChatModeMetadata".equals(params[1].getName()) &&
                    method.getReturnType() == void.class) {
                method.setAccessible(true);
                method.invoke(provider, claimId, null);
                return;
            }
        }
    }
}