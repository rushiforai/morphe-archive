package defpackage;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Build;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g40 {
    public final String a;
    public final String b;
    public final ArrayList c;
    public final String d;
    public final String e;
    public final String f;
    public final String g;
    public final lig h;

    public g40(String str, String str2, ArrayList arrayList, String str3, String str4, String str5, String str6, lig ligVar) {
        this.a = str;
        this.b = str2;
        this.c = arrayList;
        this.d = str3;
        this.e = str4;
        this.f = str5;
        this.g = str6;
        this.h = ligVar;
    }

    public static g40 a(Context context, sv5 sv5Var, String str, String str2, ArrayList arrayList, lig ligVar) {
        String packageName = context.getPackageName();
        String strD = sv5Var.d();
        PackageInfo packageInfo = context.getPackageManager().getPackageInfo(packageName, 0);
        String string = Build.VERSION.SDK_INT >= 28 ? Long.toString(packageInfo.getLongVersionCode()) : Integer.toString(packageInfo.versionCode);
        String str3 = packageInfo.versionName;
        if (str3 == null) {
            str3 = "0.0";
        }
        return new g40(str, str2, arrayList, strD, packageName, string, str3, ligVar);
    }
}
