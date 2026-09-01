package defpackage;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a1c {
    public static final a1c a = new a1c();
    public static final rz2 b;

    static {
        yb6 yb6Var = new yb6();
        yb6Var.a(z0c.class, mh0.a);
        yb6Var.a(g1c.class, nh0.a);
        yb6Var.a(jt2.class, kh0.a);
        yb6Var.a(w60.class, jh0.a);
        yb6Var.a(gm.class, ih0.a);
        yb6Var.a(w1a.class, lh0.a);
        yb6Var.d = true;
        b = new rz2(24, yb6Var);
    }

    public static w60 a(xj4 xj4Var) throws PackageManager.NameNotFoundException {
        xj4Var.a();
        Context context = xj4Var.a;
        context.getClass();
        String packageName = context.getPackageName();
        PackageInfo packageInfo = context.getPackageManager().getPackageInfo(packageName, 0);
        String strValueOf = Build.VERSION.SDK_INT >= 28 ? String.valueOf(packageInfo.getLongVersionCode()) : String.valueOf(packageInfo.versionCode);
        xj4Var.a();
        String str = xj4Var.c.b;
        str.getClass();
        Build.MODEL.getClass();
        Build.VERSION.RELEASE.getClass();
        d77 d77Var = d77.LOG_ENVIRONMENT_PROD;
        packageName.getClass();
        String str2 = packageInfo.versionName;
        if (str2 == null) {
            str2 = strValueOf;
        }
        Build.MANUFACTURER.getClass();
        xj4Var.a();
        w1a w1aVarG = v4.g(context);
        xj4Var.a();
        return new w60(str, d77Var, new gm(packageName, str2, strValueOf, w1aVarG, v4.e(context)));
    }
}
