package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
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
import java.util.regex.Pattern;

/** Runtime component of the Haiagaru patch, embedded in ChMate. */
public final class Haiagaru {
    private static final String LOG_TAG = "Haiagaru";
    private static final String PREFS_NAME =
            "io.github.areteruhiro.chmate.haiagaru.ui-config";
    private static final String BUTTON_TAG = "haiagaru.settings.button";
    private static final String DEFAULT_USER_AGENT =
            "Dalvik/2.1.0 (Linux; U; Android 4.0.3; HT-01 Build/XYZ0.123456.789)";
    private static final String DEFAULT_COOKIE_CLASS =
            "com.franmontiel.persistentcookiejar.persistence.SharedPrefsCookiePersistor";
    private static final String DEFAULT_MONAKEY_FILE = "2chapi";
    private static final String DEFAULT_MONAKEY_KEY = "2chapi_monakey";
    private static final String CHMATE_SEARCH_URLS_KEY = "searchUrls1";
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
            "(?:(?:sssp|https?):)?//img\\.5ch\\.(?:io|net)/ico/[^\\s<\\u0003\\u3000]+"
                    + "|\\u0003img\\.5ch\\.(?:io|net)/ico/[^\\s<\\u0003\\u3000]+",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern LEGACY_THREAD_READ_PATH = Pattern.compile(
            "^/test/read\\.cgi/([^/]+)/(\\d{9,10})(?:/.*)?$",
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
                    if (info.signingInfo != null) {
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
        Context context = application.getApplicationContext();
        applicationContext = context == null ? application : context;
        runtimePackageName = application.getPackageName();
        applyUserAgent();
    }

    private static void initializeApplicationContext(Context context) {
        Context resolvedContext = context.getApplicationContext();
        Context appContext = resolvedContext == null ? context : resolvedContext;
        applicationContext = appContext;
        runtimePackageName = appContext.getPackageName();
        migrateRestoredPackageReferences(appContext);
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
        error.printStackTrace(new PrintWriter(stackTrace));

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
        String fileName = "chmate-crash-" + fileTimestamp + ".txt";

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

    public static String rewrite5chUrl(String original) {
        if (original == null || !isChtoioEnabled()) return original;
        return original.replace("5ch.net", "5ch.io");
    }

    /**
     * Converts a thread URL on an obsolete 2ch/5ch server before ChMate creates
     * BBSUrlInfo. itest is independent of the thread's former server name and has
     * a dedicated parser in ChMate. The official kako archive and 2ch.sc mirror
     * remain available through the archived-thread search preset.
     */
    public static void rewriteLegacyThreadIntent(Activity activity) {
        if (activity == null || !isChtoioEnabled()) return;
        Intent intent = activity.getIntent();
        if (intent == null || intent.getData() == null) return;
        String original = intent.getData().toString();
        String rewritten = rewriteLegacyThreadUrl(original);
        boolean archiveRetry = intent.getBooleanExtra("haiagaru.archive.retry", false);
        if (!archiveRetry && isAutomaticDatEnabled(activity) && isArchivedThreadUrl(original)
                && ArchivedThreadImporter.importIfNeeded(activity, original, rewritten)) {
            Log.i(LOG_TAG, "Handling legacy thread through the local DAT cache: " + original);
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
        try {
            Uri uri = Uri.parse(original);
            String host = uri.getHost();
            String path = uri.getPath();
            if (host == null || path == null) return original;
            java.util.regex.Matcher matcher = LEGACY_THREAD_READ_PATH.matcher(path);
            if (!matcher.matches()) {
                matcher = LEGACY_THREAD_DAT_PATH.matcher(path);
            }
            if (!matcher.matches()) return original;

            String normalizedHost = host.toLowerCase(Locale.ROOT);
            if (!isArchivedThreadCandidate(normalizedHost, matcher.group(2))) {
                return original;
            }

            return "https://itest.5ch.io/test/read.cgi/"
                    + matcher.group(1) + "/" + matcher.group(2) + "/";
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to rewrite legacy thread URL", error);
            return original;
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
        return original.replace("://img.5ch.net/", "://img.5ch.io/");
    }

    public static String prepareLegacyBeParsing(String original) {
        if (original == null || !original.contains("sssp://img.5ch.io/")) return original;
        return original.replace("sssp://img.5ch.io/", "sssp://img.5ch.net/");
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
        if (candidate.contains("img.5ch.io/ico/")
                || candidate.contains("img.5ch.net/ico/")) {
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
                || normalized.contains("img.5ch.net/ico/");
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

        collapseAdView(view);
        view.post(() -> collapseAdView(view));
        view.postDelayed(() -> collapseAdView(view), 300);
        view.postDelayed(() -> collapseAdView(view), 1000);
        view.postDelayed(() -> collapseAdView(view), 2500);
    }

    private static void collapseAdView(View view) {
        view.setVisibility(View.GONE);
        ViewGroup.LayoutParams params = view.getLayoutParams();
        if (params != null) {
            params.height = 0;
            view.setLayoutParams(params);
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

    /** Finds the legacy banner slot in every Fragment root by its stable layout position. */
    public static void hideLegacyBanner(View root) {
        if (!(root instanceof ViewGroup) || !shouldHideAds()) return;

        ViewGroup rootGroup = (ViewGroup) root;
        int childCount = rootGroup.getChildCount();
        if (childCount >= 3) {
            View candidate = rootGroup.getChildAt(childCount - 3);
            if (candidate instanceof FrameLayout
                    && candidate.getClass() != FrameLayout.class) {
                rememberAdClass(candidate);
                hideAdView(candidate);
            }
        }

        hideRememberedAdViews(rootGroup);
        scheduleKnownAdChecks(rootGroup);
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

        View decorView = activity.getWindow().getDecorView();
        if (!(decorView instanceof ViewGroup)) return;
        ViewGroup overlayHost = (ViewGroup) decorView;
        if (overlayHost.findViewWithTag(BUTTON_TAG) != null) return;

        Button button = new Button(activity);
        button.setTag(BUTTON_TAG);
        button.setText("Haiagaru");
        button.setAllCaps(false);

        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.END
        );
        params.topMargin = statusBarHeight(activity) + dp(activity, 5);
        params.rightMargin = dp(activity, 10);
        overlayHost.addView(button, params);

        // Some ChMate generations render their toolbar in a sibling with a
        // higher Z order. Keep the injected entry above it so it remains both
        // visible and touchable.
        button.setElevation(dp(activity, 16));
        button.bringToFront();
        overlayHost.requestLayout();
        overlayHost.invalidate();

        button.setOnClickListener(view -> showSettingsDialog(activity));
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
        Switch automaticDat = addSwitch(
                layout,
                activity,
                text("自動DAT取得", "Automatic DAT retrieval"),
                preferences.getBoolean("automaticDat", true)
        );

        EditText archiveRouteTemplates = addArchiveRouteControl(
                activity,
                layout,
                preferences.getString(
                        ARCHIVE_ROUTE_TEMPLATES_KEY,
                        DEFAULT_ARCHIVE_ROUTE_TEMPLATES
                )
        );
        addArchiveSearchPresetControl(activity, layout);
        addPackageMigrationControl(activity, layout);
        addBoardDuplicateCleanupControl(activity, layout);

        ScrollView scrollView = new ScrollView(activity);
        scrollView.addView(layout);

        ConfigSnapshot before = ConfigSnapshot.read(preferences);
        new AlertDialog.Builder(activity)
                .setTitle("Haiagaru")
                .setCancelable(false)
                .setView(scrollView)
                .setPositiveButton(text("OK", "OK"), (dialog, which) -> {
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
                            .putBoolean("automaticDat", automaticDat.isChecked())
                            .putString(
                                    ARCHIVE_ROUTE_TEMPLATES_KEY,
                                    value(archiveRouteTemplates).trim()
                            )
                            .commit();

                    ConfigSnapshot after = ConfigSnapshot.read(preferences);
                    if (!before.equals(after)) restart(activity);
                })
                .show();
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
            // The optional package-name patch was not selected.
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
        final boolean automaticDat;
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
                boolean automaticDat,
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
            this.automaticDat = automaticDat;
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
                    preferences.getBoolean("automaticDat", true),
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
                    && automaticDat == value.automaticDat
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
