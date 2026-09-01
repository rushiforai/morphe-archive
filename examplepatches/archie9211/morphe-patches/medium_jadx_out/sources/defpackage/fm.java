package defpackage;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fm {
    public final Context a;

    public fm(Context context) {
        this.a = context;
    }

    public final boolean a() {
        PackageInfo packageInfo;
        try {
            int i = Build.VERSION.SDK_INT;
            Context context = this.a;
            packageInfo = i >= 33 ? context.getPackageManager().getPackageInfo("com.instagram.android", PackageManager.PackageInfoFlags.of(0L)) : context.getPackageManager().getPackageInfo("com.instagram.android", 0);
        } catch (PackageManager.NameNotFoundException e) {
            wld.a.b(e, "Could not find package name: ".concat("com.instagram.android"), new Object[0]);
            packageInfo = null;
        }
        return packageInfo != null;
    }
}
