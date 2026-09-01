package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import java.util.function.Consumer;
import java.util.function.IntConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class l7 extends a7 implements j$.util.u0 {
    @Override // j$.util.stream.a7
    public final void d() {
        q6 q6Var = new q6();
        this.h = q6Var;
        Objects.requireNonNull(q6Var);
        this.e = this.b.S(new k7(q6Var, 1));
        this.f = new j$.util.n(11, this);
    }

    @Override // j$.util.stream.a7
    public final a7 e(Spliterator spliterator) {
        return new l7(this.b, spliterator, this.a);
    }

    @Override // j$.util.a1
    public final void forEachRemaining(IntConsumer intConsumer) {
        if (this.h != null || this.i) {
            while (tryAdvance(intConsumer)) {
            }
            return;
        }
        Objects.requireNonNull(intConsumer);
        c();
        Objects.requireNonNull(intConsumer);
        k7 k7Var = new k7(intConsumer, 0);
        this.b.R(this.d, k7Var);
        this.i = true;
    }

    @Override // j$.util.a1
    public final boolean tryAdvance(IntConsumer intConsumer) {
        Objects.requireNonNull(intConsumer);
        boolean zA = a();
        if (zA) {
            q6 q6Var = (q6) this.h;
            long j = this.g;
            int iR = q6Var.r(j);
            intConsumer.accept((q6Var.c == 0 && iR == 0) ? ((int[]) q6Var.e)[(int) j] : ((int[][]) q6Var.f)[iR][(int) (j - q6Var.d[iR])]);
        }
        return zA;
    }

    @Override // j$.util.stream.a7, j$.util.Spliterator
    public final j$.util.u0 trySplit() {
        return (j$.util.u0) super.trySplit();
    }

    @Override // j$.util.stream.a7, j$.util.Spliterator
    public final j$.util.a1 trySplit() {
        return (j$.util.u0) super.trySplit();
    }

    @Override // j$.util.stream.a7, j$.util.Spliterator
    public final Spliterator trySplit() {
        return (j$.util.u0) super.trySplit();
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ void forEachRemaining(Consumer consumer) {
        j$.time.a.m(this, consumer);
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ boolean tryAdvance(Consumer consumer) {
        return j$.time.a.C(this, consumer);
    }
}
