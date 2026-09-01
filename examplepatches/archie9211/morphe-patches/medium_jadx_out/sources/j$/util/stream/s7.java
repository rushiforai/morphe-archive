package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import java.util.Comparator;
import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class s7 extends t7 implements Spliterator {
    public s7(Spliterator spliterator, long j, long j2) {
        super(spliterator, j, j2, 0L, Math.min(spliterator.estimateSize(), j2));
    }

    @Override // j$.util.stream.t7
    public final Spliterator a(Spliterator spliterator, long j, long j2, long j3, long j4) {
        return new s7(spliterator, j, j2, j3, j4);
    }

    @Override // j$.util.Spliterator
    public final void forEachRemaining(Consumer consumer) {
        Objects.requireNonNull(consumer);
        long j = this.e;
        long j2 = this.a;
        if (j2 >= j) {
            return;
        }
        long j3 = this.d;
        if (j3 >= j) {
            return;
        }
        if (j3 >= j2 && this.c.estimateSize() + j3 <= this.b) {
            this.c.forEachRemaining(consumer);
            this.d = this.e;
            return;
        }
        while (j2 > this.d) {
            this.c.tryAdvance(new u1(14));
            this.d++;
        }
        while (this.d < this.e) {
            this.c.tryAdvance(consumer);
            this.d++;
        }
    }

    @Override // j$.util.Spliterator
    public final Comparator getComparator() {
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
    public final boolean tryAdvance(Consumer consumer) {
        long j;
        Objects.requireNonNull(consumer);
        long j2 = this.e;
        long j3 = this.a;
        if (j3 >= j2) {
            return false;
        }
        while (true) {
            j = this.d;
            if (j3 <= j) {
                break;
            }
            this.c.tryAdvance(new u1(13));
            this.d++;
        }
        if (j >= this.e) {
            return false;
        }
        this.d = j + 1;
        return this.c.tryAdvance(consumer);
    }
}
