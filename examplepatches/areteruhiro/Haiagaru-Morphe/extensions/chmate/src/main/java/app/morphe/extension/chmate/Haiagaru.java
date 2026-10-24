package app.morphe.extension.chmate;

import android.app.Activity;

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
import android.content.pm.ResolveInfo;
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
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.Spinner;
import android.widget.ArrayAdapter;
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
import java.lang.ref.WeakReference;
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
import java.util.regex.Matcher;
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
    private static final int EDDI_ARCHIVE_TOOLBAR_ID = 0x7e000001;
    private static final int MARK_ALL_READ_TOOLBAR_ID = 0x7e000003;
    private static final int DIRECT_COPY_TOOLBAR_ID = 0x7e000004;
    private static final String PREFS_NAME =
            "io.github.areteruhiro.chmate.haiagaru.ui-config";
    private static final String LEGACY_TALK_PREFS_NAME = "talk";
    private static final String LEGACY_TALK_SESSION_REPAIR_KEY =
            "legacyTalkSessionRepairLastUpdateV2";
    private static final java.util.Map<Object, Integer> LEGACY_TALK_TRANSPORTS =
            java.util.Collections.synchronizedMap(new java.util.WeakHashMap<>());
    private static final String BUTTON_TAG = "haiagaru.settings.button";
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
    private static final String NG_REGISTRATION_LIMIT_KEY = "ngRegistrationLimit";
    private static final String HISSI_CHECKER_MODE_KEY = "hissiCheckerMode";
    private static final String HISSI_VIEWER_THEME_KEY = "hissiViewerTheme";
    private static final String HISSI_VIEWER_TEXT_ZOOM_KEY = "hissiViewerTextZoom";
    private static final String HISSI_VIEWER_FULLSCREEN_KEY = "hissiViewerFullscreen";
    private static final String DEDICATED_VIEWER_ENABLED_KEY = "dedicatedViewerEnabled";
    private static final String HISSI_VIEWER_SWIPE_HISTORY_KEY = "hissiViewerSwipeHistory";
    private static final String HISSI_VIEWER_TOOLBAR_BUTTONS_KEY = "hissiViewerToolbarButtons";
    private static final String KYODEMO_ENHANCED_VIEWER_KEY = "kyodemoEnhancedViewer";
    public static final int HISSI_TOOLBAR_REFRESH = 0;
    public static final int HISSI_TOOLBAR_COPY_URL = 1;
    public static final int HISSI_TOOLBAR_COPY_ALL = 2;
    public static final int HISSI_TOOLBAR_COPY_BODY = 3;
    public static final int HISSI_TOOLBAR_DATE = 4;
    public static final int HISSI_TOOLBAR_SEARCH = 5;
    public static final int HISSI_TOOLBAR_ANALYSIS = 6;
    public static final int HISSI_TOOLBAR_TEXT_ZOOM = 7;
    public static final int HISSI_TOOLBAR_THEME = 8;
    private static final int HISSI_TOOLBAR_BUTTON_COUNT = 9;
    private static final int ALL_HISSI_TOOLBAR_BUTTONS = (1 << HISSI_TOOLBAR_BUTTON_COUNT) - 1;
    private static final int DEFAULT_NG_REGISTRATION_LIMIT = 300;
    private static final int MAX_NG_REGISTRATION_LIMIT = 100_000;
    /** ChMate's own bounded post-history store (postDataList.json). */
    private static final String CHMATE_POST_DATA_LIST_COUNT_KEY = "postDataListCount";
    private static final String POSTED_THREAD_DISPLAY_COUNT_KEY = "postedThreadDisplayCount";
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
    private static final String AD_CLASS_242 = "o.zzbgb";
    private static final String AD_CLASS_243 = "o.zzexb";
    private static final Pattern LEGACY_BE_ATTACHMENT_TOKEN = Pattern.compile(
            "(?<![A-Za-z0-9./])(?:(?:(?:sssp|https?):)?//|\\u0003)?img\\.(?:5ch\\.(?:io|net)|2ch\\.net)/(?:ico|premium)/[^\\s<\\u0003\\u3000]+",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern LEGACY_PREMIUM_BE_URL = Pattern.compile(
            "(?<![A-Za-z0-9./])(?:(?:(?:sssp|https?):)?//|\\u0003)?img\\.(?:5ch\\.(?:io|net)|2ch\\.net)/premium/([^\\s<\\u0003\\u3000]+)",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern LEGACY_BE_ICO_URL = Pattern.compile(
            "(?<![A-Za-z0-9./])(?:(?:(?:sssp|https?):)?//|\\u0003)?img\\.(?:5ch\\.(?:io|net)|2ch\\.net)/ico/([^\\s<\\u0003\\u3000]+)",
            Pattern.CASE_INSENSITIVE
    );
    /** Any legacy BE image spelling, used only for duplicate detection. */
    private static final Pattern LEGACY_BE_ANY_URL = Pattern.compile(
            "(?<![A-Za-z0-9./])(?:(?:(?:sssp|https?):)?//|\\u0003)?img\\.(?:5ch\\.(?:io|net)|2ch\\.net)/(?:premium|ico)/([^\\s<\\u0003\\u3000]+)",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern LEGACY_LINK_HOST_ONLY = Pattern.compile(
            "(?i)^https?://([^/:?#]+)(?:/)?$"
    );
    private static final Pattern LEGACY_ABSOLUTE_URL = Pattern.compile(
            "(?i)https?://((?:[a-z0-9-]+\\.)*[a-z0-9-]+)(?=[:/?#]|\\.\\.\\.|$)(?:[^\\s<>\\\"]*)"
    );
    private static final Pattern LEGACY_THREAD_READ_PATH = Pattern.compile(
            // Keep the optional response number separate from any trailing
            // path.  ChMate uses this suffix to position the thread at the
            // requested response after an archived DAT has been imported.
            "^/test/read\\.cgi/([^/]+)/(\\d{9,10})(/\\d+)?(?:/.*)?$",
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
    private static volatile WeakReference<Activity> resumedActivity = new WeakReference<>(null);
    private static volatile boolean activityTrackingInstalled;
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
        if (MediaUploadHosts.handles(arguments)) return MediaUploadHosts.upload(arguments,
                Class.forName("o.r0ExternalSyntheticLambda13", true, Haiagaru.class.getClassLoader()));
        if (ImgurWebUpload.enabled()) return ImgurWebUpload.upload(arguments,
                Class.forName("o.r0ExternalSyntheticLambda13", true, Haiagaru.class.getClassLoader()));
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
        EmojiFontFallback.initialize(context);
    }

    /** Fallback for processes that do not create ChMate's startup provider. */
    public static void onApplicationPreCreate(Application application) {
        if (application == null) return;
        initializeApplicationContext(application);
        FoldLayout.install(application);
        NativeRestore191.initialize(application);
        EmojiFontFallback.initialize(application);
    }

    public static void onApplicationCreate(Application application) {
        if (application == null) return;
        // Keep the same process-wide application context used by the provider
        // hook.  The provider runs before ChMate creates its HTTP clients, so
        // applying the UA there is required for the first request after restart.
        initializeApplicationContext(application);
        FoldLayout.install(application);
        if (!activityTrackingInstalled) {
            synchronized (Haiagaru.class) {
                if (!activityTrackingInstalled) {
                    application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                        @Override public void onActivityCreated(Activity activity, Bundle state) { NativeToolTabs.created(activity); }
                        @Override public void onActivityStarted(Activity activity) { }
                        @Override public void onActivityResumed(Activity activity) {
                            resumedActivity = new WeakReference<>(activity);
                            NativeToolTabs.resumed(activity);
                            ExternalBoardAuth.resumed(activity);
                            NativeRestore191.onActivityResumed(activity);
                            ResponseArchive.onActivityResumed(activity);
                            StringReplacement.reload(activity, false, null);
                        }
                        @Override public void onActivityPaused(Activity activity) { }
                        @Override public void onActivityStopped(Activity activity) { }
                        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
                        @Override public void onActivityDestroyed(Activity activity) { }
                    });
                    activityTrackingInstalled = true;
                }
            }
        }
        EmojiFontFallback.register(application);
        HaiagaruMegaSync.maybeBackupOnStartup(application);
    }

    /** Adds the archive action to ChMate's own home-toolbar customization model. */
    public static Object addEdgeArchiveToolbarChoice(Object toolbarModel) {
        return addToolbarChoice(toolbarModel, EDDI_ARCHIVE_TOOLBAR_ID, "haiagaru_edge_archive");
    }

    public static Object addMarkAllReadToolbarChoice(Object toolbarModel) {
        return addToolbarChoice(toolbarModel, MARK_ALL_READ_TOOLBAR_ID, "haiagaru_mark_all_read");
    }
    public static Object addFavoriteThreadsTab(Object toolbarModel) {
        return addToolbarChoice(toolbarModel, FavoriteThreads.TAB, "haiagaru_favorite_threads");
    }

    public static boolean keepQuickFilterPosition() {
        return applicationContext != null
                && preferences(applicationContext).getBoolean("keepQuickFilterPosition", false);
    }

    public static boolean compactQuickFilters() {
        return applicationContext != null
                && preferences(applicationContext).getBoolean("compactQuickFilters", false);
    }

    public static Object addQuickFilterToolbarChoice(Object toolbarModel) {
        // The toolbar action is always available; the setting only hides the
        // original filter row at the top of the response list.
        Object result = addToolbarChoice(toolbarModel, QuickFilterToolbar.ID, "haiagaru_quick_filter");
        try {
            String version = applicationContext.getPackageManager().getPackageInfo(applicationContext.getPackageName(), 0).versionName;
            if ("0.8.10.191 dev".equals(version) || "0.8.10.226 dev".equals(version) || "0.8.10.242 dev".equals(version))
                result = addToolbarChoice(result, DIRECT_COPY_TOOLBAR_ID, "haiagaru_direct_copy");
        } catch (Exception ignored) { }
        result = addToolbarChoice(result, 0x7e000005, "haiagaru_wacchoi_lower");
        result = addToolbarChoice(result, 0x7e000006, "haiagaru_wacchoi_upper");
        return result;
    }

    private static Object addToolbarChoice(Object toolbarModel, int actionId, String resourceName) {
        if (toolbarModel == null) return null;
        try {
            Context context = applicationContext;
            if (context == null) return toolbarModel;
            int titleId = context.getResources().getIdentifier(
                    resourceName, "string", context.getPackageName());
            int iconId = context.getResources().getIdentifier(
                    resourceName, "drawable", context.getPackageName());
            if (titleId == 0 || iconId == 0) return toolbarModel;
            int summaryId=actionId==FavoriteThreads.TAB?context.getResources().getIdentifier(
                    "haiagaru_favorite_threads_description","string",context.getPackageName()):titleId;
            if(summaryId==0)summaryId=titleId;
            if (toolbarModel instanceof List) {
                List<?> source = (List<?>) toolbarModel;
                if (containsToolbarChoice(source, actionId)) return toolbarModel;
                @SuppressWarnings("unchecked")
                List<Object> buttons = (List<Object>) source;
                Class<?> itemClass = Class.forName("o.r8lambda98incQ33GAiiY2082BMi9yDa3l0",
                        false, toolbarModel.getClass().getClassLoader());
                Object item = itemClass.getConstructor(int.class, int.class, int.class,
                        int.class, boolean.class).newInstance(
                        actionId, actionId == FavoriteThreads.TAB ? 0 : iconId, titleId, summaryId, MinimalSetup.toolbarDefault(actionId));
                buttons.add(item);
                return toolbarModel;
            }

            Field listField = null;
            for (Field field : toolbarModel.getClass().getDeclaredFields()) {
                if (List.class.isAssignableFrom(field.getType())) {
                    listField = field;
                    break;
                }
            }
            if (listField == null) return toolbarModel;
            listField.setAccessible(true);
            List<?> original = (List<?>) listField.get(toolbarModel);
            if (original == null || containsToolbarChoice(original, actionId)) return toolbarModel;
            ArrayList<Object> buttons = new ArrayList<>(original);
            ClassLoader loader = toolbarModel.getClass().getClassLoader();
            Class<?> specClass = Class.forName(
                    "jp.syoboi.a2chMate.feature.toolbar.ToolbarButtonSpec", false, loader);
            Object item = specClass.getConstructor(int.class, int.class, int.class,
                    int.class, boolean.class).newInstance(
                    actionId, actionId == FavoriteThreads.TAB ? 0 : iconId, titleId, summaryId, MinimalSetup.toolbarDefault(actionId));
            // Modern ToolbarDefault keeps a mutable button list. Extending that
            // list preserves its position and configuration objects; rebuilding
            // the model can silently lose the new choice on some versions.
            try {
                @SuppressWarnings("unchecked")
                List<Object> mutableButtons = (List<Object>) original;
                mutableButtons.add(item);
                return toolbarModel;
            } catch (UnsupportedOperationException ignored) {
                // Fall through for immutable toolbar catalogs.
            }
            buttons.add(item);

            ArrayList<Field> modelFields = new ArrayList<>();
            for (Field field : toolbarModel.getClass().getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(field.getModifiers())
                        || field == listField) continue;
                field.setAccessible(true);
                modelFields.add(field);
            }
            java.lang.reflect.Constructor<?> selected = null;
            for (java.lang.reflect.Constructor<?> constructor
                    : toolbarModel.getClass().getDeclaredConstructors()) {
                Class<?>[] parameterTypes = constructor.getParameterTypes();
                if (parameterTypes.length == modelFields.size() + 1
                        && List.class.isAssignableFrom(parameterTypes[parameterTypes.length - 1])
                        && parameterTypes[0] == String.class) {
                    selected = constructor;
                    break;
                }
            }
            if (selected == null) return toolbarModel;
            ArrayList<Object> constructorArgs = new ArrayList<>();
            Class<?>[] parameterTypes = selected.getParameterTypes();
            Field titleField = null;
            for (Field field : modelFields) {
                if (field.getType() == String.class) {
                    titleField = field;
                    break;
                }
            }
            if (titleField == null) return toolbarModel;
            constructorArgs.add(titleField.get(toolbarModel));
            ArrayList<Field> remainingFields = new ArrayList<>(modelFields);
            remainingFields.remove(titleField);
            for (int parameterIndex = 1; parameterIndex < parameterTypes.length - 1;
                    parameterIndex++) {
                Field match = null;
                for (Field field : remainingFields) {
                    if (parameterTypes[parameterIndex].isAssignableFrom(field.getType())
                            || field.getType().isAssignableFrom(parameterTypes[parameterIndex])) {
                        match = field;
                        break;
                    }
                }
                if (match == null) return toolbarModel;
                constructorArgs.add(match.get(toolbarModel));
                remainingFields.remove(match);
            }
            constructorArgs.add(buttons);
            selected.setAccessible(true);
            return selected.newInstance(constructorArgs.toArray());
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to add Edge archive toolbar choice", error);
            return toolbarModel;
        }
    }

    private static boolean containsToolbarChoice(List<?> buttons, int actionId) {
        for (Object button : buttons) {
            if (button == null) continue;
            for (Field id : button.getClass().getDeclaredFields()) {
                if (id.getType() != int.class) continue;
                try {
                    id.setAccessible(true);
                    if (id.getInt(button) == actionId) return true;
                } catch (Throwable ignored) { }
            }
        }
        return false;
    }

    /** Handles the custom toolbar item before ChMate dispatches its stock actions. */
    public static boolean handleEdgeArchiveToolbarClick(Object fragment, int itemId) {
        if (FavoriteThreads.refresh(fragment, itemId)) return true;
        if (itemId == 0x7e000005 || itemId == 0x7e000006) {
            Activity activity = toolbarActivity(fragment);
            if (activity != null && !activity.isFinishing())
                HissiWacchoiSearchActivity.openFromToolbar(activity, fragment, itemId == 0x7e000006);
            return true;
        }
        if (itemId == DIRECT_COPY_TOOLBAR_ID) {
            Activity activity = toolbarActivity(fragment);
            if (activity == null || activity.isFinishing()) return true;
            SharedPreferences prefs = preferences(activity);
            boolean enabled = !prefs.getBoolean("directBodySelection", false);
            prefs.edit().putBoolean("directBodySelection", enabled).apply();
            EmojiFontFallback.refreshVisibleRows();
            View button = activity.getWindow().getDecorView().findViewById(DIRECT_COPY_TOOLBAR_ID);
            if (button != null) {
                button.setActivated(enabled);
                button.setSelected(enabled);
                button.setContentDescription("長押しコピー: " + (enabled ? "ON" : "OFF"));
            }
            Toast.makeText(activity, enabled ? "長押しコピー: ON（本文を長押しして範囲選択）"
                    : "長押しコピー: OFF（従来のレスメニュー）", Toast.LENGTH_SHORT).show();
            return true;
        }
        if (itemId == MARK_ALL_READ_TOOLBAR_ID) {
            Activity activity = toolbarActivity(fragment);
            if (activity != null) showMarkAllReadConfirmation(activity);
            return true;
        }
        if (itemId != EDDI_ARCHIVE_TOOLBAR_ID) return false;
        try {
            Activity activity = toolbarActivity(fragment);
            Context context = activity != null ? activity : applicationContext;
            if (context == null) return false;
            if (NativeToolTabs.open(activity, "eddi")) return true;
            Intent intent = new Intent(context, HissiMenuActivity.class);
            intent.setAction(Intent.ACTION_VIEW);
            intent.setData(Uri.parse("https://eddiarchive3rd.boy.jp/"));
            if (activity == null) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
            return true;
        } catch (Throwable error) {
            Log.e(LOG_TAG, "Unable to open Edge archive search from ChMate toolbar", error);
            return false;
        }
    }

    /**
     * The stock "open this thread in another app" long-press excludes only
     * the current package. With renamed Haiagaru installs, other ChMate builds
     * remain in the resolver list and can be selected before a browser. They
     * are not external viewers, so remove their thread activities while
     * leaving browser and other app candidates in the original order.
     */
    public static List<?> excludeChMateThreadActivities(List<?> candidates) {
        if (candidates == null || candidates.isEmpty()) return candidates;
        ArrayList<Object> external = new ArrayList<>(candidates.size());
        for (Object candidate : candidates) {
            if (candidate instanceof ResolveInfo) {
                ResolveInfo resolved = (ResolveInfo) candidate;
                String name = resolved.activityInfo == null ? null : resolved.activityInfo.name;
                if ("jp.syoboi.a2chMate.activity.ResListActivity".equals(name)) continue;
            }
            external.add(candidate);
        }
        return external;
    }

    static void showReadThreadsFirstScope() {
        ReadThreadsFirst.chooseScope(resumedActivity.get());
    }

    static Activity toolbarActivity(Object owner) {
        if (owner instanceof Activity) return (Activity) owner;
        if (owner != null) {
            try {
                Object activity = owner.getClass().getMethod("getActivity").invoke(owner);
                if (activity instanceof Activity) return (Activity) activity;
            } catch (ReflectiveOperationException ignored) {
                // Generated toolbar dispatchers may not be fragments.
            }
        }
        Activity current = resumedActivity.get();
        return current != null && !current.isFinishing() ? current : null;
    }

    private static void showMarkAllReadConfirmation(Activity activity) {
        new HaiagaruDialog.Builder(activity)
                .setTitle(text("未読をすべて0にする", "Mark all threads read"))
                .setMessage(text("すべてのスレの未読数を0にします。レスや履歴は削除しません。続けますか？",
                        "Set every thread’s unread count to zero without deleting posts or history?"))
                .setNegativeButton(text("キャンセル", "Cancel"), null)
                .setPositiveButton(text("既読にする", "Mark read"), (dialog, which) ->
                        new Thread(() -> {
                            try {
                                MarkReadResult result = markAllBookmarksRead(activity.getApplicationContext());
                                activity.runOnUiThread(() -> {
                                    try {
                                        refreshMarkedReadMemory(activity, result.rows);
                                        notifyMarkedThreadsRead(result.changed);
                                    } catch (Exception error) {
                                        Log.e(LOG_TAG, "Unable to refresh marked-read board badges", error);
                                        Toast.makeText(activity, text("既読数を保存しましたが、一覧表示を更新できませんでした。",
                                                "Read counts were saved, but the list could not be refreshed."), Toast.LENGTH_LONG).show();
                                        return;
                                    }
                                    Toast.makeText(activity, text(result.changed.size() + "件の未読を0にしました。",
                                            "Marked " + result.changed.size() + " threads read."), Toast.LENGTH_LONG).show();
                                    // Do not recreate the current ChMate activity here. In
                                    // Edge's thread list the restored board state can be lost
                                    // during recreation, leaving an empty list until manual
                                    // refresh. The read counts are already persisted; let the
                                    // current screen stay alive and update through its normal
                                    // refresh/reactive path.
                                });
                            } catch (Throwable error) {
                                Log.e(LOG_TAG, "Unable to mark all threads read", error);
                                activity.runOnUiThread(() -> Toast.makeText(activity,
                                        text("未読数を更新できませんでした。", "Could not update unread counts."),
                                        Toast.LENGTH_LONG).show());
                            }
                        }, "Haiagaru-mark-all-read").start())
                .show();
    }

    private static final class ReadSnapshot {
        final String board;
        final long created;
        final int count;
        ReadSnapshot(String board, long created, int count) {
            this.board = board;
            this.created = created;
            this.count = count;
        }
    }

    private static final class MarkReadResult {
        final List<long[]> changed = new ArrayList<>();
        final List<ReadSnapshot> rows = new ArrayList<>();
    }

    private static volatile java.lang.ref.WeakReference<Object> readCountManager =
            new java.lang.ref.WeakReference<>(null);

    public static void captureReadCountManager(Object manager) {
        readCountManager = new java.lang.ref.WeakReference<>(manager);
    }

    private static MarkReadResult markAllBookmarksRead(Context context) throws IOException {
        File database = context.getDatabasePath("roidon.sqlite");
        if (database == null || !database.isFile()) {
            throw new IOException("roidon.sqlite が見つかりません");
        }
        SQLiteDatabase db = SQLiteDatabase.openDatabase(
                database.getAbsolutePath(), null, SQLiteDatabase.OPEN_READWRITE);
        try {
            List<String> columns = databaseTableColumns(db, "bookmarks");
            if (!columns.contains("read_count") || !columns.contains("res_count")
                    || !columns.contains("server_res_count")) {
                throw new IOException("未読数のデータ構造が一致しません");
            }
            MarkReadResult result = new MarkReadResult();
            db.beginTransaction();
            try {
                try (Cursor cursor = db.rawQuery("SELECT _id, MAX(read_count, res_count, server_res_count) "
                        + "FROM bookmarks WHERE "
                        + "read_count < MAX(res_count, server_res_count)", null)) {
                    while (cursor.moveToNext()) {
                        result.changed.add(new long[]{cursor.getLong(0), cursor.getLong(1)});
                    }
                }
                db.execSQL("UPDATE bookmarks SET read_count = "
                        + "MAX(read_count, res_count, server_res_count) WHERE "
                        + "read_count < MAX(res_count, server_res_count)");
                // Include already-read rows to repair stale caches left by older patches.
                try (Cursor cursor = db.rawQuery("SELECT name, created, read_count FROM bookmarks", null)) {
                    while (cursor.moveToNext()) {
                        result.rows.add(new ReadSnapshot(cursor.getString(0), cursor.getLong(1), cursor.getInt(2)));
                    }
                }
                db.setTransactionSuccessful();
            } finally {
                db.endTransaction();
            }
            return result;
        } finally {
            db.close();
        }
    }

    /** Board badges prefer MemReadCountManager over the persisted read_count. */
    private static void refreshMarkedReadMemory(Activity activity, List<ReadSnapshot> rows) throws Exception {
            String version = chMateVersion();
            Object manager;
            String boardsName;
            String setter;
            if ("0.8.10.191 dev".equals(version) || "0.8.10.226 dev".equals(version)) {
                boolean legacy = "0.8.10.191 dev".equals(version);
                Class<?> type = Class.forName(legacy ? "o.onUserRewarded" : "o.splitDomain", false, activity.getClassLoader());
                Field instanceField = type.getDeclaredField("d");
                instanceField.setAccessible(true);
                manager = instanceField.get(null);
                boardsName = legacy ? "a" : "e";
                setter = "e";
            } else if ("0.8.10.241".equals(version) || "0.8.10.242 dev".equals(version)) {
                manager = readCountManager.get();
                boardsName = "0.8.10.241".equals(version) ? "e" : "a";
                setter = "0.8.10.241".equals(version) ? "b" : "c";
            } else {
                // Keep the existing database-only behavior for other versions.
                return;
            }
            if (manager == null) throw new IllegalStateException("Read-count manager is unavailable");
            Field boardsField = manager.getClass().getDeclaredField(boardsName);
            boardsField.setAccessible(true);
            Map<?, ?> boards = (Map<?, ?>) boardsField.get(manager);
                for (ReadSnapshot row : rows) {
                    Object board = boards.get(row.board);
                    if (board != null) {
                        board.getClass().getMethod(setter, long.class, int.class)
                                .invoke(board, row.created, row.count);
                    }
                }
    }

    /** Mirror ChMate's ThreadChanged event after the direct database update. */
    private static void notifyMarkedThreadsRead(List<long[]> changed) throws Exception {
        if (changed.isEmpty()) return;
        ClassLoader loader = Haiagaru.class.getClassLoader();
        Class<?> eventType;
        Object bus;
        Method publish;
        Field readCount;
        if ("0.8.10.226 dev".equals(chMateVersion())) {
            Class<?> events = Class.forName("o.getFormatOpcode", false, loader);
            eventType = Class.forName("o.RealWebSocketinitReaderAndWriterlambda3inlinedschedule1", false, loader);
            bus = events.getMethod("l").invoke(null);
            publish = bus.getClass().getMethod("e", Object.class);
        } else if ("0.8.10.191 dev".equals(chMateVersion())) {
            Class<?> events = Class.forName("o.setRequestListener", false, loader);
            eventType = Class.forName("o.cExternalSyntheticLambda0", false, loader);
            bus = events.getField("x").get(null);
            publish = bus.getClass().getMethod("b", Object.class);
        } else {
            return;
        }
        readCount = eventType.getField("d");
        java.lang.reflect.Constructor<?> constructor = eventType.getConstructor(long.class);
        for (long[] row : changed) {
            Object event = constructor.newInstance(row[0]);
            readCount.set(event, (int) row[1]);
            publish.invoke(bus, event);
        }
    }

    private static String chMateVersion() throws PackageManager.NameNotFoundException {
        Context context = applicationContext;
        return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
    }

    /** Applies the bundled emoji fallback while preserving the original text. */
    public static CharSequence processEmojiText(CharSequence source) {
        return EmojiFontFallback.processText(source);
    }

    /** Leaves the editor/history intact and adapts only the outgoing post copy. */
    public static Object prepareExternalEmojiPost(Object postData) {
        return ExternalEmojiPost.prepare(postData);
    }

    /** 191 constructs its outgoing post directly from editor strings. */
    public static String prepareExternalEmojiBody(String url, String body) {
        return ExternalEmojiPost.prepareBody(url, body);
    }

    /** The legacy constructor passes nine adjacent strings; keep a range invoke valid. */
    public static String prepareExternalEmojiBodyFromPostFields(
            String url, String first, String second, String third, String body,
            String fifth, String sixth, String seventh, String eighth) {
        return ExternalEmojiPost.prepareBody(url, body);
    }

    private static void initializeApplicationContext(Context context) {
        Context resolvedContext = context.getApplicationContext();
        Context appContext = resolvedContext == null ? context : resolvedContext;
        applicationContext = appContext;
        LocalAutoBackup.initialize(appContext);
        HistoryLimits.initialize(appContext);
        ImgurWebUpload.init(appContext);
        MediaUploadHosts.init(appContext);
        ImageVpnController.initialize(appContext);
        PatrolImages.initialize(appContext);
        ExternalBoardAuth.initialize(appContext);
        ExternalBoardEditor.initialize(appContext);
        EdgeReporterHistory.initialize(appContext);
        EdgeReporterOptions.initialize(appContext);
        ProgrammableNgController.initialize(appContext);
        HiddenIdNg.initialize(appContext);
        PosterHighlight.initialize(appContext);
        runtimePackageName = appContext.getPackageName();
        migrateRestoredPackageReferences(appContext);
        HttpsTransport.setEnabled(preferences(appContext).getBoolean("forceHttps", false));
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

    /** Save a recoverable archive-viewer failure beside crash logs and return its code. */
    static String reportEddiArchiveError(Context context, String code, String detail,
            Throwable error) {
        String safeCode = code == null || !code.matches("[A-Z0-9_-]{2,48}")
                ? "UNKNOWN" : code;
        Date now = new Date();
        String timestamp = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ", Locale.US)
                .format(now);
        String fileTimestamp = new SimpleDateFormat("yyyyMMdd-HHmmss-SSS", Locale.US)
                .format(now);
        StringWriter trace = new StringWriter();
        if (error != null) error.printStackTrace(new PrintWriter(trace));
        String version = "unknown";
        if (context != null) {
            try {
                version = context.getPackageManager().getPackageInfo(
                        context.getPackageName(), 0).versionName;
            } catch (Throwable ignored) { }
        }
        String report = "Haiagaru Edge archive viewer error\n"
                + "Time: " + timestamp + "\n"
                + "Error code: " + safeCode + "\n"
                + "Package: " + (context == null ? "unknown" : context.getPackageName()) + "\n"
                + "Version: " + version + "\n"
                + "Android: " + Build.VERSION.RELEASE + " (SDK " + Build.VERSION.SDK_INT + ")\n"
                + "Device: " + Build.MANUFACTURER + " " + Build.MODEL + "\n"
                + "Detail: " + (detail == null ? "" : detail) + "\n\n" + trace;
        try {
            writeDownloadLog(context, "eddi-archive-error-" + fileTimestamp + ".txt", report);
        } catch (Throwable logError) {
            Log.e(LOG_TAG, "Unable to save Edge archive viewer error " + safeCode, logError);
        }
        Log.e(LOG_TAG, "Edge archive viewer error " + safeCode + ": " + detail, error);
        return safeCode;
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

    /** Repairs only the certificate comparison before 242's image upload pipeline. */
    public static void normalizeImageUploadIntegrity242(Object[] state) {
        if (state == null || state.length < 2
                || !(state[0] instanceof int[]) || !(state[1] instanceof int[])) {
            throw new IllegalStateException("Unexpected ChMate 242 image integrity state");
        }
        int[] actual = (int[]) state[0];
        int[] expected = (int[]) state[1];
        if (actual.length == 0 || expected.length == 0) {
            throw new IllegalStateException("Empty ChMate 242 image integrity state");
        }
        expected[0] = actual[0];
    }

    /**
     * Repairs 243's generated uploader cache without changing its request or parser.
     * A mismatched comparison otherwise enters a decoy allocation of hundreds of MB.
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
        if (MediaUploadHosts.handles(arguments)) return MediaUploadHosts.upload(arguments,
                Class.forName("o.Ad", true, Haiagaru.class.getClassLoader()));
        if (ImgurWebUpload.enabled()) return ImgurWebUpload.upload(arguments,
                Class.forName("o.Ad", true, Haiagaru.class.getClassLoader()));
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

    /** Adjust only a fully fitting list, after ChMate restores its scroll anchor. */
    public static void alignShortThreadAfterLayout(Object layoutManager) {
        SharedPreferences settings = preferencesOrNull();
        if (settings == null || !settings.getBoolean("topAlignShortThreads", false)
                || layoutManager == null || !"jp.syoboi.a2chMate.view.MyLinearLayoutManager"
                        .equals(layoutManager.getClass().getName())) return;
        try {
            for (Class<?> type = layoutManager.getClass(); type != null; type = type.getSuperclass()) {
                for (Field field : type.getDeclaredFields()) {
                    if (java.lang.reflect.Modifier.isStatic(field.getModifiers())
                            || !"androidx.recyclerview.widget.RecyclerView".equals(field.getType().getName())) continue;
                    field.setAccessible(true);
                    android.view.ViewGroup list = (android.view.ViewGroup) field.get(layoutManager);
                    if (list == null || list.getChildCount() == 0 || list.canScrollVertically(-1)
                            || list.canScrollVertically(1)) return;
                    int top = Integer.MAX_VALUE;
                    int bottom = Integer.MIN_VALUE;
                    for (int i = 0; i < list.getChildCount(); i++) {
                        android.view.View child = list.getChildAt(i);
                        top = Math.min(top, child.getTop());
                        bottom = Math.max(bottom, child.getBottom());
                    }
                    int available = list.getHeight() - list.getPaddingTop() - list.getPaddingBottom();
                    if (top <= list.getPaddingTop() || bottom - top > available) return;
                    int offset = list.getPaddingTop() - top;
                    for (int i = 0; i < list.getChildCount(); i++) list.getChildAt(i).offsetTopAndBottom(offset);
                    list.invalidate();
                    return;
                }
            }
        } catch (ReflectiveOperationException error) {
            Log.w(LOG_TAG, "Unable to align short thread", error);
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
        return EdgeSubjectUrl.rewrite(original, EdgeReporterOptions.fetch());
    }

    public static boolean edgeReporterIdsEnabled() {
        return EdgeReporterOptions.menu();
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
     * Keeps the 191 downloader on the ordinary DAT reader for Talk URLs.  The
     * stock type-4 branch invokes a dynamically restored signer; after a
     * Morphe rebuild that signer is the source of the divide-by-zero trap.
     * ChMate's URL-info class is app-owned, so use its stable no-arg URL
     * accessor and the integer transport field reflectively.
     */
    public static void normalizeLegacyTalkTransport(Object urlInfo) {
        if (urlInfo == null) return;
        try {
            String url = null;
            for (String accessor : new String[]{"o", "G", "H", "D"}) {
                try {
                    java.lang.reflect.Method method = urlInfo.getClass().getDeclaredMethod(accessor);
                    if (method.getReturnType() == String.class) {
                    method.setAccessible(true);
                    Object value = method.invoke(urlInfo);
                    if (value instanceof String && ArchivedThreadImporter.isTalkThreadUrl((String) value)) {
                        url = (String) value;
                        break;
                    }
                    }
                } catch (NoSuchMethodException ignored) {
                }
            }
            if (url == null) return;
            for (java.lang.reflect.Field field : urlInfo.getClass().getDeclaredFields()) {
                if (field.getType() == int.class && (field.getName().equals("g")
                        || field.getName().equals("type") || field.getName().equals("kind"))) {
                    field.setAccessible(true);
                    int originalTransport = field.getInt(urlInfo);
                    if (originalTransport != 1) {
                        field.setInt(urlInfo, 1);
                        LEGACY_TALK_TRANSPORTS.put(urlInfo, originalTransport);
                    }
                    return;
                }
            }
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to normalize legacy Talk transport", error);
        }
    }

    /**
     * ChMate 0.8.10.191 can hand its write form a legacy Talk read.cgi URL,
     * while its BBSUrlInfo parser only recognizes Talk's /boards/ route.
     * Convert only that Talk-specific thread URL before parsing the post target.
     */
    public static String normalizeLegacyTalkWriteUrl(String value) {
        if (value == null) return null;
        try {
            Uri uri = Uri.parse(value);
            String host = uri.getHost();
            String path = uri.getPath();
            if (host == null || path == null) return value;
            host = host.toLowerCase(java.util.Locale.ROOT);
            boolean isTalkHost = host.equals("talk.jp") || host.endsWith(".talk.jp")
                    || host.equals("classic.talk-platform.com")
                    || host.endsWith(".talk-platform.com");
            if (!isTalkHost) return value;
            java.util.regex.Matcher matcher = java.util.regex.Pattern
                    .compile("^/(?:bbs/)?test/read\\.cgi/([^/]+)/([0-9]{9,10})(?:/.*)?$")
                    .matcher(path);
            if (!matcher.matches()) return value;
            Uri.Builder builder = uri.buildUpon()
                    .scheme("https")
                    .encodedAuthority("talk.jp")
                    .encodedPath("/boards/" + matcher.group(1) + "/" + matcher.group(2));
            return builder.build().toString();
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to normalize legacy Talk write URL", error);
            return value;
        }
    }

    /** Restores the URL model's Talk type after the protected DAT load returns. */
    public static void restoreLegacyTalkTransport(Object urlInfo) {
        if (urlInfo == null) return;
        Integer originalTransport = LEGACY_TALK_TRANSPORTS.remove(urlInfo);
        if (originalTransport == null) return;
        try {
            for (java.lang.reflect.Field field : urlInfo.getClass().getDeclaredFields()) {
                if (field.getType() == int.class && (field.getName().equals("g")
                        || field.getName().equals("type") || field.getName().equals("kind"))) {
                    field.setAccessible(true);
                    field.setInt(urlInfo, originalTransport);
                    return;
                }
            }
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to restore legacy Talk transport", error);
        }
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

    public static boolean optimize191UpdateProgress() {
        SharedPreferences settings = preferencesOrNull();
        return settings == null || settings.getBoolean("optimize191UpdateProgress", true);
    }

    public static boolean suppressTabletThreadResumeReload() {
        SharedPreferences settings = preferencesOrNull();
        return settings == null || settings.getBoolean("suppressTabletThreadResumeReload", true);
    }

    public static boolean fast191UpdateConnect() {
        SharedPreferences settings = preferencesOrNull();
        return settings == null || settings.getBoolean("fast191UpdateConnect", true);
    }

    public static int update191TimeoutSeconds() {
        SharedPreferences settings = preferencesOrNull();
        int value = settings == null ? 0 : settings.getInt("update191TimeoutSeconds", 0);
        return value == 30 || value == 60 || value == 120 ? value : 0;
    }

    /**
     * Returns the maximum number of locally persisted NG entries for each
     * ChMate NG category. Zero means unlimited; the stock value is 300.
     */
    public static int getNgRegistrationLimit() {
        SharedPreferences preferences = preferencesOrNull();
        if (preferences == null) return DEFAULT_NG_REGISTRATION_LIMIT;
        int value = preferences.getInt(NG_REGISTRATION_LIMIT_KEY, DEFAULT_NG_REGISTRATION_LIMIT);
        return value <= 0 ? Integer.MAX_VALUE : Math.min(value, MAX_NG_REGISTRATION_LIMIT);
    }

    public static int getPostedThreadDisplayCount() {
        return PostedThreadCountValue.queryLimit(getPostedThreadDisplayCountSetting());
    }

    private static int getPostedThreadDisplayCountSetting() {
        SharedPreferences prefs = preferencesOrNull();
        int defaultValue = PostedThreadCountValue.DEFAULT;
        try { defaultValue = PostedThreadCountValue.defaultForVersion(chMateVersion()); }
        catch (PackageManager.NameNotFoundException | RuntimeException ignored) { }
        return PostedThreadCountValue.normalize(prefs == null ? defaultValue
                : prefs.getInt(POSTED_THREAD_DISPLAY_COUNT_KEY, defaultValue));
    }

    public static long getPostedThreadDisplayCountLong() {
        return getPostedThreadDisplayCount();
    }

    /** Legacy database wrappers do not forward the posted query-builder LIMIT. */
    public static java.util.List<?> limitPostedThreadRows(java.util.List<?> rows) {
        if (rows == null) return null;
        int limit = getPostedThreadDisplayCount();
        return rows.size() <= limit ? rows : new java.util.ArrayList<>(rows.subList(0, limit));
    }

    /** Unlike the display limit, zero deliberately keeps no sent-history entries. */
    public static int getPostHistoryRetentionCount() {
        Context context = applicationContext;
        if (context == null) return DEFAULT_CHMATE_POST_DATA_LIST_COUNT;
        int count = PreferenceManager.getDefaultSharedPreferences(context).getInt(
                CHMATE_POST_DATA_LIST_COUNT_KEY, DEFAULT_CHMATE_POST_DATA_LIST_COUNT);
        if (count == Integer.MAX_VALUE) return Integer.MAX_VALUE;
        return Math.max(0, Math.min(count, MAX_CHMATE_POST_DATA_LIST_COUNT));
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
        configureLegacyTalkConfirmationParser();
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

    /**
     * The 0.8.10.191 confirmation-form parser uses `.` without DOTALL for both
     * the input-tag matcher and attribute-value matcher. A MESSAGE value with
     * line breaks is therefore silently dropped, so the confirmation POST is
     * retried without its body and the server shows the cookie confirmation again.
     */
    private static void configureLegacyTalkConfirmationParser() {
        try {
            Class<?> parser = Class.forName("o.getCredentials");
            java.lang.reflect.Field[] fields = parser.getDeclaredFields();
            for (java.lang.reflect.Field field : fields) {
                if (field.getType() != java.util.regex.Pattern.class) continue;
                field.setAccessible(true);
                java.util.regex.Pattern current = (java.util.regex.Pattern) field.get(null);
                if (current == null || (current.flags() & java.util.regex.Pattern.DOTALL) != 0) continue;
                field.set(null, java.util.regex.Pattern.compile(
                        current.pattern(), current.flags() | java.util.regex.Pattern.DOTALL));
            }
            Log.i(LOG_TAG, "Enabled multiline parsing for legacy Talk confirmation forms");
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Could not enable multiline parsing for legacy Talk confirmation forms", error);
        }
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
            // Every wrapped call renews the cache, but other generated paths may
            // reuse it after a day has passed. Avoid that arbitrary expiration for
            // the lifetime of this process. Half of Long.MAX_VALUE leaves room for
            // timestamp arithmetic in the generated method.
            Field timestampField = stateClass.getDeclaredField("c");
            timestampField.setAccessible(true);
            timestampField.setLong(null, Long.MAX_VALUE / 2);
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
        boolean vipThread = ArchiveRouteVariables.isVipThread(original);
        if (talkThread) {
            try {
                String version = activity.getPackageManager()
                        .getPackageInfo(activity.getPackageName(), 0).versionName;
                if ("0.8.10.243 dev".equals(version)) {
                    // 243 refreshes the first render after its native download.
                    // 242 does not, so let the importer populate the DAT before launch.
                    return;
                }
            } catch (android.content.pm.PackageManager.NameNotFoundException ignored) {
            }
        }
        if (!talkThread && !vipThread && !isChtoioEnabled()) return;
        String rewritten = talkThread || vipThread ? original : rewriteLegacyThreadUrl(original);
        boolean archiveRetry = intent.getBooleanExtra("haiagaru.archive.retry", false);
        if (archiveRetry) {
            // The retry marker is valid only for the Activity opened immediately
            // after publishing a DAT. Do not let ChMate copy it into later intents.
            intent.removeExtra("haiagaru.archive.retry");
        }
        boolean shouldImport = talkThread
                || (isAutomaticDatEnabled(activity) && (vipThread || isArchivedThreadUrl(original)));
        if (!archiveRetry && shouldImport
                && ArchivedThreadImporter.importIfNeeded(activity, original, rewritten)) {
            Log.i(LOG_TAG, "Handling thread through the local DAT cache: " + original);
            // ChMate would otherwise continue its regular network load while
            // the importer is fetching the same .io DAT. The importer opens a
            // retry Activity after publishing the local cache.
            if (talkThread) {
                // Import can finish this first instance before ChMate initializes
                // its result for the caller's forward history. Match its native
                // result (including fwRequestCode/fwFragmentTag and any nested
                // forwardIntent) even when onCreate returns early.
                activity.setResult(Activity.RESULT_CANCELED, new Intent(intent));
            }
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
        boolean vipThread = ArchiveRouteVariables.isVipThread(original);
        if (!talkThread && !vipThread && !isChtoioEnabled()) return false;
        String rewritten = talkThread || vipThread ? original : rewriteLegacyThreadUrl(original);
        boolean archiveRetry = bundle.getBoolean("haiagaru.archive.retry", false);
        boolean shouldImport = talkThread
                || (isAutomaticDatEnabled(activity) && (vipThread || isArchivedThreadUrl(original)));
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

            String responseSuffix = matcher.groupCount() >= 3
                    ? matcher.group(3) : null;
            StringBuilder rewrittenUrl = new StringBuilder()
                    .append("https://itest.5ch.io/test/read.cgi/")
                    .append(matcher.group(1)).append('/').append(matcher.group(2));
            if (responseSuffix != null && !responseSuffix.isEmpty()) {
                rewrittenUrl.append(responseSuffix);
            } else {
                rewrittenUrl.append('/');
            }
            if (uri.getEncodedQuery() != null) {
                rewrittenUrl.append('?').append(uri.getEncodedQuery());
            }
            if (uri.getEncodedFragment() != null) {
                rewrittenUrl.append('#').append(uri.getEncodedFragment());
            }
            return rewrittenUrl.toString();
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
                .replace("://img.2ch.net/", "://img.5ch.net/")
                .replace("://img.5ch.net/ico/_be_", "://img.5ch.io/premium/")
                .replace("://img.5ch.net/ico/_be", "://img.5ch.io/premium/")
                .replace("://img.5ch.net/", "://img.5ch.io/");
    }

    /** Normalize only the retired BE token before ChMate builds its text and attachment models. */
    public static String normalizeLegacyBeBody(String original) {
        if (original == null || !LEGACY_BE_ANY_URL.matcher(original).find()) {
            return original;
        }
        // The pre-io DAT format appears as sssp://, https://, or a control
        // character prefix. Normalize the host in all forms before the 226
        // response model builds its attachment projection.
        String normalized = original
                .replace("img.2ch.net/", "img.5ch.io/")
                .replace("img.5ch.net/", "img.5ch.io/")
                .replace("img.5ch.NET/", "img.5ch.io/");
        // 226 builds both the response model and the attachment projection
        // from this field. Deduplicate here as well as in the renderer so a
        // legacy row cannot produce one inline icon plus a second attachment.
        return deduplicateBeIcons(normalized);
    }

    public static String prepareLegacyBeParsing(String original) {
        if (original == null) return null;
        // Text length does not identify a second render pass. Only the overload
        // with a render buffer can establish that an icon was already emitted.
        // The 191 parser only routes sssp://img.5ch.net/ico/... through its
        // inline icon renderer. Normalize every public spelling, including
        // ordinary https://, protocol-relative, and control-character encoded
        // /ico/ URLs. This matters when
        // the optional thread-date renderer inserts text before the URL: leaving
        // the image as a normal link makes the span offsets and attachment pass
        // disagree, which produces duplicate icons or a broken link.
        String prepared = LEGACY_PREMIUM_BE_URL.matcher(original)
                .replaceAll("sssp://img.5ch.net/ico/_be$1");
        prepared = LEGACY_BE_ICO_URL.matcher(prepared)
                .replaceAll("sssp://img.5ch.net/ico/$1");
        return deduplicateBeIcons(prepared);
    }

    /** Keep one inline icon per BE filename even when the legacy parser visits a row twice. */
    private static String deduplicateBeIcons(String text) {
        Matcher matcher = LEGACY_BE_ANY_URL.matcher(text);
        java.util.HashSet<String> seen = new java.util.HashSet<>();
        StringBuffer output = null;
        while (matcher.find()) {
            String key = matcher.group(1).toLowerCase(Locale.ROOT);
            if (key.startsWith("_be_")) key = key.substring(4);
            else if (key.startsWith("_be")) key = key.substring(3);
            if (seen.add(key)) continue;
            if (output == null) output = new StringBuffer(text.length());
            matcher.appendReplacement(output, "");
        }
        if (output == null) return text;
        matcher.appendTail(output);
        return output.toString();
    }

    /** Avoid drawing the same legacy BE icon twice when the row already owns its span. */
    public static String prepareLegacyBeParsing(Object renderBuffer, String original) {
        if (original == null || renderBuffer == null
                || (!LEGACY_PREMIUM_BE_URL.matcher(original).find()
                && !LEGACY_BE_ICO_URL.matcher(original).find())) {
            return prepareLegacyBeParsing(original);
        }
        String prepared = original;
        for (Pattern tokenPattern : new Pattern[]{LEGACY_PREMIUM_BE_URL, LEGACY_BE_ICO_URL}) {
            Matcher matcher = tokenPattern.matcher(prepared);
            StringBuffer unique = null;
            while (matcher.find()) {
                if (!hasMatchingBeIconSpan(renderBuffer, matcher.group(1))) continue;
                if (unique == null) unique = new StringBuffer(prepared.length());
                matcher.appendReplacement(unique, "");
            }
            if (unique != null) {
                matcher.appendTail(unique);
                prepared = unique.toString();
            }
        }
        return prepareLegacyBeParsing(prepared);
    }

    private static boolean hasMatchingBeIconSpan(Object renderBuffer, String fileName) {
        String bufferClass = renderBuffer.getClass().getName();
        String listField;
        String spanField;
        String iconClass;
        String urlField;
        if ("o.o8".equals(bufferClass)) {
            listField = "b";
            spanField = "d";
            iconClass = "o.oa";
            urlField = "e";
        } else if ("o.getFlexLinesInternal".equals(bufferClass)) {
            listField = "a";
            spanField = "a";
            iconClass = "o.getFlexDirection";
            urlField = "b";
        } else {
            return false;
        }
        try {
            Field recordsField = renderBuffer.getClass().getDeclaredField(listField);
            recordsField.setAccessible(true);
            Object records = recordsField.get(renderBuffer);
            if (!(records instanceof List<?>)) return false;
            String target = fileName.toLowerCase(Locale.ROOT);
            for (Object record : (List<?>) records) {
                if (record == null) continue;
                Field drawableField = record.getClass().getDeclaredField(spanField);
                drawableField.setAccessible(true);
                Object drawable = drawableField.get(record);
                if (drawable == null || !iconClass.equals(drawable.getClass().getName())) continue;
                Field iconUrlField = drawable.getClass().getDeclaredField(urlField);
                iconUrlField.setAccessible(true);
                Object value = iconUrlField.get(drawable);
                if (!(value instanceof String)) continue;
                String url = ((String) value).toLowerCase(Locale.ROOT);
                if (url.endsWith("/premium/" + target)
                        || url.endsWith("/ico/" + target)
                        || url.endsWith("/ico/_be" + target)
                        || url.endsWith("/ico/_be_" + target)) return true;
            }
        } catch (ReflectiveOperationException | SecurityException ignored) {
            return false;
        }
        return false;
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
     * The pre-io renderer calculates an image span from the expanded sssp URL,
     * but its displayed text still contains the shorter DAT token. A span that
     * reaches the following newline is drawn on both lines as two BE icons.
     */
    public static int correctLegacyBeSpanEnd(
            CharSequence text, Object span, int start, int end
    ) {
        if (text == null || span == null || start < 0 || start >= text.length()) return end;
        int candidate = Math.min(end, text.length());
        int newline = -1;
        for (int i = start; i < candidate; i++) {
            if (text.charAt(i) == '\n') {
                newline = i;
                break;
            }
        }
        if (newline < 0 && end <= text.length()) return end;

        String className = span.getClass().getName();
        String urlField;
        if ("o.oa".equals(className)) urlField = "e";
        else if ("o.getFlexDirection".equals(className)) urlField = "b";
        else return end;
        try {
            Field field = span.getClass().getDeclaredField(urlField);
            field.setAccessible(true);
            Object value = field.get(span);
            if (!(value instanceof String)) return end;
            String url = ((String) value).toLowerCase(Locale.ROOT);
            if (!LEGACY_BE_ANY_URL.matcher(url).find()) return end;
            int corrected = newline >= 0 ? newline : candidate;
            return corrected > start ? corrected : end;
        } catch (ReflectiveOperationException | SecurityException ignored) {
            return end;
        }
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
        String subdomainUrl = findSubdomainUrlForBareHost(renderedText, url, originalStart);
        if (subdomainUrl != null) {
            int urlStart = renderedText.toString().indexOf(subdomainUrl);
            if (urlStart >= 0) {
                int urlEnd = urlStart + subdomainUrl.length();
                return ((long) urlEnd << 32) | (urlStart & 0xffffffffL);
            }
        }
        int start = originalStart;
        int end = originalEnd;
        if (renderedText != null && url != null && !url.isEmpty()) {
            String text = renderedText.toString();
            // The target URL includes a scheme even for a bare domain or ttp
            // display token. Its length therefore is not the span length.
            String[] displays = (url.startsWith("http://") || url.startsWith("https://"))
                    ? new String[]{url, url.substring(1), url.substring(url.indexOf("://") + 3)}
                    : new String[]{url};
            int closest = -1, closestLength = 0;
            long closestDistance = Long.MAX_VALUE;
            for (String display : displays) {
                int candidate = text.indexOf(display);
                while (candidate >= 0) {
                    // Do not mistake a domain inside another URL (or ttp inside
                    // http) for a standalone display token.
                    char previous = candidate > 0 ? text.charAt(candidate - 1) : ' ';
                    boolean boundary = display.equals(url)
                            || !(Character.isLetterOrDigit(previous)
                            || previous == '/' || previous == ':' || previous == '.'
                            || previous == '_' || previous == '-');
                    if (boundary) {
                        if (candidate == start && end == start + display.length()) {
                            return ((long) end << 32) | (start & 0xffffffffL);
                        }
                        long distance = Math.abs((long) candidate - start);
                        if (distance < closestDistance) {
                            closest = candidate;
                            closestLength = display.length();
                            closestDistance = distance;
                        }
                    }
                    candidate = text.indexOf(display, candidate + 1);
                }
            }
            // BE token removal can shift every later link by more than eight
            // characters; repeated URLs also need the nearest final-text match.
            if (closest >= 0) {
                start = closest;
                end = closest + closestLength;
            }
        }
        return ((long) end << 32) | (start & 0xffffffffL);
    }

    /**
     * Repairs legacy parser entries where a bare domain in prose steals the
     * link metadata for a full URL on the following line. The normal range
     * aligner intentionally accepts a unique bare-domain match; in this case
     * that match can be the prose suffix (for example, "391(c)2ch.net") while
     * the intended link is "http://hello.2ch.net/...". Prefer that unique
     * subdomain URL and update the ClickableSpan target together with its range.
     */
    public static long alignLegacyLinkRange(
            CharSequence renderedText,
            Object linkSpan,
            String url,
            int originalStart,
            int originalEnd
    ) {
        String correctedUrl = findSubdomainUrlForBareHost(renderedText, url, originalStart);
        if (correctedUrl == null) {
            return alignLegacyLinkRange(renderedText, url, originalStart, originalEnd);
        }

        updateLegacyLinkTarget(linkSpan, url, correctedUrl);
        String text = renderedText.toString();
        int start = text.indexOf(correctedUrl);
        if (start < 0) {
            return alignLegacyLinkRange(renderedText, url, originalStart, originalEnd);
        }
        int end = start + correctedUrl.length();
        return ((long) end << 32) | (start & 0xffffffffL);
    }

    private static String findSubdomainUrlForBareHost(
            CharSequence renderedText,
            String url,
            int originalStart
    ) {
        if (renderedText == null || url == null || originalStart < 0) return null;
        Matcher target = LEGACY_LINK_HOST_ONLY.matcher(url);
        if (!target.matches()) return null;
        String targetHost = target.group(1).toLowerCase(Locale.ROOT);
        if (targetHost.indexOf('.') < 0) return null;

        String text = renderedText.toString();
        Matcher urls = LEGACY_ABSOLUTE_URL.matcher(text);
        String candidate = null;
        int candidateStart = -1;
        while (urls.find()) {
            String host = urls.group(1).toLowerCase(Locale.ROOT);
            if (!host.endsWith("." + targetHost) || host.equals(targetHost)) continue;
            int start = urls.start();
            String value = urls.group();
            while (!value.isEmpty() && ".,;:!?)]".indexOf(value.charAt(value.length() - 1)) >= 0) {
                value = value.substring(0, value.length() - 1);
            }
            if (value.isEmpty()) continue;
            // Scope candidates to the copyright/title line immediately above
            // them. Other links in the response often share the same domain.
            int previousEnd = text.lastIndexOf('\n', start - 1);
            if (previousEnd < 0) continue;
            int previousStart = text.lastIndexOf('\n', previousEnd - 1) + 1;
            int suffixStart = text.indexOf(targetHost, previousStart);
            if (suffixStart <= previousStart || suffixStart >= previousEnd
                    || text.charAt(suffixStart - 1) != ')') continue;
            boolean adjacent = true;
            for (int index = suffixStart + targetHost.length(); index < start; index++) {
                if (!Character.isWhitespace(text.charAt(index))) {
                    adjacent = false;
                    break;
                }
            }
            if (!adjacent) continue;
            if (candidate != null) return null;
            candidate = value;
            candidateStart = start;
        }
        if (candidate == null) return null;

        // Only correct a stale range that points at the bare target domain in
        // prose. Other nearby links should retain ChMate's own interpretation.
        // The offsets still refer to the text before BE token removal. They
        // can point beyond this prose domain or even beyond the following URL.
        // Locate the domain on the line immediately preceding the actual URL.
        int precedingLineEnd = text.lastIndexOf('\n', candidateStart - 1);
        if (precedingLineEnd < 0) return null;
        int precedingLineStart = text.lastIndexOf('\n', precedingLineEnd - 1) + 1;
        int domainStart = text.indexOf(targetHost, precedingLineStart);
        if (domainStart < 0 || domainStart >= precedingLineEnd) return null;
        // Restrict this target repair to copyright/title suffixes. A genuine
        // standalone bare-host link must retain its own destination.
        if (domainStart == 0 || text.charAt(domainStart - 1) != ')') return null;
        int lineEnd = text.indexOf('\n', domainStart + targetHost.length());
        if (lineEnd < 0) return null;
        for (int index = domainStart + targetHost.length(); index < lineEnd; index++) {
            if (!Character.isWhitespace(text.charAt(index))) return null;
        }
        int nextLineStart = lineEnd + 1;
        while (nextLineStart < text.length()
                && Character.isWhitespace(text.charAt(nextLineStart))
                && text.charAt(nextLineStart) != '\n') {
            nextLineStart++;
        }
        if (candidateStart != nextLineStart) return null;
        return candidate;
    }

    private static void updateLegacyLinkTarget(Object linkSpan, String oldUrl, String newUrl) {
        if (linkSpan == null || oldUrl == null || oldUrl.equals(newUrl)) return;
        for (Field field : linkSpan.getClass().getDeclaredFields()) {
            if (field.getType() != String.class) continue;
            try {
                field.setAccessible(true);
                if (oldUrl.equals(field.get(linkSpan))) {
                    field.set(linkSpan, newUrl);
                    return;
                }
            } catch (ReflectiveOperationException | RuntimeException ignored) {
                // The corrected display range is still preferable if a target
                // version makes its URL field immutable to reflection.
            }
        }
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
                || normalized.contains("img.2ch.net/ico/")
                || normalized.contains("img.2ch.net/premium/")
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
        if (view == null || adapter == null) return;
        // This adapter hook runs for every bound response, including when ad
        // hiding is disabled. Keep emoji fallback independent of that setting.
        try {
            EmojiFontFallback.applyToRow(view);
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to apply emoji font fallback", error);
        }
        if (!shouldHideAds()) return;
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
        // ChMate 242 uses a dedicated empty, childless view as the large inline
        // Talk ad slot between consecutive responses. Identify that class by
        // name, while still requiring the Talk thread guard in the caller.
        if ("o.zzbiczzabzza".equals(name)
                && view.getVisibility() == View.VISIBLE
                && view.getHeight() >= dp(view.getContext(), 160)) {
            collapseView(view);
            return;
        }
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
                    && !AdContainerSafety.isScreenHost(child.getClass(), child.getId())
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
            if (AdContainerSafety.isScreenHost(container.getClass(), container.getId())) return;
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
        if (view != null && AdContainerSafety.isScreenHost(view.getClass(), view.getId())) return false;
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
        // The image viewer is added later to an initially empty Fragment host.
        // Never turn that host (or the Activity content root) into an ad spacer.
        if (AdContainerSafety.isScreenHost(view.getClass(), view.getId())) return;
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
        if (NativeToolTabs.open(activity, "settings")) return;
        activity.startActivity(NativeToolTabs.settingsIntent(activity));
    }

    /** Existing preference writers, rendered by the Compose settings catalog. */
    public static LinearLayout settingsCategory(Activity activity, String category) {
        switch (category) {
            case "GENERAL": return settingsGENERAL(activity);
            case "DISPLAY": return settingsDISPLAY(activity);
            case "POSTING": return settingsPOSTING(activity);
            case "ADVANCED": return settingsADVANCED(activity);
            case "CHECKER": return settingsCHECKER(activity);
            case "MEDIA": return settingsMEDIA(activity);
            case "SOCIAL": return settingsSOCIAL(activity);
            case "NG": return settingsNG(activity);
            case "ARCHIVE": return settingsARCHIVE(activity);
            case "HISTORY": return settingsHISTORY(activity);
            case "BACKUP": return settingsBACKUP(activity);
            case "UPLOAD": return settingsUPLOAD(activity);
            default: throw new IllegalArgumentException(category);
        }
    }

    public static void settingsClosed() {
        ImgurAlbumAttachments.refreshVideoModels();
        EmojiFontFallback.refreshVisibleRows();
        refreshBoardListAfterReadSortChange();
    }

    private static LinearLayout settingsUPLOAD(Activity activity) {
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        SharedPreferences preferences = preferences(activity);
        SharedPreferences chMatePreferences = PreferenceManager.getDefaultSharedPreferences(activity);
        String chMateVersion = "";
        try { chMateVersion = activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName; }
        catch (Exception ignored) { }
        LiveSettings live = new LiveSettings(preferences, () -> {
            View decor = activity.getWindow().getDecorView();
            decor.requestLayout(); decor.invalidate();
        });
        Button uploadHosts = new Button(activity);
        uploadHosts.setText(text("画像・動画のアップロード先（Imgur／imgbox／imgpile）", "Image / video upload destination (Imgur / imgbox / imgpile)"));
        uploadHosts.setOnClickListener(view -> MediaUploadHosts.showSettings(activity));
        layout.addView(uploadHosts);
        if (ImgurWebUpload.supported(activity)) {
            Switch showImgurUploads = addSwitch(layout, activity,
                    text("メニューに Imgur投稿一覧 を表示", "Show Imgur uploads in the menu"),
                    ImgurWebUpload.uploadsMenuVisible(activity));
            new LiveSettings(ImgurWebUpload.prefs(activity), () -> {})
                    .toggle(showImgurUploads, ImgurWebUpload.SHOW_UPLOADS_MENU);
            Button imgurLogin = new Button(activity);
            imgurLogin.setText(text("Imgurにログイン／Webアカウント送信（開発中）", "Imgur login / web account uploads (in development)"));
            imgurLogin.setOnClickListener(view -> activity.startActivity(
                    new Intent(activity, ImgurWebLoginActivity.class)));
            layout.addView(imgurLogin);
            Button imgurUploads = new Button(activity);
            imgurUploads.setText(text("Imgur投稿一覧", "Imgur uploads"));
            imgurUploads.setOnClickListener(view -> activity.startActivity(new Intent(activity, ImgurUploadsActivity.class)));
            layout.addView(imgurUploads);
        }



        return layout;
    }

    private static LinearLayout settingsGENERAL(Activity activity) {
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        SharedPreferences preferences = preferences(activity);
        SharedPreferences chMatePreferences = PreferenceManager.getDefaultSharedPreferences(activity);
        String chMateVersion = "";
        try { chMateVersion = activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName; }
        catch (Exception ignored) { }
        LiveSettings live = new LiveSettings(preferences, () -> {
            View decor = activity.getWindow().getDecorView();
            decor.requestLayout(); decor.invalidate();
        });
        Switch nativeTabs = addSwitch(layout, activity,
                text("タブレットの追加画面をホーム側のタブで開く", "Open extra tablet screens in HOME tabs"),
                preferences.getBoolean(NativeToolTabs.KEY, false));
        live.toggle(nativeTabs, NativeToolTabs.KEY);
        Switch nativeSettingsTab = addSwitch(layout, activity,
                text("タブ表示する画面：Haiagaru設定", "Tab screen: Haiagaru settings"),
                preferences.getBoolean(NativeToolTabs.SETTINGS_KEY, true));
        live.toggle(nativeSettingsTab, NativeToolTabs.SETTINGS_KEY);
        Switch nativeEddiTab = addSwitch(layout, activity,
                text("タブ表示する画面：エッヂ過去ログ検索", "Tab screen: Edge archive search"),
                preferences.getBoolean(NativeToolTabs.EDDI_KEY, true));
        live.toggle(nativeEddiTab, NativeToolTabs.EDDI_KEY);
        Switch nativeSearchTab = addSwitch(layout, activity,text("タブ表示する画面：投稿を探す", "Tab screen: Find posts"),preferences.getBoolean(NativeToolTabs.SEARCH_KEY,true));
        live.toggle(nativeSearchTab,NativeToolTabs.SEARCH_KEY);
        Switch nativeCheckerTab = addSwitch(layout, activity,text("タブ表示する画面：投稿検索・結果", "Tab screen: Checker results"),preferences.getBoolean(NativeToolTabs.CHECKER_KEY,true));
        live.toggle(nativeCheckerTab,NativeToolTabs.CHECKER_KEY);
        Switch nativeHissiTab = addSwitch(layout, activity,text("タブ表示する画面：必死チェッカーもどき専用ビュワー", "Tab screen: Hissi-style dedicated viewer"),preferences.getBoolean(NativeToolTabs.HISSI_KEY,true));
        live.toggle(nativeHissiTab,NativeToolTabs.HISSI_KEY);
        Switch nativeFullTab = addSwitch(layout, activity,text("タブ表示する画面：ワッチョイ全文検索", "Tab screen: Full Wacchoi search"),preferences.getBoolean(NativeToolTabs.FULL_KEY,true));
        live.toggle(nativeFullTab,NativeToolTabs.FULL_KEY);
        EditText toolTabHeight = addTextField(layout, activity,
                text("専用画面タブの見出し・×バーの高さ（dp・32〜64）", "Tool tab title and close bar height (dp, 32–64)"),
                Integer.toString(NativeToolTabs.headerHeightDp(activity)));
        toolTabHeight.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);
        live.number(toolTabHeight, NativeToolTabs.HEADER_HEIGHT_KEY, 32, 64);
        TextView nativeTabsHelp = new TextView(activity);
        nativeTabsHelp.setText(text("オンはホーム側、オフはスレ側のタブ列に追加します。各「タブ表示する画面」をオフにした画面は別画面で開きます。「画面を新しいタブに追加」の手動追加も同じ追加先を使います。変更は次に開く画面から反映され、既存のタブは自動では移動しません。",
                "On adds screens to HOME tabs; off adds them to thread tabs. Individual screen switches control automatic tab opening. Manual additions use the same pane selection. Existing tabs are not moved."));
        layout.addView(nativeTabsHelp);
        Button addToolTab = new Button(activity);
        addToolTab.setText(text("画面を新しいタブに追加", "Add a screen in a new tab"));
        addToolTab.setOnClickListener(view -> NativeToolTabs.showChooser(activity));
        layout.addView(addToolTab);
        TextView addToolTabHelp = new TextView(activity);
        addToolTabHelp.setText(text("タブレット表示で使えます。各画面の自動タブ表示がオフでも手動追加できます。追加先は上の設定で、ホーム側／スレ側を切り替えます。",
                "In tablet mode, manually add any screen even when its automatic tab setting is off. The switch above selects HOME or thread tabs."));
        layout.addView(addToolTabHelp);
        int initialSettingsLanguage = SettingsLanguage.index(preferences.getString("settingsLanguage", "ja"));
        Spinner settingsLanguage = addSpinner(layout, activity,
                "Haiagaruの表示言語 / Haiagaru language",
                new String[]{"日本語 / Japanese", "English / 英語", "端末の言語 / System"},
                initialSettingsLanguage);
        TextView settingsLanguageDescription = new TextView(activity);
        settingsLanguageDescription.setText(text(
                "表示言語を選ぶと保存され、次に設定を開いたときに反映されます。",
                "The selected language is saved immediately and appears when settings are reopened."));
        settingsLanguageDescription.setTextSize(13);
        layout.addView(settingsLanguageDescription, rowParams(activity));

        Switch hideAd = addSwitch(
                layout,
                activity,
                text("広告を削除", "Remove ads"),
                preferences.getBoolean("hideAd", true)
        );

        live.choice(settingsLanguage, () -> preferences.edit().putString("settingsLanguage", SettingsLanguage.value(settingsLanguage.getSelectedItemPosition())).apply());
        live.toggle(hideAd, "hideAd");
        return layout;
    }

    private static LinearLayout settingsDISPLAY(Activity activity) {
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        SharedPreferences preferences = preferences(activity);
        SharedPreferences chMatePreferences = PreferenceManager.getDefaultSharedPreferences(activity);
        Switch automaticFold = addSwitch(layout, activity,
                text("折りたたみ状態でスマホ／タブレット表示を自動切替", "Switch phone/tablet layout by folding state"),
                preferences.getBoolean("automaticFoldMode", false));
        TextView foldHelp = new TextView(activity);
        foldHelp.setText(text("Jetpack WindowManagerの折り目情報で判定します。内側画面の折り目を確認後、折り目がなくなるとスマホ表示へ戻します。DPIや600dp幅で推測しません。非対応端末・閉じた状態の初回起動は手動設定を維持します。分割画面で折り目が範囲外の場合も切替えません。投稿・設定・メディア表示中は切替を保留します。",
                "Uses Jetpack WindowManager folding features, not DPI or a 600dp threshold. After verifying the inner display, absence of a fold returns to phone layout. Unsupported devices, a first launch while closed, and split windows without a hinge keep the manual/current layout. Editing, settings and media defer switching."));
        layout.addView(foldHelp);
        automaticFold.setOnCheckedChangeListener((button, checked) -> {
            preferences.edit().putBoolean("automaticFoldMode", checked).apply(); FoldLayout.settingsChanged();
        });
        String chMateVersion = "";
        try { chMateVersion = activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName; }
        catch (Exception ignored) { }
        LiveSettings live = new LiveSettings(preferences, () -> {
            View decor = activity.getWindow().getDecorView();
            decor.requestLayout(); decor.invalidate();
        });
        Switch directCopyAnchors = addSwitch(layout, activity,
                text("長押しコピー中も >>番号の長押し操作を優先", "Keep native >>anchor long presses while copying"),
                preferences.getBoolean("directCopyAnchors", true));
        Button importThemes = new Button(activity);
        importThemes.setText(text("自作テーマをファイル／フォルダから取り込み・削除", "Import / delete custom themes from files / folder"));
        importThemes.setOnClickListener(view -> activity.startActivity(new Intent(activity, ThemeImportActivity.class)));
        layout.addView(importThemes);
        Switch topAlignShortThreads = null;
        if (supportsModernThreadList(activity)) {
            topAlignShortThreads = addSwitch(
                    layout, activity,
                    text("レスが少ないスレを上詰めで表示", "Align short threads to the top"),
                    preferences.getBoolean("topAlignShortThreads", false));
        }
        final Switch topAlignShortThreadsSwitch = topAlignShortThreads;
        EditText autoReloadIntervalField = null;
        if (LegacyAutoReload.supported(activity)) {
            autoReloadIntervalField = addTextField(layout, activity,
                    text("自動リロードの最小間隔（秒、10〜1800）", "Minimum auto-reload interval (seconds, 10–1800)"),
                    Integer.toString(autoReloadIntervalSeconds()));
            autoReloadIntervalField.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);
            TextView autoReloadHelp = new TextView(activity);
            autoReloadHelp.setText(text("自動スクロールを長押しで開始／停止。現在位置からスクロールし、末尾で待って更新します。新着がない場合は間隔が延びます。板の更新制限を優先し、画面を離れると停止します。",
                    "Long-press auto-scroll to start/stop. Scrolls from the current position, then waits at the bottom before reloading. Empty updates increase the interval. Board limits are respected; leaving the screen stops it."));
            layout.addView(autoReloadHelp);
        }
        final EditText autoReloadInterval = autoReloadIntervalField;
        String[] titleSpacingChoices = new String[21];
        for (int index = 0; index < titleSpacingChoices.length; index++)
            titleSpacingChoices[index] = (100 + index * 5) + "%";
        final int initialThreadTitleSpacing = threadTitleSpacingPercent();
        Spinner threadTitleSpacing = addSpinner(layout, activity,
                text("スレ一覧のタイトル行間（標準に対する割合）", "Thread-list title line spacing (relative to default)"),
                titleSpacingChoices, (initialThreadTitleSpacing - 100) / 5);

        ToolbarIcons.addSettingsButton(layout, activity);
        PopularReplies.addSettings(layout,activity);
        QuickFilterOptions.addSettings(layout,activity);
        QuickFilterOptions.addToolbarEntry(layout,activity);
        Switch compactFilters = null;
        if (QuickFilterToolbar.supported(activity)) {
            compactFilters = addSwitch(layout, activity,
                    "上部フィルタを表示しない（ツールバーの「フィルタ」は利用できます）",
                    preferences.getBoolean("compactQuickFilters", false));
        }
        final Switch compactQuickFiltersSwitch = compactFilters;
        Switch keepFilterPosition = addSwitch(layout, activity,
                "フィルタ切り替え時に表示位置を維持する（対象外のレスは近くのレスへ移動）",
                preferences.getBoolean("keepQuickFilterPosition", false));

        final boolean initialHideNgThreadGroup = hideNgThreadGroup();
        Switch hideDroppedThreadsSwitch=addSwitch(layout,activity,
                "未読・履歴・スレのタブでDAT落ちスレを非表示（ログは削除しない）",
                preferences.getBoolean(HiddenDroppedThreads.KEY,false));
        Switch deleteReadLongPress = addSwitch(layout, activity,
                text("更新ボタン長押しで既読スレを削除", "Delete read threads by long-pressing Refresh"),
                preferences.getBoolean(DeleteReadThreads.LONG_PRESS_KEY, true));
        Switch hideNgThreadGroupSwitch = addSwitch(layout, activity,
                text("スレ一覧の最下部にあるNGグループを非表示", "Hide the NG group at the bottom of thread lists"),
                initialHideNgThreadGroup);
        Switch readThreadsFirst = null;
        // 191/241/242/243 expose this in ChMate's board display options.
        // 226 keeps the Haiagaru toggle until its settings UI is migrated.
        if ("0.8.10.226 dev".equals(chMateVersion)) {
            readThreadsFirst = addSwitch(layout, activity,
                    text("板のスレ一覧で既読スレを上に", "Show read threads first in board lists"),
                    ReadThreadsFirst.enabled());
        }
        final Switch readThreadsFirstSwitch = readThreadsFirst;
        if (readThreadsFirstSwitch != null) {
            readThreadsFirstSwitch.setOnCheckedChangeListener((button, checked) -> {
                if (checked) ReadThreadsFirst.chooseScope(activity);
            });
        }
        Switch edgeReporterId = addSwitch(
                layout,
                activity,
                text(EdgeReporterOptions.MENU_LABEL, "Edge reporter IDs: long press / NG Threads"),
                preferences.getBoolean("edgeReporterId", true)
        );
        Switch edgeReporterBoardList=addSwitch(layout,activity,
                text(EdgeReporterOptions.BOARD_LABEL,"Edge reporter IDs: board thread list"),EdgeReporterOptions.board());
        TextView reporterHelp=new TextView(activity);
        reporterHelp.setText("長押し・NG追加・Threadsと、板を開いたスレ一覧への表示を別々に設定できます。既存の設定は両方へ引き継ぎます。表示を変えた後は一覧を開き直してください。未取得の記者IDは板を更新すると反映されます。");layout.addView(reporterHelp);

        PosterHighlight.addSettingsButton(layout, activity);
        if (StringReplacement.supported(activity)) {
            Button replaceStrings = new Button(activity);
            replaceStrings.setText("本文の文字列置換（外部TXT）");
            replaceStrings.setOnClickListener(v -> activity.startActivity(
                    new Intent(activity, ReplacementSettingsActivity.class)));
            layout.addView(replaceStrings, rowParams(activity));
        }


        live.toggle(directCopyAnchors,"directCopyAnchors");
        live.toggle(topAlignShortThreadsSwitch,"topAlignShortThreads");
        live.number(autoReloadInterval,"autoReloadInterval",10,1800);
        live.choice(threadTitleSpacing,"threadTitleSpacingPercent",i->100+i*5);
        live.toggle(compactQuickFiltersSwitch,"compactQuickFilters");
        live.toggle(keepFilterPosition,"keepQuickFilterPosition");
        live.toggle(deleteReadLongPress, DeleteReadThreads.LONG_PRESS_KEY);
        live.toggle(hideNgThreadGroupSwitch,"hideNgThreadGroup");
        live.toggle(hideDroppedThreadsSwitch,HiddenDroppedThreads.KEY);
        Switch excludeHiddenNgUnread=addSwitch(layout,activity,"非表示NGのレスを未読件数に含めない",preferences.getBoolean(HiddenNgUnread.KEY,false));
        live.toggle(excludeHiddenNgUnread,HiddenNgUnread.KEY);
        TextView unreadNgHelp=new TextView(activity);unreadNgHelp.setText("既読位置は変えず、取得してNG判定できた非表示レスだけを件数から除きます。未取得・未判定のレスは除きません。変更後はスレを開き直してください。");layout.addView(unreadNgHelp);
        Switch hideDroppedDrafts=addSwitch(layout,activity,
                text("DAT落ちスレの下書きを非表示", "Hide drafts for dropped threads"),
                preferences.getBoolean(HiddenDroppedThreads.DRAFTS,false));
        Switch hideDroppedSent=addSwitch(layout,activity,
                text("DAT落ちスレの送信済み・書き込み先を非表示", "Hide sent posts and destinations for dropped threads"),
                preferences.getBoolean(HiddenDroppedThreads.SENT,false));
        TextView droppedPostsHelp=new TextView(activity);
        droppedPostsHelp.setText(text("HOMEの「下書き／送信済み」に適用します。下書きと送信済みは個別に変更できます。本文・履歴・DATは削除せず、オフで再表示します。判定できないスレと新規スレ作成の下書きは表示を維持します。",
                "Applies to HOME drafts/sent posts independently. Content and history remain stored; turn off to show them again. Unconfirmed threads and drafts for new threads stay visible."));
        layout.addView(droppedPostsHelp);
        live.toggle(hideDroppedDrafts,HiddenDroppedThreads.DRAFTS);
        live.toggle(hideDroppedSent,HiddenDroppedThreads.SENT);
        live.toggle(readThreadsFirstSwitch,"readThreadsFirst",Haiagaru::refreshBoardListAfterReadSortChange);
        live.toggle(edgeReporterId,"edgeReporterId");
        live.toggle(edgeReporterBoardList,EdgeReporterOptions.BOARD);
        return layout;
    }

    private static LinearLayout settingsPOSTING(Activity activity) {
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        SharedPreferences preferences = preferences(activity);
        SharedPreferences chMatePreferences = PreferenceManager.getDefaultSharedPreferences(activity);
        String chMateVersion = "";
        try { chMateVersion = activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName; }
        catch (Exception ignored) { }
        LiveSettings live = new LiveSettings(preferences, () -> {
            View decor = activity.getWindow().getDecorView();
            decor.requestLayout(); decor.invalidate();
        });
        Switch threadCommands = addSwitch(layout, activity,
                text("スレ立てコマンドの候補を表示", "Show thread creation command suggestions"),
                preferences.getBoolean("threadCommandsEnabled", true));
        live.toggle(threadCommands, "threadCommandsEnabled");
        String[][] menuOptions = {
                {"showClipboardHistoryMenu", text("メニューに「コピー履歴・分類」を表示", "Show clipboard history in the menu")},
                {"showUploadHostMenu", text("メニューに「アップロード先を変更」を表示", "Show upload destination in the menu")},
                {"showExternalBoardAuthMenu", text("メニューに「外部板の認証ページ」を表示", "Show external board authentication in the menu")}
        };
        for (String[] option : menuOptions) {
            Switch toggle = addSwitch(layout, activity, option[1], preferences.getBoolean(option[0], false));
            live.toggle(toggle, option[0]);
        }
        TextView menuDescription = new TextView(activity);
        menuDescription.setText(text("オフにした項目は、次にメニューを開くと非表示になります。機能自体や認証が必要な際の案内は無効になりません。",
                "Disabled entries are hidden the next time the menu opens. Features and authentication prompts remain available."));
        menuDescription.setTextSize(13);
        layout.addView(menuDescription, rowParams(activity));
        String[] postSizeChoices = new String[29];
        postSizeChoices[0] = text("標準（ChMateの既定値）", "Default (ChMate)");
        for (int index = 1; index < 28; index++)
            postSizeChoices[index] = (index + 9) + " sp";
        postSizeChoices[28] = text("その他（任意のサイズ）", "Other (custom size)");
        final float initialPostSize = postEditorTextSizeSp();
        Spinner postEditorTextSize = addSpinner(layout, activity,
                text("書き込み画面の文字サイズ（本文・名前・メール・スレタイ）", "Posting text size (body, name, email, title)"),
                postSizeChoices, PostEditorSizeValue.choice(initialPostSize));
        LinearLayout customPostSizeRow = new LinearLayout(activity);
        customPostSizeRow.setOrientation(LinearLayout.VERTICAL);
        layout.addView(customPostSizeRow);
        EditText customPostSize = addTextField(customPostSizeRow, activity,
                text("任意の文字サイズ（1〜200sp、小数可）", "Custom text size (1–200sp, decimals allowed)"),
                Float.toString(initialPostSize == 0 ? 16 : initialPostSize));
        customPostSize.setInputType(android.text.InputType.TYPE_CLASS_NUMBER
                | android.text.InputType.TYPE_NUMBER_FLAG_DECIMAL);
        customPostSizeRow.setVisibility(PostEditorSizeValue.choice(initialPostSize) == 28 ? View.VISIBLE : View.GONE);
        postEditorTextSize.setOnItemSelectedListener(new android.widget.AdapterView.OnItemSelectedListener() {
            @Override public void onItemSelected(android.widget.AdapterView<?> parent, View view, int position, long id) {
                customPostSizeRow.setVisibility(position == 28 ? View.VISIBLE : View.GONE);
            }
            @Override public void onNothingSelected(android.widget.AdapterView<?> parent) {}
        });


        Switch refreshCellularNetwork = addSwitch(
                layout,
                activity,
                text("投稿時にモバイル回線を再取得する", "Refresh the cellular network before posting"),
                preferences.getBoolean("refreshCellularNetwork", true)
        );
        Switch beLogoutAfterThread = addSwitch(layout, activity,
                text("5chのスレ立て時にBEへ自動ログイン／成功後ログアウト", "Automatically log in to BE for a 5ch thread and log out after success"),
                preferences.getBoolean(BeAutoLogout.KEY, false));
        live.toggle(beLogoutAfterThread, BeAutoLogout.KEY);
        TextView beLogoutDescription = new TextView(activity);
        beLogoutDescription.setText(text("保存済みのBE情報を使い、スレ立て送信直前だけ自動ログインします。認証失敗時は送信しません。成功後にログアウトします。スレ立て失敗時は再試行用にログインを維持します。通常レスでは自動ログインしません。ログアウト完了を確認してから次の投稿をしてください。",
                "Uses saved BE credentials immediately before creating a thread; authentication failure stops submission. Logs out after success, but retains login after failed creation for retry. Replies never trigger automatic login. Wait for logout confirmation before posting again."));
        beLogoutDescription.setTextSize(13);layout.addView(beLogoutDescription, rowParams(activity));
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


        Runnable saveSize=()->{
         int index=postEditorTextSize.getSelectedItemPosition();
         float size=index==0?0:index==28?PostEditorSizeValue.parse(value(customPostSize)):index+9;
         if(size<0){customPostSize.setError("1〜200");return;}
         customPostSize.setError(null);preferences.edit().putFloat("postEditorCustomTextSizeSp",size).apply();
        };
        live.choice(postEditorTextSize,saveSize);LiveSettings.watch(customPostSize,saveSize);
        live.toggle(refreshCellularNetwork,"refreshCellularNetwork");
        live.toggle(bypassPostPreflight,"bypassPostPreflight");
        return layout;
    }

    private static LinearLayout settingsADVANCED(Activity activity) {
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        SharedPreferences preferences = preferences(activity);
        SharedPreferences chMatePreferences = PreferenceManager.getDefaultSharedPreferences(activity);
        String chMateVersion = "";
        try { chMateVersion = activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName; }
        catch (Exception ignored) { }
        LiveSettings live = new LiveSettings(preferences, () -> {
            View decor = activity.getWindow().getDecorView();
            decor.requestLayout(); decor.invalidate();
        });
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

        Switch forceHttps = addSwitch(
                layout,
                activity,
                text("HTTP通信をHTTPSへ切り替える（画像を含む）", "Upgrade HTTP to HTTPS (including images)"),
                preferences.getBoolean("forceHttps", false)
        );
        TextView httpsDescription = new TextView(activity);
        httpsDescription.setText(text(
                "hissi.org のHTTP通信は切り替え対象から除外します。他のHTTPS非対応の接続先が読み込めない場合はOFFにしてください。",
                "HTTP requests to hissi.org are excluded. Turn this off if another server does not support HTTPS."
        ));
        httpsDescription.setTextSize(13);
        layout.addView(httpsDescription, rowParams(activity));
        Switch tabletResumeReloadSetting = null;
        if ("0.8.10.191 dev".equals(chMateVersion)
                || "0.8.10.226 dev".equals(chMateVersion)
                || "0.8.10.242 dev".equals(chMateVersion)) {
            tabletResumeReloadSetting = addSwitch(layout, activity,
                    text("タブレットでスレ切替時の自動再読込を抑える",
                            "Avoid automatic reload when switching tablet thread tabs"),
                    preferences.getBoolean("suppressTabletThreadResumeReload", true));
            TextView tabletResumeReloadDescription = new TextView(activity);
            tabletResumeReloadDescription.setText(text(
                    "オンの場合、タブレットで同じスレへ戻った時の自動再読込を抑えます。初回読込と更新ボタンは変わりません。アプリをバックグラウンドから戻した時の読込は維持します。",
                    "When enabled, prevents automatic reloads when returning to an already opened thread tab. Initial loads and the refresh button are unchanged. Reloads after returning to the app from the background are preserved."));
            tabletResumeReloadDescription.setTextSize(13);
            layout.addView(tabletResumeReloadDescription, rowParams(activity));
        }
        Switch update191Progress = null;
        Switch update191Connect = null;
        Spinner update191Timeout = null;
        if ("0.8.10.191 dev".equals(chMateVersion)) {
            update191Connect = addSwitch(layout, activity,
                    text("191の代替IPへの切り替えを速くする", "Faster alternative IP fallback (191)"),
                    fast191UpdateConnect());
            TextView connectDescription = new TextView(activity);
            connectDescription.setText(text(
                    "板・スレ取得で複数の接続先IPがある場合、約250ms後に次のTCP接続も並行して試します。取得時間は回線や接続先に依存します。投稿・画像取得・プロキシ経由・TLS認証は変更しません。オフで従来の逐次接続に戻ります。次の新規接続から反映します。",
                    "For board/thread GETs with multiple direct IPs, starts another TCP connection after about 250ms. Actual load time depends on the network and server. Leaves posting, media, proxies and TLS verification unchanged. Turn off to restore sequential connections; applies to new connections."));
            connectDescription.setTextSize(13);
            layout.addView(connectDescription, rowParams(activity));
            update191Progress = addSwitch(layout, activity,
                    text("191の更新進捗通知をまとめる", "Coalesce update progress notifications (191)"),
                    optimize191UpdateProgress());
            int timeoutChoice = update191TimeoutSeconds() == 30 ? 1
                    : update191TimeoutSeconds() == 60 ? 2 : update191TimeoutSeconds() == 120 ? 3 : 0;
            update191Timeout = addSpinner(layout, activity,
                    text("191の板・スレ取得の通信全体の上限", "Overall board/thread call timeout (191)"),
                    new String[]{text("変更しない", "Unchanged"), "30s", "60s", "120s"}, timeoutChoice);
            TextView updateDescription = new TextView(activity);
            updateDescription.setText(text(
                    "進捗の途中表示だけを最大毎秒10回にまとめます。受信データ・完了通知は省略しません。通信上限は次の取得から適用し、投稿・画像取得には適用しません。DNS等のOS処理は直ちに中断できない場合があります。",
                    "Coalesces intermediate progress to at most 10 updates/second without dropping data or completion. The optional call timeout applies to subsequent standard thread/board GETs, not posts or media. OS operations such as DNS may not stop immediately."));
            updateDescription.setTextSize(13);
            layout.addView(updateDescription, rowParams(activity));
        }
        final Switch update191ProgressSetting = update191Progress;
        final Switch update191ConnectSetting = update191Connect;
        final Spinner update191TimeoutSetting = update191Timeout;

        ExternalBoardAuth.addSettingsButton(layout, activity);
        addOptionalSettingsSection(
                "duplicate board cleanup",
                () -> addBoardDuplicateCleanupControl(activity, layout)
        );

        live.toggle(removeMonaKey,"removeMonaKey");live.string(cookieClass,"cookieClass");
        live.string(monaKeyFile,"prefMonaKeyFile");live.string(monaKeyName,"prefMonaKeyName");
        live.string(adClass,"adClass");live.toggle(chtoio,"chtoio");
        live.toggle(forceHttps,"forceHttps",()->HttpsTransport.setEnabled(forceHttps.isChecked()));
        live.toggle(tabletResumeReloadSetting,"suppressTabletThreadResumeReload");
        live.toggle(update191ProgressSetting,"optimize191UpdateProgress");
        live.toggle(update191ConnectSetting,"fast191UpdateConnect");
        live.choice(update191TimeoutSetting,"update191TimeoutSeconds",i->new int[]{0,30,60,120}[i]);
        return layout;
    }

    private static LinearLayout settingsCHECKER(Activity activity) {
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        ResponseMenuSettings.addWacchoiSearchSetting(layout, activity);
        SharedPreferences preferences = preferences(activity);
        SharedPreferences chMatePreferences = PreferenceManager.getDefaultSharedPreferences(activity);
        String chMateVersion = "";
        try { chMateVersion = activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName; }
        catch (Exception ignored) { }
        LiveSettings live = new LiveSettings(preferences, () -> {
            View decor = activity.getWindow().getDecorView();
            decor.requestLayout(); decor.invalidate();
        });
        Spinner hissiCheckerMode = addSpinner(
                layout,
                activity,
                text("ID長押しの必死チェッカー", "ID long-press checker"),
                new String[]{
                        text("自動（5chはhissi.org／外部板はKyodemo）", "Automatic (hissi.org for 5ch, Kyodemo for external boards)"),
                        text("hissi.orgを使用", "Use hissi.org"),
                        text("Kyodemoを使用", "Use Kyodemo"),
                        text("両方（画面上で切り替え）", "Both (switch on the checker screen)")
                },
                preferences.getInt(HISSI_CHECKER_MODE_KEY, 0)
        );
        Switch dedicatedViewerEnabled = addSwitch(
                layout,
                activity,
                text("専用ビュワーで開く（オフならChMate標準のWeb表示）",
                        "Open in dedicated viewer (off: ChMate web view)"),
                preferences.getBoolean(DEDICATED_VIEWER_ENABLED_KEY, true)
        );

        Spinner hissiViewerTheme = addSpinner(
                layout,
                activity,
                text("必死チェッカーの表示テーマ", "Checker viewer theme"),
                new String[]{
                        text("端末設定に合わせる", "Follow system"),
                        text("ダーク", "Dark"),
                        text("AMOLEDブラック", "AMOLED black"),
                        text("ライト", "Light")
                },
                preferences.getInt(HISSI_VIEWER_THEME_KEY, 0)
        );
        Spinner hissiViewerTextZoom = addSpinner(
                layout,
                activity,
                text("必死チェッカーの文字サイズ", "Checker viewer text size"),
                new String[]{"100%", "105%", "110%", "115%", "120%", "125%", "130%"},
                viewerTextZoomIndex(preferences.getInt(HISSI_VIEWER_TEXT_ZOOM_KEY, 100))
        );
        addHissiViewerToolbarButtonControl(activity, layout, preferences);
        EditText checkerHeader=addTextField(layout,activity,"チェッカー上部パネルの最大高さ（画面の10〜60%）",Integer.toString(preferences.getInt("checkerHeaderPercent",30)));
        checkerHeader.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);
        live.number(checkerHeader,"checkerHeaderPercent",10,60);
        EditText checkerSpacing=addTextField(layout,activity,"必死チェッカーのレス上下余白（dp・0〜20）",Integer.toString(preferences.getInt("hissiViewerResponseSpacingDp",7)));
        checkerSpacing.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);
        live.number(checkerSpacing,"hissiViewerResponseSpacingDp",0,20);
        EditText checkerToolbarHeight=addTextField(layout,activity,"必死チェッカー上部ツールバーの高さ（dp・32〜56）",Integer.toString(preferences.getInt("hissiViewerToolbarHeightDp",40)));
        checkerToolbarHeight.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);
        live.number(checkerToolbarHeight,"hissiViewerToolbarHeightDp",32,56);
        Switch hissiViewerFullscreen = addSwitch(
                layout,
                activity,
                text("必死チェッカーを全画面で表示", "Fullscreen checker viewer"),
                preferences.getBoolean(HISSI_VIEWER_FULLSCREEN_KEY, false)
        );
        Switch hissiViewerCompactHeader = addSwitch(
                layout,
                activity,
                text("必死チェッカーの上部タイトルを省略して表示領域を広げる", "Hide the checker title to expand the viewing area"),
                preferences.getBoolean("hissiViewerCompactHeader", false)
        );
        Spinner hissiViewerSwipeHistory = addSpinner(
                layout,
                activity,
                text("専用ビュワーの左右スワイプ", "Viewer horizontal swipe"),
                new String[]{"無効", "左で戻る／右で進む", "左で進む／右で戻る"},
                Math.max(0, Math.min(2, preferences.getInt(HISSI_VIEWER_SWIPE_HISTORY_KEY, 0)))
        );
        Switch kyodemoEnhancedViewer = addSwitch(
                layout,
                activity,
                text("KyodemoのID/ﾜｯﾁｮｲ検索を専用表示", "Enhanced Kyodemo ID/Wacchoi viewer"),
                preferences.getBoolean(KYODEMO_ENHANCED_VIEWER_KEY, false)
        );

        live.choice(hissiCheckerMode,HISSI_CHECKER_MODE_KEY);
        live.toggle(dedicatedViewerEnabled,DEDICATED_VIEWER_ENABLED_KEY);
        live.choice(hissiViewerTheme,HISSI_VIEWER_THEME_KEY);
        live.choice(hissiViewerTextZoom,HISSI_VIEWER_TEXT_ZOOM_KEY,i->100+i*5);
        live.toggle(hissiViewerFullscreen,HISSI_VIEWER_FULLSCREEN_KEY);
        live.toggle(hissiViewerCompactHeader,"hissiViewerCompactHeader");
        live.choice(hissiViewerSwipeHistory,HISSI_VIEWER_SWIPE_HISTORY_KEY);
        live.toggle(kyodemoEnhancedViewer,KYODEMO_ENHANCED_VIEWER_KEY);
        return layout;
    }

    private static LinearLayout settingsMEDIA(Activity activity) {
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        SharedPreferences preferences = preferences(activity);
        SharedPreferences chMatePreferences = PreferenceManager.getDefaultSharedPreferences(activity);
        String chMateVersion = "";
        try { chMateVersion = activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName; }
        catch (Exception ignored) { }
        LiveSettings live = new LiveSettings(preferences, () -> {
            View decor = activity.getWindow().getDecorView();
            decor.requestLayout(); decor.invalidate();
        });
        Switch imageVpnSetting = null;
        if (ImageVpnController.available()) {
            imageVpnSetting = addSwitch(layout, activity,
                    text("VPN Gateで対象の画像を取得（実験的）", "Fetch eligible images through VPN Gate (experimental)"),
                    preferences.getBoolean("imageVpnEnabled", false));
            TextView warning = new TextView(activity);
            warning.setText(text("検証中の機能です。対象の画像だけをVPN経由で取得します。VPN取得失敗時は直接取得しません。VPN運営者には接続元IPが見え、通信が記録される可能性があります。固有URLによる識別は防げません。状態: ",
                    "Under validation. Only eligible images use the VPN. No direct fallback on VPN fetch failure. VPN operators see your source IP and may log traffic; unique URLs can still identify viewers. Status: ")
                    + ImageVpnController.status());
            layout.addView(warning, rowParams(activity));
        }
        final Switch imageVpnEnabledSetting = imageVpnSetting;
        Button vpnDomains = new Button(activity);
        vpnDomains.setText("VPN取得の対象ドメイン");
        vpnDomains.setOnClickListener(v -> {
            EditText input=new EditText(activity);
            input.setInputType(android.text.InputType.TYPE_CLASS_TEXT|android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE);
            input.setMinLines(4);input.setMaxLines(10);
            input.setText(preferences.getString("imageVpnDomains",ImageVpnRequestPolicy.DEFAULT_DOMAINS));
            input.setHint("example.com（1行1ドメイン）");
            LinearLayout form=new LinearLayout(activity);form.setOrientation(LinearLayout.VERTICAL);
            TextView help=new TextView(activity);
            help.setText("ドメイン完全一致。サブドメインは個別登録してください。登録先のリンクカードはVPNがオフ・未導入・失敗時には取得しません。画像VPNは別途導入・有効化が必要です。外部ブラウザは保護対象外です。");
            // A preceding TextView is treated as the EditText's floating label by
            // the Compose form adapter. Keep this paragraph as separate body text.
            form.addView(input);form.addView(help);
            Button save=new Button(activity);save.setText("保存");form.addView(save);
            HaiagaruDialog dialog=new HaiagaruDialog.Builder(activity).setTitle("VPN取得の対象ドメイン")
                    .setView(form).setNegativeButton("閉じる",null).create();
            save.setOnClickListener(button->{
                try{
                    String normalized=ImageVpnRequestPolicy.normalizeDomains(input.getText().toString());
                    preferences.edit().putString("imageVpnDomains",normalized).apply();
                    ImageVpnController.reloadDomains();
                    SiteCards.clear(()->{});dialog.dismiss();
                }catch(IllegalArgumentException invalid){input.setError(invalid.getMessage());}
            });
            dialog.show();
        });
        layout.addView(vpnDomains,rowParams(activity));
        PatrolImages.addSettingsButton(layout, activity);
        Switch imageRotationButton = null;
        try {
            String version = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).versionName;
            if ("0.8.10.191 dev".equals(version) || "0.8.10.226 dev".equals(version)) {
                imageRotationButton = addSwitch(layout, activity,
                        text("画像ビューアの回転ボタン", "Image viewer rotation button"),
                        preferences.getBoolean("imageViewerRotationButton", true));
            }
        } catch (Exception error) { Log.w(LOG_TAG, "Rotation setting version check failed", error); }
        final Switch imageRotationButtonSetting = imageRotationButton;
        Switch videoViewer = addSwitch(layout, activity,
                text("動画を専用ビューアで開く（オフなら従来の動作）", "Open videos in dedicated viewer (off: original behavior)"),
                preferences.getBoolean("videoViewerEnabled", true));
        if (!VideoViewerActivity.installed(activity)) {
            videoViewer.setChecked(false);
            videoViewer.setEnabled(false);
            videoViewer.setText(text("動画専用ビューア（パッチ適用時に選択してください）",
                    "Dedicated video viewer (select the patch when patching)"));
        }
        VideoViewerSettings.addSettingsButton(layout, activity);

        Switch videoFrameThumbnails = addSwitch(layout, activity,
                text("動画からサムネイルを生成する", "Generate thumbnails from videos"),
                FeatureSwitches.enabled("videoFrameThumbnailsEnabled", true));
        videoFrameThumbnails.setOnCheckedChangeListener((button, checked) ->
                activity.getSharedPreferences(WacchoiSearchOptions.PREFS, 0).edit()
                        .putBoolean("videoFrameThumbnailsEnabled", checked).apply());

        Spinner mediaAutoFetch = addSpinner(layout, activity,
                text("動画リンクから自動で読み込むもの", "What to load from video links"),
                new String[]{text("画像のみ（サムネイル）", "Thumbnail only"),
                        text("画像＋動画", "Thumbnail and video"),
                        text("動画のみ", "Video only"), text("取得しない", "Do not retrieve")},
                mediaAutoFetchMode());
        Spinner imageAutoFetch = addSpinner(layout, activity,
                text("画像リンクの画像を自動で読み込む", "Automatically load images from image links"),
                new String[]{text("画像を取得", "Retrieve images"), text("取得しない", "Do not retrieve")},
                mediaImageFetchEnabled() ? 0 : 1);
        Spinner gifAutoFetch = addSpinner(layout, activity,
                text("GIFリンクから自動で読み込むもの", "What to load from GIF links"),
                new String[]{text("画像＋GIF", "Thumbnail and GIF"), text("画像のみ（サムネイル）", "Thumbnail only"),
                        text("GIFのみ", "GIF only"), text("取得しない", "Do not retrieve")}, gifAutoFetchMode());
        TextView gifFetchHelp = new TextView(activity);
        gifFetchHelp.setText(text(".gif のリンクが対象です。画像は静止サムネイル、GIFは本体です。サムネイル生成にもGIFの取得が必要です（最大8MB）。GIFのみは自動再生を意味しません。実体がMP4のアニメーションは動画の設定に従います。",
                "Applies to .gif links. Images are still thumbnails; GIF means the original file, not autoplay. Creating a thumbnail also downloads the GIF (up to 8MB). MP4 animations use video settings."));
        layout.addView(gifFetchHelp);
        EditText videoThumbnailMaxMb = addTextField(layout, activity,
                text("動画サムネイルの取得上限（MB、1〜1024）", "Video thumbnail download limit (MB, 1–1024)"),
                Integer.toString(videoThumbnailMaxMb()));
        videoThumbnailMaxMb.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);
        EditText videoThumbnailTimeoutSeconds = addTextField(layout, activity,
                text("動画サムネイルの取得制限時間（秒、1〜600）", "Video thumbnail download timeout (seconds, 1–600)"),
                Integer.toString(videoThumbnailTimeoutSeconds()));
        videoThumbnailTimeoutSeconds.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);
        Switch videoPreviewFour = addSwitch(layout, activity,
                "動画サムネイルを時系列の分割画像で表示", videoPreviewFourEnabled());
        EditText videoPreviewCount = addTextField(layout, activity,
                "プレビューの分割数（1〜64）", Integer.toString(videoPreviewCount()));
        videoPreviewCount.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);
        EditText videoPreviewDuration = addTextField(layout, activity,
                "分割プレビューの対象時間（分:秒）", PreviewDuration.format(videoPreviewMinimumSeconds()));
        videoPreviewDuration.setSingleLine(true);
        videoPreviewDuration.setInputType(android.text.InputType.TYPE_CLASS_DATETIME
                | android.text.InputType.TYPE_DATETIME_VARIATION_TIME);
        videoPreviewDuration.setHint("例 1:30＝1分30秒以上、0:00＝すべて（最大1440:59）");
        videoPreviewDuration.setContentDescription("分割プレビューの対象時間。分と秒をコロンで区切って入力");
        TextView durationHelp = new TextView(activity);
        durationHelp.setText("例：1:30＝1分30秒以上の動画。0:00＝すべての動画（最大1440:59）。");
        durationHelp.setTextSize(13);
        layout.addView(durationHelp);
        Switch videoPreviewWifi = addSwitch(layout, activity,
                "分割プレビューの取得はWi-Fi接続時のみ", videoPreviewWifiOnly());

        live.toggle(imageVpnEnabledSetting,"imageVpnEnabled",()->ImageVpnController.setEnabled(imageVpnEnabledSetting.isChecked()));
        live.toggle(imageRotationButtonSetting,"imageViewerRotationButton");
        live.toggle(videoViewer,"videoViewerEnabled");
        live.choice(mediaAutoFetch,"urlVideoFetchMode");
        live.choice(gifAutoFetch,()->{
            preferences.edit().putInt(GifAutoFetchPolicy.KEY,gifAutoFetch.getSelectedItemPosition()).apply();
            GifAutoFetch.changed();
        });
        live.choice(imageAutoFetch,()->preferences.edit().putBoolean("urlImageFetchEnabled",imageAutoFetch.getSelectedItemPosition()==0).apply());
        live.number(videoThumbnailMaxMb,"videoThumbnailMaxMb",1,1024);
        live.number(videoThumbnailTimeoutSeconds,"videoThumbnailTimeoutSeconds",1,600);
        live.toggle(videoPreviewFour,"videoPreviewFour");live.number(videoPreviewCount,"videoPreviewCount",1,64);
        live.toggle(videoPreviewWifi,"videoPreviewWifiOnly");
        Runnable saveDuration=()->{
         try{int seconds=PreviewDuration.parse(value(videoPreviewDuration));
         videoPreviewDuration.setError(null);
         preferences.edit().putInt("videoPreviewMinimumSeconds",seconds).apply();
         }catch(IllegalArgumentException e){videoPreviewDuration.setError("分:秒で入力（例 1:30、分は0〜1440・秒は0〜59）");}
        };
        LiveSettings.watch(videoPreviewDuration,saveDuration);
        return layout;
    }

    private static LinearLayout settingsSOCIAL(Activity activity) {
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        SharedPreferences preferences = preferences(activity);
        Switch siteCards = addSwitch(layout, activity,
                text("Webサイトのリンクカードを表示（追加通信あり）", "Show website link cards (network access)"), siteCardsEnabled());
        Switch siteImages = addSwitch(layout, activity,
                text("サイトカードにサムネイルを表示", "Show thumbnails in website cards"), siteCardImages());
        TextView siteHelp = new TextView(activity);
        siteHelp.setText(text("YahooニュースなどのURLから、サイト共通のタイトル・説明・画像情報を取得します。対応サイトは追加設定なしで表示できます。取得できないURLは元のリンクを残します。1レス最大2件、取得済みの情報は24時間保存します。",
                "Uses shared page metadata for titles, summaries and images, including Yahoo News. Compatible sites work without individual setup. Unavailable previews keep the original link. Up to two cards per response; metadata is cached for 24 hours."));
        layout.addView(siteHelp);
        siteCards.setOnCheckedChangeListener((v,on)->{preferences.edit().putBoolean("siteCardsEnabled",on).apply();SiteCards.changed();});
        siteImages.setOnCheckedChangeListener((v,on)->{preferences.edit().putBoolean("siteCardImages",on).apply();SiteCards.changed();});
        Button clearSiteCards = new Button(activity);clearSiteCards.setText(text("サイトカードのキャッシュを削除", "Clear website card cache"));
        clearSiteCards.setOnClickListener(v->{
            clearSiteCards.setEnabled(false);
            SiteCards.clear(()->{if(!activity.isFinishing()&&!activity.isDestroyed()){
                clearSiteCards.setEnabled(true);Toast.makeText(activity,"サイトカードのキャッシュを削除しました",Toast.LENGTH_SHORT).show();}});
        });layout.addView(clearSiteCards);
        SharedPreferences chMatePreferences = PreferenceManager.getDefaultSharedPreferences(activity);
        String chMateVersion = "";
        try { chMateVersion = activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName; }
        catch (Exception ignored) { }
        LiveSettings live = new LiveSettings(preferences, () -> {
            View decor = activity.getWindow().getDecorView();
            decor.requestLayout(); decor.invalidate();
        });
        Switch xPostPreview = addSwitch(layout, activity,
                text("X／Twitterの投稿内容をレス内に表示（追加通信あり）", "Show X/Twitter post text in responses (network access)"),
                xPostPreviewEnabled());
        Switch xPostFullText = addSwitch(layout, activity,
                text("X投稿の本文を全文表示（オフは冒頭のみ）", "Show full X post text (off: excerpt only)"),
                xPostPreviewFullText());
        Switch xPostCollapsible = addSwitch(layout, activity,
                text("X投稿のプレビューを折りたたむ（タップで開閉）", "Collapse X previews (tap to expand/collapse)"),
                xPostPreviewCollapsible());
        Switch xPostCard = addSwitch(layout, activity,
                text("X投稿のプレビューをカード形式で表示", "Display X previews as cards"), xPostPreviewCard());
        TextView xPostCardNote = new TextView(activity);
        xPostCardNote.setText(text("投稿者・本文・日時を枠付きで表示します。X公式の埋め込みではなく、プロフィール画像の追加取得は行いません。",
                "Shows author, text and date in a native card, not an official X embed. No extra profile-image downloads."));
        xPostCardNote.setTextSize(13); layout.addView(xPostCardNote);
        Switch xPostActions = addSwitch(layout, activity,
                text("Xプレビューに返信・リポスト・いいね・リンクコピーを表示", "Show reply, repost, like and copy link actions"), xPostPreviewActions());
        Switch xPostBrowser = addSwitch(layout, activity,
                text("X投稿・操作をブラウザのアプリ内タブで開く", "Open X posts and actions in browser in-app tabs"), xPostPreviewBrowser());
        TextView xPostActionsNote = new TextView(activity);
        xPostActionsNote.setText(text("操作はX公式ページで確認します。ログインが必要な場合があります。自動で投稿・いいねは行いません。アプリ内タブ非対応のブラウザでは通常表示になります。",
                "Confirm actions on X. Login may be required. Nothing is posted or liked automatically. Unsupported browsers open normally."));
        xPostActionsNote.setTextSize(13); layout.addView(xPostActionsNote);
        XPostPreview.addCacheSettings(layout, activity);

        live.toggle(xPostPreview,"xPostPreviewEnabled");
        live.toggle(xPostFullText,"xPostPreviewFullText");
        live.toggle(xPostCollapsible,"xPostPreviewCollapsible");
        live.toggle(xPostCard,"xPostPreviewCard");
        live.toggle(xPostActions,"xPostPreviewActions");
        live.toggle(xPostBrowser,"xPostPreviewBrowser");
        return layout;
    }

    private static LinearLayout settingsNG(Activity activity) {
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        SharedPreferences preferences = preferences(activity);
        SharedPreferences chMatePreferences = PreferenceManager.getDefaultSharedPreferences(activity);
        String chMateVersion = "";
        try { chMateVersion = activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName; }
        catch (Exception ignored) { }
        LiveSettings live = new LiveSettings(preferences, () -> {
            View decor = activity.getWindow().getDecorView();
            decor.requestLayout(); decor.invalidate();
        });
        HiddenIdNg.addSettingsButton(layout, activity);
        Switch wacchoiNgFirstMenu = addSwitch(layout, activity,
                "ワッチョイ長押しメニューをNG登録優先の順番にする",
                preferences.getBoolean("wacchoiNgFirstMenu", false));
        Switch hideShowHiddenNgMenu = addSwitch(layout, activity,
                text("右上メニューの「非表示NGを表示」を隠す", "Hide Show hidden NG in the overflow menu"),
                preferences.getBoolean("hideShowHiddenNgMenu", false));
        TextView hiddenNgMenuDescription = new TextView(activity);
        hiddenNgMenuDescription.setText(text(
                "メニュー項目だけを隠します。NG登録やレスの表示状態は変更しません。変更は次にメニューを開いたときに反映します。",
                "Hides only the menu action, without changing NG rules or response visibility. Applies the next time the menu opens."));
        hiddenNgMenuDescription.setTextSize(13);
        layout.addView(hiddenNgMenuDescription, rowParams(activity));

        EditText ngRegistrationLimit = addTextField(
                layout,
                activity,
                text("NG登録上限（ワード・ID・名前など、0で無制限）",
                        "NG registration limit (words, IDs, names; 0 is unlimited)"),
                Integer.toString(preferences.getInt(
                        NG_REGISTRATION_LIMIT_KEY,
                        DEFAULT_NG_REGISTRATION_LIMIT
                ))
        );
        TextView ngRegistrationLimitDescription = new TextView(activity);
        ngRegistrationLimitDescription.setText(text(
                "NGワード・NG ID・NG名前など、各NG保存カテゴリの上限です。"
                        + "上限を下げても既存項目はその場で削除せず、次回保存時に古い項目から整理します。"
                        + "1〜100000、または0（無制限）を指定できます。",
                "Sets the per-category limit for NG words, IDs, names, and similar entries. "
                        + "Lowering the value does not delete existing entries immediately; older entries "
                        + "are trimmed on the next save. Choose 1 to 100000, or 0 for unlimited."
        ));
        ngRegistrationLimitDescription.setTextSize(13);
        layout.addView(ngRegistrationLimitDescription, rowParams(activity));

        boolean legacyPlusSupportedValue = false;
        Switch abbrevSingleIdValue = null;
        Switch copipeNg2Value = null;
        Switch arashiNgValue = null;
        try {
            legacyPlusSupportedValue = supportsLegacyChMatePlus(activity);
            if (legacyPlusSupportedValue) {
                TextView plusDescription = new TextView(activity);
                plusDescription.setText(text(
                        "ChMate+互換機能\n"
                                + "アプリに含まれている表示・省略機能をここから切り替えます。変更後は再起動して、開いているスレにも反映してください。",
                        "ChMate+ compatibility\n"
                                + "Toggle the built-in display and abbreviation features here. Restart after changing them to update open threads."
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


        addOptionalSettingsSection(
                "programmable NG",
                () -> ProgrammableNgController.addSettingsButton(layout, activity)
        );
        addOptionalSettingsSection(
                "native NG management",
                () -> NgManagement.addSettingsButton(layout, activity)
        );

        live.toggle(wacchoiNgFirstMenu,"wacchoiNgFirstMenu");live.toggle(hideShowHiddenNgMenu,"hideShowHiddenNgMenu");
        live.number(ngRegistrationLimit,NG_REGISTRATION_LIMIT_KEY,0,100000);
        LiveSettings nativeLive=new LiveSettings(chMatePreferences,()->layout.invalidate());
        nativeLive.toggle(abbrevSingleId,CHMATE_ABBREV_SINGLE_ID_KEY);
        nativeLive.toggle(copipeNg2,CHMATE_COPIPE_NG2_KEY,()->{if(copipeNg2.isChecked())chMatePreferences.edit().putBoolean(CHMATE_COPIPE_NG_KEY,true).apply();});
        nativeLive.toggle(arashiNg,CHMATE_ARASHI_NG_KEY,()->{if(arashiNg.isChecked())chMatePreferences.edit().putBoolean(CHMATE_COPIPE_NG_AR_KEY,true).apply();});
        return layout;
    }

    private static LinearLayout settingsARCHIVE(Activity activity) {
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        SharedPreferences preferences = preferences(activity);
        SharedPreferences chMatePreferences = PreferenceManager.getDefaultSharedPreferences(activity);
        String chMateVersion = "";
        try { chMateVersion = activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName; }
        catch (Exception ignored) { }
        LiveSettings live = new LiveSettings(preferences, () -> {
            View decor = activity.getWindow().getDecorView();
            decor.requestLayout(); decor.invalidate();
        });
        Switch automaticDat = addSwitch(
                layout,
                activity,
                text("自動DAT取得", "Automatic DAT retrieval"),
                preferences.getBoolean("automaticDat", true)
        );

        Button responseArchive = new Button(activity);
        responseArchive.setText(text("レスのアーカイブを開く", "Open saved responses"));
        responseArchive.setOnClickListener(v -> ResponseArchive.showList(activity));
        layout.addView(responseArchive);
        ArchiveOrigins.addSettings(layout, activity);
        RelatedThreads.addSettings(layout, activity);
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
        Switch archiveThreadStandalone = addSwitch(layout, activity,
                text("エッヂ過去ログのスレをタブレットモードを解除して開く",
                        "Open Edge archive threads outside tablet mode"),
                archiveThreadStandalone(activity));
        TextView archiveTabletDescription = new TextView(activity);
        archiveTabletDescription.setText(text(
                "検索画面の「表示」で、検索結果の文字サイズ（70〜150%）・上下余白（0〜32dp）・検索欄の表示を変更できます。設定は次回も保持します。結果をタップしてスレを開き、戻ると検索結果に戻ります。"
                        + "オン：単独画面で開き、戻ると検索結果に戻ります。オフ：ChMateのタブレット設定に従います。"
                        + "タブレットモードでは検索画面が閉じる場合があります。",
                "Use Display in archive search to adjust result text (70–150%), vertical padding (0–32dp) and search form visibility. These choices are saved. Tap a result to open it and Back to return. "
                        + "On: open a separate screen and return to search with Back. Off: follow ChMate's tablet setting. "
                        + "Tablet navigation may close the search screen."));
        archiveTabletDescription.setTextSize(13);
        layout.addView(archiveTabletDescription, rowParams(activity));
        addOptionalSettingsSection(
                "archived-thread preset",
                () -> addArchiveSearchPresetControl(activity, layout)
        );

        live.toggle(automaticDat,"automaticDat");live.string(archiveRouteTemplates,ARCHIVE_ROUTE_TEMPLATES_KEY);
        live.toggle(archiveThreadStandalone,"archiveThreadStandalone");
        return layout;
    }

    private static LinearLayout settingsHISTORY(Activity activity) {
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        SharedPreferences preferences = preferences(activity);
        SharedPreferences chMatePreferences = PreferenceManager.getDefaultSharedPreferences(activity);
        String chMateVersion = "";
        try { chMateVersion = activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName; }
        catch (Exception ignored) { }
        LiveSettings live = new LiveSettings(preferences, () -> {
            View decor = activity.getWindow().getDecorView();
            decor.requestLayout(); decor.invalidate();
        });
        ClipboardHistory.addSettings(layout, activity);
        final int savedPostHistoryCount = chMatePreferences.getInt(
                CHMATE_POST_DATA_LIST_COUNT_KEY, DEFAULT_CHMATE_POST_DATA_LIST_COUNT);
        Switch unlimitedPostHistory = addSwitch(layout, activity,
                text("書き込み履歴を無制限に保存", "Keep unlimited post history"),
                savedPostHistoryCount == Integer.MAX_VALUE);
        EditText postDataListCount = addTextField(
                layout,
                activity,
                text("書き込み履歴に残す件数（0で残さない）",
                        "Posts to keep in post history (0 keeps none)"),
                Integer.toString(savedPostHistoryCount == Integer.MAX_VALUE
                        ? DEFAULT_CHMATE_POST_DATA_LIST_COUNT : savedPostHistoryCount)
        );
        postDataListCount.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);
        postDataListCount.setEnabled(!unlimitedPostHistory.isChecked());
        unlimitedPostHistory.setOnCheckedChangeListener((button, checked) ->
                postDataListCount.setEnabled(!checked));
        TextView postDataListCountDescription = new TextView(activity);
        postDataListCountDescription.setText(text(
                "書き込み履歴の古い項目から削除します。件数は自動で保存され、"
                        + "次に送信済み履歴を保存する際に反映します。削除された履歴は戻せません。"
                        + " 1〜10000、または0を指定できます。無制限を有効にすると件数による削除を行いません。"
                        + "保存容量・バックアップサイズや読み込み負荷が増える場合があります。",
                "Oldest post-history entries are removed first. Changes are saved immediately; "
                        + "the limit applies when sent history is next saved. Removed history cannot be restored. Choose 0 to 10000, "
                        + "or enable unlimited to disable count-based pruning. Storage, backup size and load time may increase."
        ));
        postDataListCountDescription.setTextSize(13);
        layout.addView(postDataListCountDescription, rowParams(activity));

        EditText postedThreads = null;
        if ("0.8.10.191 dev".equals(chMateVersion) || "0.8.10.226 dev".equals(chMateVersion)
                || "0.8.10.241".equals(chMateVersion) || "0.8.10.242 dev".equals(chMateVersion)
                || "0.8.10.243 dev".equals(chMateVersion)) {
            postedThreads = addTextField(layout, activity,
                    text("書き込んだスレの表示数（0で無制限）", "Number of posted threads to display (0: unlimited)"),
                    Integer.toString(getPostedThreadDisplayCountSetting()));
            postedThreads.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);
            TextView description = new TextView(activity);
            description.setText(text("1〜10000件、0で無制限。件数は変更後、次に一覧を開くと反映されます。"
                            + "「書き込んだスレ」の表示件数のみを変更します。下の「送信済み」の件数や、保存済みの履歴は変更しません。",
                    "1–10000, or 0 for unlimited. The new limit applies when the list is next opened. Only posted threads are limited; sent posts and saved history are unchanged."));
            description.setTextSize(13);
            layout.addView(description, rowParams(activity));
        }
        final EditText postedThreadDisplayCount = postedThreads;
        final HistoryLimits.Settings historyLimits = HistoryLimits.addSettings(layout, activity);


        LiveSettings nativeLive=new LiveSettings(chMatePreferences,()->layout.invalidate());
        Runnable saveSent=()->{
         try {int count=unlimitedPostHistory.isChecked()?Integer.MAX_VALUE:Integer.parseInt(value(postDataListCount).trim());
         if(count<0||(count>10000&&count!=Integer.MAX_VALUE))throw new NumberFormatException();
         postDataListCount.setError(null);chMatePreferences.edit().putInt(CHMATE_POST_DATA_LIST_COUNT_KEY,count).apply();
         }catch(NumberFormatException e){postDataListCount.setError("0〜10000");}
        };
        unlimitedPostHistory.setOnCheckedChangeListener((button,checked)->{postDataListCount.setEnabled(!checked);saveSent.run();});
        LiveSettings.watch(postDataListCount,saveSent);
        live.number(postedThreadDisplayCount,POSTED_THREAD_DISPLAY_COUNT_KEY,0,10000);
        historyLimits.enableImmediateSaving();
        return layout;
    }

    private static LinearLayout settingsBACKUP(Activity activity) {
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        SharedPreferences preferences = preferences(activity);
        SharedPreferences chMatePreferences = PreferenceManager.getDefaultSharedPreferences(activity);
        String chMateVersion = "";
        try { chMateVersion = activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName; }
        catch (Exception ignored) { }
        LiveSettings live = new LiveSettings(preferences, () -> {
            View decor = activity.getWindow().getDecorView();
            decor.requestLayout(); decor.invalidate();
        });
        addOptionalSettingsSection(
                "package data migration",
                () -> addPackageMigrationControl(activity, layout)
        );

        addOptionalSettingsSection(
                "local/optional MEGA backup",
                () -> HaiagaruMegaSync.addSettingsButton(layout, activity)
        );


        return layout;
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
                        + "変数: {$server} {$host} {$bbs} {$key} {$rand}\n"
                        + "部分取り出し: {$key:0:4}（先頭4桁）／{$key:0:5}（先頭5桁）。位置は0始まり・終端を含みません。\n"
                        + "SS速報VIPは同じホストのkakoから自動取得します。",
                "Automatic DAT routes (tried from top to bottom)\n"
                        + "Use one route per line. Reorder lines to change priority, or add "
                        + "another HTTPS route.\n"
                        + "Format: auto|, dat|, kako|, or itest| followed by a URL\n"
                        + "Variables: {$server} {$host} {$bbs} {$key} {$rand}\n"
                        + "Slices: {$key:0:4} (first 4), {$key:0:5} (first 5); zero-based, end-exclusive.\n"
                        + "SS VIP archives are fetched from the same host's kako directory."
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

    static boolean archiveThreadStandalone(Context context) {
        return preferences(context).getBoolean("archiveThreadStandalone", true);
    }

    private static void addEddiArchiveSearchControl(Activity activity, LinearLayout layout) {
        Button button = new Button(activity);
        button.setAllCaps(false);
        button.setText(text("エッヂの過去ログを検索", "Search archived Edge threads"));
        button.setOnClickListener(view -> {
            Intent intent = new Intent(activity, HissiMenuActivity.class);
            intent.setAction(Intent.ACTION_VIEW);
            intent.setData(Uri.parse("https://eddiarchive3rd.boy.jp/"));
            activity.startActivity(intent);
        });
        layout.addView(button, rowParams(activity));
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
        new HaiagaruDialog.Builder(activity)
                .setTitle(text("削除する板の種類", "Boards to remove"))
                .setSingleChoiceItems(choices, 0, (dialog, which) -> {
                    dialog.dismiss();
                    boolean removeExternal = which == 0;
                    new HaiagaruDialog.Builder(activity)
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
                || AD_CLASS_242.equals(savedClass)
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
                    || "0.8.10.242 dev".equals(versionName)
                    || "0.8.10.243 dev".equals(versionName);
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to determine ChMate version for compatibility controls", error);
            return false;
        }
    }

    private static boolean supportsModernThreadList(Context context) {
        if (context == null) return false;
        try {
            String version = context.getPackageManager()
                    .getPackageInfo(context.getPackageName(), 0).versionName;
            return "0.8.10.241".equals(version)
                    || "0.8.10.242 dev".equals(version)
                    || "0.8.10.243 dev".equals(version);
        } catch (Throwable error) {
            return false;
        }
    }

    private static String defaultAdClass() {
        if (classExists(AD_CLASS_243)) return AD_CLASS_243;
        if (classExists(AD_CLASS_242)) return AD_CLASS_242;
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
        Switch widget = new LiveSettings.Toggle(context);
        widget.setText(title);
        widget.setChecked(checked);
        LinearLayout.LayoutParams params = rowParams(context);
        layout.addView(widget, params);
        return widget;
    }

    private static void addHissiViewerToolbarButtonControl(
            Activity activity,
            LinearLayout layout,
            SharedPreferences preferences
    ) {
        String[] labels = new String[]{
                text("更新", "Refresh"),
                text("URLコピー", "Copy URL"),
                text("全レスコピー", "Copy all posts"),
                text("本文コピー", "Copy page text"),
                text("日付", "Date"),
                text("ID/ﾜｯﾁｮｲ検索", "ID/Wacchoi search"),
                text("分析", "Analysis"),
                text("文字サイズ", "Text size"),
                text("配色", "Theme"),
                text("調整", "Adjust")
        };
        Button button = new Button(activity);
        button.setAllCaps(false);
        button.setText(text("必死チェッカー上部ボタンの表示項目を選択",
                "Choose checker toolbar buttons"));
        layout.addView(button, rowParams(activity));
        button.setOnClickListener(view -> {
            int savedMask = preferences.getInt(
                    HISSI_VIEWER_TOOLBAR_BUTTONS_KEY, ALL_HISSI_TOOLBAR_BUTTONS);
            boolean[] selected = new boolean[labels.length];
            // Keep Adjust separate: old nine-bit masks must retain its previously always-visible default.
            for (int index = 0; index < selected.length; index++) {
                selected[index] = index == HISSI_TOOLBAR_BUTTON_COUNT
                        ? preferences.getBoolean("hissiViewerShowAdjust", true)
                        : (savedMask & (1 << index)) != 0;
            }
            new HaiagaruDialog.Builder(activity)
                    .setTitle(text("上部に表示するボタン", "Checker toolbar buttons"))
                    .setMultiChoiceItems(labels, selected,
                            (dialog, which, checked) -> selected[which] = checked)
                    .setNeutralButton(text("すべて表示", "Show all"), (dialog, which) -> {
                        preferences.edit().putInt(HISSI_VIEWER_TOOLBAR_BUTTONS_KEY,
                                ALL_HISSI_TOOLBAR_BUTTONS).putBoolean("hissiViewerShowAdjust", true).apply();
                        Toast.makeText(activity,
                                text("すべてのボタンを表示します", "All toolbar buttons are shown"),
                                Toast.LENGTH_SHORT).show();
                    })
                    .setNegativeButton(text("キャンセル", "Cancel"), null)
                    .setPositiveButton(text("保存", "Save"), (dialog, which) -> {
                        int mask = 0;
                        for (int index = 0; index < HISSI_TOOLBAR_BUTTON_COUNT; index++) {
                            if (selected[index]) mask |= 1 << index;
                        }
                        preferences.edit().putInt(HISSI_VIEWER_TOOLBAR_BUTTONS_KEY, mask)
                                .putBoolean("hissiViewerShowAdjust", selected[HISSI_TOOLBAR_BUTTON_COUNT]).apply();
                        Toast.makeText(activity,
                                text("上部ボタンの表示を保存しました", "Toolbar button visibility saved"),
                                Toast.LENGTH_SHORT).show();
                    })
                    .show();
        });
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

    private static Spinner addSpinner(
            LinearLayout layout,
            Context context,
            String title,
            String[] values,
            int selected
    ) {
        TextView label = new TextView(context);
        label.setText(title);
        layout.addView(label, rowParams(context));
        Spinner spinner = new LiveSettings.Choice(context);
        spinner.setAdapter(new ArrayAdapter<>(context,
                android.R.layout.simple_spinner_dropdown_item, values));
        spinner.setSelection(Math.max(0, Math.min(selected, values.length - 1)));
        layout.addView(spinner, rowParams(context));
        return spinner;
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

    private static int parseNgRegistrationLimit(String rawValue, int fallback) {
        try {
            int value = Integer.parseInt(rawValue.trim());
            if (value >= 0 && value <= MAX_NG_REGISTRATION_LIMIT) return value;
        } catch (RuntimeException ignored) {
        }
        return Math.max(0, Math.min(fallback, MAX_NG_REGISTRATION_LIMIT));
    }

    private static String text(String japanese, String english) {
        SharedPreferences prefs = preferencesOrNull();
        String language = prefs == null ? "ja" : prefs.getString("settingsLanguage", "ja");
        return SettingsLanguage.text(language, Locale.getDefault(), japanese, english);
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    static boolean automaticFoldMode() {
        SharedPreferences prefs = preferencesOrNull();
        return prefs != null && prefs.getBoolean("automaticFoldMode", false);
    }

    static boolean siteCardsEnabled() {
        SharedPreferences prefs = preferencesOrNull();return prefs != null && prefs.getBoolean("siteCardsEnabled", false);
    }
    static boolean siteCardImages() {
        SharedPreferences prefs = preferencesOrNull();return prefs == null || prefs.getBoolean("siteCardImages", true);
    }

    /** ResEdit also prepares the BE account popup; only its main overflow owns upload actions. */
    static boolean isPostingOverflowMenu(Context context, Menu menu) {
        if (context == null || menu == null) return false;
        final String version;
        try {
            version = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (PackageManager.NameNotFoundException ignored) { return false; }
        final int versionItem, uploadHistoryItem;
        // Native menu IDs verified in both the activity and dialog overflow XMLs.
        // Require both markers even when native visibility rules hide either item.
        switch (version) {
            case "0.8.10.191 dev": versionItem = 0x7f0a018f; uploadHistoryItem = 0x7f0a02f7; break;
            case "0.8.10.226 dev": versionItem = 0x7f090128; uploadHistoryItem = 0x7f090304; break;
            case "0.8.10.241": versionItem = 0x7f09017a; uploadHistoryItem = 0x7f0902f7; break;
            case "0.8.10.242 dev": versionItem = 0x7f09017e; uploadHistoryItem = 0x7f090301; break;
            default: return false;
        }
        return menu.findItem(versionItem) != null && menu.findItem(uploadHistoryItem) != null;
    }

    static boolean preparePostingMenu(Context context, Menu menu, int itemId, String key) {
        if (context == null || menu == null) return false;
        if (!isPostingOverflowMenu(context, menu)) {
            menu.removeItem(itemId);
            return false;
        }
        boolean visible = preferences(context).getBoolean(key, false);
        MenuItem existing = menu.findItem(itemId);
        if (existing != null) existing.setVisible(visible);
        return visible && existing == null;
    }

    private static SharedPreferences preferencesOrNull() {
        Context context = applicationContext;
        return context == null ? null : preferences(context);
    }

    public static boolean hideShowHiddenNgMenu() {
        SharedPreferences prefs = preferencesOrNull();
        return prefs != null && prefs.getBoolean("hideShowHiddenNgMenu", false);
    }

    public static boolean deleteReadThreadsLongPressEnabled() {
        SharedPreferences prefs = preferencesOrNull();
        return prefs == null || prefs.getBoolean(DeleteReadThreads.LONG_PRESS_KEY, true);
    }

    /** 0=automatic, 1=hissi.org, 2=Kyodemo, 3=both. Shared by all supported ChMate versions. */
    public static int hissiCheckerMode() {
        SharedPreferences prefs = preferencesOrNull();
        if (prefs == null) return 0;
        int mode = prefs.getInt(HISSI_CHECKER_MODE_KEY, 0);
        return mode < 0 || mode > 3 ? 0 : mode;
    }

    /** Runtime display choice. Keep patch-time availability separate for URL expansion. */
    public static boolean dedicatedViewerEnabled() {
        SharedPreferences prefs = preferencesOrNull();
        return prefs == null || prefs.getBoolean(DEDICATED_VIEWER_ENABLED_KEY, true);
    }

    static boolean imageRotationButtonEnabled(Context context) {
        return context != null && preferences(context).getBoolean("imageViewerRotationButton", true);
    }

    /** Returns whether the patch-time dedicated checker Activity was registered. */
    public static boolean dedicatedCheckerViewerAvailable() {
        Context context = applicationContext;
        if (context == null) return false;
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW,
                    Uri.parse("haiagaru-hissi://hissi.org/read.php/test/1/1.html"));
            intent.setPackage(context.getPackageName());
            return context.getPackageManager().resolveActivity(intent, PackageManager.MATCH_DEFAULT_ONLY) != null;
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to detect the dedicated checker viewer", error);
            return false;
        }
    }

    public static Context applicationContextForExtension() {
        return applicationContext;
    }

    public static int mediaAutoFetchMode() {
        SharedPreferences prefs = preferencesOrNull();
        int oldMode = prefs == null ? 2 : prefs.getInt("mediaAutoFetchMode", 2);
        int mode = prefs == null ? 1 : prefs.getInt("urlVideoFetchMode", oldMode == 3 ? 3 : oldMode == 0 ? 0 : 1);
        return mode >= 0 && mode <= 3 ? mode : 1;
    }

    public static int gifAutoFetchMode() {
        SharedPreferences prefs = preferencesOrNull();
        return GifAutoFetchPolicy.mode(prefs == null ? -1 : prefs.getInt(GifAutoFetchPolicy.KEY, -1), mediaImageFetchEnabled());
    }

    public static int autoReloadIntervalSeconds() {
        SharedPreferences prefs = preferencesOrNull();
        return Math.max(10, Math.min(1800, prefs == null ? 10 : prefs.getInt("autoReloadInterval", 10)));
    }

    public static int threadTitleSpacingPercent() {
        SharedPreferences prefs = preferencesOrNull();
        int percent = prefs == null ? 100 : prefs.getInt("threadTitleSpacingPercent", 100);
        return Math.max(100, Math.min(200, percent)) / 5 * 5;
    }

    public static float postEditorTextSizeSp() {
        SharedPreferences prefs = preferencesOrNull();
        if (prefs == null) return 0;
        float size = prefs.contains("postEditorCustomTextSizeSp")
                ? prefs.getFloat("postEditorCustomTextSizeSp", 0) : prefs.getInt("postEditorTextSizeSp", 0);
        return PostEditorSizeValue.valid(size) ? size : 0;
    }

    public static boolean videoViewerEnabled() {
        Context context = applicationContext;
        if (!VideoViewerActivity.installed(context) || !preferences(context).getBoolean("videoViewerEnabled", true)) return false;
        try {
            String version = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
            return "0.8.10.191 dev".equals(version) || "0.8.10.226 dev".equals(version)
                    || "0.8.10.241".equals(version) || "0.8.10.242 dev".equals(version);
        } catch (Exception ignored) { return false; }
    }

    public static boolean mediaImageFetchEnabled() {
        SharedPreferences prefs = preferencesOrNull();
        if (prefs == null) return true;
        int oldMode = prefs.getInt("mediaAutoFetchMode", 2);
        return prefs.getBoolean("urlImageFetchEnabled", oldMode != 1 && oldMode != 3);
    }

    private static int boundedMediaSetting(String raw, int fallback, int maximum) {
        try {
            int value = Integer.parseInt(raw.trim());
            if (value >= 1 && value <= maximum) return value;
        } catch (RuntimeException ignored) {}
        return Math.max(1, Math.min(maximum, fallback));
    }

    public static int videoThumbnailMaxMb() {
        SharedPreferences prefs = preferencesOrNull();
        return Math.max(1, Math.min(1024, prefs == null ? 24 : prefs.getInt("videoThumbnailMaxMb", 24)));
    }

    public static int videoThumbnailTimeoutSeconds() {
        SharedPreferences prefs = preferencesOrNull();
        return Math.max(1, Math.min(600, prefs == null ? 20 : prefs.getInt("videoThumbnailTimeoutSeconds", 20)));
    }

    private static int previewNumber(String raw, int fallback, int maximum) {
        try { int n = Integer.parseInt(raw.trim()); if (n >= 0 && n <= maximum) return n; }
        catch (RuntimeException ignored) {}
        return fallback;
    }
    public static boolean videoPreviewFourEnabled() {
        SharedPreferences p = preferencesOrNull();
        return p != null && p.getBoolean("videoPreviewFour", false);
    }
    public static boolean videoPreviewWifiOnly() {
        SharedPreferences p = preferencesOrNull();
        return p == null || p.getBoolean("videoPreviewWifiOnly", true);
    }
    public static int videoPreviewMinimumSeconds() {
        SharedPreferences p = preferencesOrNull();
        return Math.max(0, Math.min(86459, p == null ? 60 : p.getInt("videoPreviewMinimumSeconds", 60)));
    }
    public static int videoPreviewCount() {
        SharedPreferences p = preferencesOrNull();
        return Math.max(1, Math.min(64, p == null ? 4 : p.getInt("videoPreviewCount", 4)));
    }

    public static boolean directBodySelectionEnabled() {
        SharedPreferences prefs = preferencesOrNull();
        return prefs != null && prefs.getBoolean("directBodySelection", false);
    }
    public static boolean directCopyAnchorsEnabled() {
        SharedPreferences prefs = preferencesOrNull();
        return prefs == null || prefs.getBoolean("directCopyAnchors", true);
    }

    public static boolean xPostPreviewEnabled() {
        SharedPreferences prefs = preferencesOrNull();
        return prefs != null && prefs.getBoolean("xPostPreviewEnabled", false);
    }

    public static boolean xPostPreviewFullText() {
        SharedPreferences prefs = preferencesOrNull();
        return prefs == null || prefs.getBoolean("xPostPreviewFullText", true);
    }

    public static boolean xPostPreviewCollapsible() {
        SharedPreferences prefs = preferencesOrNull();
        return prefs != null && prefs.getBoolean("xPostPreviewCollapsible", false);
    }
    public static boolean xPostPreviewActions() {
        SharedPreferences prefs = preferencesOrNull();
        return prefs != null && prefs.getBoolean("xPostPreviewActions", false);
    }

    public static boolean xPostPreviewBrowser() {
        SharedPreferences prefs = preferencesOrNull();
        return prefs != null && prefs.getBoolean("xPostPreviewBrowser", true);
    }

    public static boolean xPostPreviewCard() {
        SharedPreferences prefs = preferencesOrNull();
        return prefs != null && prefs.getBoolean("xPostPreviewCard", false);
    }

    private static final Handler MEDIA_REFRESH_HANDLER = new Handler(Looper.getMainLooper());
    private static boolean mediaRefreshPending;
    static void refreshImgurAttachments() {
        synchronized (MEDIA_REFRESH_HANDLER) {
            if (mediaRefreshPending) return;
            mediaRefreshPending = true;
            // Album/frame completions often arrive together. Rebind once for
            // the batch instead of relaying out the entire response list each time.
            MEDIA_REFRESH_HANDLER.postDelayed(() -> {
                synchronized (MEDIA_REFRESH_HANDLER) { mediaRefreshPending = false; }
                Activity activity = resumedActivity.get();
                if (activity != null && !activity.isFinishing() && !activity.isDestroyed())
                    refreshImgurList(activity.getWindow().getDecorView());
            }, 80);
        }
    }

    private static void refreshImgurList(android.view.View view) {
        if (!view.isShown()) return;
        if (view instanceof android.widget.ListView) {
            android.widget.ListAdapter adapter = ((android.widget.ListView) view).getAdapter();
            if (adapter instanceof android.widget.HeaderViewListAdapter)
                adapter = ((android.widget.HeaderViewListAdapter) adapter).getWrappedAdapter();
            if (adapter instanceof android.widget.BaseAdapter)
                ((android.widget.BaseAdapter) adapter).notifyDataSetChanged();
        }
        // Later ChMate generations can host responses in a RecyclerView.
        // Notify only existing visible adapters; never recreate tabs or reorder rows.
        for (Class<?> type = view.getClass(); type != null; type = type.getSuperclass()) {
            if (!"androidx.recyclerview.widget.RecyclerView".equals(type.getName())) continue;
            try {
                Object adapter = type.getMethod("getAdapter").invoke(view);
                if (adapter != null) adapter.getClass().getMethod("notifyDataSetChanged").invoke(adapter);
            } catch (ReflectiveOperationException | RuntimeException error) {
                Log.w(LOG_TAG, "Could not refresh resolved Imgur attachments", error);
            }
            break;
        }
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) refreshImgurList(group.getChildAt(i));
        }
    }

    static void refreshBoardListAfterReadSortChange() {
        Activity activity = resumedActivity.get();
        if (activity != null) activity.runOnUiThread(() -> {
            BrowsingHistory.refreshVisible(activity);
            if (!ReadThreadsFirst.refreshLegacyAdapterInPlace(activity)) {
                ReadThreadsFirst.refreshRecyclerAdapterInPlace(activity);
            }
            ReadThreadsFirst.refreshComposeSettingDialog(activity);
        });
    }

    private static boolean hideNgThreadGroup() {
        SharedPreferences prefs = preferencesOrNull();
        return prefs != null && prefs.getBoolean("hideNgThreadGroup", false);
    }

    public static java.util.List<?> ngThreadsForDisplay(java.util.List<?> threads) {
        return NgThreadGroup.visible(threads, hideNgThreadGroup());
    }

    public static int hissiViewerTheme() {
        SharedPreferences prefs = preferencesOrNull();
        if (prefs == null) return 0;
        int value = prefs.getInt(HISSI_VIEWER_THEME_KEY, 0);
        return value < 0 || value > 3 ? 0 : value;
    }

    public static void setHissiViewerTheme(int value) {
        SharedPreferences prefs = preferencesOrNull();
        if (prefs != null) prefs.edit().putInt(HISSI_VIEWER_THEME_KEY,
                Math.max(0, Math.min(3, value))).apply();
    }

    public static int hissiViewerTextZoom() {
        SharedPreferences prefs = preferencesOrNull();
        if (prefs == null) return 100;
        int value = prefs.getInt(HISSI_VIEWER_TEXT_ZOOM_KEY, 100);
        return Math.max(100, Math.min(130, value));
    }

    public static void setHissiViewerTextZoom(int value) {
        SharedPreferences prefs = preferencesOrNull();
        int zoom = Math.max(100, Math.min(130, value));
        if (prefs != null) prefs.edit().putInt(HISSI_VIEWER_TEXT_ZOOM_KEY, zoom).apply();
    }

    public static boolean hissiViewerToolbarButtonVisible(int buttonIndex) {
        if (buttonIndex < 0 || buttonIndex >= HISSI_TOOLBAR_BUTTON_COUNT) return false;
        SharedPreferences prefs = preferencesOrNull();
        int mask = prefs == null
                ? ALL_HISSI_TOOLBAR_BUTTONS
                : prefs.getInt(HISSI_VIEWER_TOOLBAR_BUTTONS_KEY, ALL_HISSI_TOOLBAR_BUTTONS);
        return (mask & (1 << buttonIndex)) != 0;
    }

    public static boolean hissiViewerFullscreen() {
        SharedPreferences prefs = preferencesOrNull();
        return prefs != null && prefs.getBoolean(HISSI_VIEWER_FULLSCREEN_KEY, false);
    }

    public static boolean hissiViewerShowAdjust() {
        SharedPreferences prefs = preferencesOrNull();
        return prefs == null || prefs.getBoolean("hissiViewerShowAdjust", true);
    }

    public static boolean hissiViewerCompactHeader() {
        SharedPreferences prefs = preferencesOrNull();
        return prefs != null && prefs.getBoolean("hissiViewerCompactHeader", false);
    }

    public static int hissiViewerResponseSpacingDp() {
        SharedPreferences prefs = preferencesOrNull();
        int value = prefs == null ? 7 : prefs.getInt("hissiViewerResponseSpacingDp", 7);
        return Math.max(0, Math.min(20, value));
    }

    public static void setHissiViewerResponseSpacingDp(int value) {
        SharedPreferences prefs = preferencesOrNull();
        if (prefs != null) prefs.edit().putInt("hissiViewerResponseSpacingDp",
                Math.max(0, Math.min(20, value))).apply();
    }

    public static int hissiViewerToolbarHeightDp() {
        SharedPreferences prefs = preferencesOrNull();
        int value = prefs == null ? 40 : prefs.getInt("hissiViewerToolbarHeightDp", 40);
        return Math.max(32, Math.min(56, value));
    }

    public static void setHissiViewerToolbarHeightDp(int value) {
        SharedPreferences prefs = preferencesOrNull();
        if (prefs != null) prefs.edit().putInt("hissiViewerToolbarHeightDp",
                Math.max(32, Math.min(56, value))).apply();
    }

    public static int hissiViewerSwipeHistory() {
        SharedPreferences prefs = preferencesOrNull();
        if (prefs == null) return 0;
        int direction = prefs.getInt(HISSI_VIEWER_SWIPE_HISTORY_KEY, 0);
        return direction >= 0 && direction <= 2 ? direction : 0;
    }

    public static boolean kyodemoEnhancedViewer() {
        SharedPreferences prefs = preferencesOrNull();
        return prefs != null && prefs.getBoolean(KYODEMO_ENHANCED_VIEWER_KEY, false);
    }

    private static int viewerTextZoomIndex(int zoom) {
        return Math.max(0, Math.min(6, Math.round((zoom - 100) / 5f)));
    }

    private static final class ConfigSnapshot {
        final boolean hideAd;
        final boolean topAlignShortThreads;
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
                boolean topAlignShortThreads,
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
            this.topAlignShortThreads = topAlignShortThreads;
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
                    preferences.getBoolean("topAlignShortThreads", false),
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
                    && topAlignShortThreads == value.topAlignShortThreads
                    && removeMonaKey == value.removeMonaKey
                    && chtoio == value.chtoio
                    && edgeReporterId == value.edgeReporterId
                    && forceHttps == value.forceHttps
                    && automaticDat == value.automaticDat
                    && refreshCellularNetwork == value.refreshCellularNetwork
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
