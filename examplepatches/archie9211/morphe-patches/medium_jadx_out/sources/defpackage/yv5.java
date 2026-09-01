package defpackage;

import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class yv5 {
    public final String a;
    public final String b;
    public final String c;
    public final float d;
    public final boolean e;
    public final boolean f;

    public yv5(String str, String str2, String str3, float f, boolean z, boolean z2) {
        str2.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = f;
        this.e = z;
        this.f = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yv5)) {
            return false;
        }
        yv5 yv5Var = (yv5) obj;
        return this.a.equals(yv5Var.a) && this.b.equals(yv5Var.b) && g76.L(this.c, yv5Var.c) && Float.compare(this.d, yv5Var.d) == 0 && this.e == yv5Var.e && this.f == yv5Var.f;
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        return ((km4.p(this.d, (iO + (str == null ? 0 : str.hashCode())) * 31, 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbU = y30.u(ziYqbdHrAXvj.gaDExaUw, this.a, ", mediumBaseUrl=", this.b, ", thumbnailUrl=");
        sbU.append(this.c);
        sbU.append(", mediaRatio=");
        sbU.append(this.d);
        sbU.append(", isInEditMode=");
        return b09.C(sbU, this.e, ", isFocused=", this.f, ")");
    }
}
