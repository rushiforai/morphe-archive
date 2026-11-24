package app.hoitruyenchu.extension.itruyenchu.patches.shared;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Build;

/**
 * The patched app's version and what differs between the supported versions (2.1.0 and 3.0.0).
 * <ul>
 *   <li>Metro module ids of the app modules the JS scripts use: they change with every app build.
 *       The scripts get them through {@code globalThis.__htcR(name)} (see {@link JsScripts}).</li>
 *   <li>The API host: 3.0.0 uses https://api.hoitruyenchu.org, 2.1.0 https://api.tienphu.top.</li>
 *   <li>Behaviour: 3.0.0's voice bar reads the text after the "Thay thế" rules (2.1.0 read the
 *       original text) and its sync button sets the history as sent (2.1.0 added it entry by entry).</li>
 * </ul>
 * Module ids were read from the Hermes bundles: 2.1.0 (versionCode 10) and 3.0.0 (versionCode 11).
 * A newer unknown version gets the 3.0.0 values; every script checks what it gets.
 */
public final class AppInfo {
    /** versionCode of app 3.0.0. */
    public static final int V3_0_0 = 11;

    private static final String API_V2 = "https://api.tienphu.top";
    private static final String API_V3 = "https://api.hoitruyenchu.org";

    /** jsx react/jsx-runtime, rn react-native, icons lucide-react-native, toast react-native-toast-message,
     *  auth useAuthStore, api the app's axios client, read useReadStore, replace useMagicReplaceStore +
     *  applyReplaceRules, voice useTTSVoiceStore, speech expo-speech, s3 getDataFromS3 (only needed for
     *  3.0.0, see TitlesScript); 3.0.0 only, for the mini player: text parseLines, audio expo-audio,
     *  silence the voice bar's silent mp3, chapters getChapterContent, banner getSmallBannerURL. */
    private static final String MODULES_V2 = "{\"jsx\":288,\"react\":114,\"rn\":74,\"icons\":883,"
            + "\"toast\":2680,\"auth\":2713,\"api\":2722,\"read\":2735,\"replace\":2765,\"voice\":2766,\"speech\":3234}";
    private static final String MODULES_V3 = "{\"jsx\":288,\"react\":114,\"rn\":74,\"icons\":880,\"s3\":2745,"
            + "\"toast\":2677,\"auth\":2709,\"api\":2718,\"read\":2732,\"replace\":2766,\"voice\":2767,\"speech\":3237,"
            + "\"text\":3251,\"audio\":3240,\"silence\":3250,\"chapters\":2742,\"banner\":2663}";

    private static volatile int versionCode = -1;

    private AppInfo() {
    }

    /** @return the app's versionCode, 0 if it could not be read (not cached then). */
    public static int versionCode() {
        int code = versionCode;
        if (code >= 0) return code;
        try {
            Context context = HtcSettings.context();
            if (context == null) return 0;
            PackageInfo info = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            code = Build.VERSION.SDK_INT >= 28 ? (int) info.getLongVersionCode() : info.versionCode;
        } catch (Throwable t) {
            return 0;
        }
        versionCode = code;
        return code;
    }

    /** @return true for app 3.0.0 and later. */
    public static boolean isV3() {
        return versionCode() >= V3_0_0;
    }

    /** @return the API host the app uses, without a trailing slash. */
    public static String apiUrl() {
        return isV3() ? API_V3 : API_V2;
    }

    /** @return the other known API host, tried when {@link #apiUrl()} cannot be reached. */
    public static String otherApiUrl() {
        return isV3() ? API_V2 : API_V3;
    }

    /** @return {"code": n, "voiceReplaced": bool, "m": {name: module id}} for the JS prelude. */
    static String json() {
        boolean v3 = isV3();
        return "{\"code\":" + versionCode() + ",\"voiceReplaced\":" + v3
                + ",\"m\":" + (v3 ? MODULES_V3 : MODULES_V2) + "}";
    }
}
