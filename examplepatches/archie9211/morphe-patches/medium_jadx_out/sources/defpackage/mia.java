package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class mia implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ pia b;
    public final /* synthetic */ nla c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ int e;

    public /* synthetic */ mia(pia piaVar, nla nlaVar, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = piaVar;
        this.c = nlaVar;
        this.d = r28Var;
        this.e = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.e;
        r28 r28Var = this.d;
        nla nlaVar = this.c;
        pia piaVar = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                ek7.b(piaVar, nlaVar, r28Var, x12Var, tr7.y(i2 | 1));
                break;
            case 1:
                ek7.e(piaVar, nlaVar, r28Var, x12Var, tr7.y(i2 | 1));
                break;
            case 2:
                ek7.b(piaVar, nlaVar, r28Var, x12Var, tr7.y(i2 | 1));
                break;
            case 3:
                ek7.d(piaVar, nlaVar, r28Var, x12Var, tr7.y(i2 | 1));
                break;
            case 4:
                ek7.d(piaVar, nlaVar, r28Var, x12Var, tr7.y(i2 | 1));
                break;
            default:
                ek7.o(piaVar, nlaVar, r28Var, x12Var, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }
}
