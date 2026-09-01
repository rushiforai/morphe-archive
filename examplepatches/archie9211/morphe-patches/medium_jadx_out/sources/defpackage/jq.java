package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class jq implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ m78 b;
    public final /* synthetic */ l78 c;
    public final /* synthetic */ yrb d;
    public final /* synthetic */ r28 e;
    public final /* synthetic */ mz1 f;

    public /* synthetic */ jq(m78 m78Var, l78 l78Var, yrb yrbVar, r28 r28Var, mz1 mz1Var) {
        this.b = m78Var;
        this.c = l78Var;
        this.d = yrbVar;
        this.e = r28Var;
        this.f = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    yo7.b(this.b, this.c, this.d, this.e, this.f, p65Var, 48);
                }
                break;
            default:
                ((Integer) obj2).getClass();
                yo7.b(this.b, this.c, this.d, this.e, this.f, (x12) obj, tr7.y(49));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ jq(m78 m78Var, l78 l78Var, yrb yrbVar, r28 r28Var, mz1 mz1Var, int i) {
        this.b = m78Var;
        this.c = l78Var;
        this.d = yrbVar;
        this.e = r28Var;
        this.f = mz1Var;
    }
}
