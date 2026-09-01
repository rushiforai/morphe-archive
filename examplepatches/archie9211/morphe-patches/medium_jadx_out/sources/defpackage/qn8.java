package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class qn8 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ String b;
    public final /* synthetic */ long c;
    public final /* synthetic */ long d;
    public final /* synthetic */ Object e;

    public /* synthetic */ qn8(String str, long j, long j2, m45 m45Var) {
        this.b = str;
        this.c = j;
        this.d = j2;
        this.e = m45Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.e;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                no7.e(this.b, this.c, this.d, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            default:
                m45 m45Var = (m45) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    r28 r28VarN = bgf.N(jfc.f(o28.b, 32.0f, 0.0f, 2), "explore_starter_pack_" + this.b);
                    amb ambVarA = bmb.a(xn7.M.m180getCornerSizeD9Ej5fM());
                    long j = this.c;
                    f76.s(m45Var, r28VarN, true, ambVarA, h11.d(this.d, 0L, 0L, 0L, p65Var, 14), k40.b(1.0f, j), xn7.S.getContentPadding(), pxf.E(-160822114, new bl0(4, j), p65Var), p65Var, 805503360, 256);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ qn8(String str, long j, long j2, r28 r28Var, int i) {
        this.b = str;
        this.c = j;
        this.d = j2;
        this.e = r28Var;
    }
}
