package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class bi2 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ ah2 b;
    public final /* synthetic */ k95 c;

    public /* synthetic */ bi2(ah2 ah2Var, k95 k95Var, int i) {
        this.a = i;
        this.b = ah2Var;
        this.c = k95Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.a) {
            case 0:
                this.b.onResult(this.c);
                break;
            default:
                this.b.onResult(this.c);
                break;
        }
    }
}
