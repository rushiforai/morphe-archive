package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.ComponentName;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Bundle;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Process;
import android.preference.PreferenceManager;
import android.provider.MediaStore;
import android.net.Uri;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkRequest;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import org.lsposed.hiddenapibypass.HiddenApiBypass;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.Socket;
import javax.net.SocketFactory;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.regex.Pattern;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/** Runtime component of the Haiagaru patch, embedded in ChMate. */
public final class Haiagaru {
    private static final String LOG_TAG = "Haiagaru";
    /**
     * A cellular Network requested for a post must remain requested while the
     * HTTP client is using its socket.  Releasing the callback immediately
     * after onAvailable() lets Android tear down the request underneath the
     * socket and can reproduce "Binding socket to network N failed: EPERM".
     * ChMate closes its sockets inside generated code, so the extension keeps
     * the lease for a bounded post window instead of guessing at a close hook.
     */
    private static final long CELLULAR_NETWORK_LEASE_MILLIS = 120_000L;
    private static final Handler CELLULAR_NETWORK_LEASE_HANDLER =
            new Handler(Looper.getMainLooper());
    private static final Map<Activity, PopupWindow> SETTINGS_BUTTON_POPUPS =
            new WeakHashMap<>();
    private static final String PREFS_NAME =
            "io.github.areteruhiro.chmate.haiagaru.ui-config";
    private static final String LEGACY_TALK_PREFS_NAME = "talk";
    private static final String LEGACY_TALK_SESSION_REPAIR_KEY =
            "legacyTalkSessionRepairLastUpdateV2";
    private static final String BUTTON_TAG = "haiagaru.settings.button";
    private static final String DEFAULT_USER_AGENT =
            "Dalvik/2.1.0 (Linux; U; Android 4.0.3; HT-01 Build/XYZ0.123456.789)";
    private static final String DEFAULT_COOKIE_CLASS =
            "com.franmontiel.persistentcookiejar.persistence.SharedPrefsCookiePersistor";
    private static final String DEFAULT_MONAKEY_FILE = "2chapi";
    private static final String DEFAULT_MONAKEY_KEY = "2chapi_monakey";
    private static final String CHMATE_SEARCH_URLS_KEY = "searchUrls1";
    private static final String CHMATE_ABBREV_SINGLE_ID_KEY = "abbrevSingleId";
    private static final String CHMATE_COPIPE_NG_KEY = "copipeNg";
    private static final String CHMATE_COPIPE_NG_AR_KEY = "copipeNgAR";
    private static final String CHMATE_COPIPE_NG2_KEY = "copipeNg2";
    private static final String CHMATE_ARASHI_NG_KEY = "arashiNg";
    /** ChMate's own bounded post-history store (postDataList.json). */
    private static final String CHMATE_POST_DATA_LIST_COUNT_KEY = "postDataListCount";
    private static final int DEFAULT_CHMATE_POST_DATA_LIST_COUNT = 100;
    private static final int MAX_CHMATE_POST_DATA_LIST_COUNT = 10_000;
    private static final String ARCHIVE_ROUTE_TEMPLATES_KEY = "archiveRouteTemplates";
    private static final String ARCHIVE_PRESET_MARKER = "【Haiagaru】";
    private static final String ARCHIVE_PRESET_URL =
            "https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/"
                    + "refs/heads/master/presets/chmate-dat-fallen-search-urls.txt";
    private static final String ARCHIVE_HOST_MATCH =
            "{$host[match:\\.[25]ch\\.(?:net|io)$]}";
    private static final String BUILTIN_ARCHIVE_PRESET =
            ARCHIVE_HOST_MATCH + ARCHIVE_PRESET_MARKER
                    + "5ch公式過去ログへ https://kako.5ch.io/test/read.cgi/{$bbs}/{$key}/\n"
                    + ARCHIVE_HOST_MATCH + ARCHIVE_PRESET_MARKER
                    + "5ch現在サーバーへ https://itest.5ch.io/test/read.cgi/{$bbs}/{$key}/\n"
                    + ARCHIVE_HOST_MATCH + ARCHIVE_PRESET_MARKER
                    + "2ch.scへ https://2ch.sc/test/read.cgi/{$bbs}/{$key}/";
    private static final String DEFAULT_ARCHIVE_ROUTE_TEMPLATES =
            "dat|https://{$server}.5ch.io/{$bbs}/dat/{$key}.dat\n"
                    + "kako|https://kako.5ch.io/test/read.cgi/{$bbs}/{$key}/\n"
                    + "itest|https://itest.5ch.io/public/newapi/client.php?subdomain={$server}"
                    + "&board={$bbs}&dat={$key}&rand={$rand}\n"
                    + "dat|https://{$server}.2ch.sc/{$bbs}/dat/{$key}.dat";
    private static final String AD_CLASS_191 = "o.qheCC";
    private static final String AD_CLASS_241 = "o.setUseHandlerThreadForCallbacks";
    private static final String AD_CLASS_243 = "o.zzexb";
    private static final Pattern LEGACY_BE_ATTACHMENT_TOKEN = Pattern.compile(
            "(?:(?:sssp|https?):)?//img\\.5ch\\.(?:io|net)/(?:ico|premium)/[^\\s<\\u0003\\u3000]+"
                    + "|\\u0003img\\.5ch\\.(?:io|net)/(?:ico|premium)/[^\\s<\\u0003\\u3000]+",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern LEGACY_PREMIUM_BE_URL = Pattern.compile(
            "(?:(?:(?:sssp|https?):)?//|\\u0003)img\\.5ch\\.(?:io|net)/premium/([^\\s<\\u0003\\u3000]+)",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern LEGACY_BE_ICO_URL = Pattern.compile(
            "(?:(?:(?:sssp|https?):)?//|\\u0003)img\\.5ch\\.(?:io|net)/ico/([^\\s<\\u0003\\u3000]+)",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern LEGACY_THREAD_READ_PATH = Pattern.compile(
            "^/test/read\\.cgi/([^/]+)/(\\d{9,10})(?:/.*)?$",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern ITEST_SERVER_THREAD_READ_PATH = Pattern.compile(
            "^/([a-z0-9_-]+)/test/read\\.cgi/([^/]+)/(\\d{9,10})(/.*)?$",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern LEGACY_THREAD_DAT_PATH = Pattern.compile(
            "^/([^/]+)/(?:dat|kako(?:/[^/]+)*)/(\\d{9,10})\\.dat$",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern SC_BOARD_LINK = Pattern.compile(
            "(?i)//([a-z0-9_-]+)\\.2ch\\.sc/([a-z0-9_]+)/"
    );
    private static final String ORIGINAL_CERTIFICATE =
            "MIICZTCCAc6gAwIBAgIETUOudzANBgkqhkiG9w0BAQUFADB2MQswCQYDVQQGEwJK"
            + "UDEOMAwGA1UECBMFVG9reW8xETAPBgNVBAcTCFNldGFnYXlhMRUwEwYDVQQKEwxB"
            + "SVJGUk9OVCBJbmMxFTATBgNVBAsTDEFJUkZST05UIEluYzEWMBQGA1UEAxMNSWl6"
            + "dWthIFl1dGFrYTAgFw0xMTAxMjkwNjA2NDdaGA8yMTExMDEwNTA2MDY0N1owdjEL"
            + "MAkGA1UEBhMCSlAxDjAMBgNVBAgTBVRva3lvMREwDwYDVQQHEwhTZXRhZ2F5YTEV"
            + "MBMGA1UEChMMQUlSRlJPTlQgSW5jMRUwEwYDVQQLEwxBSVJGUk9OVCBJbmMxFjAU"
            + "BgNVBAMTDUlpenVrYSBZdXRha2EwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGB"
            + "AIHFDp9gJvnNQ0I0oummb9HEMDi6gQJ3DwhHkTBymKn00gwInFEx+URZNzT1P2SV"
            + "8te21T199vUvBygujXaJknmoIPy2T6HNIVFt0hREWQqtsCQNeQWZj4Qdmcgr2T6C"
            + "DKl0Cgy20Qf5Q/DTmVSLKM6fIjabi9WzvZThLlhyFzbVAgMBAAEwDQYJKoZIhvcN"
            + "AQEFBQADgYEAOfY6cwtJbh2vX95s0Xlhsr6am63Gq78Fh39zP/vO7g2fkas4miT5"
            + "1ITb29uBm1Mggd2pD1mP6SELsexpdaz/6xBtWk5KagFAgS+4yuceXn9HQ5dgCk2v"
            + "9kQy5kSVkF2kCALI9DxTEE3yuzZFKw7f7pKGZzs3wZCyeMCZNCC2MRQ=";

    private static volatile Context applicationContext;
    private static volatile boolean crashLoggerInstalled;
    private static volatile boolean signatureSpoofInstalled;
    private static volatile String runtimePackageName = originalPackageName();

    private Haiagaru() {
    }

    /** Makes ChMate's distributed integrity calculations see its original certificate. */
    @SuppressWarnings("deprecation")
    public static synchronized void installSignatureSpoof() {
        if (signatureSpoofInstalled) return;

        runtimePackageName = resolveRuntimePackageName();

        final Signature originalSignature = new Signature(
                Base64.decode(ORIGINAL_CERTIFICATE, Base64.DEFAULT));
        final Parcelable.Creator<PackageInfo> originalCreator = PackageInfo.CREATOR;
        final Parcelable.Creator<PackageInfo> spoofingCreator = new Parcelable.Creator<PackageInfo>() {
            @Override
            public PackageInfo createFromParcel(Parcel source) {
                PackageInfo info = originalCreator.createFromParcel(source);
                if (originalPackageName().equals(info.packageName)
                        || runtimePackageName.equals(info.packageName)) {
                    if (info.signatures != null && info.signatures.length > 0) {
                        info.signatures[0] = originalSignature;
                    }
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P && info.signingInfo != null) {
                        Signature[] signers = info.signingInfo.getApkContentsSigners();
                        if (signers != null && signers.length > 0) {
                            signers[0] = originalSignature;
                        }
                    }
                }
                return info;
            }

            @Override
            public PackageInfo[] newArray(int size) {
                return originalCreator.newArray(size);
            }
        };

        try {
            HiddenApiBypass.addHiddenApiExemptions(
                    "Landroid/os/Parcel;", "Landroid/content/pm", "Landroid/app");
            findField(PackageInfo.class, "CREATOR").set(null, spoofingCreator);
            clearStaticCache(PackageManager.class, "sPackageInfoCache");
            clearStaticMap(Parcel.class, "mCreators");
            clearStaticMap(Parcel.class, "sPairedCreators");
            signatureSpoofInstalled = true;
        } catch (ReflectiveOperationException e) {
            throw new IllegalStateException("Unable to install ChMate signature spoof", e);
        }
    }

    private static void clearStaticCache(Class<?> type, String name) {
        try {
            Object cache = findField(type, name).get(null);
            if (cache != null) cache.getClass().getMethod("clear").invoke(cache);
        } catch (Throwable ignored) {
        }
    }

    private static void clearStaticMap(Class<?> type, String name) {
        try {
            Object value = findField(type, name).get(null);
            if (value instanceof Map) ((Map<?, ?>) value).clear();
        } catch (Throwable ignored) {
        }
    }

    private static String resolveRuntimePackageName() {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Object value = activityThread.getDeclaredMethod("currentPackageName").invoke(null);
            if (value instanceof String && !((String) value).isEmpty()) {
                return (String) value;
            }
        } catch (ReflectiveOperationException ignored) {
        }
        return originalPackageName();
    }

    private static Field findField(Class<?> type, String name) throws NoSuchFieldException {
        Class<?> cursor = type;
        while (cursor != null && cursor != Object.class) {
            try {
                Field field = cursor.getDeclaredField(name);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
                cursor = cursor.getSuperclass();
            }
        }
        throw new NoSuchFieldException(type.getName() + "." + name);
    }

    /** Runs the legacy 0.8.10.191 image request without its generated integrity decoy. */
    public static Object uploadLegacyImage(Object[] arguments) throws Exception {
        File image = (File) arguments[0];
        HttpURLConnection connection = (HttpURLConnection) new URL(
                "https://imgw.syoboi.jp/3/image").openConnection();
        connection.setConnectTimeout(30_000);
        connection.setReadTimeout(30_000);
        connection.setRequestMethod("POST");
        connection.setRequestProperty("x-imgw-key",
                "0c6d5f862ad665e0556be3602dfc3f673b01060ab7acf4ccebba10bb073b4c8f");
        connection.setRequestProperty("Content-Type", "image/*");
        connection.setDoOutput(true);
        connection.setFixedLengthStreamingMode(image.length());

        try {
            try (InputStream input = new BufferedInputStream(new FileInputStream(image));
                 OutputStream output = connection.getOutputStream()) {
                byte[] buffer = new byte[16 * 1024];
                int count;
                while ((count = input.read(buffer)) != -1) {
                    output.write(buffer, 0, count);
                }
            }

            int status = connection.getResponseCode();
            InputStream responseStream = status >= 200 && status < 300
                    ? connection.getInputStream() : connection.getErrorStream();
            String body = readUtf8(responseStream);
            JSONObject root = new JSONObject(body);

            ClassLoader loader = Haiagaru.class.getClassLoader();
            Class<?> responseType = Class.forName(
                    "o.r0ExternalSyntheticLambda13", true, loader);
            Class<?> dataType = Class.forName(
                    "o.r0ExternalSyntheticLambda16", true, loader);
            Object response = responseType.getDeclaredConstructor().newInstance();
            Object data = dataType.getDeclaredConstructor().newInstance();

            boolean success = root.optBoolean("success", status >= 200 && status < 300);
            responseType.getSuperclass().getField("b").setBoolean(response, success);
            responseType.getSuperclass().getField("c").setInt(
                    response, root.optInt("status", status));

            Object dataValue = root.opt("data");
            if (dataValue instanceof JSONObject) {
                JSONObject dataJson = (JSONObject) dataValue;
                dataType.getField("b").set(data, dataJson.optString("deletehash", null));
                dataType.getField("c").set(data, dataJson.optString("error", null));
                dataType.getField("d").set(data, dataJson.optString("link", null));
            } else if (dataValue != null && dataValue != JSONObject.NULL) {
                dataType.getField("c").set(data, String.valueOf(dataValue));
            } else if (!success) {
                dataType.getField("c").set(data, body);
            }
            responseType.getField("d").set(response, data);
            return response;
        } finally {
            connection.disconnect();
        }
    }

    private static String readUtf8(InputStream input) throws Exception {
        if (input == null) return "";
        try (InputStream stream = input; ByteArrayOutputStream output = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8 * 1024];
            int count;
            while ((count = stream.read(buffer)) != -1) {
                output.write(buffer, 0, count);
            }
            return new String(output.toByteArray(), StandardCharsets.UTF_8);
        }
    }

    /**
     * Runs before ChMate initializes its process-wide preference cache. This is required after
     * restoring an original-package backup into an optionally renamed installation.
     */
    public static void onProviderCreate(ContentProvider provider) {
        if (provider == null) return;
        Context context = provider.getContext();
        if (context == null) return;
        initializeApplicationContext(context);
    }

    /** Fallback for processes that do not create ChMate's startup provider. */
    public static void onApplicationPreCreate(Application application) {
        if (application == null) return;
        initializeApplicationContext(application);
    }

    public static void onApplicationCreate(Application application) {
        if (application == null) return;
        // Keep the same process-wide application context used by the provider
        // hook.  The provider runs before ChMate creates its HTTP clients, so
        // applying the UA there is required for the first request after restart.
        initializeApplicationContext(application);
    }

    private static void initializeApplicationContext(Context context) {
        Context resolvedContext = context.getApplicationContext();
        Context appContext = resolvedContext == null ? context : resolvedContext;
        applicationContext = appContext;
        EdgeReporterHistory.initialize(appContext);
        ProgrammableNgController.initialize(appContext);
        runtimePackageName = appContext.getPackageName();
        migrateRestoredPackageReferences(appContext);
        HttpsTransport.setEnabled(preferences(appContext).getBoolean("forceHttps", false));
        applyUserAgent();
    }

    /** Installs the optional crash logger before ChMate's startup provider does any work. */
    public static synchronized void installCrashLogger(ContentProvider provider) {
        if (crashLoggerInstalled || provider == null) return;
        Context context = provider.getContext();
        if (context == null) return;
        Context appContext = context.getApplicationContext();
        final Context crashContext = appContext == null ? context : appContext;
        final Thread.UncaughtExceptionHandler previous =
                Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler((thread, error) -> {
            try {
                writeCrashLog(crashContext, thread, error);
            } catch (Throwable logError) {
                Log.e(LOG_TAG, "Unable to save crash log", logError);
            } finally {
                if (previous != null) {
                    previous.uncaughtException(thread, error);
                } else {
                    Process.killProcess(Process.myPid());
                    System.exit(10);
                }
            }
        });
        crashLoggerInstalled = true;
    }

    private static void writeCrashLog(Context context, Thread thread, Throwable error)
            throws IOException {
        Date now = new Date();
        String timestamp = new SimpleDateFormat(
                "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
                Locale.US
        ).format(now);
        String fileTimestamp = new SimpleDateFormat(
                "yyyyMMdd-HHmmss-SSS",
                Locale.US
        ).format(now);
        StringWriter stackTrace = new StringWriter();
        Throwable reportError = error == null
                ? new RuntimeException("Unknown uncaught exception")
                : error;
        reportError.printStackTrace(new PrintWriter(stackTrace));

        String versionName = "unknown";
        long versionCode = -1;
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(
                    context.getPackageName(),
                    0
            );
            versionName = info.versionName;
            versionCode = Build.VERSION.SDK_INT >= 28
                    ? info.getLongVersionCode()
                    : info.versionCode;
        } catch (Throwable ignored) {
        }

        String report = "Haiagaru crash log\n"
                + "Time: " + timestamp + "\n"
                + "Package: " + context.getPackageName() + "\n"
                + "Version: " + versionName + " (" + versionCode + ")\n"
                + "Android: " + Build.VERSION.RELEASE + " (SDK " + Build.VERSION.SDK_INT + ")\n"
                + "Device: " + Build.MANUFACTURER + " " + Build.MODEL + "\n"
                + "Thread: " + thread.getName() + "\n\n"
                + stackTrace;
        writeDownloadLog(context, "chmate-crash-" + fileTimestamp + ".txt", report);
    }

    /** Writes a UTF-8 report to Downloads/Haiagaru on every supported Android release. */
    private static void writeDownloadLog(Context context, String fileName, String report)
            throws IOException {
        if (context == null) throw new IOException("No context available for Downloads log");
        if (Build.VERSION.SDK_INT >= 29) {
            ContentValues values = new ContentValues();
            values.put(MediaStore.MediaColumns.DISPLAY_NAME, fileName);
            values.put(MediaStore.MediaColumns.MIME_TYPE, "text/plain");
            values.put(
                    MediaStore.MediaColumns.RELATIVE_PATH,
                    Environment.DIRECTORY_DOWNLOADS + "/Haiagaru"
            );
            values.put(MediaStore.MediaColumns.IS_PENDING, 1);
            Uri uri = context.getContentResolver().insert(
                    MediaStore.Downloads.EXTERNAL_CONTENT_URI,
                    values
            );
            if (uri == null) throw new IOException("Unable to create Downloads log entry");
            boolean completed = false;
            try (OutputStream output = context.getContentResolver().openOutputStream(uri)) {
                if (output == null) throw new IOException("Unable to open Downloads log entry");
                writeUtf8(output, report);
                completed = true;
            } finally {
                if (completed) {
                    ContentValues ready = new ContentValues();
                    ready.put(MediaStore.MediaColumns.IS_PENDING, 0);
                    context.getContentResolver().update(uri, ready, null, null);
                } else {
                    context.getContentResolver().delete(uri, null, null);
                }
            }
            return;
        }

        File directory = new File(
                Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS),
                "Haiagaru"
        );
        if (!directory.isDirectory() && !directory.mkdirs()) {
            throw new IOException("Unable to create " + directory);
        }
        try (OutputStream output = new FileOutputStream(new File(directory, fileName))) {
            writeUtf8(output, report);
        }
    }

    private static void writeUtf8(OutputStream output, String text) throws IOException {
        OutputStreamWriter writer = new OutputStreamWriter(output, StandardCharsets.UTF_8);
        writer.write(text);
        writer.flush();
    }

    /**
     * Runs the current image uploader after repairing its certificate-derived cache.
     *
     * <p>ChMate 0.8.10.243 loads this uploader from an in-memory DEX. Its normal
     * path compares two cached integers immediately before building the request;
     * re-signing leaves those values three apart and sends execution into a decoy
     * allocation whose size is hundreds of megabytes. Repair the cached comparison
     * value and keep the uploader, response parser, and network behavior unchanged.</p>
     */
    public static Object invokeCurrentImageUploader(
            Method method,
            Object receiver,
            Object[] arguments
    ) throws Throwable {
        ClassLoader loader = method.getDeclaringClass().getClassLoader();
        Class<?> stateClass = Class.forName("o.setHasVideoContent", false, loader);
        Field stateField = stateClass.getDeclaredField("b");
        stateField.setAccessible(true);
        Object[] state = (Object[]) stateField.get(null);
        if (state != null && state.length > 3
                && state[2] instanceof int[] && state[3] instanceof int[]) {
            int[] expected = (int[]) state[2];
            int[] actual = (int[]) state[3];
            if (expected.length > 0 && actual.length > 0) {
                actual[0] = expected[0];
            }
        }

        try {
            return method.invoke(receiver, arguments);
        } catch (InvocationTargetException error) {
            Throwable cause = error.getCause();
            throw cause == null ? error : cause;
        }
    }

    /**
     * Runs the pre-5ch.io image uploader after repairing its cached integrity state.
     *
     * <p>ChMate 0.8.10.226 decrypts the uploader into an in-memory DEX. The
     * re-signed package leaves two cached values unequal, which diverts the
     * otherwise valid upload into a deliberate {@code throw null} branch.</p>
     */
    public static Object invokePreIoImageUploader(
            Method method,
            Object receiver,
            Object[] arguments
    ) throws Throwable {
        ClassLoader loader = method.getDeclaringClass().getClassLoader();
        Class<?> stateClass = Class.forName("o.getMethodokhttp", false, loader);
        Field stateField = stateClass.getDeclaredField("c");
        stateField.setAccessible(true);
        Object[] state = (Object[]) stateField.get(null);
        if (state != null && state.length > 3
                && state[1] instanceof int[] && state[3] instanceof int[]) {
            int[] first = (int[]) state[1];
            int[] second = (int[]) state[3];
            if (first.length > 0 && second.length > 0) {
                first[0] = second[0];
            }
        }

        try {
            return method.invoke(receiver, arguments);
        } catch (InvocationTargetException error) {
            Throwable cause = error.getCause();
            throw cause == null ? error : cause;
        }
    }

    /**
     * ChMate backups contain preference values rather than a package manifest. When a backup
     * created by the original package contains an absolute app-data path or content URI, remap
     * that value to the optional renamed package before ChMate reads the restored preferences.
     */
    private static synchronized void migrateRestoredPackageReferences(Context application) {
        String originalPackage = originalPackageName();
        String currentPackage = application.getPackageName();
        if (originalPackage.equals(currentPackage)) return;

        int migratedSettings = migrateLegacyDefaultPreferences(
                application,
                originalPackage,
                currentPackage
        );
        File preferencesDirectory = new File(application.getApplicationInfo().dataDir, "shared_prefs");
        File[] preferenceFiles = preferencesDirectory.listFiles((directory, name) ->
                name != null && name.endsWith(".xml"));
        if (preferenceFiles == null) {
            if (migratedSettings > 0) {
                Log.i(LOG_TAG, "Migrated " + migratedSettings
                        + " ChMate settings to the renamed package");
            }
            return;
        }

        int changedValues = 0;
        for (File preferenceFile : preferenceFiles) {
            String fileName = preferenceFile.getName();
            String preferenceName = fileName.substring(0, fileName.length() - 4);
            try {
                SharedPreferences preferences = application.getSharedPreferences(
                        preferenceName,
                        Context.MODE_PRIVATE
                );
                SharedPreferences.Editor editor = null;
                for (Map.Entry<String, ?> entry : preferences.getAll().entrySet()) {
                    Object value = entry.getValue();
                    if (value instanceof String) {
                        String rewritten = rewriteRestoredPackageReference(
                                (String) value,
                                originalPackage,
                                currentPackage
                        );
                        if (!value.equals(rewritten)) {
                            if (editor == null) editor = preferences.edit();
                            editor.putString(entry.getKey(), rewritten);
                            changedValues++;
                        }
                    } else if (value instanceof Set) {
                        @SuppressWarnings("unchecked")
                        Set<String> strings = (Set<String>) value;
                        Set<String> rewritten = new HashSet<>(strings.size());
                        boolean changed = false;
                        for (String string : strings) {
                            String replacement = rewriteRestoredPackageReference(
                                    string,
                                    originalPackage,
                                    currentPackage
                            );
                            rewritten.add(replacement);
                            changed |= !replacement.equals(string);
                        }
                        if (changed) {
                            if (editor == null) editor = preferences.edit();
                            editor.putStringSet(entry.getKey(), rewritten);
                            changedValues++;
                        }
                    }
                }
                if (editor != null) editor.commit();
            } catch (Throwable error) {
                Log.w(LOG_TAG, "Unable to normalize restored preferences: " + fileName, error);
            }
        }
        if (changedValues > 0) {
            Log.i(LOG_TAG, "Normalized " + changedValues + " restored package references");
        }
        if (migratedSettings > 0) {
            Log.i(LOG_TAG, "Migrated " + migratedSettings
                    + " ChMate settings to the renamed package");
        }
    }

    /**
     * ChMate 191 writes restored default preferences under its original hard-coded package name.
     * PreferenceManager, however, reads the runtime package name after Morphe renames the app.
     * Move every supported SharedPreferences value to the runtime default-preference file before
     * ChMate creates its preference singleton.
     */
    private static int migrateLegacyDefaultPreferences(
            Context application,
            String originalPackage,
            String currentPackage
    ) {
        String legacyPreferenceName = originalPackage + "_preferences";
        String currentPreferenceName = currentPackage + "_preferences";
        File preferencesDirectory = new File(application.getApplicationInfo().dataDir, "shared_prefs");
        File legacyPreferenceFile = new File(
                preferencesDirectory,
                legacyPreferenceName + ".xml"
        );
        if (!legacyPreferenceFile.isFile()) return 0;

        try {
            SharedPreferences legacyPreferences = application.getSharedPreferences(
                    legacyPreferenceName,
                    Context.MODE_PRIVATE
            );
            Map<String, ?> restoredValues = legacyPreferences.getAll();
            if (restoredValues.isEmpty()) return 0;

            SharedPreferences.Editor editor = application.getSharedPreferences(
                    currentPreferenceName,
                    Context.MODE_PRIVATE
            ).edit();
            int migratedValues = 0;
            for (Map.Entry<String, ?> entry : restoredValues.entrySet()) {
                String key = entry.getKey();
                Object value = entry.getValue();
                if (value instanceof Boolean) {
                    editor.putBoolean(key, (Boolean) value);
                } else if (value instanceof Integer) {
                    editor.putInt(key, (Integer) value);
                } else if (value instanceof Long) {
                    editor.putLong(key, (Long) value);
                } else if (value instanceof Float) {
                    editor.putFloat(key, (Float) value);
                } else if (value instanceof String) {
                    editor.putString(
                            key,
                            rewriteRestoredPackageReference(
                                    (String) value,
                                    originalPackage,
                                    currentPackage
                            )
                    );
                } else if (value instanceof Set) {
                    @SuppressWarnings("unchecked")
                    Set<String> strings = (Set<String>) value;
                    Set<String> rewritten = new HashSet<>(strings.size());
                    for (String string : strings) {
                        rewritten.add(rewriteRestoredPackageReference(
                                string,
                                originalPackage,
                                currentPackage
                        ));
                    }
                    editor.putStringSet(key, rewritten);
                } else {
                    Log.w(LOG_TAG, "Skipping unsupported restored setting: " + key);
                    continue;
                }
                migratedValues++;
            }

            if (migratedValues == 0 || !editor.commit()) return 0;

            boolean deleted = false;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                deleted = application.deleteSharedPreferences(legacyPreferenceName);
            }
            if (!deleted) {
                legacyPreferences.edit().clear().commit();
                File backupFile = new File(legacyPreferenceFile.getPath() + ".bak");
                if (legacyPreferenceFile.exists() && !legacyPreferenceFile.delete()) {
                    Log.w(LOG_TAG, "Unable to remove migrated legacy preference file");
                }
                if (backupFile.exists() && !backupFile.delete()) {
                    Log.w(LOG_TAG, "Unable to remove migrated legacy preference backup");
                }
            }
            return migratedValues;
        } catch (Throwable error) {
            Log.e(LOG_TAG, "Unable to migrate restored ChMate settings", error);
            return 0;
        }
    }

