package j$.util;

import java.util.function.Consumer;
import java.util.function.IntConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class j1 extends j$.time.a implements u0 {
    @Override // j$.util.Spliterator
    public final /* synthetic */ void forEachRemaining(Consumer consumer) {
        j$.time.a.m(this, consumer);
    }

    @Override // j$.util.Spliterator
    public final java.util.Comparator getComparator() {
        throw new IllegalStateException();
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ long getExactSizeIfKnown() {
        return j$.time.a.q(this);
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ boolean hasCharacteristics(int i) {
        return j$.time.a.s(this, i);
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ boolean tryAdvance(Consumer consumer) {
        return j$.time.a.C(this, consumer);
    }

    @Override // j$.time.a, j$.util.a1, j$.util.Spliterator
    public final /* bridge */ /* synthetic */ u0 trySplit() {
        return null;
    }

    @Override // j$.time.a, j$.util.a1, j$.util.Spliterator
    public final /* bridge */ /* synthetic */ a1 trySplit() {
        return null;
    }

    @Override // j$.util.u0
    public final void forEachRemaining(IntConsumer intConsumer) {
        Objects.requireNonNull(intConsumer);
    }

    @Override // j$.util.u0
    public final boolean tryAdvance(IntConsumer intConsumer) {
        Objects.requireNonNull(intConsumer);
        return false;
    }
}
