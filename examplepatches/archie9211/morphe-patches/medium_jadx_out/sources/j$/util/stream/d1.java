package j$.util.stream;

import j$.util.Objects;
import java.util.function.LongConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class d1 extends g5 {
    public boolean b;
    public final j$.util.j0 c;
    public final /* synthetic */ e1 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d1(e1 e1Var, l5 l5Var) {
        super(l5Var);
        this.d = e1Var;
        l5 l5Var2 = this.a;
        Objects.requireNonNull(l5Var2);
        this.c = new j$.util.j0(l5Var2, 1);
    }

    @Override // j$.util.stream.k5, j$.util.stream.l5
    public final void accept(long j) throws Exception {
        l1 l1Var = (l1) ((j$.util.n) this.d.m).apply(j);
        if (l1Var != null) {
            try {
                boolean z = this.b;
                j$.util.j0 j0Var = this.c;
                if (z) {
                    j$.util.x0 x0VarSpliterator = l1Var.sequential().spliterator();
                    while (!this.a.e() && x0VarSpliterator.tryAdvance((LongConsumer) j0Var)) {
                    }
                } else {
                    l1Var.sequential().forEach(j0Var);
                }
            } catch (Throwable th) {
                try {
                    l1Var.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
                throw th;
            }
        }
        if (l1Var != null) {
            l1Var.close();
        }
    }

    @Override // j$.util.stream.g5, j$.util.stream.l5
    public final void c(long j) {
        this.a.c(-1L);
    }

    @Override // j$.util.stream.g5, j$.util.stream.l5
    public final boolean e() {
        this.b = true;
        return this.a.e();
    }
}