    private static String rewriteRestoredPackageReference(
            String value,
            String originalPackage,
            String currentPackage
    ) {
        if (value == null || !value.contains(originalPackage)) return value;
        if (!currentPackage.startsWith(originalPackage)) {
            return value.replace(originalPackage, currentPackage);
        }

        StringBuilder rewritten = null;
        int copiedUntil = 0;
        int searchFrom = 0;
        int match = value.indexOf(originalPackage, searchFrom);
        while (match >= 0) {
            if (value.startsWith(currentPackage, match)) {
                searchFrom = match + currentPackage.length();
            } else {
                if (rewritten == null) rewritten = new StringBuilder(value.length() + 16);
                rewritten.append(value, copiedUntil, match).append(currentPackage);
                copiedUntil = match + originalPackage.length();
                searchFrom = copiedUntil;
            }
            match = value.indexOf(originalPackage, searchFrom);
        }
        if (rewritten == null) return value;
        return rewritten.append(value, copiedUntil, value.length()).toString();
    }

    /** Keeps ChMate's explicit self-navigation inside an optionally renamed installation. */
    public static Intent retargetSelfIntent(Intent intent) {
        if (intent == null) return null;
        ComponentName component = intent.getComponent();
        String currentPackage = runtimePackageName;
        if (component == null || currentPackage == null
                || originalPackageName().equals(currentPackage)
                || !originalPackageName().equals(component.getPackageName())
                || !component.getClassName().startsWith("jp.syoboi.")) {
            return intent;
        }
        intent.setComponent(new ComponentName(currentPackage, component.getClassName()));
        return intent;
    }

    public static boolean shouldHideAds() {
        return shouldHideAds(applicationContext);
    }

