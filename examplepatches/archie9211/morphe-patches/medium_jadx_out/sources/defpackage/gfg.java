package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gfg {
    public final String a;
    public final boolean b;

    public gfg(String str, boolean z) {
        vp7.n(str);
        this.a = str;
        vp7.n("com.google.android.gms");
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gfg)) {
            return false;
        }
        gfg gfgVar = (gfg) obj;
        return en7.u(this.a, gfgVar.a) && en7.u("com.google.android.gms", "com.google.android.gms") && en7.u(null, null) && this.b == gfgVar.b;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, "com.google.android.gms", null, 4225, Boolean.valueOf(this.b)});
    }

    public final String toString() {
        String str = this.a;
        if (str != null) {
            return str;
        }
        vp7.p(null);
        throw null;
    }
}
