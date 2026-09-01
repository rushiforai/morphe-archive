package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ci8 {
    public final mn1 a;
    public final List b;

    public ci8(mn1 mn1Var, List list) {
        mn1Var.getClass();
        this.a = mn1Var;
        this.b = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ci8)) {
            return false;
        }
        ci8 ci8Var = (ci8) obj;
        return g76.L(this.a, ci8Var.a) && this.b.equals(ci8Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "ClassRequest(classId=" + this.a + ", typeParametersCount=" + this.b + ')';
    }
}
