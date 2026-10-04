package io.github.bakwudo.uyu.extension.channelpoints;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Objects;
import io.github.bakwudo.uyu.extension.settings.Settings;

public final class AutoClaimChannelPointsPatch {
    private static final long POLL_INTERVAL_MS = 3_000L;
    private static final long RETRY_DELAY_MS = 3_000L;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static String lastClaimId;
    private static long lastClaimTime;
    private static volatile Object activeProvider;
    private static volatile Object activeModel;
    private static boolean polling;

    private static final Runnable POLL = new Runnable() {
        @Override public void run() {
            Object provider = activeProvider;
            Object model = activeModel;
            if (provider == null || model == null || !Settings.AUTO_CLAIM_CHANNEL_POINTS.get()) {
                synchronized (AutoClaimChannelPointsPatch.class) {
                    polling = false;
                }
                return;
            }

            try {
                invokeGeneratedAutoClaim(provider, model);
            } catch (Throwable ignored) {
            }

            synchronized (AutoClaimChannelPointsPatch.class) {
                if (polling && activeProvider == provider && activeModel == model) {
                    MAIN.postDelayed(this, POLL_INTERVAL_MS);
                }
            }
        }
    };

    private AutoClaimChannelPointsPatch() {}

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

    public static synchronized boolean retryAllowed(String claimId) {
        return Settings.AUTO_CLAIM_CHANNEL_POINTS.get() && claimId != null && !claimId.isEmpty();
    }

    public static synchronized void startPolling(Object provider, Object model) {
        if (provider == null || model == null || !Settings.AUTO_CLAIM_CHANNEL_POINTS.get()) {
            return;
        }

        activeProvider = provider;
        activeModel = model;

        if (polling) {
            return;
        }

        polling = true;
        MAIN.removeCallbacks(POLL);
        MAIN.postDelayed(POLL, POLL_INTERVAL_MS);
    }

    // Kept for binary compatibility with older generated patch code.
    public static synchronized void startPolling(Object provider, String claimId) {
        if (provider == null || !Settings.AUTO_CLAIM_CHANNEL_POINTS.get()) {
            return;
        }
        activeProvider = provider;
        if (polling) {
            return;
        }
        polling = true;
        MAIN.removeCallbacks(POLL);
        MAIN.postDelayed(POLL, POLL_INTERVAL_MS);
    }

    public static synchronized void stopPolling() {
        activeProvider = null;
        activeModel = null;
        polling = false;
        MAIN.removeCallbacks(POLL);
    }

    private static void invokeGeneratedAutoClaim(Object provider, Object model) throws Exception {
        Class<?> providerClass = provider.getClass();
        Class<?> modelClass = model.getClass();

        Method target = null;
        for (Method method : providerClass.getMethods()) {
            if (!method.getName().equals("kizuAutoClaim")
                    || !Modifier.isStatic(method.getModifiers())
                    || method.getParameterTypes().length != 2) {
                continue;
            }

            Class<?>[] params = method.getParameterTypes();
            if (params[0].isAssignableFrom(providerClass)
                    && params[1].isAssignableFrom(modelClass)) {
                target = method;
                break;
            }
        }

        if (target == null) {
            throw new NoSuchMethodException("kizuAutoClaim");
        }

        target.invoke(null, provider, model);
    }
}
