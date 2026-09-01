package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class he3 {
    public final String a;
    public final List b;

    public he3(String str, List list) {
        str.getClass();
        this.a = str;
        this.b = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof he3)) {
            return false;
        }
        he3 he3Var = (he3) obj;
        return g76.L(this.a, he3Var.a) && this.b.equals(he3Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return ka1.s("DigestSection(title=", this.a, ", posts=", ")", this.b);
    }
}
