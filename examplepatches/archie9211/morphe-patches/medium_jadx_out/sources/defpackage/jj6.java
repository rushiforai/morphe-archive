package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class jj6 extends hj6 implements si6, qh6 {
    public static final /* synthetic */ fj6[] j = {n1b.a.g(new u4a(jj6.class, "descriptor", "getDescriptor()Lorg/jetbrains/kotlin/descriptors/PropertyGetterDescriptor;", 0))};
    public final k1b h = no7.y(null, new ij6(this, 0));
    public final vq6 i = vx0.d0(yw6.PUBLICATION, new ij6(this, 1));

    @Override // defpackage.hj6
    public final o4a C() {
        fj6 fj6Var = j[0];
        Object objInvoke = this.h.invoke();
        objInvoke.getClass();
        return (s4a) objInvoke;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof jj6) && g76.L(D(), ((jj6) obj).D());
    }

    @Override // defpackage.rg6
    public final String getName() {
        return ev6.z(new StringBuilder("<get-"), D().i, '>');
    }

    public final int hashCode() {
        return D().hashCode();
    }

    public final String toString() {
        return "getter of " + D();
    }

    @Override // defpackage.vg6
    public final v41 v() {
        return (v41) this.i.getValue();
    }

    @Override // defpackage.vg6
    public final f41 y() {
        fj6 fj6Var = j[0];
        Object objInvoke = this.h.invoke();
        objInvoke.getClass();
        return (s4a) objInvoke;
    }
}
