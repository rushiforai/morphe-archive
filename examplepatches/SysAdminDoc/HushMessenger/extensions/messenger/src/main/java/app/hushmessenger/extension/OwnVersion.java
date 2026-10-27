package app.hushmessenger.extension;

import android.content.pm.PackageInfo;
import android.util.Log;

import java.util.regex.Matcher;

/**
 * Messenger's own version code as it was before Spoof package version raised it. That patch sends Messenger's reads of
 * its own PackageInfo version through here, so its checks still see the build it really is. AppComponentManager, for
 * one, logs a version code that differs from the APK's, and ACRA puts it in crash data. Any other package's PackageInfo keeps what Android
 * reported, and so does this app's when the patched-from build is unknown.
 */
public final class OwnVersion {

    private OwnVersion() {}

    /** The original code once read, 0 when there isn't one, -1 before the first read. Tests set it. */
    static volatile long original = -1;
    private static volatile boolean announced;

    /** Stands in for {@code info.versionCode}, null included. */
    public static int versionCode(PackageInfo info) {
        int reported = info.versionCode;
        long own = ownCode(info.packageName);
        return own > 0 ? (int) own : reported;
    }

    /** Stands in for {@code info.getLongVersionCode()}, keeping the high half Android reported. */
    public static long longVersionCode(PackageInfo info) {
        long reported = info.getLongVersionCode();
        long own = ownCode(info.packageName);
        return own > 0 ? (reported & 0xffff_ffff_0000_0000L) | own : reported;
    }

    /** The original code if {@code packageName} is this app's, else 0. */
    static long ownCode(String packageName) {
        if (packageName == null || !packageName.equals(MessengerSignature.ownPackage())) return 0;
        long code = original;
        if (code < 0) {
            code = originalCode(HostScreens.originalBuild());
            original = code;
        }
        if (code > 0 && !announced) {
            announced = true;
            Log.i("HushMessenger", "Messenger's own version reads answer " + code + ", the build it was patched from");
        }
        return code;
    }

    /** The code in "584.1.0.61.98|346816935|base", or 0 for anything else. */
    static long originalCode(String build) {
        Matcher parts = ProblemReport.ORIGINAL.matcher(build == null ? "" : build);
        if (!parts.matches()) return 0;
        long code = Long.parseLong(parts.group(2));
        return code <= Integer.MAX_VALUE ? code : 0;
    }

    /** Forgets the cached code, for tests. */
    static void reset() {
        original = -1;
        announced = false;
    }
}
