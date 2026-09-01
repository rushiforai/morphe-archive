package defpackage;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w97 {
    public static final ScheduledExecutorService d = Executors.newSingleThreadScheduledExecutor();
    public final String a;
    public final md5 b;
    public final String c;

    public w97(Context context, String str) {
        PackageInfo packageInfo;
        this.a = str;
        this.b = new md5(context, str);
        try {
            PackageManager packageManager = context.getPackageManager();
            if (packageManager == null || (packageInfo = packageManager.getPackageInfo("com.facebook.katana", 0)) == null) {
                return;
            }
            this.c = packageInfo.versionName;
        } catch (PackageManager.NameNotFoundException unused) {
        }
    }

    public final void a(String str, String str2) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            Bundle bundleW0 = ht2.w0("");
            bundleW0.putString("2_result", n87.ERROR.getLoggingValue());
            bundleW0.putString("5_error_message", "Unexpected call to logCompleteLogin with null pendingAuthorizationRequest.");
            bundleW0.putString("3_method", str2);
            this.b.s(str, bundleW0);
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }
}
