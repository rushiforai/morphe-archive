package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class jy1 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ xy1 b;

    public /* synthetic */ jy1(xy1 xy1Var, int i) {
        this.a = i;
        this.b = xy1Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        xy1 xy1Var = this.b;
        switch (i) {
            case 0:
                xy1Var.invalidateMenu();
                break;
            default:
                xy1.l(xy1Var);
                break;
        }
    }
}
