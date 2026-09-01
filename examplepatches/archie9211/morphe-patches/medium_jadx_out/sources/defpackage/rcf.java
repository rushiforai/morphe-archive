package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class rcf implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ SourceParameter b;
    public final /* synthetic */ ddf c;
    public final /* synthetic */ r28 d;

    public /* synthetic */ rcf(SourceParameter sourceParameter, ddf ddfVar, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = sourceParameter;
        this.c = ddfVar;
        this.d = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        r28 r28Var = this.d;
        ddf ddfVar = this.c;
        SourceParameter sourceParameter = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                flb.F(sourceParameter, ddfVar, r28Var, x12Var, tr7.y(1));
                break;
            default:
                flb.N(sourceParameter, ddfVar, r28Var, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }
}
