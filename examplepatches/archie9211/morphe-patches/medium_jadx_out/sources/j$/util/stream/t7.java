package j$.util.stream;

import j$.util.Spliterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class t7 {
    public final long a;
    public final long b;
    public Spliterator c;
    public long d;
    public long e;

    public t7(Spliterator spliterator, long j, long j2, long j3, long j4) {
        this.c = spliterator;
        this.a = j;
        this.b = j2;
        this.d = j3;
        this.e = j4;
    }

    public abstract Spliterator a(Spliterator spliterator, long j, long j2, long j3, long j4);

    public final int characteristics() {
        return this.c.characteristics();
    }

    public final long estimateSize() {
        long j = this.e;
        long j2 = this.a;
        if (j2 < j) {
            return j - Math.max(j2, this.d);
        }
        return 0L;
    }

    public final Spliterator trySplit() {
        long j = this.e;
        if (this.a >= j || this.d >= j) {
            return null;
        }
        while (true) {
            Spliterator spliteratorTrySplit = this.c.trySplit();
            if (spliteratorTrySplit == null) {
                return null;
            }
            long jEstimateSize = spliteratorTrySplit.estimateSize() + this.d;
            long jMin = Math.min(jEstimateSize, this.b);
            long j2 = this.a;
            if (j2 >= jMin) {
                this.d = jMin;
            } else {
                long j3 = this.b;
                if (jMin < j3) {
                    long j4 = this.d;
                    if (j4 < j2 || jEstimateSize > j3) {
                        this.d = jMin;
                        return a(spliteratorTrySplit, j2, j3, j4, jMin);
                    }
                    this.d = jMin;
                    return spliteratorTrySplit;
                }
                this.c = spliteratorTrySplit;
                this.e = jMin;
            }
        }
    }

    /* JADX INFO: renamed from: trySplit, reason: collision with other method in class */
    public /* bridge */ /* synthetic */ j$.util.a1 m120trySplit() {
        return (j$.util.a1) trySplit();
    }

    /* JADX INFO: renamed from: trySplit, reason: collision with other method in class */
    public /* bridge */ /* synthetic */ j$.util.u0 m122trySplit() {
        return (j$.util.u0) trySplit();
    }

    /* JADX INFO: renamed from: trySplit, reason: collision with other method in class */
    public /* bridge */ /* synthetic */ j$.util.x0 m123trySplit() {
        return (j$.util.x0) trySplit();
    }

    /* JADX INFO: renamed from: trySplit, reason: collision with other method in class */
    public /* bridge */ /* synthetic */ j$.util.r0 m121trySplit() {
        return (j$.util.r0) trySplit();
    }
}
