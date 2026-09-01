package defpackage;

import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w60 {
    public final String a;
    public final d77 b;
    public final gm c;

    public w60(String str, d77 d77Var, gm gmVar) {
        String str2 = Build.MODEL;
        String str3 = Build.VERSION.RELEASE;
        str.getClass();
        str2.getClass();
        str3.getClass();
        d77Var.getClass();
        this.a = str;
        this.b = d77Var;
        this.c = gmVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w60)) {
            return false;
        }
        w60 w60Var = (w60) obj;
        if (!g76.L(this.a, w60Var.a)) {
            return false;
        }
        String str = Build.MODEL;
        if (!g76.L(str, str)) {
            return false;
        }
        String str2 = Build.VERSION.RELEASE;
        return g76.L(str2, str2) && this.b == w60Var.b && this.c.equals(w60Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ((this.b.hashCode() + wgd.o((((Build.MODEL.hashCode() + (this.a.hashCode() * 31)) * 31) + 48517565) * 31, 31, Build.VERSION.RELEASE)) * 31);
    }

    public final String toString() {
        return "ApplicationInfo(appId=" + this.a + ", deviceModel=" + Build.MODEL + ", sessionSdkVersion=3.0.6, osVersion=" + Build.VERSION.RELEASE + ", logEnvironment=" + this.b + ", androidAppInfo=" + this.c + ')';
    }
}
