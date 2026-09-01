package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class h0 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ r0 b;

    public /* synthetic */ h0(r0 r0Var, int i) {
        this.a = i;
        this.b = r0Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        a43 a43Var;
        int i = this.a;
        r0 r0Var = this.b;
        switch (i) {
            case 0:
                w06 w06Var = (w06) bo.K(r0Var, s06.a);
                if (w06Var == null) {
                    e26.a("clickable only supports IndicationNodeFactory instances provided to LocalIndication, but Indication was provided instead. Either migrate the Indication implementation to implement IndicationNodeFactory, or use the other clickable overload that takes an Indication parameter, and explicitly pass LocalIndication.current there. The Indication instance provided here was: " + w06Var);
                }
                w06 w06Var2 = r0Var.y;
                r0Var.y = w06Var;
                if (w06Var2 != null && !g76.L(w06Var, w06Var2) && ((a43Var = r0Var.B) != null || !r0Var.I)) {
                    if (a43Var != null) {
                        r0Var.J0(a43Var);
                    }
                    r0Var.B = null;
                    r0Var.T0();
                }
                return c1e.a;
            default:
                r0Var.w.invoke();
                return Boolean.TRUE;
        }
    }
}
