package j$.util.stream;

import java.util.function.LongConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class h0 extends j0 implements k5 {
    public static final d0 c;
    public static final d0 d;

    static {
        z6 z6Var = z6.LONG_VALUE;
        e0 e0Var = new e0(3);
        e0 e0Var2 = new e0(4);
        j$.util.a0 a0Var = j$.util.a0.c;
        c = new d0(true, z6Var, a0Var, e0Var, e0Var2);
        d = new d0(false, z6Var, a0Var, new e0(3), new e0(4));
    }

    @Override // j$.util.stream.j0, j$.util.stream.l5
    public final void accept(long j) {
        n(Long.valueOf(j));
    }

    public final /* synthetic */ LongConsumer andThen(LongConsumer longConsumer) {
        return j$.time.a.g(this, longConsumer);
    }

    @Override // java.util.function.Supplier
    public final Object get() {
        if (this.a) {
            return new j$.util.a0(((Long) this.b).longValue());
        }
        return null;
    }
}
