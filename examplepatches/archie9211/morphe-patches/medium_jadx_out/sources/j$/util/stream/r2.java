package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import java.util.function.Consumer;
import java.util.function.IntFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class r2 extends i2 {
    @Override // j$.util.stream.g2
    public final void forEach(Consumer consumer) {
        this.a.forEach(consumer);
        this.b.forEach(consumer);
    }

    @Override // j$.util.stream.g2
    public final g2 j(long j, long j2, IntFunction intFunction) {
        if (j == 0 && j2 == this.c) {
            return this;
        }
        long jCount = this.a.count();
        if (j >= jCount) {
            return this.b.j(j - jCount, j2 - jCount, intFunction);
        }
        g2 g2Var = this.a;
        if (j2 <= jCount) {
            return g2Var.j(j, j2, intFunction);
        }
        return v3.E(z6.REFERENCE, g2Var.j(j, jCount, intFunction), this.b.j(0L, j2 - jCount, intFunction));
    }

    @Override // j$.util.stream.g2
    public final void k(Object[] objArr, int i) {
        Objects.requireNonNull(objArr);
        g2 g2Var = this.a;
        g2Var.k(objArr, i);
        this.b.k(objArr, i + ((int) g2Var.count()));
    }

    @Override // j$.util.stream.g2
    public final Object[] m(IntFunction intFunction) {
        long j = this.c;
        if (j >= 2147483639) {
            j$.time.h.c("Stream size exceeds max array size");
            return null;
        }
        Object[] objArr = (Object[]) intFunction.apply((int) j);
        k(objArr, 0);
        return objArr;
    }

    @Override // j$.util.stream.g2
    public final Spliterator spliterator() {
        return new i3(this);
    }

    public final String toString() {
        long j = this.c;
        return j < 32 ? String.format("ConcNode[%s.%s]", this.a, this.b) : String.format("ConcNode[size=%d]", Long.valueOf(j));
    }
}
