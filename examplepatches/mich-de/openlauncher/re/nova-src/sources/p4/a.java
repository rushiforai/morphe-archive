package p4;

import android.content.pm.PackageInfo;
import android.os.Handler;
import android.os.Looper;

/* loaded from: classes.dex */
public abstract class a {
    public static Handler a(Looper looper) {
        return Handler.createAsync(looper);
    }

    public static Handler b(Looper looper) {
        return Handler.createAsync(looper);
    }

    public static long c(PackageInfo packageInfo) {
        return packageInfo.getLongVersionCode();
    }
}
