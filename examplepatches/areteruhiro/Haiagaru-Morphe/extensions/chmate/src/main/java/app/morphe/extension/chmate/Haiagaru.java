package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Process;
import android.text.TextUtils;
import android.util.Base64;
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
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.Map;

/** Runtime component of the Haiagaru patch, embedded in ChMate. */
public final class Haiagaru {
    private static final String PREFS_NAME =
            "io.github.areteruhiro.chmate.haiagaru.ui-config";
    private static final String BUTTON_TAG = "haiagaru.settings.button";

    private static final String DEFAULT_USER_AGENT =
            "Dalvik/2.1.0 (Linux; U; Android 4.0.3; HT-01 Build/XYZ0.123456.789)";
    private static final String DEFAULT_COOKIE_CLASS =
            "com.franmontiel.persistentcookiejar.persistence.SharedPrefsCookiePersistor";
    private static final String DEFAULT_MONAKEY_FILE = "2chapi";
    private static final String DEFAULT_MONAKEY_KEY = "2chapi_monakey";
    private static final String AD_CLASS_191 = "o.qheCC";
    private static final String AD_CLASS_241 = "o.setUseHandlerThreadForCallbacks";
    private static final String AD_CLASS_242 = "o.zzbgb";
    private static final String AD_CLASS_243 = "o.zzexb";
    private static final String CHMATE_PACKAGE = "jp.co.airfront.android.a2chMate";
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
    private static volatile boolean signatureSpoofInstalled;

    private Haiagaru() {
    }

    /** Makes ChMate's distributed integrity calculations see its original certificate. */
    @SuppressWarnings("deprecation")
    public static synchronized void installSignatureSpoof() {
        if (signatureSpoofInstalled) return;

        final Signature originalSignature = new Signature(
                Base64.decode(ORIGINAL_CERTIFICATE, Base64.DEFAULT));
        final Parcelable.Creator<PackageInfo> originalCreator = PackageInfo.CREATOR;
        final Parcelable.Creator<PackageInfo> spoofingCreator = new Parcelable.Creator<PackageInfo>() {
            @Override
            public PackageInfo createFromParcel(Parcel source) {
                PackageInfo info = originalCreator.createFromParcel(source);
                if (CHMATE_PACKAGE.equals(info.packageName)) {
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

    public static void onApplicationCreate(Application application) {
        applicationContext = application.getApplicationContext();
        applyUserAgent();
    }

    public static boolean shouldHideAds() {
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

    public static String normalizeBeIconUrl(String original) {
        if (original == null) return null;
        return original.replace("://img.5ch.net/", "://img.5ch.io/");
    }

    public static String prepareLegacyBeParsing(String original) {
        if (original == null || !original.contains("sssp://img.5ch.io/")) return original;
        return original.replace("sssp://img.5ch.io/", "sssp://img.5ch.net/");
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

        ViewGroup content = activity.findViewById(android.R.id.content);
        if (content == null || content.findViewWithTag(BUTTON_TAG) != null) return;

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
        content.addView(button, params);

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
                            .commit();

                    ConfigSnapshot after = ConfigSnapshot.read(preferences);
                    if (!before.equals(after)) restart(activity);
                })
                .show();
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

        private ConfigSnapshot(
                boolean hideAd,
                boolean replaceUserAgent,
                String userAgent,
                boolean removeMonaKey,
                String cookieClass,
                String monaKeyFile,
                String monaKeyName,
                String adClass,
                boolean chtoio
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
                    preferences.getBoolean("chtoio", true)
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
                    && equal(userAgent, value.userAgent)
                    && equal(cookieClass, value.cookieClass)
                    && equal(monaKeyFile, value.monaKeyFile)
                    && equal(monaKeyName, value.monaKeyName)
                    && equal(adClass, value.adClass);
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
