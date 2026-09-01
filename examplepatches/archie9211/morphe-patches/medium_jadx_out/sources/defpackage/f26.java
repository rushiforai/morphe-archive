package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class f26 extends cqe {
    public final n98 a;
    public final hkb b;

    public f26(n98 n98Var, hkb hkbVar) {
        hkbVar.getClass();
        this.a = n98Var;
        this.b = hkbVar;
    }

    @Override // defpackage.cqe
    public final boolean a(n98 n98Var) {
        return this.a.equals(n98Var);
    }

    public final String toString() {
        return "InlineClassRepresentation(underlyingPropertyName=" + this.a + ", underlyingType=" + this.b + ')';
    }
}
