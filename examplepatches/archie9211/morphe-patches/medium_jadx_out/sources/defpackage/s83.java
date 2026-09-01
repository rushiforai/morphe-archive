package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class s83 implements m45 {
    public final /* synthetic */ int a;
    public final w83 b;
    public final vm6 c;

    public /* synthetic */ s83(w83 w83Var, vm6 vm6Var, int i) {
        this.a = i;
        this.b = w83Var;
        this.c = vm6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        vm6 vm6Var = this.c;
        w83 w83Var = this.b;
        switch (i) {
            case 0:
                eo1 eo1VarO = w83Var.o();
                y28 y28VarJ = vm6Var.j(lnc.C);
                if (y28VarJ != null) {
                    return muc.v0(eo1VarO.b(y28VarJ, w83Var), "Collection");
                }
                vm6.a(35);
                throw null;
            default:
                return muc.v0(w83Var.o().b(vm6Var.k("Array"), w83Var), "Array");
        }
    }
}
