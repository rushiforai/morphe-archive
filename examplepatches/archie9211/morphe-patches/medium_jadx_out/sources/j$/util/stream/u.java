package j$.util.stream;

import j$.util.Objects;
import java.util.function.DoubleConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class u extends e5 {
    public boolean b;
    public final j$.util.b0 c;
    public final /* synthetic */ q d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(q qVar, l5 l5Var) {
        super(l5Var);
        this.d = qVar;
        l5 l5Var2 = this.a;
        Objects.requireNonNull(l5Var2);
        this.c = new j$.util.b0(l5Var2, 1);
    }

    @Override // j$.util.stream.i5, j$.util.stream.l5
    public final void accept(double d) throws Exception {
        c0 c0Var = (c0) ((j$.util.n) this.d.m).apply(d);
        if (c0Var != null) {
            try {
                boolean z = this.b;
                j$.util.b0 b0Var = this.c;
                if (z) {
                    j$.util.r0 r0VarSpliterator = c0Var.sequential().spliterator();
                    while (!this.a.e() && r0VarSpliterator.tryAdvance((DoubleConsumer) b0Var)) {
                    }
                } else {
                    c0Var.sequential().forEach(b0Var);
                }
            } catch (Throwable th) {
                try {
                    c0Var.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
                throw th;
            }
        }
        if (c0Var != null) {
            c0Var.close();
        }
    }

    @Override // j$.util.stream.e5, j$.util.stream.l5
    public final void c(long j) {
        this.a.c(-1L);
    }

    @Override // j$.util.stream.e5, j$.util.stream.l5
    public final boolean e() {
        this.b = true;
        return this.a.e();
    }
}
