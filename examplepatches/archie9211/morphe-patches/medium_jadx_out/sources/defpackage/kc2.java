package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class kc2 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ nc2 b;
    public final /* synthetic */ iv2 c;

    public /* synthetic */ kc2(nc2 nc2Var, iv2 iv2Var, int i) {
        this.a = i;
        this.b = nc2Var;
        this.c = iv2Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        iv2 iv2Var = this.c;
        nc2 nc2Var = this.b;
        switch (i) {
            case 0:
                nc2Var.a(iv2Var);
                break;
            default:
                nc2Var.a(iv2Var);
                break;
        }
    }
}
