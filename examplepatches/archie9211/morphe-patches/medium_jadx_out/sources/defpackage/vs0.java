package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vs0 extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vs0(int i, boolean z) {
        super(1);
        this.a = i;
        this.b = z;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        nr5 nr5Var = rv8.r;
        tjb tjbVar = (tjb) obj;
        float fB = tjbVar.s.b() * 20.0f;
        float fB2 = tjbVar.s.b() * 20.0f;
        tjbVar.g((fB <= 0.0f || fB2 <= 0.0f) ? null : new ts0(fB, fB2, this.a));
        tjbVar.n(nr5Var);
        tjbVar.e(this.b);
        return c1e.a;
    }
}
