package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zwd implements qj6 {
    public final ih6 a;
    public final List b;

    public zwd(ih6 ih6Var, List list) {
        ih6Var.getClass();
        list.getClass();
        this.a = ih6Var;
        this.b = list;
    }

    public final String a(boolean z) {
        String name;
        ih6 ih6Var = this.a;
        wg6 wg6Var = ih6Var instanceof wg6 ? (wg6) ih6Var : null;
        Class clsT = wg6Var != null ? vx0.T(wg6Var) : null;
        if (clsT == null) {
            name = ih6Var.toString();
        } else if (clsT.isArray()) {
            name = clsT.equals(boolean[].class) ? "kotlin.BooleanArray" : clsT.equals(char[].class) ? "kotlin.CharArray" : clsT.equals(byte[].class) ? "kotlin.ByteArray" : clsT.equals(short[].class) ? "kotlin.ShortArray" : clsT.equals(int[].class) ? "kotlin.IntArray" : clsT.equals(float[].class) ? "kotlin.FloatArray" : clsT.equals(long[].class) ? "kotlin.LongArray" : clsT.equals(double[].class) ? "kotlin.DoubleArray" : "kotlin.Array";
        } else if (z && clsT.isPrimitive()) {
            ih6Var.getClass();
            name = vx0.U((wg6) ih6Var).getName();
        } else {
            name = clsT.getName();
        }
        return b09.y(name, this.b.isEmpty() ? "" : bu1.F0(this.b, ", ", "<", ">", new tjd(this), 24), "");
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof zwd)) {
            return false;
        }
        zwd zwdVar = (zwd) obj;
        return g76.L(this.a, zwdVar.a) && g76.L(this.b, zwdVar.b);
    }

    @Override // defpackage.qg6
    public final List getAnnotations() {
        throw null;
    }

    @Override // defpackage.qj6
    public final boolean h() {
        return false;
    }

    public final int hashCode() {
        return wgd.p(this.a.hashCode() * 31, 31, this.b);
    }

    @Override // defpackage.qj6
    public final List o() {
        return this.b;
    }

    @Override // defpackage.qj6
    public final ih6 r() {
        return this.a;
    }

    public final String toString() {
        return a(false).concat(" (Kotlin reflection is not available)");
    }
}
