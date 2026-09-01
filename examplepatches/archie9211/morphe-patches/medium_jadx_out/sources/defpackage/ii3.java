package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ii3 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ji3 b;

    public /* synthetic */ ii3(ji3 ji3Var, int i) {
        this.a = i;
        this.b = ji3Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        ji3 ji3Var = this.b;
        int i2 = 1;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i) {
            case 0:
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    kt7.a(false, pxf.E(1119307883, new ii3(ji3Var, i2), p65Var), p65Var, 48);
                }
                break;
            default:
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var2.S();
                } else {
                    mi3 mi3Var = ji3Var.c.b;
                    vp7.b(mi3Var.a, 0, 0, ((uu1) mi3Var.b.invoke(p65Var2, 0)).a, p65Var2, w2g.E(flb.a0(o28.b, ((uu1) mi3Var.c.invoke(p65Var2, 0)).a, rv8.r), 0.0f, 0.0f, 2));
                }
                break;
        }
        return c1eVar;
    }
}
