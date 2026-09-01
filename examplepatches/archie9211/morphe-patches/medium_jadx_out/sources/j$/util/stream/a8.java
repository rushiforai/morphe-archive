package j$.util.stream;

import j$.util.Spliterator;
import java.util.concurrent.atomic.AtomicLong;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class a8 {
    public final Spliterator a;
    public final boolean b;
    public final long c;
    public final AtomicLong d;

    public a8(Spliterator spliterator, long j, long j2) {
        this.a = spliterator;
        this.b = j2 < 0;
        this.c = j2 >= 0 ? j2 : 0L;
        this.d = new AtomicLong(j2 >= 0 ? j + j2 : j);
    }

    public final long a(long j) {
        long j2;
        boolean z;
        long jMin;
        do {
            j2 = this.d.get();
            z = this.b;
            if (j2 != 0) {
                jMin = Math.min(j2, j);
                if (jMin <= 0) {
                    break;
                }
            } else {
                if (z) {
                    return j;
                }
                return 0L;
            }
        } while (!this.d.compareAndSet(j2, j2 - jMin));
        if (z) {
            return Math.max(j - jMin, 0L);
        }
        long j3 = this.c;
        return j2 > j3 ? Math.max(jMin - (j2 - j3), 0L) : jMin;
    }

    public abstract Spliterator b(Spliterator spliterator);

    public final int characteristics() {
        return this.a.characteristics() & (-16465);
    }

    public final long estimateSize() {
        return this.a.estimateSize();
    }

    public final z7 f() {
        return this.d.get() > 0 ? z7.MAYBE_MORE : this.b ? z7.UNLIMITED : z7.NO_MORE;
    }

    public final Spliterator trySplit() {
        Spliterator spliteratorTrySplit;
        if (this.d.get() == 0 || (spliteratorTrySplit = this.a.trySplit()) == null) {
            return null;
        }
        return b(spliteratorTrySplit);
    }

    /* JADX INFO: renamed from: trySplit, reason: collision with other method in class */
    public /* bridge */ /* synthetic */ j$.util.a1 m116trySplit() {
        return (j$.util.a1) trySplit();
    }

    /* JADX INFO: renamed from: trySplit, reason: collision with other method in class */
    public /* bridge */ /* synthetic */ j$.util.u0 m118trySplit() {
        return (j$.util.u0) trySplit();
    }

    /* JADX INFO: renamed from: trySplit, reason: collision with other method in class */
    public /* bridge */ /* synthetic */ j$.util.x0 m119trySplit() {
        return (j$.util.x0) trySplit();
    }

    /* JADX INFO: renamed from: trySplit, reason: collision with other method in class */
    public /* bridge */ /* synthetic */ j$.util.r0 m117trySplit() {
        return (j$.util.r0) trySplit();
    }

    public a8(Spliterator spliterator, a8 a8Var) {
        this.a = spliterator;
        this.b = a8Var.b;
        this.d = a8Var.d;
        this.c = a8Var.c;
    }
}
