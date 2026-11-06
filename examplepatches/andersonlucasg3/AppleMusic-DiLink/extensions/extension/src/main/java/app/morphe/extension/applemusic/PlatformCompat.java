package app.morphe.extension.applemusic;

import android.app.ActivityManager;
import android.content.Context;
import android.graphics.Outline;
import android.graphics.Path;
import android.os.Build;
import android.os.ext.SdkExtensions;
import android.view.Surface;
import android.view.View;
import android.view.Window;
import android.view.WindowInsetsAnimation;
import android.view.WindowManager;

import java.util.Collections;
import java.util.List;

/**
 * Shims for the API 30 platform calls that Apple Music 7.0.0 performs without an SDK_INT guard
 * (the app was built with minSdk 30, so R8 removed androidx's own fallbacks). On the DiLink
 * (Android 10 / API 29) every one of these throws {@code NoSuchMethodError} or
 * {@code NoSuchFieldError} when reached.
 *
 * <p>All platform references live in {@link Api30}, loaded only after the SDK check, so this
 * class itself is loadable on API 29. On API 30+ the calls behave exactly like the original
 * bytecode; on API 29 they degrade to null/false/empty/no-op.
 */
public final class PlatformCompat {

    private PlatformCompat() {
    }

    private static volatile String[] cachedAnisette;
    private static volatile long cachedAnisetteAt;

    /** Replace the local ADI headers with ones from a remote Anisette v3 server. */
    public static void applyAnisetteHeaders(Object request) {
        try {
            String[] headers = anisetteHeaders();
            if (headers == null || headers.length == 0) {
                return;
            }
            Object map = request.getClass().getMethod("getHeaders").invoke(request);
            java.lang.reflect.Method set = map.getClass().getMethod("set", String.class, Object.class);
            for (int i = 0; i < headers.length; i += 2) {
                set.invoke(map, headers[i], headers[i + 1]);
            }
        } catch (Throwable t) {
            android.util.Log.e("AppleMusicDiLink", "applyAnisetteHeaders failed", t);
        }
    }

