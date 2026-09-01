package defpackage;

import android.os.Build;
import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class gm {
    public final String a;
    public final String b;
    public final String c;
    public final w1a d;
    public final ArrayList e;

    public gm(String str, String str2, String str3, w1a w1aVar, ArrayList arrayList) {
        b09.I(str2, str3, Build.MANUFACTURER);
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = w1aVar;
        this.e = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gm)) {
            return false;
        }
        gm gmVar = (gm) obj;
        if (!this.a.equals(gmVar.a) || !g76.L(this.b, gmVar.b) || !g76.L(this.c, gmVar.c)) {
            return false;
        }
        String str = Build.MANUFACTURER;
        return g76.L(str, str) && this.d.equals(gmVar.d) && this.e.equals(gmVar.e);
    }

    public final int hashCode() {
        return this.e.hashCode() + ((this.d.hashCode() + wgd.o(wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c), 31, Build.MANUFACTURER)) * 31);
    }

    public final String toString() {
        return "AndroidApplicationInfo(packageName=" + this.a + ", versionName=" + this.b + kSWQKWZ.MAZSTXba + this.c + ", deviceManufacturer=" + Build.MANUFACTURER + ", currentProcessDetails=" + this.d + ", appProcessDetails=" + this.e + ')';
    }
}
