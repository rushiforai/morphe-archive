package ariecos.patches.gemini.extension;

import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;

public class SpoofSignatureHelper {

    public static PackageInfo getPackageInfo(
            PackageManager pm,
            String packageName,
            int flags
    ) throws PackageManager.NameNotFoundException {

        final int GET_SIGNATURES = 0x40;

        if ((flags & GET_SIGNATURES) == 0) {
            return pm.getPackageInfo(packageName, flags);
        }

        PackageInfo info = pm.getPackageInfo(packageName, flags & ~GET_SIGNATURES);
        info.signatures = new Signature[]{ GOOGLE_RELEASE_CERT };
        return info;
    }

    // Replace the 0x00 below with the actual Google cert bytes once you have them
    private static final Signature GOOGLE_RELEASE_CERT = new Signature(new byte[]{ 0x00 });
}
