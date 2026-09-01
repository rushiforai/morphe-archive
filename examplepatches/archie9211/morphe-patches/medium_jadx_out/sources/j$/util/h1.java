package j$.util;

import java.util.function.Consumer;
import java.util.function.DoubleConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class h1 implements r0 {
    public final double[] a;
    public int b;
    public final int c;
    public final int d;

    public h1(double[] dArr, int i, int i2, int i3) {
        this.a = dArr;
        this.b = i;
        this.c = i2;
        this.d = i3 | 16448;
    }

    @Override // j$.util.Spliterator
    public final int characteristics() {
        return this.d;
    }

    @Override // j$.util.Spliterator
    public final long estimateSize() {
        return this.c - this.b;
    }

    @Override // j$.util.a1
    public final void forEachRemaining(DoubleConsumer doubleConsumer) {
        int i;
        doubleConsumer.getClass();
        double[] dArr = this.a;
        int length = dArr.length;
        int i2 = this.c;
        if (length < i2 || (i = this.b) < 0) {
            return;
        }
        this.b = i2;
        if (i < i2) {
            do {
                doubleConsumer.accept(dArr[i]);
                i++;
            } while (i < i2);
        }
    }

    @Override // j$.util.Spliterator
    public final java.util.Comparator getComparator() {
        if (j$.time.a.s(this, 4)) {
            return null;
        }
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

    @Override // j$.util.a1
    public final boolean tryAdvance(DoubleConsumer doubleConsumer) {
        doubleConsumer.getClass();
        int i = this.b;
        if (i < 0 || i >= this.c) {
            return false;
        }
        this.b = i + 1;
        doubleConsumer.accept(this.a[i]);
        return true;
    }

    @Override // j$.util.a1, j$.util.Spliterator
    public final r0 trySplit() {
        int i = this.b;
        int i2 = (this.c + i) >>> 1;
        if (i >= i2) {
            return null;
        }
        this.b = i2;
        return new h1(this.a, i, i2, this.d);
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ boolean tryAdvance(Consumer consumer) {
        return j$.time.a.B(this, consumer);
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ void forEachRemaining(Consumer consumer) {
        j$.time.a.l(this, consumer);
    }
}
