package j$.util.stream;

import j$.util.Spliterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class g1 extends i1 {
    @Override // j$.util.stream.a
    public final boolean M() {
        return true;
    }

    @Override // j$.util.stream.a, j$.util.stream.g
    public final l1 parallel() {
        this.a.k = true;
        return this;
    }

    @Override // j$.util.stream.a, j$.util.stream.g
    public final l1 sequential() {
        this.a.k = false;
        return this;
    }

    @Override // j$.util.stream.a, j$.util.stream.g
    public final /* bridge */ /* synthetic */ Spliterator spliterator() {
        return spliterator();
    }

    @Override // j$.util.stream.g
    public final g unordered() {
        return !y6.ORDERED.k(this.f) ? this : new t(this, y6.r, 4);
    }
}
