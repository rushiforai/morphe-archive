package defpackage;

import com.medium.android.common.ui.Ezz.Plbho;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class zq9 implements cr9 {
    public final String a;
    public final String b;
    public final String c;
    public final boolean d;

    public zq9(String str, String str2, String str3, boolean z) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zq9)) {
            return false;
        }
        zq9 zq9Var = (zq9) obj;
        return g76.L(this.a, zq9Var.a) && this.b.equals(zq9Var.b) && g76.L(this.c, zq9Var.c) && this.d == zq9Var.d;
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        return (((iO + (str == null ? 0 : str.hashCode())) * 31) + (this.d ? 1231 : 1237)) * 31;
    }

    public final String toString() {
        StringBuilder sbU = y30.u("UserHighlighted(userId=", this.a, ", userName=", this.b, ", userImageId=");
        sbU.append(this.c);
        sbU.append(", isCurrentUser=");
        sbU.append(this.d);
        sbU.append(Plbho.uBCLwx);
        return sbU.toString();
    }
}
