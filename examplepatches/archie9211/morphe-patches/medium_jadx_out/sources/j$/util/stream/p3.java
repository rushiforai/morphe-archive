package j$.util.stream;

import j$.util.Spliterator;
import java.util.function.LongConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class p3 extends r3 implements k5 {
    public final long[] h;

    public p3(p3 p3Var, Spliterator spliterator, long j, long j2) {
        super(p3Var, spliterator, j, j2, p3Var.h.length);
        this.h = p3Var.h;
    }

    @Override // j$.util.stream.r3
    public final r3 a(Spliterator spliterator, long j, long j2) {
        return new p3(this, spliterator, j, j2);
    }

    @Override // j$.util.stream.r3, j$.util.stream.l5
    public final void accept(long j) {
        int i = this.f;
        if (i >= this.g) {
            throw new IndexOutOfBoundsException(Integer.toString(i));
        }
        long[] jArr = this.h;
        this.f = i + 1;
        jArr[i] = j;
    }

    public final /* synthetic */ LongConsumer andThen(LongConsumer longConsumer) {
        return j$.time.a.g(this, longConsumer);
    }

    @Override // j$.util.stream.k5
    public final /* synthetic */ void l(Long l) {
        v3.i(this, l);
    }

    public p3(Spliterator spliterator, a aVar, long[] jArr) {
        super(spliterator, aVar, jArr.length);
        this.h = jArr;
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final /* bridge */ /* synthetic */ void n(Object obj) {
        l((Long) obj);
    }
}
