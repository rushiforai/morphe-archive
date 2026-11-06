package app.pablobaro.extension.spotify;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.util.Log;

import java.security.MessageDigest;
import java.lang.reflect.Field;
import java.net.URI;
import java.util.Arrays;
import java.util.IdentityHashMap;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicInteger;

/** Read-only diagnostics. Never log request bodies, tokens, or exception messages. */
@SuppressWarnings("unused")
public final class DiagnoseClientPatch {
    private static final String TAG = "SpotifyClientDiag";
    /**
     * The running app's package, which differs from the original when "Change package name" is applied.
     * Null until resolved; never assumed, so a renamed app never logs another installed app's certificates.
     */
    private static volatile String ownPackage;
    private static volatile boolean processNameLookedUp;
    private static volatile Callable<String> processNameSource = DiagnoseClientPatch::currentProcessName;
    private static final AtomicInteger tokenResultsLogged = new AtomicInteger();
    private static final AtomicInteger responsesLogged = new AtomicInteger();
    private static final AtomicInteger homeFailuresLogged = new AtomicInteger();

    private DiagnoseClientPatch() {
    }

    public static void onStartup(Context context) {
        try {
            Log.i(TAG, "diagnostics=v5; behavior=unchanged");
            String packageName = context.getPackageName();
            rememberOwnPackage(packageName);
            PackageManager pm = context.getPackageManager();
            Log.i(TAG, "package=" + packageName);
            Log.i(TAG, "installer=" + pm.getInstallerPackageName(packageName));
            observe(pm.getPackageInfo(packageName, Build.VERSION.SDK_INT >= 28
                    ? PackageManager.GET_SIGNING_CERTIFICATES : PackageManager.GET_SIGNATURES));
        } catch (Throwable error) {
            safeLog("startup diagnostic failed; " + describeFailure(error));
        }
    }

    public static PackageInfo getPackageInfo(PackageManager pm, String name, int flags)
            throws PackageManager.NameNotFoundException {
        PackageInfo info = pm.getPackageInfo(name, flags);
        observe(info);
        return info;
    }

    public static PackageInfo getPackageInfo(PackageManager pm, String name, PackageManager.PackageInfoFlags flags)
            throws PackageManager.NameNotFoundException {
        PackageInfo info = pm.getPackageInfo(name, flags);
        observe(info);
        return info;
    }

    static void rememberOwnPackage(String packageName) {
        if (packageName != null && !packageName.isEmpty()) ownPackage = packageName;
    }

    /**
     * Package queries can run before Application.onCreate (e.g. from a ContentProvider), so resolve lazily.
     * The process name is looked up at most once: this runs on every wrapped getPackageInfo call,
     * and onStartup sets the package anyway if the lookup failed.
     */
    static boolean isOwnPackage(String packageName) {
        String own = ownPackage;
        if (own == null && !processNameLookedUp) own = lookUpOwnPackage();
        return own != null && own.equals(packageName);
    }

    /** Synchronized so a concurrent caller waits for the lookup instead of seeing it half done. */
    private static synchronized String lookUpOwnPackage() {
        if (ownPackage == null && !processNameLookedUp) {
            String processName = null;
            try {
                processName = processNameSource.call();
            } catch (Throwable ignored) {
            }
            rememberOwnPackage(packageFromProcessName(processName));
            processNameLookedUp = true;
        }
        return ownPackage;
    }

    /** Restores the unresolved state. Tests only. */
    static synchronized void resetOwnPackage(Callable<String> source) {
        ownPackage = null;
        processNameLookedUp = false;
        processNameSource = source;
    }

    /** The default process is named after the package; secondary ones add a ":name" suffix. */
    static String packageFromProcessName(String processName) {
        if (processName == null) return null;
        int separator = processName.indexOf(':');
        String packageName = separator >= 0 ? processName.substring(0, separator) : processName;
        return packageName.isEmpty() ? null : packageName;
    }

    private static String currentProcessName() {
        try {
            if (Build.VERSION.SDK_INT >= 28) return android.app.Application.getProcessName();
            // Before API 28 there is no public API, and hidden API restrictions do not apply yet.
            return (String) Class.forName("android.app.ActivityThread")
                    .getMethod("currentProcessName").invoke(null);
        } catch (Throwable error) {
            return null;
        }
    }

    private static void observe(PackageInfo info) {
        try {
            if (info == null || !isOwnPackage(info.packageName)) return;
            if (info.signatures != null) logSignatures("legacy", info.signatures);
            if (Build.VERSION.SDK_INT >= 28 && info.signingInfo != null) {
                logSignatures("contents", info.signingInfo.getApkContentsSigners());
                logSignatures("history", info.signingInfo.getSigningCertificateHistory());
            }
        } catch (Throwable error) {
            safeLog("certificate diagnostic failed; " + describeFailure(error));
        }
    }

