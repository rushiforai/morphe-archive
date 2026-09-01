package j$.util.stream;

import java.util.function.DoubleConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class f0 extends j0 implements i5 {
    public static final d0 c;
    public static final d0 d;

    static {
        z6 z6Var = z6.DOUBLE_VALUE;
        j$.time.format.a aVar = new j$.time.format.a(29);
        e0 e0Var = new e0(0);
        j$.util.y yVar = j$.util.y.c;
        c = new d0(true, z6Var, yVar, aVar, e0Var);
        d = new d0(false, z6Var, yVar, new j$.time.format.a(29), new e0(0));
    }

    @Override // j$.util.stream.j0, j$.util.stream.l5
    public final void accept(double d2) {
        n(Double.valueOf(d2));
    }

    public final /* synthetic */ DoubleConsumer andThen(DoubleConsumer doubleConsumer) {
        return j$.time.a.e(this, doubleConsumer);
    }

    @Override // java.util.function.Supplier
    public final Object get() {
        if (this.a) {
            return new j$.util.y(((Double) this.b).doubleValue());
        }
        return null;
    }
}
