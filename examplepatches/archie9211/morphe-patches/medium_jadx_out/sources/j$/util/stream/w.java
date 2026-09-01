package j$.util.stream;

import j$.util.Spliterator;
import java.util.function.DoubleConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class w extends z {
    @Override // j$.util.stream.a
    public final boolean M() {
        throw new UnsupportedOperationException();
    }

    @Override // j$.util.stream.a
    public final l5 N(int i, l5 l5Var) {
        throw new UnsupportedOperationException();
    }

    @Override // j$.util.stream.z, j$.util.stream.c0
    public final void forEach(DoubleConsumer doubleConsumer) {
        if (this.a.k) {
            super.forEach(doubleConsumer);
        } else {
            z.U(P()).forEachRemaining(doubleConsumer);
        }
    }

    @Override // j$.util.stream.z, j$.util.stream.c0
    public final void forEachOrdered(DoubleConsumer doubleConsumer) {
        if (this.a.k) {
            super.forEachOrdered(doubleConsumer);
        } else {
            z.U(P()).forEachRemaining(doubleConsumer);
        }
    }

    @Override // j$.util.stream.a, j$.util.stream.g
    public final c0 parallel() {
        this.a.k = true;
        return this;
    }

    @Override // j$.util.stream.a, j$.util.stream.g
    public final c0 sequential() {
        this.a.k = false;
        return this;
    }

    @Override // j$.util.stream.a, j$.util.stream.g
    public final /* bridge */ /* synthetic */ Spliterator spliterator() {
        return spliterator();
    }

    @Override // j$.util.stream.g
    public final g unordered() {
        return !y6.ORDERED.k(this.f) ? this : new v(this, y6.r, 0);
    }
}
