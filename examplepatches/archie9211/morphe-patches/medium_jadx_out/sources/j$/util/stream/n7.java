package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import java.util.function.Consumer;
import java.util.function.LongConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class n7 extends a7 implements j$.util.x0 {
    @Override // j$.util.stream.a7
    public final void d() {
        s6 s6Var = new s6();
        this.h = s6Var;
        Objects.requireNonNull(s6Var);
        this.e = this.b.S(new m7(s6Var, 1));
        this.f = new j$.util.n(12, this);
    }

    @Override // j$.util.stream.a7
    public final a7 e(Spliterator spliterator) {
        return new n7(this.b, spliterator, this.a);
    }

    @Override // j$.util.a1
    public final void forEachRemaining(LongConsumer longConsumer) {
        if (this.h != null || this.i) {
            while (tryAdvance(longConsumer)) {
            }
            return;
        }
        Objects.requireNonNull(longConsumer);
        c();
        Objects.requireNonNull(longConsumer);
        m7 m7Var = new m7(longConsumer, 0);
        this.b.R(this.d, m7Var);
        this.i = true;
    }

    @Override // j$.util.a1
    public final boolean tryAdvance(LongConsumer longConsumer) {
        Objects.requireNonNull(longConsumer);
        boolean zA = a();
        if (zA) {
            s6 s6Var = (s6) this.h;
            long j = this.g;
            int iR = s6Var.r(j);
            longConsumer.accept((s6Var.c == 0 && iR == 0) ? ((long[]) s6Var.e)[(int) j] : ((long[][]) s6Var.f)[iR][(int) (j - s6Var.d[iR])]);
        }
        return zA;
    }

    @Override // j$.util.stream.a7, j$.util.Spliterator
    public final j$.util.x0 trySplit() {
        return (j$.util.x0) super.trySplit();
    }

    @Override // j$.util.stream.a7, j$.util.Spliterator
    public final j$.util.a1 trySplit() {
        return (j$.util.x0) super.trySplit();
    }

    @Override // j$.util.stream.a7, j$.util.Spliterator
    public final Spliterator trySplit() {
        return (j$.util.x0) super.trySplit();
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ void forEachRemaining(Consumer consumer) {
        j$.time.a.n(this, consumer);
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ boolean tryAdvance(Consumer consumer) {
        return j$.time.a.D(this, consumer);
    }
}
