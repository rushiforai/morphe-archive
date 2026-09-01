package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class v61 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ long c;

    public /* synthetic */ v61(sw5 sw5Var, long j, int i) {
        this.a = i;
        this.b = sw5Var;
        this.c = j;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        String alt;
        int i = this.a;
        o28 o28Var = o28.b;
        c1e c1eVar = c1e.a;
        long j = this.c;
        Object obj3 = this.b;
        switch (i) {
            case 0:
                sw5 sw5Var = (sw5) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    alt = sw5Var != null ? sw5Var.getAlt() : null;
                    rh4 rh4Var = jfc.a;
                    ur7.b(sw5Var, alt, bgf.N(r40.y(jfc.m(o28Var, yj3.b(j), yj3.a(j)), bmb.a(2.0f)), "repost_story_image"), null, null, vn7.J(2131231256, 0, p65Var), null, null, null, null, p65Var, 262144, 6, 31704);
                }
                break;
            case 1:
                sw5 sw5Var2 = (sw5) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    alt = sw5Var2 != null ? sw5Var2.getAlt() : null;
                    rh4 rh4Var2 = jfc.a;
                    ur7.b(sw5Var2, alt, bgf.N(r40.y(jfc.m(o28Var, yj3.b(j), yj3.a(j)), bmb.a(2.0f)), "repost_story_image"), null, null, vn7.J(2131231256, 0, p65Var2), null, null, null, null, p65Var2, 262144, 6, 31704);
                }
                break;
            case 2:
                ((Integer) obj2).getClass();
                bo.c((sw5) obj3, j, (x12) obj, tr7.y(1));
                break;
            default:
                ((Integer) obj2).getClass();
                vo7.a((mn4) obj3, j, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ v61(Object obj, long j, int i, int i2) {
        this.a = i2;
        this.b = obj;
        this.c = j;
    }
}