    private static void logSignatures(String source, Signature[] signatures) throws Exception {
        if (signatures == null) return;
        for (Signature signature : signatures) {
            byte[] hash = MessageDigest.getInstance("SHA-256").digest(signature.toByteArray());
            StringBuilder hex = new StringBuilder();
            for (byte value : hash) hex.append(String.format(java.util.Locale.ROOT, "%02x", value & 255));
            safeLog("certificate=" + source + "; sha256=" + hex);
        }
    }

    public static void onVerificationStarted() {
        safeLog("integrity verification entered (includes coroutine resumes)");
    }

    public static void onHomeFailure(Throwable error) {
        try {
            if (homeFailuresLogged.getAndIncrement() < 20) safeLog(describeHomeFailure(error));
        } catch (Throwable ignored) {
            // A diagnostic must never replace the application's original failure.
        }
    }

    public static void onHomeHttpStatus(int status) {
        if (status >= 100 && status <= 599) safeLog("home http failure=" + status);
    }

    static String describeHomeFailure(Throwable error) {
        StringBuilder result = new StringBuilder("home failure");
        IdentityHashMap<Throwable, Boolean> seen = new IdentityHashMap<>();
        for (int depth = 0; depth < 4 && error != null && !seen.containsKey(error); depth++) {
            seen.put(error, Boolean.TRUE);
            result.append("; cause=").append(depth).append("; ").append(describeFailure(error));
            try {
                StackTraceElement[] frames = error.getStackTrace();
                for (int i = 0; i < Math.min(frames.length, 6); i++) {
                    StackTraceElement frame = frames[i];
                    // Include code identifiers only, never source filenames or exception messages.
                    String owner = frame.getClassName();
                    String method = frame.getMethodName();
                    if (owner.length() <= 200 && method.length() <= 120 &&
                            owner.matches("[A-Za-z0-9_.$]+") && method.matches("[A-Za-z0-9_$<>-]+")) {
                        result.append("; at=").append(owner).append('#').append(method);
                    }
                }
                error = error.getCause();
            } catch (Throwable ignored) {
                break;
            }
        }
        return result.toString();
    }

    public static void onVerificationResponse(String response) {
        // The response may itself be a token. Log only its presence, never its contents.
        safeLog("integrity response received; nonempty=" + (response != null && !response.isEmpty()));
    }

    public static void onVerificationFailure(Throwable error) {
        safeLog("integrity request failed; " + describeFailure(error));
    }

    public static void onClientTokenResult(Object result) {
        if (tokenResultsLogged.getAndIncrement() < 20) safeLog(describeClientTokenResult(result));
    }

    static String describeClientTokenResult(Object result) {
        if (result == null) return "client token result=null";
        try {
            int resultCase = (Integer) field(result, "resultCase_");
            // Never inspect the token payload, including via toString().
            if (resultCase == 1) return "client token acquired";
            if (resultCase == 2) {
                Object failure = field(result, "result_");
                int code = (Integer) field(failure, "code_");
                return "client token acquisition failed; code=" + code;
            }
            return "client token result case=" + resultCase;
        } catch (Throwable error) {
            return "client token diagnostic unavailable; " + describeFailure(error);
        }
    }

    private static Object field(Object instance, String name) throws ReflectiveOperationException {
        Field field = instance.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(instance);
    }

    public static void onHttpResponse(int status, String url) {
        if (responsesLogged.getAndIncrement() < 150) safeLog(describeHttpResponse(status, url));
    }

    static String describeHttpResponse(int status, String url) {
        String host = "other";
        String service = "other";
        try {
            URI uri = URI.create(url);
            String hostname = uri.getHost();
            if ("clienttoken.spotify.com".equals(hostname)) host = "clienttoken";
            else if ("api.spotify.com".equals(hostname)) host = "api";
            else if ("login5.spotify.com".equals(hostname)) host = "login5";
            else if ("spclient.wg.spotify.com".equals(hostname) ||
                    (hostname != null && hostname.endsWith("-spclient.spotify.com"))) host = "spclient";
            String[] path = uri.getPath().split("/");
            if (path.length > 1 && Arrays.asList("home", "homeview-service", "metadata",
                    "extended-metadata", "playlist", "playlist-read", "playlist4", "storage-resolve",
                    "track-playback", "connect-state", "clienttoken", "v1", "v2").contains(path[1])) {
                service = path[1];
            }
        } catch (Throwable ignored) {
            // Log only allowlisted categories, never a raw host, URL, path, query, or error message.
        }
        return "http response=" + status + "; host=" + host + "; service=" + service;
    }

    static String describeFailure(Throwable error) {
        if (error == null) return "exception=null";
        String description = "exception=" + error.getClass().getName();
        try {
            Object code = error.getClass().getMethod("code").invoke(error);
            if (code instanceof Integer && (Integer) code >= 100 && (Integer) code <= 599) {
                description += "; http=" + code;
            }
        } catch (Throwable ignored) {
            // Not an HTTP exception, or its API was obfuscated. Do not fall back to its message.
        }
        return description;
    }

    private static void safeLog(String message) {
        try {
            Log.i(TAG, message);
        } catch (Throwable ignored) {
            // Diagnostics must not replace a successful app operation with a logging failure.
        }
    }
}
