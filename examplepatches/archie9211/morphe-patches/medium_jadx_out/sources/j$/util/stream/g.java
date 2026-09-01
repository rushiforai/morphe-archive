package j$.util.stream;

import j$.util.Spliterator;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public interface g extends AutoCloseable {
    boolean isParallel();

    Iterator iterator();

    g onClose(Runnable runnable);

    g parallel();

    g sequential();

    Spliterator spliterator();

    g unordered();
}
