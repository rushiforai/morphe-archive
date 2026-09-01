package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nd3 {
    public final sd3 a;
    public final String b;
    public final ArrayList c;

    public nd3(sd3 sd3Var, String str, ArrayList arrayList) {
        str.getClass();
        this.a = sd3Var;
        this.b = str;
        this.c = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof nd3)) {
            return false;
        }
        nd3 nd3Var = (nd3) obj;
        return this.a == nd3Var.a && g76.L(this.b, nd3Var.b) && this.c.equals(nd3Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        return "DigestSection(type=" + this.a + ", title=" + this.b + ", posts=" + this.c + ")";
    }
}
