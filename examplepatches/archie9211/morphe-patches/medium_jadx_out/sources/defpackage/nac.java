package defpackage;

import com.medium.android.core.susi.SusiDestination;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nac implements qac {
    public final String a;
    public final SusiDestination b;
    public final String c;
    public final boolean d;

    public nac(String str, String str2, SusiDestination susiDestination, boolean z) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = susiDestination;
        this.c = str2;
        this.d = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof nac)) {
            return false;
        }
        nac nacVar = (nac) obj;
        return g76.L(this.a, nacVar.a) && g76.L(this.b, nacVar.b) && g76.L(this.c, nacVar.c) && this.d == nacVar.d;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        SusiDestination susiDestination = this.b;
        return wgd.o((iHashCode + (susiDestination == null ? 0 : susiDestination.hashCode())) * 31, 31, this.c) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        return "NavigateToUnrecognizedEmail(email=" + this.a + ", susiDestination=" + this.b + ", source=" + this.c + ", rememberMe=" + this.d + ")";
    }
}