    /**
     * Clears the captured Compose flag which emits the tablet-only 50dp banner spacer.
     * The generated lambda name changes between ChMate releases, so resolve its single
     * boolean capture structurally instead of depending on an obfuscated field name.
     */
    public static void suppressTabletThreadHeaderAdSpace(Object owner) {
        if (owner == null || !shouldHideAds()) {
            return;
        }
        try {
            for (Field field : owner.getClass().getDeclaredFields()) {
                if (field.getType() == Boolean.TYPE
                        && !java.lang.reflect.Modifier.isStatic(field.getModifiers())) {
                    field.setAccessible(true);
                    field.setBoolean(owner, false);
                    return;
                }
            }
        } catch (Throwable throwable) {
            Log.w(LOG_TAG, "Unable to suppress tablet banner spacer", throwable);
        }
    }

    public static boolean shouldHideAds(Context context) {
        if (context != null) {
            Context resolvedContext = context.getApplicationContext();
            applicationContext = resolvedContext == null ? context : resolvedContext;
        }
        SharedPreferences preferences = preferencesOrNull();
        return preferences == null || preferences.getBoolean("hideAd", true);
    }

    public static CharSequence replace5chDomain(CharSequence original) {
        if (original == null || !isChtoioEnabled()) return original;
        if (!original.toString().contains("5ch.net")) return original;

        return TextUtils.replace(
                original,
                new String[]{"5ch.net"},
                new CharSequence[]{"5ch.io"}
        );
    }

    /** Rewrites a stored legacy board-menu endpoint to the canonical 5ch.io host. */
    public static String rewriteBbsMenuUrl(String original) {
        if (original == null || !isChtoioEnabled()) return original;
        return original
                .replace("https://menu.5ch.net", "https://menu.5ch.io")
                .replace("http://menu.5ch.net", "https://menu.5ch.io");
    }

    public static String rewrite5chUrl(String original) {
        if (original == null) return null;
        String rewritten = rewriteLegacyTalkBoardResource(original);
        if (!isChtoioEnabled()) return rewritten;
        rewritten = rewritten.replace("5ch.net", "5ch.io");
        try {
            Uri uri = Uri.parse(rewritten);
            String host = uri.getHost();
            String path = uri.getPath();
            if (host == null || path == null
                    || !host.equalsIgnoreCase("itest.5ch.io")) {
                return rewritten;
            }

            java.util.regex.Matcher matcher = ITEST_SERVER_THREAD_READ_PATH.matcher(path);
            if (!matcher.matches()) return rewritten;

            String suffix = matcher.group(4);
            StringBuilder normalized = new StringBuilder()
                    .append("https://")
                    .append(matcher.group(1))
                    .append(".5ch.io/test/read.cgi/")
                    .append(matcher.group(2))
                    .append('/')
                    .append(matcher.group(3))
                    .append(suffix == null || suffix.isEmpty() ? "/" : suffix);
            if (uri.getEncodedQuery() != null) {
                normalized.append('?').append(uri.getEncodedQuery());
            }
            if (uri.getEncodedFragment() != null) {
                normalized.append('#').append(uri.getEncodedFragment());
            }
            return normalized.toString();
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to normalize itest thread URL", error);
            return rewritten;
        }
    }

    /** Redirects Edge's subject list to the metadata feed that includes reporter IDs. */
    public static String rewriteSubjectUrl(String original) {
        SharedPreferences preferences = preferencesOrNull();
        return EdgeSubjectUrl.rewrite(original,
                preferences == null || preferences.getBoolean("edgeReporterId", true));
    }

    /**
     * ChMate can retain pre-web Talk board roots such as {@code talk.jp/operation/}.
     * The current website serves threads below /boards, while the classic endpoint
     * remains the 2ch-compatible source for subject.txt and board settings. Rewrite
     * only those board resources; thread bodies are loaded through the Talk JSON API.
     */
    private static String rewriteLegacyTalkBoardResource(String original) {
        try {
            Uri uri = Uri.parse(original);
            String host = uri.getHost();
            String path = uri.getPath();
            if (host == null || path == null || !host.equalsIgnoreCase("talk.jp")) {
                return original;
            }
            if (!path.matches("(?i)^/[a-z0-9_-]+/(?:subject\\.txt|setting\\.txt|head\\.txt)$")) {
                return original;
            }
            return uri.buildUpon()
                    .scheme("https")
                    .encodedAuthority("classic.talk-platform.com")
                    .build()
                    .toString();
        } catch (Throwable ignored) {
            return original;
        }
    }

    /**
     * Converts a thread URL on an obsolete 2ch/5ch server before ChMate creates
     * BBSUrlInfo. itest is independent of the thread's former server name and has
     * a dedicated parser in ChMate. The official kako archive and 2ch.sc mirror
     * remain available through the archived-thread search preset.
     */
    public static boolean loadLiveTalkDat(String url, File destination) throws IOException {
        return ArchivedThreadImporter.loadLiveTalkDat(url, destination);
    }

    /**
     * Creates a socket on the currently usable cellular network. ChMate's
     * cellular-only client keeps one Network.SocketFactory, but Android 16 can
     * invalidate that Network while a post is being assembled. Resolve the
     * network again for every new socket and retry the current candidates before
     * falling back to ChMate's original factory.
     */
    public static Socket createCellularSocket(SocketFactory fallback, String host, int port)
            throws IOException {
        if (!isCellularNetworkRefreshEnabled()) return fallback.createSocket(host, port);
        return createRequestedCellularSocket(host, port, null, 0);
    }

    public static Socket createCellularSocket(
            SocketFactory fallback, String host, int port, InetAddress localAddress, int localPort)
            throws IOException {
        if (!isCellularNetworkRefreshEnabled()) {
            return fallback.createSocket(host, port, localAddress, localPort);
        }
        return createRequestedCellularSocket(host, port, localAddress, localPort);
    }

    public static Socket createCellularSocket(
            SocketFactory fallback, InetAddress address, int port) throws IOException {
        if (!isCellularNetworkRefreshEnabled()) return fallback.createSocket(address, port);
        return createRequestedCellularSocket(address, port, null, 0);
    }

    public static Socket createCellularSocket(
            SocketFactory fallback, InetAddress address, int port,
            InetAddress localAddress, int localPort) throws IOException {
        if (!isCellularNetworkRefreshEnabled()) {
            return fallback.createSocket(address, port, localAddress, localPort);
        }
        return createRequestedCellularSocket(address, port, localAddress, localPort);
    }

    private static Socket createRequestedCellularSocket(
            String host, int port, InetAddress localAddress, int localPort) throws IOException {
        IOException last = null;
        for (int attempt = 0; attempt < 2; attempt++) {
            CellularNetworkLease lease = requestCellularNetwork();
            if (lease == null) continue;
            try {
                Socket socket = localAddress == null
                        ? lease.network.getSocketFactory().createSocket(host, port)
                        : lease.network.getSocketFactory().createSocket(
                                host, port, localAddress, localPort);
                retainCellularNetworkLease(lease);
                Log.i(LOG_TAG, "Using requested cellular network " + lease.network
                        + " for post socket");
                return socket;
            } catch (IOException error) {
                last = error;
                lease.release();
                Log.w(LOG_TAG, "Requested cellular network socket failed on attempt "
                        + (attempt + 1), error);
            }
        }
        throw last != null ? last : new IOException("No cellular network available for post");
    }

    private static Socket createRequestedCellularSocket(
            InetAddress address, int port, InetAddress localAddress, int localPort)
            throws IOException {
        IOException last = null;
        for (int attempt = 0; attempt < 2; attempt++) {
            CellularNetworkLease lease = requestCellularNetwork();
            if (lease == null) continue;
            try {
                Socket socket = localAddress == null
                        ? lease.network.getSocketFactory().createSocket(address, port)
                        : lease.network.getSocketFactory().createSocket(
                                address, port, localAddress, localPort);
                retainCellularNetworkLease(lease);
                Log.i(LOG_TAG, "Using requested cellular network " + lease.network
                        + " for post socket");
                return socket;
            } catch (IOException error) {
                last = error;
                lease.release();
                Log.w(LOG_TAG, "Requested cellular network socket failed on attempt "
                        + (attempt + 1), error);
            }
        }
        throw last != null ? last : new IOException("No cellular network available for post");
    }

    private static CellularNetworkLease requestCellularNetwork() {
        Context context = applicationContext;
        if (context == null) return null;
        ConnectivityManager manager = null;
        CellularNetworkLease lease = null;
        try {
            manager = (ConnectivityManager)
                    context.getSystemService(Context.CONNECTIVITY_SERVICE);
            if (manager == null) return null;
            CountDownLatch ready = new CountDownLatch(1);
            Network[] result = new Network[1];
            ConnectivityManager.NetworkCallback callback = new ConnectivityManager.NetworkCallback() {
                @Override
                public void onAvailable(Network network) {
                    result[0] = network;
                    ready.countDown();
                }

            };
            NetworkRequest request = new NetworkRequest.Builder()
                    .addCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
                    .addTransportType(NetworkCapabilities.TRANSPORT_CELLULAR)
                    .build();
            manager.requestNetwork(request, callback);
            lease = new CellularNetworkLease(manager, callback);
            if (!ready.await(5L, TimeUnit.SECONDS) || result[0] == null) {
                lease.release();
                return null;
            }
            lease.network = result[0];
            return lease;
        } catch (Throwable error) {
            if (lease != null) lease.release();
            Log.w(LOG_TAG, "Unable to request a fresh cellular network", error);
            return null;
        }
    }

    private static void retainCellularNetworkLease(final CellularNetworkLease lease) {
        CELLULAR_NETWORK_LEASE_HANDLER.postDelayed(
                lease::release, CELLULAR_NETWORK_LEASE_MILLIS);
    }

    /** Whether the user enabled the fresh-cellular-network workaround. */
    public static boolean isCellularNetworkRefreshEnabled() {
        SharedPreferences preferences = preferencesOrNull();
        return preferences == null || preferences.getBoolean("refreshCellularNetwork", true);
    }

    private static final class CellularNetworkLease {
        private final ConnectivityManager manager;
        private final ConnectivityManager.NetworkCallback callback;
        private volatile Network network;
        private boolean released;

        private CellularNetworkLease(
                ConnectivityManager manager,
                ConnectivityManager.NetworkCallback callback) {
            this.manager = manager;
            this.callback = callback;
        }

        private synchronized void release() {
            if (released) return;
            released = true;
            try {
                manager.unregisterNetworkCallback(callback);
            } catch (Throwable ignored) {
            }
        }
    }

