package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class l34 extends n34 {
    public final x51 c;
    public final /* synthetic */ p34 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l34(p34 p34Var, long j, x51 x51Var) {
        super(j);
        this.d = p34Var;
        this.c = x51Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.c.D(this.d);
    }

    @Override // defpackage.n34
    public final String toString() {
        return super.toString() + this.c;
    }
}
