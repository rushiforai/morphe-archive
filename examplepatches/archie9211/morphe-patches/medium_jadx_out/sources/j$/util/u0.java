package j$.util;

import java.util.function.IntConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public interface u0 extends a1 {
    void forEachRemaining(IntConsumer intConsumer);

    boolean tryAdvance(IntConsumer intConsumer);

    @Override // j$.util.a1, j$.util.Spliterator
    u0 trySplit();
}
