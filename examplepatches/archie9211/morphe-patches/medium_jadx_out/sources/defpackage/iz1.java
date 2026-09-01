package defpackage;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class iz1 implements h8a {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ iz1(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.h8a
    public final Object get() {
        ApplicationInfo applicationInfo;
        Bundle bundle;
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                iy1 iy1Var = (iy1) obj;
                return iy1Var.f.f(new iq1(iy1Var, (jz1) obj2));
            case 1:
                return new dj5((Context) obj2, (String) obj);
            default:
                xj4 xj4Var = (xj4) obj2;
                Context contextE = (Context) obj;
                String strF = xj4Var.f();
                gt2 gt2Var = new gt2();
                int i2 = Build.VERSION.SDK_INT;
                if (i2 >= 24) {
                    contextE = i2 >= 24 ? o6.e(contextE) : null;
                }
                SharedPreferences sharedPreferences = contextE.getSharedPreferences("com.google.firebase.common.prefs:".concat(strF), 0);
                boolean z = true;
                if (sharedPreferences.contains("firebase_data_collection_default_enabled")) {
                    z = sharedPreferences.getBoolean("firebase_data_collection_default_enabled", true);
                } else {
                    try {
                        PackageManager packageManager = contextE.getPackageManager();
                        if (packageManager != null && (applicationInfo = packageManager.getApplicationInfo(contextE.getPackageName(), 128)) != null && (bundle = applicationInfo.metaData) != null && bundle.containsKey("firebase_data_collection_default_enabled")) {
                            z = applicationInfo.metaData.getBoolean("firebase_data_collection_default_enabled");
                        }
                        break;
                    } catch (PackageManager.NameNotFoundException unused) {
                    }
                }
                gt2Var.a = z;
                return gt2Var;
        }
    }
}
