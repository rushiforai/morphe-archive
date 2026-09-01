package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tn3 implements gqe {
    public final k49 a;

    public tn3(k49 k49Var) {
        this.a = k49Var;
    }

    @Override // defpackage.gqe
    public final Object a(i89 i89Var) {
        return this.a.getValue();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof tn3) && this.a == ((tn3) obj).a;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "DynamicValueHolder(state=" + this.a + ')';
    }
}
