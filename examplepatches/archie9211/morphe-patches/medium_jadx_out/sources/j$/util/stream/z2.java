package j$.util.stream;

import java.util.function.IntFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class z2 implements g2 {
    @Override // j$.util.stream.g2
    public g2 a(int i) {
        throw new IndexOutOfBoundsException();
    }

    @Override // j$.util.stream.g2
    public final long count() {
        return 0L;
    }

    @Override // j$.util.stream.g2
    public /* synthetic */ g2 j(long j, long j2, IntFunction intFunction) {
        return v3.w(this, j, j2, intFunction);
    }

    @Override // j$.util.stream.g2
    public final Object[] m(IntFunction intFunction) {
        return (Object[]) intFunction.apply(0);
    }

    @Override // j$.util.stream.g2
    public final int o() {
        return 0;
    }

    public final void g(Object obj) {
    }

    public final void f(int i, Object obj) {
    }
}
