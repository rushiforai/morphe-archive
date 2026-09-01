package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class adf implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ adf(aw4 aw4Var, SourceParameter sourceParameter, ddf ddfVar, r28 r28Var, int i) {
        this.c = aw4Var;
        this.d = sourceParameter;
        this.e = ddfVar;
        this.b = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.e;
        Object obj4 = this.d;
        Object obj5 = this.c;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(1);
                flb.L((aw4) obj5, (SourceParameter) obj4, (ddf) obj3, this.b, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(1);
                n01.k((String) obj5, (zm7) obj4, this.b, (ce3) obj3, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ adf(String str, zm7 zm7Var, r28 r28Var, ce3 ce3Var, int i) {
        this.c = str;
        this.d = zm7Var;
        this.b = r28Var;
        this.e = ce3Var;
    }
}
