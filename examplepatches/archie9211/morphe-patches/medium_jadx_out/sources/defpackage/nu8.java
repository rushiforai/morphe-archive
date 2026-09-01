package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nu8 extends zl4 {
    public static final nu8 e;
    public static final nu8 f;
    public static final nu8 g;
    public static final nu8 h;
    public final /* synthetic */ int d;

    static {
        int i = 1;
        e = new nu8(i, 2, 0);
        int i2 = 1;
        f = new nu8(i2, i2, 1);
        g = new nu8(i, 2, 2);
        int i3 = 1;
        h = new nu8(i3, i3, 3);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ nu8(int i, int i2, int i3) {
        super(i, i2, 1, (byte) 0);
        this.d = i3;
    }

    @Override // defpackage.zl4
    public final void c(ym0 ym0Var, x60 x60Var, igc igcVar, l3b l3bVar, kv8 kv8Var) {
        switch (this.d) {
            case 0:
                Object objInvoke = ((m45) ym0Var.i(0)).invoke();
                k65 k65Var = (k65) ym0Var.i(1);
                int iH = ym0Var.h(0);
                k65Var.getClass();
                igcVar.T(igcVar.c(k65Var), objInvoke);
                x60Var.k(iH, objInvoke);
                x60Var.d(objInvoke);
                break;
            case 1:
                k65 k65Var2 = (k65) ym0Var.i(0);
                int iH2 = ym0Var.h(0);
                x60Var.i();
                k65Var2.getClass();
                x60Var.c(iH2, igcVar.C(igcVar.c(k65Var2)));
                break;
            case 2:
                Object objI = ym0Var.i(0);
                k65 k65Var3 = (k65) ym0Var.i(1);
                int iH3 = ym0Var.h(0);
                if (objI instanceof t65) {
                    t65 t65Var = (t65) objI;
                    ((o78) l3bVar.d).b(t65Var);
                    ((g78) l3bVar.g).a(t65Var);
                }
                Object objJ = igcVar.J(igcVar.c(k65Var3), iH3, objI);
                if (objJ instanceof t65) {
                    l3bVar.f((t65) objJ);
                } else if (objJ instanceof mwa) {
                    ((mwa) objJ).d();
                }
                break;
            default:
                Object objI2 = ym0Var.i(0);
                int iH4 = ym0Var.h(0);
                if (objI2 instanceof t65) {
                    t65 t65Var2 = (t65) objI2;
                    ((o78) l3bVar.d).b(t65Var2);
                    ((g78) l3bVar.g).a(t65Var2);
                }
                Object objJ2 = igcVar.J(igcVar.t, iH4, objI2);
                if (objJ2 instanceof t65) {
                    l3bVar.f((t65) objJ2);
                } else if (objJ2 instanceof mwa) {
                    ((mwa) objJ2).d();
                }
                break;
        }
    }

    @Override // defpackage.zl4
    public k65 e(ym0 ym0Var) {
        switch (this.d) {
            case 0:
                return (k65) ym0Var.i(1);
            case 1:
                return (k65) ym0Var.i(0);
            default:
                return super.e(ym0Var);
        }
    }
}
