package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class q07 implements xzb {
    public final xzb a;
    public final xzb b;

    public q07(xzb xzbVar, xzb xzbVar2) {
        xzbVar.getClass();
        xzbVar2.getClass();
        this.a = xzbVar;
        this.b = xzbVar2;
    }

    @Override // defpackage.xzb
    public final String a() {
        return "kotlin.collections.LinkedHashMap";
    }

    @Override // defpackage.xzb
    public final boolean c() {
        return false;
    }

    @Override // defpackage.xzb
    public final int d(String str) {
        str.getClass();
        Integer numO = tuc.O(str);
        if (numO != null) {
            return numO.intValue();
        }
        ay0.e(str.concat(" is not a valid map index"));
        return 0;
    }

    @Override // defpackage.xzb
    public final int e() {
        return 2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q07)) {
            return false;
        }
        q07 q07Var = (q07) obj;
        return g76.L(this.a, q07Var.a) && g76.L(this.b, q07Var.b);
    }

    @Override // defpackage.xzb
    public final String f(int i) {
        return String.valueOf(i);
    }

    @Override // defpackage.xzb
    public final List g(int i) {
        if (i >= 0) {
            return ey3.a;
        }
        ywb.g(ev6.w("Illegal index ", i, ", kotlin.collections.LinkedHashMap expects only non-negative indices"));
        return null;
    }

    @Override // defpackage.xzb
    public final List getAnnotations() {
        return ey3.a;
    }

    @Override // defpackage.xzb
    public final xzb h(int i) {
        if (i < 0) {
            ywb.g(ev6.w("Illegal index ", i, ", kotlin.collections.LinkedHashMap expects only non-negative indices"));
            return null;
        }
        int i2 = i % 2;
        if (i2 == 0) {
            return this.a;
        }
        if (i2 == 1) {
            return this.b;
        }
        ygf.f("Unreached");
        return null;
    }

    public final int hashCode() {
        return this.b.hashCode() + ((this.a.hashCode() + 710441009) * 31);
    }

    @Override // defpackage.xzb
    public final boolean isInline() {
        return false;
    }

    @Override // defpackage.xzb
    public final mo7 j() {
        return wuc.g;
    }

    public final String toString() {
        return "kotlin.collections.LinkedHashMap(" + this.a + ", " + this.b + ')';
    }
}
