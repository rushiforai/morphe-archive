package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f32 implements gqe {
    public final x45 a;

    public f32(x45 x45Var) {
        this.a = x45Var;
    }

    @Override // defpackage.gqe
    public final Object a(i89 i89Var) {
        return this.a.invoke(i89Var);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof f32) && this.a.equals(((f32) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "ComputedValueHolder(compute=" + this.a + ')';
    }
}
