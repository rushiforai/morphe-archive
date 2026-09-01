package defpackage;

import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o66 extends gsa {
    public final String n;
    public final LinkedHashMap o;

    public o66(String str, LinkedHashMap linkedHashMap) {
        str.getClass();
        this.n = str;
        this.o = linkedHashMap;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o66)) {
            return false;
        }
        o66 o66Var = (o66) obj;
        return g76.L(this.n, o66Var.n) && this.o.equals(o66Var.o);
    }

    public final int hashCode() {
        return this.o.hashCode() + (this.n.hashCode() * 31);
    }

    public final String toString() {
        return "Metric(message=" + this.n + ", additionalProperties=" + this.o + ")";
    }
}
