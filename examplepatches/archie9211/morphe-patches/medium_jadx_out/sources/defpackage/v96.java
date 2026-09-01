package defpackage;

import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v96 {
    public final lxd a;
    public final w96 b;
    public final boolean c;
    public final boolean d;
    public final Set e;
    public final hec f;

    public /* synthetic */ v96(lxd lxdVar, boolean z, boolean z2, Set set, int i) {
        this(lxdVar, w96.INFLEXIBLE, (i & 4) != 0 ? false : z, (i & 8) != 0 ? false : z2, (i & 16) != 0 ? null : set, null);
    }

    public static v96 a(v96 v96Var, w96 w96Var, boolean z, Set set, hec hecVar, int i) {
        lxd lxdVar = v96Var.a;
        if ((i & 2) != 0) {
            w96Var = v96Var.b;
        }
        w96 w96Var2 = w96Var;
        if ((i & 4) != 0) {
            z = v96Var.c;
        }
        boolean z2 = z;
        boolean z3 = v96Var.d;
        if ((i & 16) != 0) {
            set = v96Var.e;
        }
        Set set2 = set;
        if ((i & 32) != 0) {
            hecVar = v96Var.f;
        }
        v96Var.getClass();
        lxdVar.getClass();
        w96Var2.getClass();
        return new v96(lxdVar, w96Var2, z2, z3, set2, hecVar);
    }

    public final v96 b(w96 w96Var) {
        w96Var.getClass();
        return a(this, w96Var, false, null, null, 61);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof v96)) {
            return false;
        }
        v96 v96Var = (v96) obj;
        return g76.L(v96Var.f, this.f) && v96Var.a == this.a && v96Var.b == this.b && v96Var.c == this.c && v96Var.d == this.d;
    }

    public final int hashCode() {
        hec hecVar = this.f;
        int iHashCode = hecVar != null ? hecVar.hashCode() : 0;
        int iHashCode2 = this.a.hashCode() + (iHashCode * 31) + iHashCode;
        int iHashCode3 = this.b.hashCode() + (iHashCode2 * 31) + iHashCode2;
        int i = (iHashCode3 * 31) + (this.c ? 1 : 0) + iHashCode3;
        return (i * 31) + (this.d ? 1 : 0) + i;
    }

    public final String toString() {
        return "JavaTypeAttributes(howThisTypeIsUsed=" + this.a + ", flexibility=" + this.b + ", isRaw=" + this.c + ", isForAnnotationParameter=" + this.d + ", visitedTypeParameters=" + this.e + ", defaultType=" + this.f + ')';
    }

    public v96(lxd lxdVar, w96 w96Var, boolean z, boolean z2, Set set, hec hecVar) {
        lxdVar.getClass();
        w96Var.getClass();
        this.a = lxdVar;
        this.b = w96Var;
        this.c = z;
        this.d = z2;
        this.e = set;
        this.f = hecVar;
    }
}
