package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class m16 extends p4d implements b55 {
    public /* synthetic */ float b;

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        m16 m16Var = new m16(2, n92Var);
        m16Var.b = ((Number) obj).floatValue();
        return m16Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((m16) create(Float.valueOf(((Number) obj).floatValue()), (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        br7.v(obj);
        return Boolean.valueOf(this.b > 0.0f);
    }
}
