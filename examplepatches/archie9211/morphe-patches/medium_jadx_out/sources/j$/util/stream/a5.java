package j$.util.stream;

import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class a5 extends d5 {
    @Override // j$.util.stream.a
    public final boolean M() {
        throw new UnsupportedOperationException();
    }

    @Override // j$.util.stream.a
    public final l5 N(int i, l5 l5Var) {
        throw new UnsupportedOperationException();
    }

    @Override // j$.util.stream.d5, j$.util.stream.Stream
    public final void forEach(Consumer consumer) {
        if (this.a.k) {
            super.forEach(consumer);
        } else {
            P().forEachRemaining(consumer);
        }
    }

    @Override // j$.util.stream.d5, j$.util.stream.Stream
    public final void forEachOrdered(Consumer consumer) {
        if (this.a.k) {
            super.forEachOrdered(consumer);
        } else {
            P().forEachRemaining(consumer);
        }
    }

    @Override // j$.util.stream.g
    public final g unordered() {
        return !y6.ORDERED.k(this.f) ? this : new z4(this, y6.r);
    }
}
