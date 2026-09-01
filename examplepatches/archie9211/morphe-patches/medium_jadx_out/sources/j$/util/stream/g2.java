package j$.util.stream;

import j$.util.Spliterator;
import java.util.function.Consumer;
import java.util.function.IntFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public interface g2 {
    g2 a(int i);

    long count();

    void forEach(Consumer consumer);

    g2 j(long j, long j2, IntFunction intFunction);

    void k(Object[] objArr, int i);

    Object[] m(IntFunction intFunction);

    int o();

    Spliterator spliterator();
}
