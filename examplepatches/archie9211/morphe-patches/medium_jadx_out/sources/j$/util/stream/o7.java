package j$.util.stream;

import j$.util.Spliterator;
import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class o7 extends r7 implements j$.util.r0 {
    @Override // j$.util.stream.t7
    public final Spliterator a(Spliterator spliterator, long j, long j2, long j3, long j4) {
        return new o7((j$.util.r0) spliterator, j, j2, j3, j4);
    }

    @Override // j$.util.stream.r7
    public final Object b() {
        return new z1(1);
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ void forEachRemaining(Consumer consumer) {
        j$.time.a.l(this, consumer);
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ boolean tryAdvance(Consumer consumer) {
        return j$.time.a.B(this, consumer);
    }
}
