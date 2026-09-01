package j$.util.stream;

import java.util.function.IntConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class g0 extends j0 implements j5 {
    public static final d0 c;
    public static final d0 d;

    static {
        z6 z6Var = z6.INT_VALUE;
        e0 e0Var = new e0(1);
        e0 e0Var2 = new e0(2);
        j$.util.z zVar = j$.util.z.c;
        c = new d0(true, z6Var, zVar, e0Var, e0Var2);
        d = new d0(false, z6Var, zVar, new e0(1), new e0(2));
    }

    @Override // j$.util.stream.j0, j$.util.stream.l5
    public final void accept(int i) {
        n(Integer.valueOf(i));
    }

    public final /* synthetic */ IntConsumer andThen(IntConsumer intConsumer) {
        return j$.time.a.f(this, intConsumer);
    }

    @Override // java.util.function.Supplier
    public final Object get() {
        if (this.a) {
            return new j$.util.z(((Integer) this.b).intValue());
        }
        return null;
    }
}
