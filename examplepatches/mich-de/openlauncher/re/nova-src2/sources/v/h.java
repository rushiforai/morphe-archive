package v;

import android.content.pm.PackageManager;

/* loaded from: classes2.dex */
public abstract class h {
    public static boolean a(PackageManager packageManager) {
        return packageManager.hasSystemFeature("android.hardware.fingerprint");
    }
}
