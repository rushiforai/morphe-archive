package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class qo implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ long c;
    public final /* synthetic */ Object d;

    public /* synthetic */ qo(long j, nx0 nx0Var, mz1 mz1Var, int i) {
        this.a = 3;
        this.c = j;
        this.d = nx0Var;
        this.b = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.b;
        Object obj4 = this.d;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                to.a((lp8) obj4, (r28) obj3, this.c, (x12) obj, tr7.y(1));
                break;
            case 1:
                ((Integer) obj2).getClass();
                f76.f((hl0) obj4, (r28) obj3, this.c, (x12) obj, tr7.y(1));
                break;
            case 2:
                ((Integer) obj2).getClass();
                s42.w((oe1) obj4, this.c, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 3:
                ((Integer) obj2).getClass();
                vn7.c(this.c, (nx0) obj4, (mz1) obj3, (x12) obj, tr7.y(24631));
                break;
            default:
                jhc jhcVar = (jhc) obj4;
                String str = (String) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    ay2 ay2VarB = i11.b(this.c, p65Var, 5);
                    boolean zH = p65Var.h(jhcVar);
                    Object objM = p65Var.M();
                    if (zH || objM == w12.a) {
                        objM = new dhc(jhcVar, 1);
                        p65Var.j0(objM);
                    }
                    g76.H((m45) objM, null, false, null, ay2VarB, null, pxf.E(-929149933, new ba1(str, 3), p65Var), p65Var, 805306368, 382);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ qo(long j, jhc jhcVar, String str) {
        this.a = 4;
        this.c = j;
        this.d = jhcVar;
        this.b = str;
    }

    public /* synthetic */ qo(oe1 oe1Var, long j, r28 r28Var, int i) {
        this.a = 2;
        this.d = oe1Var;
        this.c = j;
        this.b = r28Var;
    }

    public /* synthetic */ qo(Object obj, r28 r28Var, long j, int i, int i2) {
        this.a = i2;
        this.d = obj;
        this.b = r28Var;
        this.c = j;
    }
}
