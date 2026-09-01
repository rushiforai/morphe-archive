package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dx7 {
    public final ew5 a;
    public final Map b;

    public dx7(ew5 ew5Var, Map map) {
        this.a = ew5Var;
        this.b = nk7.A0(map);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof dx7)) {
            return false;
        }
        dx7 dx7Var = (dx7) obj;
        return g76.L(this.a, dx7Var.a) && g76.L(this.b, dx7Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "Value(image=" + this.a + ", extras=" + this.b + ')';
    }
}
