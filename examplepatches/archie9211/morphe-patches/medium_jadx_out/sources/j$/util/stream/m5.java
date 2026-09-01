package j$.util.stream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class m5 extends h5 {
    public long b;
    public long c;
    public final /* synthetic */ n5 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m5(n5 n5Var, l5 l5Var) {
        super(l5Var);
        this.d = n5Var;
        this.b = n5Var.l;
        long j = n5Var.m;
        this.c = j < 0 ? Long.MAX_VALUE : j;
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final void n(Object obj) {
        long j = this.b;
        if (j != 0) {
            this.b = j - 1;
            return;
        }
        long j2 = this.c;
        if (j2 > 0) {
            this.c = j2 - 1;
            this.a.n(obj);
        }
    }

    @Override // j$.util.stream.h5, j$.util.stream.l5
    public final void c(long j) {
        this.a.c(v3.y(j, this.d.l, this.c));
    }

    @Override // j$.util.stream.h5, j$.util.stream.l5
    public final boolean e() {
        return this.c == 0 || this.a.e();
    }
}
