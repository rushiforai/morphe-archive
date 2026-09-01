package j$.util.stream;

import j$.util.Spliterator;
import java.util.function.Consumer;
import java.util.function.IntFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class n2 extends q2 implements a2 {
    @Override // j$.util.stream.g2
    public final /* synthetic */ void forEach(Consumer consumer) {
        v3.q(this, consumer);
    }

    @Override // j$.util.stream.g2
    public final /* synthetic */ g2 j(long j, long j2, IntFunction intFunction) {
        return v3.t(this, j, j2);
    }

    @Override // j$.util.stream.g2
    public final /* synthetic */ void k(Object[] objArr, int i) {
        v3.n(this, (Double[]) objArr, i);
    }

    @Override // j$.util.stream.f2
    public final Object newArray(int i) {
        return new double[i];
    }

    @Override // j$.util.stream.g2
    public final j$.util.a1 spliterator() {
        return new e3(this);
    }

    @Override // j$.util.stream.g2
    public final Spliterator spliterator() {
        return new e3(this);
    }
}
