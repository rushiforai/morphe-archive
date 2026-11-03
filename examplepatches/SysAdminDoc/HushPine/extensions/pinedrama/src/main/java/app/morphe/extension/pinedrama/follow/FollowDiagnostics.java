/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.extension.pinedrama.follow;

import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.pinedrama.settings.Settings;

@SuppressWarnings("unused")
public final class FollowDiagnostics {
    private static final String HOOK_FAMILY = "follow diagnostics";

    static {
        // Gated on the debug switch, which keeps its value while paused, so Pause leaves these
        // diagnostics as they were; the export says so.
        app.morphe.extension.shared.diagnostics.HookStatus.runsWhilePaused(HOOK_FAMILY);
    }
    private static final AtomicInteger eventCount = new AtomicInteger();
    private static final AtomicInteger callId = new AtomicInteger();
    // The patched Common and Jedi calls do not nest. Entries clear failed calls;
    // each return consumes its admission even when logging was switched off.
    private static final ThreadLocal<Integer> activeCallId = new ThreadLocal<>();
    private static final Object networkContextLock = new Object();
    /**
     * The requests in flight, by identity. A request leaves when its lifecycle ends (parsed
     * response, parse error or transport error), and one that never gets there is held weakly,
     * so a request graph with its bodies and buffers is never kept for the process lifetime: the
     * 160 that used to sit here after 160 events stayed reachable until PineDrama was killed.
     */
    private static final java.util.HashMap<WeakIdentityKey, FollowRequestContext> networkContexts = new java.util.HashMap<>();

    /** Identity of the request, held weakly, so the map neither confuses two requests nor keeps one alive. */
    private static final class WeakIdentityKey extends java.lang.ref.WeakReference<Object> {
        private final int hash;

        WeakIdentityKey(Object referent) {
            super(referent);
            hash = System.identityHashCode(referent);
        }

        @Override public int hashCode() { return hash; }

        @Override public boolean equals(Object other) {
            if (this == other) return true;
            if (!(other instanceof WeakIdentityKey)) return false;
            Object mine = get();
            return mine != null && mine == ((WeakIdentityKey) other).get();
        }
    }

    private static volatile boolean loggedSettingsSnapshot;
    private static volatile long followReadbackWindowUntil;
    private static volatile FollowRequestContext activeReadbackContext;
    /**
     * The room the last LIVE room enter named, as a hash of its id, and when it was answered.
     * A comment that the server takes but never shows (#110: from a room opened on the feed,
     * fine from the profile) may be going to a room this session never entered.
     */
    private static volatile String lastEnteredRoom;
    private static volatile long lastEnterAtMs;

    private FollowDiagnostics() {}

    static final class FollowRequestContext {
        final int id;
        final String path;
        String action = "unknown";
        String uidHash = "empty";
        String secUidHash = "empty";
        String followFrom = "unknown";
        String source = "unknown";
        String enterFrom = "unknown";
        String payload = "none";
        String responseSuccess = "unknown";
        String responseCode = "unknown";
        String bodyFollowStatus = "unknown";
        String bodyFollowerStatus = "unknown";
        String bodyIsFollowSuccess = "unknown";
        String statusCode = FollowVerdict.UNKNOWN;
        String statusMsg = FollowVerdict.UNKNOWN;
        String riskCheck = "none";
        final long createdAtMs = System.currentTimeMillis();

        FollowRequestContext(int id, String path) {
            this.id = id;
            this.path = path;
        }

        boolean hasTarget() {
            return !"empty".equals(uidHash) || !"empty".equals(secUidHash);
        }

        String summary() {
            return "id=" + id
                    + " action=" + action
                    + " uidHash=" + uidHash
                    + " secUidHash=" + secUidHash
                    + " followFrom=" + followFrom
                    + " source=" + source
                    + " enterFrom=" + enterFrom;
        }

        void copyMissingFrom(FollowRequestContext other) {
            if (other == null) return;
            if ("unknown".equals(action)) action = other.action;
            if ("empty".equals(uidHash)) uidHash = other.uidHash;
            if ("empty".equals(secUidHash)) secUidHash = other.secUidHash;
            if ("unknown".equals(followFrom)) followFrom = other.followFrom;
            if ("unknown".equals(source)) source = other.source;
            if ("unknown".equals(enterFrom)) enterFrom = other.enterFrom;
        }
    }

    private static volatile FollowRequestContext recentDirectContext;
    private static final AtomicBoolean warnedAboutRefusedFollow = new AtomicBoolean();
    private static final AtomicBoolean warnedAboutRefusedLike = new AtomicBoolean();

