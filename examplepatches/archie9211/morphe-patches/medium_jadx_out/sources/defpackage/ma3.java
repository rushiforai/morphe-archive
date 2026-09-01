package defpackage;

import android.content.Context;
import android.content.pm.PackageManager;
import android.util.Log;
import java.io.IOException;
import java.io.InputStream;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ma3 {
    public final /* synthetic */ int a = 2;
    public String b;
    public String c;

    public ma3(lig ligVar) {
        Context context = (Context) ligVar.b;
        int iK = gx1.K(context, "com.google.firebase.crashlytics.unity_version", "string");
        if (iK != 0) {
            this.b = "Unity";
            String string = context.getResources().getString(iK);
            this.c = string;
            String strR = ka1.r("Unity Editor version is: ", string);
            if (Log.isLoggable("FirebaseCrashlytics", 2)) {
                Log.v("FirebaseCrashlytics", strR, null);
                return;
            }
            return;
        }
        if (context.getAssets() != null) {
            try {
                InputStream inputStreamOpen = context.getAssets().open("flutter_assets/NOTICES.Z");
                if (inputStreamOpen != null) {
                    inputStreamOpen.close();
                }
                this.b = "Flutter";
                this.c = null;
                if (Log.isLoggable("FirebaseCrashlytics", 2)) {
                    Log.v("FirebaseCrashlytics", "Development platform is: Flutter", null);
                    return;
                }
                return;
            } catch (IOException unused) {
            }
        }
        this.b = null;
        this.c = null;
    }

    public boolean equals(Object obj) {
        switch (this.a) {
            case 2:
                return false;
            default:
                return super.equals(obj);
        }
    }

    public int hashCode() {
        switch (this.a) {
            case 2:
                String str = this.b;
                int iHashCode = str == null ? 0 : str.hashCode();
                String str2 = this.c;
                return iHashCode ^ (str2 != null ? str2.hashCode() : 0);
            default:
                return super.hashCode();
        }
    }

    public String toString() {
        switch (this.a) {
            case 2:
                return "Pair{" + ((Object) this.b) + " " + ((Object) this.c) + eoLmc.LXudWDL;
            default:
                return super.toString();
        }
    }

    public ma3(Context context) {
        String packageName = context.getPackageName();
        vp7.n(packageName);
        this.b = packageName;
        try {
            byte[] bArrQ0 = ht2.q0(context, packageName);
            if (bArrQ0 == null) {
                Log.e("FBA-PackageInfo", "single cert required: " + packageName);
                this.c = null;
                return;
            }
            this.c = f76.z(bArrQ0);
        } catch (PackageManager.NameNotFoundException unused) {
            Log.e("FBA-PackageInfo", "no pkg: " + packageName);
            this.c = null;
        }
    }

    public ma3(String str, String str2) {
        this.b = str;
        this.c = str2;
    }

    public /* synthetic */ ma3() {
    }
}
