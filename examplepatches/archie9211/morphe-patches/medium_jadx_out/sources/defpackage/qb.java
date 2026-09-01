package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class qb implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ r28 d;

    public /* synthetic */ qb(String str, m45 m45Var, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = str;
        this.c = m45Var;
        this.d = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        r28 r28Var = this.d;
        m45 m45Var = this.c;
        String str = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                t40.d(str, m45Var, r28Var, x12Var, tr7.y(7));
                break;
            case 1:
                yi2.n(str, m45Var, r28Var, x12Var, tr7.y(1));
                break;
            case 2:
                n01.O(str, m45Var, r28Var, x12Var, tr7.y(1));
                break;
            case 3:
                nk7.P(str, m45Var, r28Var, x12Var, tr7.y(1));
                break;
            case 4:
                mk7.d(str, m45Var, r28Var, x12Var, tr7.y(385));
                break;
            default:
                qb8.t(str, m45Var, r28Var, x12Var, tr7.y(385));
                break;
        }
        return c1eVar;
    }
}
