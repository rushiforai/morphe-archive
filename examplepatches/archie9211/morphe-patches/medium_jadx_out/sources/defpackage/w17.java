package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class w17 implements xzb {
    public final xzb a;

    public w17(xzb xzbVar) {
        this.a = xzbVar;
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
        ay0.e(str.concat(" is not a valid list index"));
        return 0;
    }

    @Override // defpackage.xzb
    public final int e() {
        return 1;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w17)) {
            return false;
        }
        w17 w17Var = (w17) obj;
        return g76.L(this.a, w17Var.a) && g76.L(a(), w17Var.a());
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
        rd6.l(ev6.C("Illegal index ", i, ", "), a(), " expects only non-negative indices");
        return null;
    }

    @Override // defpackage.xzb
    public final List getAnnotations() {
        return ey3.a;
    }

    @Override // defpackage.xzb
    public final xzb h(int i) {
        if (i >= 0) {
            return this.a;
        }
        rd6.l(ev6.C("Illegal index ", i, ", "), a(), " expects only non-negative indices");
        return null;
    }

    public final int hashCode() {
        return a().hashCode() + (this.a.hashCode() * 31);
    }

    @Override // defpackage.xzb
    public final boolean isInline() {
        return false;
    }

    @Override // defpackage.xzb
    public final mo7 j() {
        return wuc.f;
    }

    public final String toString() {
        return a() + '(' + this.a + ')';
    }
}
