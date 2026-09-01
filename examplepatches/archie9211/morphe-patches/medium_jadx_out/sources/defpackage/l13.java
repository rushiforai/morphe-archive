package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l13 implements g00 {
    public final /* synthetic */ int a;

    public /* synthetic */ l13(int i) {
        this.a = i;
    }

    @Override // defpackage.g00
    public final bo4 a(h00 h00Var, ad adVar) {
        int i = this.a;
        int i2 = 0;
        int i3 = 12;
        n92 n92Var = null;
        h00Var.getClass();
        switch (i) {
            case 0:
                Boolean bool = h00Var.k;
                boolean zBooleanValue = bool != null ? bool.booleanValue() : false;
                Boolean bool2 = h00Var.j;
                boolean zBooleanValue2 = bool2 != null ? bool2.booleanValue() : false;
                if (zBooleanValue || zBooleanValue2) {
                    pya pyaVar = new pya();
                }
                break;
            case 4:
                h00 h00VarD = h00Var.d();
                h00VarD.b(new pd4());
                break;
        }
        return adVar.n(h00Var);
    }
}