    /** Clears bounded diagnostics state between deterministic runtime tests. */
    static void resetForTests() {
        eventCount.set(0);
        callId.set(0);
        activeCallId.remove();
        synchronized (networkContextLock) {
            networkContexts.clear();
        }
        loggedSettingsSnapshot = false;
        lastEnteredRoom = null;
        lastEnterAtMs = 0L;
        followReadbackWindowUntil = 0L;
        activeReadbackContext = null;
        recentDirectContext = null;
        warnedAboutRefusedFollow.set(false);
        warnedAboutRefusedLike.set(false);
    }

    static int eventCountForTests() {
        return eventCount.get();
    }

    /** How many requests are held, for the test that proves completed ones are not. */
    static int heldRequestsForTests() {
        synchronized (networkContextLock) {
            return networkContexts.size();
        }
    }

    private static String invokeString(Object target, String methodName) {
        Object value = invokeValueObject(target, methodName);
        return value instanceof String ? (String) value : null;
    }

    private static Object invokeValueObject(Object target, String methodName) {
        if (target == null) return null;

        try {
            Method method = target.getClass().getMethod(methodName);
            method.setAccessible(true);
            return method.invoke(target);
        } catch (Exception ignored) {
            Class<?> currentClass = target.getClass();
            while (currentClass != null) {
                try {
                    Method method = currentClass.getDeclaredMethod(methodName);
                    method.setAccessible(true);
                    return method.invoke(target);
                } catch (Exception ignoredAgain) {
                    currentClass = currentClass.getSuperclass();
                }
            }
        }

        return null;
    }

    private static Object readField(Object target, String fieldName) {
        if (target == null) return null;

        Class<?> currentClass = target.getClass();
        while (currentClass != null) {
            try {
                Field field = currentClass.getDeclaredField(fieldName);
                field.setAccessible(true);
                return field.get(target);
            } catch (Exception ignored) {
                currentClass = currentClass.getSuperclass();
            }
        }

        return null;
    }

    private static String className(Object target) {
        return target == null ? "null" : target.getClass().getName();
    }

    private static String requestPath(Object request) {
        // Through the cached lookup, not the uncached one below. This runs for every request
        // and every response the app makes, before the logging gate, because a refused follow
        // has to be noticed whether or not logging is on; an uncached getMethod on each of
        // them, and a superclass walk throwing per level on a build that renamed getPath,
        // was a cost every network call paid for the life of the process.
        Object value = app.morphe.extension.pinedrama.blockauthor.Reflect.required(
                request, "getPath", HOOK_FAMILY);
        if (!(value instanceof String)) return null;

        return (String) value;
    }

    /**
     * The request's whole URL, for reading its query. PineDrama's Request.getPath() is
     * URI.getPath(), which leaves the query out, so every like read type=none and every LIVE
     * enter route=none on a phone (#269). getUrl() keeps it. The path stands in where a
     * request has no URL with a query.
     */
    private static String requestUrl(Object request) {
        Object url = app.morphe.extension.pinedrama.blockauthor.Reflect.invoke(request, "getUrl");
        if (url instanceof String && ((String) url).indexOf('?') >= 0) return (String) url;
        return requestPath(request);
    }

    /**
     * The same pseudonym for other reports about an account, so a creator blocked from the feed
     * and a creator followed read as one account across the two families of lines.
     */
    public static String pseudonym(String accountId) {
        return hash(accountId);
    }

    /**
     * A stable per-install pseudonym. Prefixing FNV with a secret still lets one known account
     * reveal the intermediate state and identify other accounts. HMAC keeps that secret as a
     * key instead of mixing it into a reversible hash prefix. The key never enters a report.
     */
    private static String hash(String value) {
        if (value == null || value.isEmpty()) return "empty";

        try {
            Mac digest = Mac.getInstance("HmacSHA256");
            digest.init(new SecretKeySpec(salt().getBytes(StandardCharsets.UTF_8), "HmacSHA256"));
            return hex(digest.doFinal(value.getBytes(StandardCharsets.UTF_8)));
        } catch (GeneralSecurityException failure) {
            Logger.printException(() -> "Could not create a diagnostic account pseudonym", failure);
            return "unavailable";
        }
    }

    private static String hex(byte[] bytes) {
        StringBuilder result = new StringBuilder(bytes.length * 2);
        for (byte value : bytes) {
            result.append(Character.forDigit((value & 0xff) >>> 4, 16));
            result.append(Character.forDigit(value & 0xf, 16));
        }
        return result.toString();
    }

    private static volatile String salt;

    private static String salt() {
        String known = salt;
        if (known != null) return known;

        synchronized (FollowDiagnostics.class) {
            if (salt != null) return salt;
            String stored = Settings.DIAGNOSTIC_REPORT_SALT.get();
            if (stored.isEmpty()) {
                byte[] key = new byte[32];
                new java.security.SecureRandom().nextBytes(key);
                stored = hex(key);
                Settings.DIAGNOSTIC_REPORT_SALT.save(stored);
            }
            salt = stored;
            return stored;
        }
    }
}
