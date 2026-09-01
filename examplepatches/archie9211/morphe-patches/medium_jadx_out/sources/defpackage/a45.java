package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class a45 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ub0 b;
    public final /* synthetic */ SourceParameter c;
    public final /* synthetic */ i3c d;
    public final /* synthetic */ i45 e;
    public final /* synthetic */ r28 f;

    public /* synthetic */ a45(ub0 ub0Var, SourceParameter sourceParameter, i3c i3cVar, i45 i45Var, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = ub0Var;
        this.c = sourceParameter;
        this.d = i3cVar;
        this.e = i45Var;
        this.f = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(196609);
                vc2.r(this.b, this.c, this.d, this.e, this.f, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(196609);
                vc2.j(this.b, this.c, this.d, this.e, this.f, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }
}
