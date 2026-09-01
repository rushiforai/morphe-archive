package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ou6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ru6 b;

    public /* synthetic */ ou6(ru6 ru6Var, int i) {
        this.a = i;
        this.b = ru6Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        int i2 = 0;
        ru6 ru6Var = this.b;
        switch (i) {
            case 0:
                wt6 wt6Var = (wt6) ru6Var.o.invoke();
                int iA = wt6Var.a();
                while (true) {
                    if (i2 >= iA) {
                        i2 = -1;
                    } else if (!wt6Var.c(i2).equals(obj)) {
                        i2++;
                    }
                }
                return Integer.valueOf(i2);
            default:
                int iIntValue = ((Integer) obj).intValue();
                wt6 wt6Var2 = (wt6) ru6Var.o.invoke();
                if (iIntValue < 0 || iIntValue >= wt6Var2.a()) {
                    StringBuilder sbC = ev6.C("Can't scroll to index ", iIntValue, ", it is out of bounds [0, ");
                    sbC.append(wt6Var2.a());
                    sbC.append(')');
                    e26.a(sbC.toString());
                }
                vx0.c0(ru6Var.u0(), null, null, new qu6(ru6Var, iIntValue, null, 0), 3);
                return Boolean.TRUE;
        }
    }
}