    /**
     * Repairs the write session left by older 191 patches once, without touching
     * the rest of ChMate's data.  The stock Talk flow stores a replacement
     * {@code x-write-key} before showing its confirmation dialog.  If that dialog
     * is cancelled, the matching one-shot extend token is discarded while the
     * replacement key remains in {@code talk.xml}.  Every later post then reuses
     * an impossible key/token pair until all app data is cleared.
     */
    public static void prepareLegacyTalkPostSession() {
        Context context = applicationContext;
        if (context == null) return;
        SharedPreferences haiagaru = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        long installedAt = 1L;
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            if (info.lastUpdateTime > 0) installedAt = info.lastUpdateTime;
        } catch (Throwable ignored) {
            try {
                long modified = new File(context.getApplicationInfo().sourceDir).lastModified();
                if (modified > 0) installedAt = modified;
            } catch (Throwable ignoredAgain) {
            }
        }
        if (installedAt == haiagaru.getLong(LEGACY_TALK_SESSION_REPAIR_KEY, Long.MIN_VALUE)) return;
        clearLegacyTalkWriteSession(context);
        haiagaru.edit()
                .putLong(LEGACY_TALK_SESSION_REPAIR_KEY, installedAt)
                .remove("legacyTalkSessionRepairVersionV1")
                .remove("legacyTalkSessionRepairV1")
                .commit();
        Log.i(LOG_TAG, "Repaired legacy Talk write session after APK update");
    }

    /** Drops only 191's renewable Talk write credentials after confirmation is cancelled. */
    public static void resetLegacyTalkPostSession() {
        Context context = applicationContext;
        if (context == null) return;
        clearLegacyTalkWriteSession(context);
        Log.i(LOG_TAG, "Reset legacy Talk write session after cancelled confirmation");
    }

    private static void clearLegacyTalkWriteSession(Context context) {
        context.getSharedPreferences(LEGACY_TALK_PREFS_NAME, Context.MODE_PRIVATE)
                .edit()
                .remove("talk_write_key")
                .remove("talk_created")
                .commit();
    }

    /**
     * ChMate 0.8.10.191 restores its Talk client into a dedicated in-memory DEX.
     * A certificate-derived comparison in that DEX deliberately divides by zero
     * when the APK is re-signed. Keep the generated request/authentication code,
     * but normalize only the two comparison values before it is invoked.
     */
    public static void normalizeLegacyTalkAuthIntegrity(Object authClient) {
        if (authClient == null) return;
        normalizeLegacyTalkAuthIntegrity(authClient.getClass().getClassLoader());
    }

    /** Invokes the 191 generated Talk authenticator and repairs its refreshed cache once. */
    public static Object invokeLegacyTalkAuthenticator(
            java.lang.reflect.Method method,
            Object target,
            Object[] arguments
    ) {
        if (method == null) throw new NullPointerException("method");
        // The generated Talk client can refresh its certificate-derived cache
        // after construction.  Repair it at the actual invocation boundary as
        // well, rather than relying solely on the constructor hook.
        normalizeLegacyTalkAuthIntegrity(method.getDeclaringClass().getClassLoader());
        try {
            return method.invoke(target, arguments);
        } catch (java.lang.reflect.InvocationTargetException error) {
            Throwable cause = error.getCause();
            // Depending on the generated DEX revision the failed integrity
            // comparison is expressed either as divide-by-zero or throw-null.
            if (!(cause instanceof ArithmeticException)
                    && !(cause instanceof NullPointerException)) {
                return Haiagaru.<RuntimeException, Object>throwUnchecked(cause);
            }
            // The generated client can replace its static certificate cache between
            // construction and this reflected call.  Repair that refreshed state and
            // retry only the authentication calculation once.
            normalizeLegacyTalkAuthIntegrity(method.getDeclaringClass().getClassLoader());
            try {
                return method.invoke(target, arguments);
            } catch (java.lang.reflect.InvocationTargetException retryError) {
                return Haiagaru.<RuntimeException, Object>throwUnchecked(retryError.getCause());
            } catch (Throwable retryError) {
                return Haiagaru.<RuntimeException, Object>throwUnchecked(retryError);
            }
        } catch (Throwable error) {
            return Haiagaru.<RuntimeException, Object>throwUnchecked(error);
        }
    }

    private static void normalizeLegacyTalkAuthIntegrity(ClassLoader loader) {
        try {
            Class<?> stateClass = Class.forName("o.fm", false, loader);
            Field stateField = stateClass.getDeclaredField("e");
            stateField.setAccessible(true);
            Object value = stateField.get(null);
            if (!(value instanceof Object[])) return;
            Object[] state = (Object[]) value;
            if (state.length < 2 || !(state[0] instanceof int[]) || !(state[1] instanceof int[])) {
                return;
            }
            int[] actual = (int[]) state[0];
            int[] expected = (int[]) state[1];
            if (actual.length == 0 || expected.length == 0) return;
            expected[0] = actual[0];

            // The generated method refreshes this state after roughly two seconds.
            // Hold the normalized state for the duration of the authentication call.
            Field timestampField = stateClass.getDeclaredField("c");
            timestampField.setAccessible(true);
            timestampField.setLong(null, System.currentTimeMillis() + 86_400_000L);
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to normalize legacy Talk authentication state", error);
        }
    }

    /**
     * Runs ChMate 226's dynamically restored Talk posting method after repairing
     * only its certificate-derived comparison cache. The generated class throws
     * null when the two cached integers differ, which surfaces as an unexplained
     * NullPointerException after the APK has been re-signed.
     */
    public static Object invokePreIoTalkPoster(
            java.lang.reflect.Method method,
            Object target,
            Object[] arguments
    ) {
        if (method == null) throw new NullPointerException("method");
        normalizeGeneratedIntegrityState(target, "o.head", "e", "d");
        try {
            return method.invoke(target, arguments);
        } catch (java.lang.reflect.InvocationTargetException error) {
            return Haiagaru.<RuntimeException, Object>throwUnchecked(error.getCause());
        } catch (Throwable error) {
            return Haiagaru.<RuntimeException, Object>throwUnchecked(error);
        }
    }

    /**
     * Invokes 226's generated Talk session/key builder after repairing the same
     * certificate-derived state used by its private string encoder.  This call
     * runs before the posting method, so repairing only invokePreIoTalkPoster is
     * too late: the encoder otherwise deliberately throws a bare NPE.
     */
    public static Object invokePreIoTalkAuthenticator(
            java.lang.reflect.Method method,
            Object target,
            Object[] arguments
    ) {
        if (method == null) throw new NullPointerException("method");
        normalizeGeneratedIntegrityState(target, "o.head", "e", "d");
        try {
            return method.invoke(target, arguments);
        } catch (java.lang.reflect.InvocationTargetException error) {
            Throwable cause = error.getCause();
            if (!isGeneratedIntegrityFailure(cause)) {
                return Haiagaru.<RuntimeException, Object>throwUnchecked(cause);
            }
            normalizeGeneratedIntegrityState(target, "o.head", "e", "d");
            try {
                return method.invoke(target, arguments);
            } catch (java.lang.reflect.InvocationTargetException retryError) {
                return Haiagaru.<RuntimeException, Object>throwUnchecked(retryError.getCause());
            } catch (Throwable retryError) {
                return Haiagaru.<RuntimeException, Object>throwUnchecked(retryError);
            }
        } catch (Throwable error) {
            return Haiagaru.<RuntimeException, Object>throwUnchecked(error);
        }
    }

    /** Compatibility wrapper for 0.8.10.241's generated Talk authenticator. */
    public static Object invokeIoTalkPoster(
            java.lang.reflect.Method method,
            Object target,
            Object[] arguments
    ) {
        if (method == null) throw new NullPointerException("method");
        if ("o.setTimeUpdate".equals(method.getDeclaringClass().getName())
                && "e".equals(method.getName())
                && arguments != null && arguments.length == 5) {
            try {
                applyIoTalkPostHeaders(arguments);
                return null;
            } catch (Throwable error) {
                return Haiagaru.<RuntimeException, Object>throwUnchecked(error);
            }
        }
        normalizeIoTalkIntegrity(method.getDeclaringClass(), target);
        try {
            return method.invoke(target, arguments);
        } catch (java.lang.reflect.InvocationTargetException error) {
            Throwable cause = error.getCause();
            if (!isGeneratedIntegrityFailure(cause)) {
                return Haiagaru.<RuntimeException, Object>throwUnchecked(cause);
            }
            normalizeIoTalkIntegrity(method.getDeclaringClass(), target);
            try {
                return method.invoke(target, arguments);
            } catch (java.lang.reflect.InvocationTargetException retryError) {
                return Haiagaru.<RuntimeException, Object>throwUnchecked(retryError.getCause());
            } catch (Throwable retryError) {
                return Haiagaru.<RuntimeException, Object>throwUnchecked(retryError);
            }
        } catch (Throwable error) {
            return Haiagaru.<RuntimeException, Object>throwUnchecked(error);
        }
    }

    /**
     * Recreates 0.8.10.241's Talk authentication request without entering the
     * generated digest routine.  That routine derives the correct HMAC but can
     * throw a numeric integrity exception before returning it after an update.
     */
    public static Object invokeIoTalkAuth(
            java.lang.reflect.Method method,
            Object target,
            Object[] arguments
    ) {
        if (method == null) throw new NullPointerException("method");
        if ("o.setTimeUpdate".equals(method.getDeclaringClass().getName())
                && "b".equals(method.getName())
                && arguments != null && arguments.length == 4
                && arguments[1] instanceof String
                && arguments[2] instanceof String
                && arguments[3] instanceof Number) {
            try {
                return requestIoTalkAuth(
                        (String) arguments[1],
                        (String) arguments[2],
                        ((Number) arguments[3]).longValue());
            } catch (Throwable error) {
                return Haiagaru.<RuntimeException, Object>throwUnchecked(error);
            }
        }
        return invokeIoTalkPoster(method, target, arguments);
    }

    private static String requestIoTalkAuth(String id, String password, long suppliedTime)
            throws Exception {
        // ChMate 241 passes epoch seconds here.  Do not convert the value a
        // second time: using milliseconds-to-seconds conversion again changes
        // the HMAC input and makes Talk reject the write token.
        long authTime = suppliedTime;
        String appKey = "KkaD9iXqKv9lp2luO9SuaTL8lmvRPj";
        String digestInput = id + password + appKey + authTime;

        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(new SecretKeySpec(
                "eaGheElQLJ6QJNOKHLxWL15GvgLkVn".getBytes(StandardCharsets.UTF_8),
                "HmacSHA256"));
        byte[] digest = mac.doFinal(digestInput.getBytes(StandardCharsets.UTF_8));
        StringBuilder hex = new StringBuilder(digest.length * 2);
        for (byte item : digest) hex.append(String.format(Locale.ROOT, "%02x", item & 0xff));

        String form = "ID=" + java.net.URLEncoder.encode(id, "UTF-8")
                + "&PW=" + java.net.URLEncoder.encode(password, "UTF-8")
                + "&KY=" + java.net.URLEncoder.encode(appKey, "UTF-8")
                + "&CT=" + authTime
                + "&HB=" + hex;
        byte[] body = form.getBytes(StandardCharsets.UTF_8);
        java.net.HttpURLConnection connection = (java.net.HttpURLConnection)
                new java.net.URL("https://api.talk-platform.com/v1/auth/").openConnection();
        connection.setConnectTimeout(15000);
        connection.setReadTimeout(15000);
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        connection.setRequestProperty(
                "Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        connection.setFixedLengthStreamingMode(body.length);
        try {
            java.io.OutputStream output = connection.getOutputStream();
            output.write(body);
            output.close();
            int status = connection.getResponseCode();
            java.io.InputStream input = status >= 400
                    ? connection.getErrorStream() : connection.getInputStream();
            String response = readUtf8Response(input);
            String firstLine = response == null ? "" : response.split("[\\r\\n]", 2)[0];
            if (status < 200 || status >= 300 || firstLine.length() <= 26) {
                throw new java.io.IOException(
                        "Talk authentication failed (HTTP " + status + "): " + firstLine);
            }
            return firstLine.substring(26);
        } finally {
            connection.disconnect();
        }
    }

    private static String readUtf8Response(java.io.InputStream input) throws java.io.IOException {
        if (input == null) return "";
        java.io.ByteArrayOutputStream output = new java.io.ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int count;
        try {
            while ((count = input.read(buffer)) >= 0) output.write(buffer, 0, count);
        } finally {
            input.close();
        }
        return new String(output.toByteArray(), StandardCharsets.UTF_8);
    }

    /** Recreates 241's two Talk headers without entering its re-signing trap. */
    private static void applyIoTalkPostHeaders(Object[] arguments) throws Exception {
        Object requestBuilder = arguments[0];
        String writeSourceKey = String.valueOf(arguments[1]);
        String writeKey = String.valueOf(arguments[3]);
        Object parameters = arguments[4];

        java.util.HashMap<String, String> values = new java.util.HashMap<>();
        if (parameters instanceof Iterable) {
            for (Object entry : (Iterable<?>) parameters) {
                if (entry == null) continue;
                Field nameField = entry.getClass().getDeclaredField("c");
                Field valueField = entry.getClass().getDeclaredField("a");
                nameField.setAccessible(true);
                valueField.setAccessible(true);
                Object name = nameField.get(entry);
                Object value = valueField.get(entry);
                if (name != null) values.put(String.valueOf(name), value == null ? "" : String.valueOf(value));
            }
        }
        String timestamp = String.valueOf(System.currentTimeMillis() / 1000L);
        String payload = valueOrEmpty(values, "bbs") + "<>"
                + valueOrEmpty(values, "key") + "<>"
                + valueOrEmpty(values, "mail") + "<>"
                + valueOrEmpty(values, "MESSAGE") + "<>"
                + timestamp + "<>"
                + writeSourceKey + "<>";

        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(new SecretKeySpec(
                "eaGheElQLJ6QJNOKHLxWL15GvgLkVn".getBytes(StandardCharsets.UTF_8),
                "HmacSHA256"));
        byte[] digest = mac.doFinal(payload.getBytes(StandardCharsets.UTF_8));
        StringBuilder hex = new StringBuilder(digest.length * 2);
        for (byte item : digest) hex.append(String.format(Locale.ROOT, "%02x", item & 0xff));

        Object headerBuilder = null;
        for (Field field : requestBuilder.getClass().getDeclaredFields()) {
            field.setAccessible(true);
            Object value = field.get(requestBuilder);
            if (value != null && value.getClass().getName().contains("Headers$ComponentActivity")) {
                headerBuilder = value;
                break;
            }
        }
        if (headerBuilder == null) throw new IllegalStateException("Talk header builder was not found");
        Method addHeader = null;
        for (Method candidate : headerBuilder.getClass().getDeclaredMethods()) {
            if ("c".equals(candidate.getName())
                    && candidate.getParameterTypes().length == 2
                    && candidate.getParameterTypes()[0] == String.class
                    && candidate.getParameterTypes()[1] == String.class) {
                addHeader = candidate;
                break;
            }
        }
        if (addHeader == null) throw new IllegalStateException("Talk header method was not found");
        addHeader.setAccessible(true);
        addHeader.invoke(headerBuilder, "X-Write-Token", hex.toString());
        addHeader.invoke(headerBuilder, "X-Write-Key", writeKey);

        Method setParameter = parameters.getClass().getDeclaredMethod(
                "a", String.class, String.class);
        setParameter.setAccessible(true);
        setParameter.invoke(parameters, "time", timestamp);
        setParameter.invoke(parameters, "appkey", "KkaD9iXqKv9lp2luO9SuaTL8lmvRPj");
        setParameter.invoke(parameters, "sid", writeSourceKey);
    }

    private static String valueOrEmpty(java.util.Map<String, String> values, String key) {
        String value = values.get(key);
        return value == null ? "" : value;
    }

    private static boolean isGeneratedIntegrityFailure(Throwable error) {
        if (error instanceof ArithmeticException || error instanceof NullPointerException) return true;
        if (!(error instanceof RuntimeException)) return false;
        String message = error.getMessage();
        return message != null && message.matches("-?\\d+");
    }

    private static void normalizeIoTalkIntegrity(Class<?> generatedClass, Object target) {
        normalizeIntegrityFields(generatedClass, null);
        if (target != null) normalizeIntegrityFields(target.getClass(), target);
        ClassLoader loader = generatedClass == null ? null : generatedClass.getClassLoader();
        normalizeIoTalkStateClass(loader, "o._JvmPlatformKt");
        normalizeIoTalkStateClass(loader, "o.canonicalizeInternal");
    }

    private static void normalizeIoTalkStateClass(ClassLoader loader, String className) {
        if (loader == null) return;
        try {
            Class<?> stateClass = Class.forName(className, false, loader);
            for (Field field : stateClass.getDeclaredFields()) {
                if (!java.lang.reflect.Modifier.isStatic(field.getModifiers())
                        || field.getType() != Object[].class) continue;
                field.setAccessible(true);
                Object value = field.get(null);
                if (!(value instanceof Object[])) continue;
                Object[] state = (Object[]) value;
                if (state.length < 2 || !(state[0] instanceof int[])
                        || !(state[1] instanceof int[])) continue;
                int[] actual = (int[]) state[0];
                int[] expected = (int[]) state[1];
                if (actual.length != 0 && expected.length != 0) {
                    expected[0] = actual[0];
                }
            }
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to normalize ChMate 241 Talk state " + className, error);
        }
    }

    private static void normalizeIntegrityFields(Class<?> type, Object owner) {
        if (type == null) return;
        try {
            for (Field field : type.getDeclaredFields()) {
                boolean isStatic = java.lang.reflect.Modifier.isStatic(field.getModifiers());
                if (!isStatic && owner == null) continue;
                field.setAccessible(true);
                Object receiver = isStatic ? null : owner;
                if (field.getType() == long.class && isStatic) {
                    field.setLong(null, System.currentTimeMillis() + 86_400_000L);
                    continue;
                }
                Object value = field.get(receiver);
                if (!(value instanceof Object[])) continue;
                Object[] state = (Object[]) value;
                int[][] integers = new int[3][];
                int count = 0;
                for (Object item : state) {
                    if (item instanceof int[] && ((int[]) item).length != 0 && count < integers.length) {
                        integers[count++] = (int[]) item;
                    }
                }
                if (count >= 2) integers[1][0] = integers[0][0];
                if (count >= 3) integers[2][0] = -1531869433;
            }
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to normalize ChMate 241 Talk integrity state", error);
        }
    }

    private static void normalizeGeneratedIntegrityState(
            Object owner,
            String className,
            String stateFieldName,
            String timestampFieldName
    ) {
        if (owner == null) return;
        try {
            ClassLoader loader = owner.getClass().getClassLoader();
            Class<?> stateClass = Class.forName(className, false, loader);
            Field stateField = stateClass.getDeclaredField(stateFieldName);
            stateField.setAccessible(true);
            Object value = stateField.get(null);
            if (!(value instanceof Object[])) return;
            Object[] state = (Object[]) value;
            if (state.length < 2 || !(state[0] instanceof int[]) || !(state[1] instanceof int[])) {
                return;
            }
            int[] first = (int[]) state[0];
            int[] second = (int[]) state[1];
            if (first.length == 0 || second.length == 0) return;
            second[0] = first[0];

            Field timestampField = stateClass.getDeclaredField(timestampFieldName);
            timestampField.setAccessible(true);
            timestampField.setLong(null, System.currentTimeMillis() + 86_400_000L);
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to normalize generated Talk integrity state", error);
        }
    }

    @SuppressWarnings("unchecked")
    private static <E extends Throwable, T> T throwUnchecked(Throwable error) throws E {
        throw (E) error;
    }

    public static void rewriteLegacyThreadIntent(Activity activity) {
        if (activity == null) return;
        Intent intent = activity.getIntent();
        if (intent == null || intent.getData() == null) return;
        String original = intent.getData().toString();
        boolean talkThread = ArchivedThreadImporter.isTalkThreadUrl(original);
        if (talkThread) {
            try {
                if ("0.8.10.243 dev".equals(activity.getPackageManager()
                        .getPackageInfo(activity.getPackageName(), 0).versionName)) {
                    // 243 fetches inside the native download lock, including refresh.
                    return;
                }
            } catch (android.content.pm.PackageManager.NameNotFoundException ignored) {
            }
        }
        if (!talkThread && !isChtoioEnabled()) return;
        String rewritten = talkThread ? original : rewriteLegacyThreadUrl(original);
        boolean archiveRetry = intent.getBooleanExtra("haiagaru.archive.retry", false);
        if (archiveRetry) {
            // The retry marker is valid only for the Activity opened immediately
            // after publishing a DAT. Do not let ChMate copy it into later intents.
            intent.removeExtra("haiagaru.archive.retry");
        }
        boolean shouldImport = talkThread
                || (isAutomaticDatEnabled(activity) && isArchivedThreadUrl(original));
        if (!archiveRetry && shouldImport
                && ArchivedThreadImporter.importIfNeeded(activity, original, rewritten)) {
            Log.i(LOG_TAG, "Handling thread through the local DAT cache: " + original);
            // ChMate would otherwise continue its regular network load while
            // the importer is fetching the same .io DAT. The importer opens a
            // retry Activity after publishing the local cache.
            activity.finish();
            return;
        }
        if (!original.equals(rewritten)) {
            intent.setData(Uri.parse(rewritten));
            Log.i(LOG_TAG, "Using browser-compatible fallback URL " + rewritten);
        }
    }

    /**
     * Applies the legacy-thread recovery path to the in-place tablet navigation
     * bundle. TabletHomeActivity opens threads without creating ResListActivity,
     * so its bundle would otherwise retain the obsolete server URL and bypass the
     * archived-DAT importer entirely.
     *
     * @return true when an asynchronous DAT import owns this navigation request
     */
    public static boolean rewriteLegacyTabletThreadBundle(Activity activity, Bundle bundle) {
        if (activity == null || bundle == null) return false;
        String original = bundle.getString("_data");
        if (original == null || original.isEmpty()) return false;

        boolean talkThread = ArchivedThreadImporter.isTalkThreadUrl(original);
        if (!talkThread && !isChtoioEnabled()) return false;
        String rewritten = talkThread ? original : rewriteLegacyThreadUrl(original);
        boolean archiveRetry = bundle.getBoolean("haiagaru.archive.retry", false);
        boolean shouldImport = talkThread
                || (isAutomaticDatEnabled(activity) && isArchivedThreadUrl(original));
        if (!archiveRetry && shouldImport
                && ArchivedThreadImporter.importIfNeeded(activity, original, rewritten)) {
            Log.i(LOG_TAG, "Handling tablet thread through the local DAT cache: " + original);
            return true;
        }
        if (!original.equals(rewritten)) {
            bundle.putString("_data", rewritten);
            Log.i(LOG_TAG, "Using tablet fallback URL " + rewritten);
        }
        return false;
    }

    private static boolean isArchivedThreadUrl(String value) {
        try {
            Uri uri = Uri.parse(value);
            String host = uri.getHost();
            String path = uri.getPath();
            if (host == null || path == null) return false;
            java.util.regex.Matcher matcher = LEGACY_THREAD_READ_PATH.matcher(path);
            if (!matcher.matches()) matcher = LEGACY_THREAD_DAT_PATH.matcher(path);
            return matcher.matches()
                    && isArchivedThreadCandidate(host.toLowerCase(Locale.ROOT), matcher.group(2));
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static String rewriteLegacyThreadUrl(String original) {
        if (original == null || original.isEmpty() || !isChtoioEnabled()) return original;
        String normalized = rewrite5chUrl(original);
        try {
            Uri uri = Uri.parse(normalized);
            String host = uri.getHost();
            String path = uri.getPath();
            if (host == null || path == null) return normalized;
            java.util.regex.Matcher matcher = LEGACY_THREAD_READ_PATH.matcher(path);
            if (!matcher.matches()) {
                matcher = LEGACY_THREAD_DAT_PATH.matcher(path);
            }
            if (!matcher.matches()) return normalized;

            String normalizedHost = host.toLowerCase(Locale.ROOT);
            if (!isArchivedThreadCandidate(normalizedHost, matcher.group(2))) {
                return normalized;
            }

            return "https://itest.5ch.io/test/read.cgi/"
                    + matcher.group(1) + "/" + matcher.group(2) + "/";
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to rewrite legacy thread URL", error);
            return normalized;
        }
    }

    private static boolean isArchivedThreadCandidate(String host, String threadKey) {
        if (host.equals("2ch.net") || host.endsWith(".2ch.net")) return true;
        if (!(host.endsWith(".5ch.net") || host.endsWith(".5ch.io"))) return false;

        int dot = host.indexOf('.');
        String server = dot > 0 ? host.substring(0, dot) : host;
        switch (server) {
            case "ai":
            case "anago":
            case "awabi":
            case "daily":
            case "fox":
            case "hayabusa":
            case "hayabusa2":
            case "hayabusa3":
            case "hayabusa5":
            case "hayabusa6":
            case "hello":
            case "hope":
            case "kanae":
            case "maguro":
            case "mastiff":
            case "peace":
            case "potato":
            case "raptor":
            case "wktk":
                return true;
            default:
                try {
                    long createdAtSeconds = Long.parseLong(threadKey);
                    long ninetyDaysAgoSeconds = System.currentTimeMillis() / 1000L
                            - 90L * 24L * 60L * 60L;
                    return createdAtSeconds < ninetyDaysAgoSeconds;
                } catch (NumberFormatException ignored) {
                    return false;
                }
        }
    }

    public static String normalizeBeIconUrl(String original) {
        if (original == null) return null;
        return original
                .replace("://img.5ch.net/ico/_be_", "://img.5ch.io/premium/")
                .replace("://img.5ch.net/ico/_be", "://img.5ch.io/premium/")
                .replace("://img.5ch.net/", "://img.5ch.io/");
    }

    public static String prepareLegacyBeParsing(String original) {
        if (original == null) return null;
        // The 191 parser only routes sssp://img.5ch.net/ico/... through its
        // inline icon renderer. Normalize every public spelling, including
        // ordinary https://, protocol-relative, and control-character encoded
        // /ico/ URLs. This matters when
        // the optional thread-date renderer inserts text before the URL: leaving
        // the image as a normal link makes the span offsets and attachment pass
        // disagree, which produces duplicate icons or a broken link.
        String prepared = LEGACY_PREMIUM_BE_URL.matcher(original)
                .replaceAll("sssp://img.5ch.net/ico/_be$1");
        return LEGACY_BE_ICO_URL.matcher(prepared)
                .replaceAll("sssp://img.5ch.net/ico/$1");
    }

    public static String stripLegacyBeAttachmentTokens(String original) {
        if (original == null || original.isEmpty()) return original;
        return LEGACY_BE_ATTACHMENT_TOKEN.matcher(original).replaceAll("");
    }

    public static boolean classifyLegacyBeIcon(
            String text,
            int[] linkInfo,
            boolean found
    ) {
        if (!found || text == null || linkInfo == null || linkInfo.length < 6) return found;

        int start = Math.max(0, Math.min(linkInfo[0], linkInfo[1]));
        int end = Math.min(text.length(), linkInfo[2]);
        if (start >= end) return found;

        String candidate = text.substring(start, end).toLowerCase(Locale.ROOT);
        if (isBeIconUrl(candidate)) {
            linkInfo[3] = 0;
            linkInfo[5] = 4;
        }
        return found;
    }

    /**
     * Reconciles the legacy parser's URL offsets with the final rendered text.
     * ChMate 191 can remove one display character before link parsing completes,
     * leaving every later URL span shifted right and dropping a URL at end-of-text.
     */
    public static long alignLegacyLinkRange(
            CharSequence renderedText,
            String url,
            int originalStart,
            int originalEnd
    ) {
        int start = originalStart;
        int end = originalEnd;
        if (renderedText != null && url != null && !url.isEmpty()) {
            String text = renderedText.toString();
            boolean alreadyAligned = start >= 0
                    && end == start + url.length()
                    && end <= text.length()
                    && text.regionMatches(start, url, 0, url.length());
            if (!alreadyAligned) {
                int searchStart = Math.max(0, start - 8);
                int searchEnd = Math.min(text.length(), start + 8 + url.length());
                int candidate = text.indexOf(url, searchStart);
                int closest = -1;
                int closestDistance = Integer.MAX_VALUE;
                while (candidate >= 0 && candidate + url.length() <= searchEnd) {
                    int distance = Math.abs(candidate - start);
                    if (distance < closestDistance) {
                        closest = candidate;
                        closestDistance = distance;
                    }
                    candidate = text.indexOf(url, candidate + 1);
                }
                if (closest >= 0) {
                    start = closest;
                    end = closest + url.length();
                }
            }
        }
        return ((long) end << 32) | (start & 0xffffffffL);
    }

    /** Removes legacy BE tokens when ChMate requests BE icons to be hidden. */
    public static String filterBeIconText(String original, boolean hideBeIcon, boolean hideEmoticon) {
        if (!hideBeIcon || original == null || original.isEmpty()) return original;
        return stripLegacyBeAttachmentTokens(original);
    }

    public static String[] filterLegacyBeAttachments(String[] urls) {
        if (urls == null || urls.length == 0) return urls;

        int writeIndex = 0;
        String[] filtered = new String[urls.length];
        for (String url : urls) {
            if (!isBeIconUrl(url)) {
                filtered[writeIndex++] = url;
            }
        }
        if (writeIndex == urls.length) return urls;
        return writeIndex == 0 ? new String[0] : Arrays.copyOf(filtered, writeIndex);
    }

    private static boolean isBeIconUrl(String url) {
        if (url == null) return false;
        String normalized = url.toLowerCase(Locale.ROOT);
        return normalized.contains("img.5ch.io/ico/")
                || normalized.contains("img.5ch.net/ico/")
                || normalized.contains("img.5ch.io/premium/")
                || normalized.contains("img.5ch.net/premium/");
    }

    public static boolean is5chHost(String host) {
        if (host == null) return false;
        String normalized = host.toLowerCase(Locale.ROOT);
        return normalized.equals("5ch.net")
                || normalized.endsWith(".5ch.net")
                || normalized.equals("5ch.io")
                || normalized.endsWith(".5ch.io");
    }

    public static String normalizePostError(String error) {
        if (error != null && "0000 Confirmation".equalsIgnoreCase(error.trim())) {
            // Let ChMate's existing confirmation-form parser merge the returned hidden
            // fields and repeat the POST instead of treating the confirmation as failure.
            return "";
        }
        return error;
    }

    public static boolean isCurrentPostConfirmation(String html) {
        return html != null
                && html.contains("<!-- _X:cookie -->")
                && html.contains("name=\"feature\"")
                && html.contains("上記全てを承諾して書き込む");
    }

    public static boolean preserveServerPostForm(
            CharSequence ignoredExcludedField,
            CharSequence ignoredResponseField
    ) {
        return true;
    }

    public static void hideAdView(View view) {
        if (view == null || !shouldHideAds()) return;

        safeCollapseAdView(view);
        safePostCollapseAdView(view, 0);
        safePostCollapseAdView(view, 300);
        safePostCollapseAdView(view, 1000);
        safePostCollapseAdView(view, 2500);
    }

    /** Collapses the inline banner row inserted between the first two responses on 191. */
    public static void hideLegacyThreadListAd(
            View view,
            android.widget.BaseAdapter adapter,
            int position
    ) {
        if (view == null || adapter == null || !shouldHideAds()) return;
        try {
            // 191 reserves the tablet banner above the filter buttons as top padding on
            // the first adapter row. It is not an ad View, so collapsing SDK Views alone
            // cannot remove it. Normal response rows have no top padding.
            if (position == 0 && view.getPaddingTop() > 0) {
                view.setPadding(
                        view.getPaddingLeft(),
                        0,
                        view.getPaddingRight(),
                        view.getPaddingBottom()
                );
            }
            // The legacy response adapter reserves its sixth view type exclusively
            // for the in-thread banner. Normal responses use type 0.
            if (adapter.getItemViewType(position) == 5) {
                hideAdView(view);
            }
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to collapse legacy in-thread ad", error);
        }
    }

    /** Collapses ChMate 243's RecyclerView-only INLINE_AD response row. */
    public static void hideModernThreadListAd(View view) {
        if (view == null || !shouldHideAds()) return;
        safeCollapseAdView(view);
        safePostCollapseAdView(view, 0);
        safePostCollapseAdView(view, 300);
        safePostCollapseAdView(view, 1000);
        safePostCollapseAdView(view, 2500);
    }

    /** Removes empty inline slots left between Talk response rows. */
    public static void hideTalkThreadBlankRows(Activity activity) {
        if (activity == null || !shouldHideAds()) return;
        // This hook is installed on ResListActivity, which is also used for
        // ordinary 5ch threads.  Their response container can still be empty
        // while the first network load is in progress.  Treating that
        // container as an ad slot hides the whole thread on its first open.
        Intent intent = activity.getIntent();
        if (intent == null || intent.getData() == null
                || !ArchivedThreadImporter.isTalkThreadUrl(intent.getData().toString())) {
            return;
        }
        View root = activity.getWindow() == null
                ? null : activity.getWindow().getDecorView();
        if (!(root instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) root;
        Runnable scan = () -> collapseTalkBlankRows(group);
        group.post(scan);
        group.postDelayed(scan, 300);
        group.postDelayed(scan, 1000);
        group.postDelayed(scan, 2500);
    }

    private static void collapseTalkBlankRows(View view) {
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        String name = group.getClass().getName();
        if (name.contains("RecyclerView") || name.contains("AbsListView")
                || name.contains("ScrollView")) {
            for (int i = 0; i < group.getChildCount(); i++) {
                collapseTalkBlankRows(group.getChildAt(i));
            }
            return;
        }
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            // 0.8.10.241 leaves its inline-ad slot as a large childless
            // ViewGroup. Do not recursively classify arbitrary UI containers as
            // empty here: ChMate's bottom bar uses custom-drawn Views that have
            // no text/background and would otherwise be mistaken for spacers.
            if (child.getVisibility() == View.VISIBLE
                    && child instanceof ViewGroup
                    && ((ViewGroup) child).getChildCount() == 0
                    && child.getHeight() >= dp(child.getContext(), 160)) {
                collapseView(child);
                continue;
            }
            collapseTalkBlankRows(child);
        }
    }

    private static void collapseAdView(View view) {
        boolean wasLaidOut = view != null && view.getHeight() > 0;
        collapseView(view);
        collapseAdContainer(view, wasLaidOut);
    }

    private static void collapseAdContainer(View adView, boolean wasLaidOut) {
        // onViewCreated can reach the ad before measure/layout. At that point every
        // sibling also has height 0; walking upward would incorrectly collapse the
        // whole HomeActivity root and leave a black screen on launch.
        if (adView == null || !wasLaidOut) return;
        View current = adView;
        // Talk's inline slot is sometimes wrapped in a FrameLayout containing a second,
        // already-empty spacer. The old sole-child check left that wrapper at its reserved
        // height, producing a large blank row between two responses. Walk only the small
        // wrapper chain and collapse a parent after every child has become empty or hidden.
        for (int depth = 0; depth < 4 && current.getParent() instanceof ViewGroup; depth++) {
            ViewGroup container = (ViewGroup) current.getParent();
            String name = container.getClass().getName();
            if (name.contains("RecyclerView") || name.contains("AbsListView")
                    || name.contains("ScrollView")) {
                return;
            }
            boolean hasVisibleChild = false;
            for (int i = 0; i < container.getChildCount(); i++) {
                View child = container.getChildAt(i);
                if (child.getVisibility() == View.VISIBLE && child.getHeight() > 0
                        && !isEmptySpacer(child)) {
                    hasVisibleChild = true;
                    break;
                }
            }
            if (hasVisibleChild) return;
            collapseView(container);
            current = container;
        }
    }

    private static boolean isEmptySpacer(View view) {
        if (view == null || view.getVisibility() != View.VISIBLE || view.getHeight() <= 0) {
            return true;
        }
        if (view instanceof TextView) {
            CharSequence text = ((TextView) view).getText();
            return (text == null || text.length() == 0)
                    && view.getBackground() == null;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            // Talk 241 places the inline ad in a childless FrameLayout. The SDK
            // background remains attached even after the ad has no content, so
            // background presence alone cannot make this a non-empty row.
            if (group.getChildCount() == 0
                    && view.getHeight() >= dp(view.getContext(), 160)) {
                return true;
            }
            for (int i = 0; i < group.getChildCount(); i++) {
                if (!isEmptySpacer(group.getChildAt(i))) return false;
            }
            return view.getBackground() == null;
        }
        return view.getBackground() == null;
    }

    private static void collapseView(View view) {
        view.setVisibility(View.GONE);
        ViewGroup.LayoutParams params = view.getLayoutParams();
        if (params != null) {
            params.height = 0;
            view.setLayoutParams(params);
        }
    }

    private static void safeCollapseAdView(View view) {
        try {
            collapseAdView(view);
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to collapse ChMate ad view", error);
        }
    }

    private static void safePostCollapseAdView(View view, long delayMillis) {
        try {
            if (delayMillis <= 0) {
                view.post(() -> safeCollapseAdView(view));
            } else {
                view.postDelayed(() -> safeCollapseAdView(view), delayMillis);
            }
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to schedule ChMate ad view collapse", error);
        }
    }

    /** Reproduces the original version-code >= 494 HomeFragment banner discovery. */
    public static void hideHomeBanner(View root) {
        if (!(root instanceof ViewGroup) || !shouldHideAds()) return;

        ViewGroup rootGroup = (ViewGroup) root;
        if (hideRememberedAdViews(rootGroup)) {
            scheduleKnownAdChecks(rootGroup);
            return;
        }

        ViewGroup container = rootGroup.getChildCount() > 0
                && rootGroup.getChildAt(0) instanceof ViewGroup
                ? (ViewGroup) rootGroup.getChildAt(0)
                : rootGroup;

        int frameLayoutHit = 0;
        for (int i = 0; i < container.getChildCount(); i++) {
            View child = container.getChildAt(i);
            if (child instanceof FrameLayout) {
                frameLayoutHit++;
                if (frameLayoutHit == 2) {
                    rememberAdClass(child);
                    hideAdView(child);
                    scheduleKnownAdChecks(rootGroup);
                    return;
                }
            }
        }

        hideRememberedAdViews(rootGroup);
        scheduleKnownAdChecks(rootGroup);
    }

    /** Only the identified 191 ad view is safe to hide across arbitrary Fragments. */
    public static void hideLegacyBanner(View root) {
        if (!(root instanceof ViewGroup) || !shouldHideAds()) return;
        hideKnownLegacyAds(root);
        root.post(() -> hideKnownLegacyAds(root));
        root.postDelayed(() -> hideKnownLegacyAds(root), 300);
        root.postDelayed(() -> hideKnownLegacyAds(root), 1000);
        root.postDelayed(() -> hideKnownLegacyAds(root), 2500);
    }

    private static void hideKnownLegacyAds(View view) {
        // Search options also occupy a FrameLayout subclass. Neither child order
        // nor an adClass persisted by the old positional heuristic identifies ads.
        if (AD_CLASS_191.equals(view.getClass().getName())) {
            hideAdView(view);
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                hideKnownLegacyAds(group.getChildAt(i));
            }
        }
    }

    public static void removeMonaKey() {
        SharedPreferences preferences = preferencesOrNull();
        Context context = applicationContext;
        if (preferences == null || context == null
                || !preferences.getBoolean("removeMonaKey", false)) {
            return;
        }

        String file = preferences.getString("prefMonaKeyFile", DEFAULT_MONAKEY_FILE);
        String key = preferences.getString("prefMonaKeyName", DEFAULT_MONAKEY_KEY);
        if (file == null || file.trim().isEmpty() || key == null || key.trim().isEmpty()) return;

        context.getSharedPreferences(file.trim(), Context.MODE_PRIVATE)
                .edit()
                .remove(key.trim())
                .apply();
    }

    public static void onSettingsResume(Activity activity) {
        if (activity == null) return;
        applicationContext = activity.getApplicationContext();
        PopupWindow existing = SETTINGS_BUTTON_POPUPS.get(activity);
        if (existing != null && existing.isShowing()) return;

        View decorView = activity.getWindow().getDecorView();
        if (decorView == null) return;

        Button button = new Button(activity);
        button.setTag(BUTTON_TAG);
        button.setText("Haiagaru");
        button.setAllCaps(false);
        button.setOnClickListener(view -> view.post(() -> showSettingsDialog(activity)));

        PopupWindow popup = new PopupWindow(
                button,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                false
        );
        popup.setTouchable(true);
        popup.setOutsideTouchable(false);
        popup.setClippingEnabled(false);
        popup.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        if (Build.VERSION.SDK_INT >= 21) {
            popup.setElevation(dp(activity, 16));
        }
        SETTINGS_BUTTON_POPUPS.put(activity, popup);

        decorView.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View view) {
            }

            @Override
            public void onViewDetachedFromWindow(View view) {
                PopupWindow stored = SETTINGS_BUTTON_POPUPS.remove(activity);
                if (stored != null && stored.isShowing()) stored.dismiss();
            }
        });
        decorView.post(() -> {
            if (activity.isFinishing()
                    || (Build.VERSION.SDK_INT >= 17 && activity.isDestroyed())) {
                SETTINGS_BUTTON_POPUPS.remove(activity);
                return;
            }
            if (popup.isShowing()) return;
            try {
                popup.showAtLocation(
                        decorView,
                        Gravity.TOP | Gravity.END,
                        dp(activity, 10),
                        statusBarHeight(activity) + dp(activity, 5)
                );
            } catch (Throwable error) {
                SETTINGS_BUTTON_POPUPS.remove(activity);
                Log.w(LOG_TAG, "Unable to show Haiagaru settings popup button", error);
            }
        });
    }

    private static void showSettingsDialog(Activity activity) {
        SharedPreferences preferences = preferences(activity);

        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        int padding = dp(activity, 20);
        layout.setPadding(padding, padding, padding, padding);

        Switch hideAd = addSwitch(
                layout,
                activity,
                text("広告を削除", "Remove ads"),
                preferences.getBoolean("hideAd", true)
        );

        Switch replaceUserAgent = addSwitch(
                layout,
                activity,
                text("User-Agent の変更", "Enable replacing User-Agent"),
                preferences.getBoolean("replaceUserAgent", false)
        );
        EditText userAgent = addTextField(
                layout,
                activity,
                "User-Agent",
                preferences.getString("userAgent", DEFAULT_USER_AGENT)
        );

        Switch removeMonaKey = addSwitch(
                layout,
                activity,
                text("MonaKeyを削除", "Make MonaKey removable"),
                preferences.getBoolean("removeMonaKey", false)
        );
        EditText cookieClass = addTextField(
                layout,
                activity,
                text("SharedPrefsCookiePersistor クラス", "SharedPrefsCookiePersistor class"),
                preferences.getString("cookieClass", DEFAULT_COOKIE_CLASS)
        );
        EditText monaKeyFile = addTextField(
                layout,
                activity,
                text("2chapi 設定ファイル", "2chapi preference file"),
                preferences.getString("prefMonaKeyFile", DEFAULT_MONAKEY_FILE)
        );
        EditText monaKeyName = addTextField(
                layout,
                activity,
                text("2chapi_monakey 設定キー", "2chapi_monakey preference key"),
                preferences.getString("prefMonaKeyName", DEFAULT_MONAKEY_KEY)
        );
        EditText adClass = addTextField(
                layout,
                activity,
                text("広告クラス名", "Ad ClassName"),
                configuredAdClass(preferences)
        );
        Switch chtoio = addSwitch(
                layout,
                activity,
                "chtoio",
                preferences.getBoolean("chtoio", true)
        );
        Switch edgeReporterId = addSwitch(
                layout,
                activity,
                text("エッヂのスレタイ末尾に記者IDを表示", "Show Edge reporter IDs in thread titles"),
                preferences.getBoolean("edgeReporterId", true)
        );
        Switch forceHttps = addSwitch(
                layout,
                activity,
                text("HTTP通信をHTTPSへ切り替える（画像を含む）", "Upgrade HTTP to HTTPS (including images)"),
                preferences.getBoolean("forceHttps", false)
        );
        TextView httpsDescription = new TextView(activity);
        httpsDescription.setText(text(
                "HTTPS非対応の接続先は読み込めなくなります。その場合はOFFにしてください。",
                "Servers without HTTPS will fail to load. Turn this off if needed."
        ));
        httpsDescription.setTextSize(13);
        layout.addView(httpsDescription, rowParams(activity));
        Switch automaticDat = addSwitch(
                layout,
                activity,
                text("自動DAT取得", "Automatic DAT retrieval"),
                preferences.getBoolean("automaticDat", true)
        );
        Switch refreshCellularNetwork = addSwitch(
                layout,
                activity,
                text("投稿時にモバイル回線を再取得する", "Refresh the cellular network before posting"),
                preferences.getBoolean("refreshCellularNetwork", true)
        );
        TextView refreshCellularNetworkDescription = new TextView(activity);
        refreshCellularNetworkDescription.setText(text(
                "ON（推奨）では、古いNetwork IDを使わず投稿前にセルラー回線を再要求します。"
                        + " OFFにするとChMate本来の接続選択へ戻ります。",
                "ON (recommended) requests a fresh cellular network before posting instead of reusing "
                        + "a stale Network ID. OFF restores ChMate's original selection."
        ));
        refreshCellularNetworkDescription.setTextSize(13);
        layout.addView(refreshCellularNetworkDescription, rowParams(activity));
        Switch bypassPostPreflight = addSwitch(
                layout,
                activity,
                text("投稿前の本文チェックを無効化",
                        "Disable the local post body check"),
                preferences.getBoolean("bypassPostPreflight", true)
        );
        TextView bypassPostPreflightDescription = new TextView(activity);
        bypassPostPreflightDescription.setText(text(
                "ONにすると、空欄・端末情報のみかどうかの判定を投稿先サーバーに任せます。"
                        + " 誤判定される場合はON、ChMate本来の確認を使う場合はOFFにしてください。",
                "When enabled, empty-body and device-info-only validation is left to the server. "
                        + "Enable this if ChMate rejects non-empty text; disable it to restore ChMate's check."
        ));
        bypassPostPreflightDescription.setTextSize(13);
        layout.addView(bypassPostPreflightDescription, rowParams(activity));

        final SharedPreferences chMatePreferences =
                PreferenceManager.getDefaultSharedPreferences(activity);
        EditText postDataListCount = addTextField(
                layout,
                activity,
                text("書き込み履歴に残す件数（0で残さない）",
                        "Posts to keep in post history (0 keeps none)"),
                Integer.toString(chMatePreferences.getInt(
                        CHMATE_POST_DATA_LIST_COUNT_KEY,
                        DEFAULT_CHMATE_POST_DATA_LIST_COUNT
                ))
        );
        TextView postDataListCountDescription = new TextView(activity);
        postDataListCountDescription.setText(text(
                "書き込み履歴の古い項目から削除します。設定変更時にもすぐ整理されます。"
                        + " 1〜10000、または0を指定できます。",
                "Oldest post-history entries are removed first, including immediately after changing "
                        + "this setting. Choose 0 to 10000."
        ));
        postDataListCountDescription.setTextSize(13);
        layout.addView(postDataListCountDescription, rowParams(activity));

        boolean legacyPlusSupportedValue = false;
        Switch abbrevSingleIdValue = null;
        Switch copipeNg2Value = null;
        Switch arashiNgValue = null;
        try {
            legacyPlusSupportedValue = supportsLegacyChMatePlus(activity);
            if (legacyPlusSupportedValue) {
                TextView plusDescription = new TextView(activity);
                plusDescription.setText(text(
                        "ChMate+互換機能（191/226/243 dev）\n"
                                + "アプリに含まれている表示・省略機能をここから切り替えます。",
                        "ChMate+ compatibility (191/226/243 dev)\n"
                                + "Toggle the built-in display and abbreviation features here."
                ));
                plusDescription.setTextSize(13);
                layout.addView(plusDescription, rowParams(activity));
                abbrevSingleIdValue = addSwitch(
                        layout,
                        activity,
                        text("単発ID表示を省略", "Abbreviate single-ID display"),
                        chMatePreferences.getBoolean(CHMATE_ABBREV_SINGLE_ID_KEY, false)
                );
                copipeNg2Value = addSwitch(
                        layout,
                        activity,
                        text("コピペ省略2", "Copy-paste abbreviation 2"),
                        chMatePreferences.getBoolean(CHMATE_COPIPE_NG2_KEY, false)
                );
                arashiNgValue = addSwitch(
                        layout,
                        activity,
                        text("荒らし省略", "Troll abbreviation"),
                        chMatePreferences.getBoolean(CHMATE_ARASHI_NG_KEY, false)
                );
            }
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to add ChMate+ compatibility controls", error);
            legacyPlusSupportedValue = false;
            abbrevSingleIdValue = null;
            copipeNg2Value = null;
            arashiNgValue = null;
        }
        final boolean legacyPlusSupported = legacyPlusSupportedValue;
        final Switch abbrevSingleId = abbrevSingleIdValue;
        final Switch copipeNg2 = copipeNg2Value;
        final Switch arashiNg = arashiNgValue;

        EditText archiveRouteTemplatesValue = null;
        try {
            archiveRouteTemplatesValue = addArchiveRouteControl(
                    activity,
                    layout,
                    preferences.getString(
                            ARCHIVE_ROUTE_TEMPLATES_KEY,
                            DEFAULT_ARCHIVE_ROUTE_TEMPLATES
                    )
            );
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to add automatic DAT route controls", error);
        }
        final EditText archiveRouteTemplates = archiveRouteTemplatesValue;
        addOptionalSettingsSection(
                "archived-thread preset",
                () -> addArchiveSearchPresetControl(activity, layout)
        );
        addOptionalSettingsSection(
                "package data migration",
                () -> addPackageMigrationControl(activity, layout)
        );
        addOptionalSettingsSection(
                "duplicate board cleanup",
                () -> addBoardDuplicateCleanupControl(activity, layout)
        );
        addOptionalSettingsSection(
                "programmable NG",
                () -> ProgrammableNgController.addSettingsButton(layout, activity)
        );

        ScrollView scrollView = new ScrollView(activity);
        scrollView.addView(layout);

        ConfigSnapshot before = ConfigSnapshot.read(preferences);
        new AlertDialog.Builder(activity)
                .setTitle("Haiagaru")
                .setCancelable(false)
                .setView(scrollView)
                .setPositiveButton(text("OK", "OK"), (dialog, which) -> {
                    boolean legacyPlusChanged = false;
                    if (legacyPlusSupported) {
                        SharedPreferences.Editor chMateEditor = chMatePreferences.edit();
                        int postHistoryCount = parsePostHistoryCount(
                                value(postDataListCount),
                                chMatePreferences.getInt(
                                        CHMATE_POST_DATA_LIST_COUNT_KEY,
                                        DEFAULT_CHMATE_POST_DATA_LIST_COUNT
                                )
                        );
                        chMateEditor.putInt(CHMATE_POST_DATA_LIST_COUNT_KEY, postHistoryCount);
                        if (abbrevSingleId != null) {
                            boolean checked = abbrevSingleId.isChecked();
                            legacyPlusChanged |= checked != chMatePreferences.getBoolean(
                                    CHMATE_ABBREV_SINGLE_ID_KEY,
                                    false
                            );
                            chMateEditor.putBoolean(CHMATE_ABBREV_SINGLE_ID_KEY, checked);
                        }
                        if (copipeNg2 != null) {
                            boolean checked = copipeNg2.isChecked();
                            legacyPlusChanged |= checked != chMatePreferences.getBoolean(
                                    CHMATE_COPIPE_NG2_KEY,
                                    false
                            );
                            chMateEditor.putBoolean(CHMATE_COPIPE_NG2_KEY, checked);
                            if (checked) {
                                legacyPlusChanged |= !chMatePreferences.getBoolean(
                                        CHMATE_COPIPE_NG_KEY,
                                        false
                                );
                                chMateEditor.putBoolean(CHMATE_COPIPE_NG_KEY, true);
                            }
                        }
                        if (arashiNg != null) {
                            boolean checked = arashiNg.isChecked();
                            legacyPlusChanged |= checked != chMatePreferences.getBoolean(
                                    CHMATE_ARASHI_NG_KEY,
                                    false
                            );
                            chMateEditor.putBoolean(CHMATE_ARASHI_NG_KEY, checked);
                            if (checked) {
                                legacyPlusChanged |= !chMatePreferences.getBoolean(
                                        CHMATE_COPIPE_NG_AR_KEY,
                                        false
                                );
                                chMateEditor.putBoolean(CHMATE_COPIPE_NG_AR_KEY, true);
                            }
                        }
                        chMateEditor.commit();
                    } else {
                        int postHistoryCount = parsePostHistoryCount(
                                value(postDataListCount),
                                chMatePreferences.getInt(
                                        CHMATE_POST_DATA_LIST_COUNT_KEY,
                                        DEFAULT_CHMATE_POST_DATA_LIST_COUNT
                                )
                        );
                        chMatePreferences.edit()
                                .putInt(CHMATE_POST_DATA_LIST_COUNT_KEY, postHistoryCount)
                                .commit();
                    }
                    preferences.edit()
                            .putBoolean("hideAd", hideAd.isChecked())
                            .putBoolean("replaceUserAgent", replaceUserAgent.isChecked())
                            .putString("userAgent", value(userAgent))
                            .putBoolean("removeMonaKey", removeMonaKey.isChecked())
                            .putString("cookieClass", value(cookieClass))
                            .putString("prefMonaKeyFile", value(monaKeyFile))
                            .putString("prefMonaKeyName", value(monaKeyName))
                            .putString("adClass", value(adClass).trim())
                            .putBoolean("chtoio", chtoio.isChecked())
                            .putBoolean("edgeReporterId", edgeReporterId.isChecked())
                            .putBoolean("forceHttps", forceHttps.isChecked())
                            .putBoolean("automaticDat", automaticDat.isChecked())
                            .putBoolean("refreshCellularNetwork", refreshCellularNetwork.isChecked())
                            .putBoolean("bypassPostPreflight", bypassPostPreflight.isChecked())
                            .commit();
                    if (archiveRouteTemplates != null) {
                        preferences.edit()
                                .putString(
                                        ARCHIVE_ROUTE_TEMPLATES_KEY,
                                        value(archiveRouteTemplates).trim()
                                )
                                .commit();
                    }

                    ConfigSnapshot after = ConfigSnapshot.read(preferences);
                    if (!before.equals(after) || legacyPlusChanged) restart(activity);
                })
                .show();
    }

    private static void addOptionalSettingsSection(String name, Runnable section) {
        try {
            section.run();
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to add Haiagaru settings section: " + name, error);
        }
    }

    private static EditText addArchiveRouteControl(
            Activity activity,
            LinearLayout layout,
            String initialValue
    ) {
        TextView description = new TextView(activity);
        description.setText(text(
                "自動DAT取得経路（上から順に探索）\n"
                        + "1行1経路で、行を並べ替えると探索順を変更できます。"
                        + "任意のHTTPS経路も追加できます。\n"
                        + "書式: auto| / dat| / kako| / itest| のいずれか + URL\n"
                        + "変数: {$server} {$bbs} {$key} {$rand}",
                "Automatic DAT routes (tried from top to bottom)\n"
                        + "Use one route per line. Reorder lines to change priority, or add "
                        + "another HTTPS route.\n"
                        + "Format: auto|, dat|, kako|, or itest| followed by a URL\n"
                        + "Variables: {$server} {$bbs} {$key} {$rand}"
        ));
        description.setTextSize(13);
        layout.addView(description, rowParams(activity));

        EditText editor = new EditText(activity);
        editor.setSingleLine(false);
        editor.setMinLines(6);
        editor.setHorizontallyScrolling(false);
        editor.setText(initialValue == null || initialValue.trim().isEmpty()
                ? DEFAULT_ARCHIVE_ROUTE_TEMPLATES
                : initialValue);
        layout.addView(editor, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        Button reset = new Button(activity);
        reset.setAllCaps(false);
        reset.setText(text("標準の探索順に戻す", "Reset archive route order"));
        reset.setOnClickListener(view -> editor.setText(DEFAULT_ARCHIVE_ROUTE_TEMPLATES));
        layout.addView(reset, rowParams(activity));
        return editor;
    }

    private static void addArchiveSearchPresetControl(Activity activity, LinearLayout layout) {
        TextView description = new TextView(activity);
        description.setText(text(
                "DAT落ちスレ用プリセットをHaiagaru-Morpheから取得します。更新時だけ通信し、通常利用時の追加通信はありません。\n"
                        + "2ch.sc板一覧: https://menu.2ch.sc/bbsmenu.html",
                "Downloads the archived-thread preset from Haiagaru-Morphe. "
                        + "Network access occurs only while updating.\n"
                        + "2ch.sc board menu: https://menu.2ch.sc/bbsmenu.html"
        ));
        description.setTextSize(13);
        LinearLayout.LayoutParams descriptionParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        descriptionParams.topMargin = dp(activity, 20);
        layout.addView(description, descriptionParams);

        Button button = new Button(activity);
        button.setAllCaps(false);
        button.setText(text(
                "GitHubからDAT落ち用プリセットを更新",
                "Update archived-thread preset from GitHub"
        ));
        LinearLayout.LayoutParams buttonParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        buttonParams.topMargin = dp(activity, 8);
        layout.addView(button, buttonParams);
        button.setOnClickListener(view -> updateArchiveSearchPreset(activity, button));
    }

    private static void updateArchiveSearchPreset(Activity activity, Button button) {
        button.setEnabled(false);
        button.setText(text("更新中…", "Updating..."));
        new Thread(() -> {
            boolean downloadedFromGitHub = false;
            try {
                String preset;
                try {
                    preset = downloadArchiveSearchPreset();
                    downloadedFromGitHub = true;
                } catch (IOException downloadError) {
                    Log.w(LOG_TAG, "Unable to download the archived-thread preset; "
                            + "using the built-in fallback", downloadError);
                    preset = validateArchiveSearchPreset(BUILTIN_ARCHIVE_PRESET);
                }
                SharedPreferences chMatePreferences =
                        PreferenceManager.getDefaultSharedPreferences(activity);
                String existing = chMatePreferences.getString(CHMATE_SEARCH_URLS_KEY, "");
                String merged = mergeArchiveSearchPreset(existing, preset);
                if (!chMatePreferences.edit()
                        .putString(CHMATE_SEARCH_URLS_KEY, merged)
                        .commit()) {
                    throw new IOException("Unable to save the ChMate search URL preset");
                }
                boolean usedGitHub = downloadedFromGitHub;
                activity.runOnUiThread(() -> {
                    resetArchivePresetButton(button);
                    button.setEnabled(true);
                    Toast.makeText(
                            activity,
                            usedGitHub
                                    ? text(
                                            "GitHubからDAT落ち用プリセットを更新しました",
                                            "Archived-thread preset updated from GitHub"
                                    )
                                    : text(
                                            "GitHubに接続できないため内蔵プリセットを適用しました",
                                            "GitHub was unavailable; the built-in preset was applied"
                                    ),
                            Toast.LENGTH_LONG
                    ).show();
                });
            } catch (Throwable error) {
                Log.e(LOG_TAG, "Unable to update the archived-thread preset", error);
                activity.runOnUiThread(() -> {
                    resetArchivePresetButton(button);
                    button.setEnabled(true);
                    Toast.makeText(
                            activity,
                            text(
                                    "プリセットを更新できませんでした",
                                    "Unable to update the archived-thread preset"
                            ),
                            Toast.LENGTH_LONG
                    ).show();
                });
            }
        }, "Haiagaru-archive-preset").start();
    }

    private static void resetArchivePresetButton(Button button) {
        button.setText(text(
                "GitHubからDAT落ち用プリセットを更新",
                "Update archived-thread preset from GitHub"
        ));
    }

    private static String downloadArchiveSearchPreset() throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(ARCHIVE_PRESET_URL)
                .openConnection();
        connection.setConnectTimeout(5_000);
        connection.setReadTimeout(8_000);
        connection.setInstanceFollowRedirects(true);
        connection.setRequestProperty("User-Agent", "Haiagaru/1.0");
        try {
            int responseCode = connection.getResponseCode();
            if (responseCode < 200 || responseCode >= 300) {
                throw new IOException("Haiagaru-Morphe preset returned HTTP " + responseCode);
            }
            try (InputStream input = new BufferedInputStream(connection.getInputStream());
                 ByteArrayOutputStream output = new ByteArrayOutputStream()) {
                byte[] buffer = new byte[16 * 1024];
                int count;
                int total = 0;
                while ((count = input.read(buffer)) != -1) {
                    total += count;
                    if (total > 128 * 1024) {
                        throw new IOException("Haiagaru-Morphe preset is unexpectedly large");
                    }
                    output.write(buffer, 0, count);
                }
                return validateArchiveSearchPreset(
                        new String(output.toByteArray(), StandardCharsets.UTF_8)
                );
            }
        } finally {
            connection.disconnect();
        }
    }

    private static String validateArchiveSearchPreset(String preset) throws IOException {
        String normalized = preset == null
                ? ""
                : preset.replace("\uFEFF", "").replace("\r\n", "\n").replace('\r', '\n');
        StringBuilder validated = new StringBuilder();
        int ruleCount = 0;
        boolean hasOfficialArchive = false;
        for (String rawLine : normalized.split("\n")) {
            String line = rawLine.trim();
            if (line.isEmpty()) continue;
            if (!line.contains(ARCHIVE_PRESET_MARKER)
                    || !line.contains("{$bbs}")
                    || !line.contains("{$key}")) {
                throw new IOException("Invalid archived-thread preset rule");
            }
            int urlStart = line.lastIndexOf(" https://");
            if (urlStart < 0) {
                throw new IOException("Archived-thread preset rule has no HTTPS URL");
            }
            URL destination = new URL(line.substring(urlStart + 1));
            String host = destination.getHost().toLowerCase(Locale.ROOT);
            if (!(host.equals("kako.5ch.io")
                    || host.equals("itest.5ch.io")
                    || host.equals("2ch.sc")
                    || host.endsWith(".2ch.sc"))) {
                throw new IOException("Archived-thread preset uses an unapproved host");
            }
            hasOfficialArchive |= host.equals("kako.5ch.io") || host.equals("itest.5ch.io");
            if (validated.length() > 0) validated.append('\n');
            validated.append(line);
            if (++ruleCount > 64) {
                throw new IOException("Archived-thread preset contains too many rules");
            }
        }
        if (ruleCount < 2 || !hasOfficialArchive) {
            throw new IOException("Archived-thread preset is incomplete");
        }
        Log.i(LOG_TAG, "Validated " + ruleCount + " archived-thread preset rules");
        return validated.toString();
    }

    private static String mergeArchiveSearchPreset(String existing, String preset) {
        StringBuilder merged = new StringBuilder();
        if (existing != null && !existing.isEmpty()) {
            for (String line : existing.split("\\r?\\n")) {
                if (line.contains(ARCHIVE_PRESET_MARKER)) continue;
                if (line.trim().isEmpty()) continue;
                if (merged.length() > 0) merged.append('\n');
                merged.append(line);
            }
        }
        if (merged.length() > 0) merged.append('\n');
        return merged.append(preset).toString();
    }

    private static void addPackageMigrationControl(Activity activity, LinearLayout layout) {
        if (originalPackageName().equals(activity.getPackageName())) return;
        try {
            Class.forName("app.morphe.extension.chmate.PackageDataMigration")
                    .getDeclaredMethod("addControl", Activity.class, LinearLayout.class)
                    .invoke(null, activity, layout);
        } catch (ClassNotFoundException ignored) {
            // The optional Shizuku data-migration patch was not selected.
        } catch (ReflectiveOperationException error) {
            Log.e(LOG_TAG, "Unable to add the package-data migration control", error);
        }
    }

    private static void addBoardDuplicateCleanupControl(Activity activity, LinearLayout layout) {
        TextView description = new TextView(activity);
        description.setText(text(
                "5ch.ioの板が「外部板」と「5ch本来の板」の2種類に重複した場合に、ChMate内部の板一覧から片方を一括削除します。"
                        + "削除する側を選択できます。スレ履歴やDATは削除しません。",
                "If 5ch.io boards exist both as external boards and native 5ch boards, remove one side in ChMate's internal board list."
                        + "Choose which side to remove. Thread history and DAT files are not removed."
        ));
        description.setTextSize(13);
        LinearLayout.LayoutParams descriptionParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        descriptionParams.topMargin = dp(activity, 20);
        layout.addView(description, descriptionParams);

        Button button = new Button(activity);
        button.setAllCaps(false);
        button.setText(text(
                "重複した5ch.io板を内部データから整理",
                "Clean duplicate 5ch.io boards"
        ));
        layout.addView(button, rowParams(activity));
        button.setOnClickListener(view -> showBoardCleanupChoice(activity));
    }

    private static void showBoardCleanupChoice(Activity activity) {
        String[] choices = new String[]{
                text("外部板扱いの5ch.ioを削除（Haiagaruの5ch板を残す）", "Remove external-board 5ch.io entries (keep Haiagaru native boards)"),
                text("5ch扱いの5ch.ioを削除（外部板扱いを残す）", "Remove native 5ch 5ch.io entries (keep external-board entries)")
        };
        new AlertDialog.Builder(activity)
                .setTitle(text("削除する板の種類", "Boards to remove"))
                .setSingleChoiceItems(choices, 0, (dialog, which) -> {
                    dialog.dismiss();
                    boolean removeExternal = which == 0;
                    new AlertDialog.Builder(activity)
                            .setTitle(text("内部データを変更します", "Modify internal data"))
                            .setMessage(removeExternal
                                    ? text("外部板扱いの5ch.ioを板一覧から削除します。スレ履歴とDATは残ります。", "External-board 5ch.io entries will be removed from the board list. Thread history and DAT remain.")
                                    : text("5ch扱いの5ch.ioを板一覧から削除します。スレ履歴とDATは残ります。", "Native 5ch 5ch.io entries will be removed from the board list. Thread history and DAT remain."))
                            .setNegativeButton(android.R.string.cancel, null)
                            .setPositiveButton(text("削除", "Remove"), (confirm, ignored) -> removeDuplicateBoardsAsync(activity, removeExternal))
                            .show();
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private static void removeDuplicateBoardsAsync(Activity activity, boolean removeExternal) {
        Toast.makeText(activity, text("板一覧を確認中…", "Inspecting board list…"), Toast.LENGTH_SHORT).show();
        new Thread(() -> {
            try {
                int removed = removeDuplicateBoards(activity.getApplicationContext(), removeExternal);
                activity.runOnUiThread(() -> {
                    if (activity.isFinishing()) return;
                    Toast.makeText(activity, text(
                            "5ch.io板を" + removed + "件削除しました。ChMateを再起動してください。",
                            "Removed " + removed + " 5ch.io board entries. Restart ChMate to refresh the list."
                    ), Toast.LENGTH_LONG).show();
                });
            } catch (Throwable error) {
                Log.e(LOG_TAG, "Unable to remove duplicate 5ch.io boards", error);
                activity.runOnUiThread(() -> {
                    if (activity.isFinishing()) return;
                    Toast.makeText(activity, text(
                            "板一覧を変更できませんでした: " + error.getMessage(),
                            "Unable to update the board list: " + error.getMessage()
                    ), Toast.LENGTH_LONG).show();
                });
            }
        }, "Haiagaru-board-cleanup").start();
    }

    private static int removeDuplicateBoards(Context context, boolean removeExternal) throws IOException {
        File database = context.getDatabasePath("roidon.sqlite");
        if (database == null || !database.isFile()) {
            throw new IOException("roidon.sqlite が見つかりません");
        }
        SQLiteDatabase db = SQLiteDatabase.openDatabase(
                database.getAbsolutePath(), null, SQLiteDatabase.OPEN_READWRITE);
        try {
            List<String> columns = databaseTableColumns(db, "boards");
            if (columns.isEmpty()) throw new IOException("boardsテーブルが見つかりません");
            String idColumn = findDatabaseColumn(columns, "_id", "id");
            StringBuilder select = new StringBuilder("SELECT ")
                    .append(idColumn == null ? "rowid" : quoteDatabaseIdentifier(idColumn));
            for (String column : columns) {
                select.append(',').append(quoteDatabaseIdentifier(column));
            }
            select.append(" FROM boards");
            ArrayList<String> deleteIds = new ArrayList<>();
            db.beginTransaction();
            try (Cursor cursor = db.rawQuery(select.toString(), null)) {
                while (cursor.moveToNext()) {
                    ArrayList<String> identity = new ArrayList<>();
                    for (int index = 0; index < columns.size(); index++) {
                        String column = columns.get(index).toLowerCase(Locale.ROOT);
                        if (column.contains("server") || column.contains("board")
                                || column.contains("bbs") || column.equals("name") || column.contains("url")) {
                            String value = cursor.getString(index + 1);
                            if (value != null) identity.add(value);
                        }
                    }
                    boolean io = containsIoBoard(identity);
                    boolean encoded = containsExternalIoBoard(identity);
                    if (!io || (removeExternal ? !encoded : encoded)) continue;
                    deleteIds.add(cursor.getString(0));
                }
                String where = (idColumn == null ? "rowid" : quoteDatabaseIdentifier(idColumn)) + "=?";
                for (String id : deleteIds) db.delete("boards", where, new String[]{id});
                db.setTransactionSuccessful();
            } finally {
                db.endTransaction();
            }
            try (Cursor ignored = db.rawQuery("PRAGMA wal_checkpoint(FULL)", null)) {
                while (ignored.moveToNext()) { /* drain */ }
            } catch (RuntimeException ignored) {
                // Non-WAL databases are already flushed by the transaction.
            }
            return deleteIds.size();
        } finally {
            db.close();
        }
    }

    private static List<String> databaseTableColumns(SQLiteDatabase db, String table) throws IOException {
        ArrayList<String> columns = new ArrayList<>();
        try (Cursor cursor = db.rawQuery("PRAGMA table_info(" + quoteDatabaseIdentifier(table) + ")", null)) {
            while (cursor.moveToNext()) columns.add(cursor.getString(1));
        } catch (RuntimeException error) {
            throw new IOException("boardsテーブルの構造を読み取れません", error);
        }
        return columns;
    }

    private static boolean containsIoBoard(List<String> values) {
        for (String value : values) {
            String normalized = value.toLowerCase(Locale.ROOT);
            if (normalized.contains("5ch.io") || normalized.contains("5ch%2eio")) return true;
        }
        return false;
    }

    private static boolean containsExternalIoBoard(List<String> values) {
        for (String value : values) {
            if (value.toLowerCase(Locale.ROOT).contains("5ch.io%2f")) return true;
        }
        return false;
    }

    private static String findDatabaseColumn(List<String> columns, String... names) {
        for (String name : names) {
            for (String column : columns) if (name.equalsIgnoreCase(column)) return column;
        }
        return null;
    }

    private static String quoteDatabaseIdentifier(String value) {
        return "\"" + value.replace("\"", "\"\"") + "\"";
    }

    /** Built at runtime so package-name post-processing cannot rewrite this compatibility value. */
    public static String originalPackageName() {
        return new StringBuilder("jp.co.airfront.android.a2ch")
                .append("Mate")
                .toString();
    }

    private static void applyUserAgent() {
        SharedPreferences preferences = preferencesOrNull();
        if (preferences == null || !preferences.getBoolean("replaceUserAgent", false)) return;

        String userAgent = preferences.getString("userAgent", DEFAULT_USER_AGENT);
        if (userAgent != null && !userAgent.isEmpty()) {
            System.setProperty("http.agent", userAgent);
        }
    }

    private static boolean isChtoioEnabled() {
        SharedPreferences preferences = preferencesOrNull();
        return preferences == null || preferences.getBoolean("chtoio", true);
    }

    private static boolean isAutomaticDatEnabled(Context context) {
        if (context == null) return true;
        return preferences(context).getBoolean("automaticDat", true);
    }

    /** Whether ChMate's local empty/device-info-only post gate should be skipped. */
    public static boolean bypassPostPreflightValidation() {
        SharedPreferences preferences = preferencesOrNull();
        return preferences == null || preferences.getBoolean("bypassPostPreflight", true);
    }

    static String archiveRouteTemplates(Context context) {
        if (context == null) return DEFAULT_ARCHIVE_ROUTE_TEMPLATES;
        String configured = preferences(context).getString(
                ARCHIVE_ROUTE_TEMPLATES_KEY,
                DEFAULT_ARCHIVE_ROUTE_TEMPLATES
        );
        return configured == null || configured.trim().isEmpty()
                ? DEFAULT_ARCHIVE_ROUTE_TEMPLATES
                : configured;
    }

    private static void rememberAdClass(View view) {
        Context context = view.getContext();
        if (context == null) return;
        preferences(context).edit().putString("adClass", view.getClass().getName()).apply();
    }

    private static boolean hideRememberedAdViews(View view) {
        SharedPreferences preferences = preferencesOrNull();
        String savedClass = preferences == null
                ? defaultAdClass()
                : configuredAdClass(preferences);
        boolean hidden = false;
        if (savedClass != null && savedClass.equals(view.getClass().getName())) {
            hideAdView(view);
            hidden = true;
        }
        if (!(view instanceof ViewGroup)) return hidden;

        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            hidden |= hideRememberedAdViews(group.getChildAt(i));
        }
        return hidden;
    }

    private static void scheduleKnownAdChecks(View root) {
        root.post(() -> hideRememberedAdViews(root));
        root.postDelayed(() -> hideRememberedAdViews(root), 300);
        root.postDelayed(() -> hideRememberedAdViews(root), 1000);
        root.postDelayed(() -> hideRememberedAdViews(root), 2500);
    }

    private static String configuredAdClass(SharedPreferences preferences) {
        String savedClass = preferences.getString("adClass", null);
        if (savedClass == null || savedClass.trim().isEmpty()) return defaultAdClass();

        // A downgrade/upgrade keeps SharedPreferences. Migrate only our built-in
        // obfuscated defaults; an explicitly entered custom class is preserved verbatim.
        if ((AD_CLASS_191.equals(savedClass)
                || AD_CLASS_241.equals(savedClass)
                || AD_CLASS_243.equals(savedClass))
                && !classExists(savedClass)) {
            return defaultAdClass();
        }
        return savedClass;
    }

    private static boolean supportsLegacyChMatePlus(Context context) {
        if (context == null) return false;
        try {
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(
                    context.getPackageName(),
                    0
            );
            String versionName = packageInfo.versionName;
            return "0.8.10.191 dev".equals(versionName)
                    || "0.8.10.226 dev".equals(versionName)
                    || "0.8.10.243 dev".equals(versionName);
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to determine ChMate version for compatibility controls", error);
            return false;
        }
    }

    private static String defaultAdClass() {
        if (classExists(AD_CLASS_243)) return AD_CLASS_243;
        if (classExists(AD_CLASS_241)) return AD_CLASS_241;
        return AD_CLASS_191;
    }

    private static boolean classExists(String className) {
        try {
            Class.forName(className, false, Haiagaru.class.getClassLoader());
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static Switch addSwitch(
            LinearLayout layout,
            Context context,
            String title,
            boolean checked
    ) {
        Switch widget = new Switch(context);
        widget.setText(title);
        widget.setChecked(checked);
        LinearLayout.LayoutParams params = rowParams(context);
        layout.addView(widget, params);
        return widget;
    }

    private static EditText addTextField(
            LinearLayout layout,
            Context context,
            String title,
            String initialValue
    ) {
        TextView label = new TextView(context);
        label.setText(title);
        layout.addView(label, rowParams(context));

        EditText editText = new EditText(context);
        editText.setSingleLine(false);
        editText.setText(initialValue == null ? "" : initialValue);
        layout.addView(editText);
        return editText;
    }

    private static LinearLayout.LayoutParams rowParams(Context context) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        params.topMargin = dp(context, 20);
        return params;
    }

    private static void restart(Activity activity) {
        Toast.makeText(
                activity.getApplicationContext(),
                text("アプリを再起動しています...", "Restarting now..."),
                Toast.LENGTH_SHORT
        ).show();

        Intent intent = new Intent();
        intent.setClassName(activity.getPackageName(), "jp.syoboi.a2chMate.activity.HomeActivity");
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        activity.startActivity(intent);

        new Handler(Looper.getMainLooper()).postDelayed(
                () -> Process.killProcess(Process.myPid()),
                200
        );
    }

    private static int statusBarHeight(Context context) {
        int id = context.getResources().getIdentifier("status_bar_height", "dimen", "android");
        return id > 0 ? context.getResources().getDimensionPixelSize(id) : 0;
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static String value(EditText editText) {
        return editText.getText() == null ? "" : editText.getText().toString();
    }

    private static int parsePostHistoryCount(String rawValue, int fallback) {
        try {
            int value = Integer.parseInt(rawValue.trim());
            if (value >= 0 && value <= MAX_CHMATE_POST_DATA_LIST_COUNT) return value;
        } catch (RuntimeException ignored) {
        }
        return Math.max(0, Math.min(fallback, MAX_CHMATE_POST_DATA_LIST_COUNT));
    }

    private static String text(String japanese, String english) {
        return Locale.JAPANESE.getLanguage().equals(Locale.getDefault().getLanguage())
                ? japanese
                : english;
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    private static SharedPreferences preferencesOrNull() {
        Context context = applicationContext;
        return context == null ? null : preferences(context);
    }

    private static final class ConfigSnapshot {
        final boolean hideAd;
        final boolean replaceUserAgent;
        final String userAgent;
        final boolean removeMonaKey;
        final String cookieClass;
        final String monaKeyFile;
        final String monaKeyName;
        final String adClass;
        final boolean chtoio;
        final boolean edgeReporterId;
        final boolean forceHttps;
        final boolean automaticDat;
        final boolean refreshCellularNetwork;
        final String archiveRouteTemplates;

        private ConfigSnapshot(
                boolean hideAd,
                boolean replaceUserAgent,
                String userAgent,
                boolean removeMonaKey,
                String cookieClass,
                String monaKeyFile,
                String monaKeyName,
                String adClass,
                boolean chtoio,
                boolean edgeReporterId,
                boolean forceHttps,
                boolean automaticDat,
                boolean refreshCellularNetwork,
                String archiveRouteTemplates
        ) {
            this.hideAd = hideAd;
            this.replaceUserAgent = replaceUserAgent;
            this.userAgent = userAgent;
            this.removeMonaKey = removeMonaKey;
            this.cookieClass = cookieClass;
            this.monaKeyFile = monaKeyFile;
            this.monaKeyName = monaKeyName;
            this.adClass = adClass;
            this.chtoio = chtoio;
            this.edgeReporterId = edgeReporterId;
            this.forceHttps = forceHttps;
            this.automaticDat = automaticDat;
            this.refreshCellularNetwork = refreshCellularNetwork;
            this.archiveRouteTemplates = archiveRouteTemplates;
        }

        static ConfigSnapshot read(SharedPreferences preferences) {
            return new ConfigSnapshot(
                    preferences.getBoolean("hideAd", true),
                    preferences.getBoolean("replaceUserAgent", false),
                    preferences.getString("userAgent", DEFAULT_USER_AGENT),
                    preferences.getBoolean("removeMonaKey", false),
                    preferences.getString("cookieClass", DEFAULT_COOKIE_CLASS),
                    preferences.getString("prefMonaKeyFile", DEFAULT_MONAKEY_FILE),
                    preferences.getString("prefMonaKeyName", DEFAULT_MONAKEY_KEY),
                    configuredAdClass(preferences),
                    preferences.getBoolean("chtoio", true),
                    preferences.getBoolean("edgeReporterId", true),
                    preferences.getBoolean("forceHttps", false),
                    preferences.getBoolean("automaticDat", true),
                    preferences.getBoolean("refreshCellularNetwork", true),
                    preferences.getString(
                            ARCHIVE_ROUTE_TEMPLATES_KEY,
                            DEFAULT_ARCHIVE_ROUTE_TEMPLATES
                    )
            );
        }

        @Override
        public boolean equals(Object other) {
            if (!(other instanceof ConfigSnapshot)) return false;
            ConfigSnapshot value = (ConfigSnapshot) other;
            return hideAd == value.hideAd
                    && replaceUserAgent == value.replaceUserAgent
                    && removeMonaKey == value.removeMonaKey
                    && chtoio == value.chtoio
                    && edgeReporterId == value.edgeReporterId
                    && forceHttps == value.forceHttps
                    && automaticDat == value.automaticDat
                    && refreshCellularNetwork == value.refreshCellularNetwork
                    && equal(userAgent, value.userAgent)
                    && equal(cookieClass, value.cookieClass)
                    && equal(monaKeyFile, value.monaKeyFile)
                    && equal(monaKeyName, value.monaKeyName)
                    && equal(adClass, value.adClass)
                    && equal(archiveRouteTemplates, value.archiveRouteTemplates);
        }

        @Override
        public int hashCode() {
            return 0;
        }

        private static boolean equal(Object first, Object second) {
            return first == second || (first != null && first.equals(second));
        }
    }
}
