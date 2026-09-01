package defpackage;

import com.medium.android.data.catalog.KnyB.uvlZTF;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class k1a implements n1a {
    public final boolean a;
    public final boolean b;
    public final boolean c;
    public final boolean d;
    public final boolean e;

    public k1a(boolean z, boolean z2, boolean z3, boolean z4, boolean z5) {
        this.a = z;
        this.b = z2;
        this.c = z3;
        this.d = z4;
        this.e = z5;
    }

    public static k1a a(k1a k1aVar, boolean z, boolean z2, boolean z3, int i) {
        if ((i & 1) != 0) {
            z = k1aVar.a;
        }
        boolean z4 = z;
        if ((i & 2) != 0) {
            z2 = k1aVar.b;
        }
        boolean z5 = z2;
        if ((i & 4) != 0) {
            z3 = k1aVar.c;
        }
        return new k1a(z4, z5, z3, k1aVar.d, k1aVar.e);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k1a)) {
            return false;
        }
        k1a k1aVar = (k1a) obj;
        return this.a == k1aVar.a && this.b == k1aVar.b && this.c == k1aVar.c && this.d == k1aVar.d && this.e == k1aVar.e;
    }

    public final int hashCode() {
        return ((((((((this.a ? 1231 : 1237) * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Content(showClaps=");
        sb.append(this.a);
        sb.append(", showResponses=");
        sb.append(this.b);
        sb.append(", showHighlights=");
        ho2.R(sb, this.c, uvlZTF.FbEfiXY, this.d, ", discoverableByAddressBook=");
        return lv8.t(sb, this.e, ")");
    }
}
