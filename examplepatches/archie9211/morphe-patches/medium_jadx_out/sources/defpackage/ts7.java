package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ts7 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ l78 b;

    public /* synthetic */ ts7(l78 l78Var, int i) {
        this.a = i;
        this.b = l78Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        l78 l78Var = this.b;
        switch (i) {
            case 0:
                zr4 zr4Var = (zr4) obj;
                zr4Var.getClass();
                l78Var.setValue(Boolean.valueOf(zr4Var.getHasFocus()));
                break;
            case 1:
                zr4 zr4Var2 = (zr4) obj;
                zr4Var2.getClass();
                l78Var.setValue(Boolean.valueOf(zr4Var2.getHasFocus()));
                break;
            case 2:
                zr4 zr4Var3 = (zr4) obj;
                zr4Var3.getClass();
                l78Var.setValue(Boolean.valueOf(zr4Var3.isFocused()));
                break;
            default:
                zr4 zr4Var4 = (zr4) obj;
                zr4Var4.getClass();
                l78Var.setValue(Boolean.valueOf(zr4Var4.isFocused()));
                break;
        }
        return c1eVar;
    }
}
