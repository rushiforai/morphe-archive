package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class i33 implements uue {
    public static final i33 b = new i33(0);
    public static i33 c;
    public final /* synthetic */ int a;

    public /* synthetic */ i33(int i) {
        this.a = i;
    }

    @Override // defpackage.uue
    public que a(Class cls) {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException("`Factory.create(String, CreationExtras)` is not implemented. You may need to override the method and provide a custom implementation. Note that using `Factory.create(String)` is not supported and considered an error.");
            case 1:
                return new i25(true);
            case 2:
                return new q57();
            case 3:
                throw new UnsupportedOperationException("`Factory.create(String, CreationExtras)` is not implemented. You may need to override the method and provide a custom implementation. Note that using `Factory.create(String)` is not supported and considered an error.");
            default:
                return vc2.E(cls);
        }
    }

    @Override // defpackage.uue
    public que b(Class cls, g68 g68Var) {
        switch (this.a) {
            case 0:
                a(cls);
                throw null;
            case 1:
                return a(cls);
            case 2:
                return a(cls);
            case 3:
                a(cls);
                throw null;
            default:
                return a(cls);
        }
    }

    @Override // defpackage.uue
    public final que c(wg6 wg6Var, g68 g68Var) {
        switch (this.a) {
            case 0:
                wg6Var.getClass();
                return vc2.E(vx0.T(wg6Var));
            case 1:
                return wgd.a(this, wg6Var, g68Var);
            case 2:
                return wgd.a(this, wg6Var, g68Var);
            case 3:
                wg6Var.getClass();
                return new bpb();
            default:
                wg6Var.getClass();
                return b(vx0.T(wg6Var), g68Var);
        }
    }
}
