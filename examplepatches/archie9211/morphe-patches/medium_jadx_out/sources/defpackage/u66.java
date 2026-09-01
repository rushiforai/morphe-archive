package defpackage;

import java.util.AbstractCollection;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class u66 implements zvd, awd {
    public mn6 a;
    public final LinkedHashSet b;
    public final int c;

    public u66(AbstractCollection abstractCollection) {
        abstractCollection.isEmpty();
        LinkedHashSet linkedHashSet = new LinkedHashSet(abstractCollection);
        this.b = linkedHashSet;
        this.c = linkedHashSet.hashCode();
    }

    @Override // defpackage.zvd
    public final co1 a() {
        return null;
    }

    @Override // defpackage.zvd
    public final Collection b() {
        return this.b;
    }

    @Override // defpackage.zvd
    public final boolean c() {
        return false;
    }

    @Override // defpackage.zvd
    public final vm6 e() {
        vm6 vm6VarE = ((mn6) this.b.iterator().next()).j0().e();
        vm6VarE.getClass();
        return vm6VarE;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u66)) {
            return false;
        }
        return this.b.equals(((u66) obj).b);
    }

    public final hec f() {
        uvd.b.getClass();
        return pwd.a0(uvd.c, this, ey3.a, false, ek7.y("member scope for intersection type", this.b), new z(15, this));
    }

    public final String g(x45 x45Var) {
        x45Var.getClass();
        return bu1.F0(bu1.f1(this.b, new u23(4, x45Var)), " & ", "{", "}", new rd5(1, x45Var), 24);
    }

    @Override // defpackage.zvd
    public final List getParameters() {
        return ey3.a;
    }

    public final int hashCode() {
        return this.c;
    }

    public final String toString() {
        return g(h06.d);
    }
}
