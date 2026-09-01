package defpackage;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l5g {
    public final Context a;
    public final be5 b;

    public l5g(Context context, be5 be5Var) {
        this.a = context;
        this.b = be5Var;
    }

    public final boolean a() {
        try {
            List<PackageInfo> installedPackages = this.a.getPackageManager().getInstalledPackages(0);
            if (!(installedPackages != null) || !installedPackages.isEmpty()) {
                Iterator<T> it2 = installedPackages.iterator();
                while (it2.hasNext()) {
                    if (g76.L(((PackageInfo) it2.next()).packageName, "com.android.vending")) {
                        return true;
                    }
                }
            }
        } catch (Exception unused) {
        }
        return false;
    }

    public final String b() {
        try {
            Context context = this.a;
            PackageManager packageManager = context.getPackageManager();
            String packageName = context.getPackageName();
            if (Build.VERSION.SDK_INT >= 30) {
                String initiatingPackageName = packageManager.getInstallSourceInfo(packageName).getInitiatingPackageName();
                if (initiatingPackageName != null) {
                    return initiatingPackageName;
                }
            } else {
                String installerPackageName = packageManager.getInstallerPackageName(packageName);
                if (installerPackageName != null) {
                    return installerPackageName;
                }
            }
            return "";
        } catch (Exception unused) {
            return "";
        }
    }

    public final int c() {
        int iB = this.b.b(this.a);
        return (iB == 1 || iB == 3 || iB == 9) ? 4 : 3;
    }
}