    private static String[] anisetteHeaders() {
        String[] cached = cachedAnisette;
        long now = System.currentTimeMillis();
        if (cached != null && now - cachedAnisetteAt < 120_000L) {
            return cached;
        }
        java.net.HttpURLConnection connection = null;
        try {
            connection = (java.net.HttpURLConnection) new java.net.URL("https://ani.sidestore.io/").openConnection();
            connection.setConnectTimeout(3000);
            connection.setReadTimeout(3000);
            java.io.InputStream in = connection.getInputStream();
            java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int read;
            while ((read = in.read(buffer)) > 0) {
                out.write(buffer, 0, read);
            }
            in.close();
            org.json.JSONObject json = new org.json.JSONObject(out.toString("UTF-8"));
            java.util.List<String> pairs = new java.util.ArrayList<>();
            java.util.Iterator<String> keys = json.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                pairs.add(key);
                pairs.add(json.getString(key));
            }
            String[] result = pairs.toArray(new String[0]);
            cachedAnisette = result;
            cachedAnisetteAt = now;
            return result;
        } catch (Throwable t) {
            android.util.Log.e("AppleMusicDiLink", "anisette fetch failed", t);
            return null;
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    /**
     * The native AMS bridge script uses ES2020 optional chaining/nullish coalescing, which
     * the DiLink WebView (Chromium 74) cannot parse, so window.AMS is never defined. Rewrite the
     * three affected snippets to ES5/ES2018 before the scripts are injected.
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static void fixScripts(Object context, Object scripts) {
        try {
            if (!(scripts instanceof java.util.List)) {
                return;
            }
            java.util.List list = (java.util.List) scripts;
            for (int i = 0; i < list.size(); i++) {
                Object item = list.get(i);
                if (!(item instanceof String)) {
                    continue;
                }
                String original = (String) item;
                String fixed = original
                        .replace(
                                "window.webkit?.messageHandlers?.callback",
                                "(window.webkit&&window.webkit.messageHandlers&&window.webkit.messageHandlers.callback)")
                        .replace("...o.userInfo??{}", "...(o.userInfo!=null?o.userInfo:{})");
                if (!fixed.equals(original)) {
                    list.set(i, fixed);
                }
            }
        } catch (Throwable t) {
            android.util.Log.e("AppleMusicDiLink", "fixScripts failed", t);
        }
    }

    private static volatile java.util.Map<String, String> dlAssets;

    /** Serve the build-time transpiled Apple JS assets on the DiLink WebView (Chromium 74). */

    /** Fetch fresh Anisette v3 headers. Each provider request needs a new OTP. */
    private static org.json.JSONObject anisetteJson() {
        java.net.HttpURLConnection connection = null;
        try {
            connection = (java.net.HttpURLConnection) new java.net.URL("https://ani.sidestore.io/").openConnection();
            connection.setConnectTimeout(3000);
            connection.setReadTimeout(3000);
            java.io.InputStream in = connection.getInputStream();
            java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int read;
            while ((read = in.read(buffer)) > 0) {
                out.write(buffer, 0, read);
            }
            in.close();
            org.json.JSONObject json = new org.json.JSONObject(out.toString("UTF-8"));
            return json;
        } catch (Throwable t) {
            android.util.Log.e("AppleMusicDiLink", "anisetteJson failed", t);
            return null;
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    /** Expected.success(Unit) for the Anisette methods we replace wholesale. */
    public static Object expectedUnit() {
        try {
            Class<?> unitClass = Class.forName("kotlin.Unit");
            Object unit = null;
            try {
                java.lang.reflect.Field field = unitClass.getDeclaredField("INSTANCE");
                field.setAccessible(true);
                unit = field.get(null);
            } catch (Throwable ignored) {
                // R8 may remove the INSTANCE field; fall through to a reflective instance.
            }
            if (unit == null) {
                java.lang.reflect.Constructor<?> constructor = unitClass.getDeclaredConstructor();
                constructor.setAccessible(true);
                unit = constructor.newInstance();
            }
            return expectedSuccess(unit);
        } catch (Throwable t) {
            android.util.Log.e("AppleMusicDiLink", "expectedUnit failed", t);
            return null;
        }
    }

    private static Object expectedSuccess(Object value) throws Exception {
        Class<?> successClass = Class.forName("com.apple.mediaservices.amskit.bindings.Expected$Success");
        java.lang.reflect.Constructor<?> constructor = successClass.getDeclaredConstructor(Object.class);
        constructor.setAccessible(true);
        return constructor.newInstance(value);
    }

    private static Object expectedInstance(String className) {
        try {
            Class<?> clazz = Class.forName(className);
            for (java.lang.reflect.Constructor<?> constructor : clazz.getDeclaredConstructors()) {
                Class<?>[] parameters = constructor.getParameterTypes();
                Object[] arguments = new Object[parameters.length];
                boolean supported = true;
                for (int i = 0; i < parameters.length; i++) {
                    if (parameters[i] == long.class) {
                        arguments[i] = 0L;
                    } else if (parameters[i] == int.class) {
                        arguments[i] = 0;
                    } else if (parameters[i] == byte[].class) {
                        arguments[i] = new byte[0];
                    } else if (parameters[i] == Object.class) {
                        arguments[i] = null;
                    } else if (parameters[i].getName().startsWith("kotlin.jvm.internal.")) {
                        arguments[i] = null;
                    } else {
                        supported = false;
                        break;
                    }
                }
                if (supported) {
                    constructor.setAccessible(true);
                    return expectedSuccess(constructor.newInstance(arguments));
                }
            }
            android.util.Log.e("AppleMusicDiLink", "no usable constructor for " + className);
            return null;
        } catch (Throwable t) {
            android.util.Log.e("AppleMusicDiLink", "expectedInstance failed " + className, t);
            return null;
        }
    }

    public static Object expectedStartProvisioning() {
        return expectedInstance(
                "com.apple.mediaservices.amskit.fairplay.INativeAnisetteProvider$StartProvisionResponse");
    }

    public static Object expectedSync() {
        return expectedInstance("com.apple.mediaservices.amskit.fairplay.INativeAnisetteProvider$SyncResponse");
    }

    /** Replacement for the app's IAnisetteProvider.request. */
    public static Object remoteOtpResponse(long dsid) {
        try {
            if (dsid == -2L) {
                int counter = (int) (System.currentTimeMillis() / 1000L / 30L);
                byte[] otp = app.morphe.extension.applemusic.adi.AmdOtp.computeOtp(
                        app.morphe.extension.applemusic.adi.AdiProfile.SECONDARY,
                        app.morphe.extension.applemusic.adi.AdiProfile.ENCRYPTED_SEED,
                        counter);
                byte[] mid = app.morphe.extension.applemusic.adi.AdiProfile.MACHINE_ID;
                // GrandSlam X-Apple-I-MD envelope: u32 ver=5, u32 len=16, 16 B OTP, u32 platform=4.
                byte[] envelope = new byte[28];
                envelope[3] = 5;
                envelope[7] = 16;
                System.arraycopy(otp, 0, envelope, 8, 16);
                envelope[27] = 4;
                return expectedOtpResponse(mid, envelope);
            }
            if (dsid == -1L) {
                int counter = (int) (System.currentTimeMillis() / 1000L / 30L);
                byte[] otp = app.morphe.extension.applemusic.adi.StoreOtp.computeOtp(
                        app.morphe.extension.applemusic.adi.StoreProfile.SECONDARY,
                        app.morphe.extension.applemusic.adi.StoreProfile.ENCRYPTED_SEED,
                        counter);
                byte[] amd = app.morphe.extension.applemusic.adi.StoreOtp.amd(otp);
                byte[] mid = app.morphe.extension.applemusic.adi.StoreProfile.MACHINE_ID;
                return expectedOtpResponse(mid, amd);
            }
            org.json.JSONObject json = anisetteJson();
            if (json == null) {
                return null;
            }
            byte[] md = android.util.Base64.decode(json.getString("X-Apple-I-MD"), android.util.Base64.DEFAULT);
            byte[] mdm = android.util.Base64.decode(json.getString("X-Apple-I-MD-M"), android.util.Base64.DEFAULT);
            // V1.5 (AMD/AMD-M): try otp=MD, mid=MD-M swapped relative to the v3 mapping.
            byte[] otp = mdm;
            byte[] mid = md;
            return expectedOtpResponse(mid, otp);
        } catch (Throwable t) {
            android.util.Log.e("AppleMusicDiLink", "remoteOtpResponse failed", t);
            return null;
        }
    }

    private static Object expectedOtpResponse(byte[] mid, byte[] otp) throws Exception {
        Class<?> otpClass = Class.forName(
                "com.apple.mediaservices.amskit.fairplay.INativeAnisetteProvider$OTPResponse");
        java.lang.reflect.Constructor<?> constructor =
                otpClass.getDeclaredConstructor(byte[].class, byte[].class);
        constructor.setAccessible(true);
        Object otpResponse = constructor.newInstance(mid, otp);
        Class<?> successClass = Class.forName("com.apple.mediaservices.amskit.bindings.Expected$Success");
        java.lang.reflect.Constructor<?> successConstructor =
                successClass.getDeclaredConstructor(Object.class);
        successConstructor.setAccessible(true);
        return successConstructor.newInstance(otpResponse);
    }

    public static android.webkit.WebResourceResponse interceptWebResource(Object request) {
        try {
            Object uri = request.getClass().getMethod("getUrl").invoke(request);
            String url = String.valueOf(uri);
            String code = dlAssets().get(url);
            if (code == null) {
                return null;
            }
            code = applyColorSchemeCompat(code);
            android.webkit.WebResourceResponse response = new android.webkit.WebResourceResponse(
                    "application/javascript",
                    "UTF-8",
                    new java.io.ByteArrayInputStream(code.getBytes("UTF-8")));
            java.util.Map<String, String> headers = new java.util.HashMap<>();
            headers.put("Access-Control-Allow-Origin", "*");
            headers.put("Cache-Control", "no-cache");
            response.setResponseHeaders(headers);
            return response;
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * The DiLink WebView (Chromium 74) has matchMedia but not the prefers-color-scheme media
     * feature, so the login page always picks the light theme on a black WebView background.
     * Rewriting the served JS reports a dark scheme, which the page renders legibly.
     */
    private static String applyColorSchemeCompat(String code) {
        if (!code.contains("prefers-color-scheme")) {
            return code;
        }
        return code
                .replaceAll(
                        "window\\.matchMedia\\(\"\\(prefers-color-scheme: dark\\)\"\\)\\.matches",
                        "true")
                .replaceAll(
                        "([A-Za-z_$][A-Za-z0-9_$]*)\\s*=\\s*window\\.matchMedia\\(\"\\(prefers-color-scheme: dark\\)\"\\)(?!\\s*\\.)",
                        "$1 = {matches: true, addListener: function () {}, removeListener: function () {}, addEventListener: function () {}, removeEventListener: function () {}}");
    }

    private static java.util.Map<String, String> dlAssets() {
        java.util.Map<String, String> cached = dlAssets;
        if (cached != null) {
            return cached;
        }
        synchronized (PlatformCompat.class) {
            if (dlAssets != null) {
                return dlAssets;
            }
            java.util.Map<String, String> map = new java.util.HashMap<>();
            try {
                Object application = Class.forName("android.app.ActivityThread")
                        .getMethod("currentApplication")
                        .invoke(null);
                android.content.Context context = (android.content.Context) application;
                int id = context.getResources().getIdentifier("js_ams_adaptor", "raw", context.getPackageName());
                java.io.InputStream in = context.getResources().openRawResource(id);
                java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
                byte[] buffer = new byte[65536];
                int read;
                while ((read = in.read(buffer)) > 0) {
                    out.write(buffer, 0, read);
                }
                in.close();
                String text = out.toString("UTF-8");
                String marker = "window.__DL_ASSETS_B64__=\"";
                int start = text.indexOf(marker);
                int end = text.indexOf("\";/*__DL_END__*/", start);
                String encoded = text.substring(start + marker.length(), end);
                String json = new String(
                        android.util.Base64.decode(encoded, android.util.Base64.DEFAULT), "UTF-8");
                org.json.JSONObject object = new org.json.JSONObject(json);
                java.util.Iterator<String> keys = object.keys();
                while (keys.hasNext()) {
                    String key = keys.next();
                    map.put(key, object.getString(key));
                }
            } catch (Throwable t) {
                android.util.Log.e("AppleMusicDiLink", "dlAssets failed", t);
            }
            dlAssets = map;
            return map;
        }
    }

    /** API 30 static used by p507z3.C7059k.<clinit>; on API 29 return the platform default. */
    public static int getSuggestedMaxIpcSizeBytes() {
        return 1024 * 1024;
    }

    /** API 30 Surface.setFrameRate(float, int); no-op on API 29 (ExoPlayer calls it). */
    public static void setFrameRate(Object surface, float frameRate, int compatibility) {
        if (Build.VERSION.SDK_INT >= 30 && surface instanceof Surface) {
            Api30.setFrameRate((Surface) surface, frameRate, compatibility);
        }
    }

    public static void setWindowInsetsAnimationCallback(Object view, Object callback) {
        if (Build.VERSION.SDK_INT >= 30 && view != null) {
            Api30.setWindowInsetsAnimationCallback(view, callback);
        }
    }

    public static void setFitInsetsSides(Object layoutParams, int sides) {
        if (Build.VERSION.SDK_INT >= 30 && layoutParams != null) {
            Api30.setFitInsetsSides(layoutParams, sides);
        }
    }

    public static void setFitInsetsTypes(Object layoutParams, int types) {
        if (Build.VERSION.SDK_INT >= 30 && layoutParams != null) {
            Api30.setFitInsetsTypes(layoutParams, types);
        }
    }

    public static void setPath(Object outline, Object path) {
        if (Build.VERSION.SDK_INT >= 30 && outline != null && path != null) {
            Api30.setPath(outline, path);
        }
    }

    public static String getAttributionTag(Object context) {
        return Build.VERSION.SDK_INT >= 30 && context != null
                ? Api30.getAttributionTag(context)
                : null;
    }

    public static List<?> getHistoricalProcessExitReasons(
            Object activityManager, String packageName, int pid, int maxNum) {
        return Build.VERSION.SDK_INT >= 30 && activityManager != null
                ? Api30.getHistoricalProcessExitReasons(activityManager, packageName, pid, maxNum)
                : Collections.emptyList();
    }

    public static boolean isShowingLayoutBounds(Object view) {
        return Build.VERSION.SDK_INT >= 30 && view != null && Api30.isShowingLayoutBounds(view);
    }

    public static void setDecorFitsSystemWindows(Object window, boolean fitSystemWindows) {
        if (Build.VERSION.SDK_INT >= 30 && window != null) {
            Api30.setDecorFitsSystemWindows(window, fitSystemWindows);
        }
    }

    /**
     * android.os.ext.SdkExtensions (API 30). The app calls it unconditionally from
     * androidx.core/MediaDrm paths; on API 29 the class does not exist, so the extension version
     * is 0 (the value the platform reports for an absent extension).
     */
    public static int getExtensionVersion(int extension) {
        return Build.VERSION.SDK_INT >= 30 ? Api30.getExtensionVersion(extension) : 0;
    }

    private static final class Api30 {

        private Api30() {
        }

        static void setWindowInsetsAnimationCallback(Object view, Object callback) {
            ((View) view).setWindowInsetsAnimationCallback((WindowInsetsAnimation.Callback) callback);
        }

        static void setFitInsetsSides(Object layoutParams, int sides) {
            ((WindowManager.LayoutParams) layoutParams).setFitInsetsSides(sides);
        }

        static void setFitInsetsTypes(Object layoutParams, int types) {
            ((WindowManager.LayoutParams) layoutParams).setFitInsetsTypes(types);
        }

        static void setPath(Object outline, Object path) {
            ((Outline) outline).setPath((Path) path);
        }

        static String getAttributionTag(Object context) {
            return ((Context) context).getAttributionTag();
        }

        static List<?> getHistoricalProcessExitReasons(
                Object activityManager, String packageName, int pid, int maxNum) {
            return ((ActivityManager) activityManager)
                    .getHistoricalProcessExitReasons(packageName, pid, maxNum);
        }

        static boolean isShowingLayoutBounds(Object view) {
            return ((View) view).isShowingLayoutBounds();
        }

        static void setDecorFitsSystemWindows(Object window, boolean fitSystemWindows) {
            ((Window) window).setDecorFitsSystemWindows(fitSystemWindows);
        }

        static void setFrameRate(Surface surface, float frameRate, int compatibility) {
            surface.setFrameRate(frameRate, compatibility);
        }

        static int getExtensionVersion(int extension) {
            return SdkExtensions.getExtensionVersion(extension);
        }
    }
}
