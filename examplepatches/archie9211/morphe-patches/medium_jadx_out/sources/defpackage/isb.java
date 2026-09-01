package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class isb implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ msb b;

    public /* synthetic */ isb(msb msbVar, int i) {
        this.a = i;
        this.b = msbVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        msb msbVar = this.b;
        switch (i) {
            case 0:
                return Boolean.valueOf(msbVar.n);
            default:
                es4 es4Var = msbVar.P;
                if (!es4Var.a.n) {
                    return null;
                }
                zr4 zr4VarN0 = es4Var.N0();
                if (!zr4VarN0.getHasFocus()) {
                    return null;
                }
                if (zr4VarN0.isFocused()) {
                    return es4Var.L0(null);
                }
                es4 es4VarF = ((or4) ((mn) flb.w0(es4Var)).getFocusOwner()).f();
                if (es4VarF != null) {
                    return es4VarF.L0(flb.u0(es4Var));
                }
                return null;
        }
    }
}
