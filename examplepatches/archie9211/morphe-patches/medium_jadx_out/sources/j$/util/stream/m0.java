package j$.util.stream;

import j$.util.Spliterator;
import java.util.function.DoubleConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class m0 extends q0 implements i5 {
    public final DoubleConsumer b;

    public m0(DoubleConsumer doubleConsumer, boolean z) {
        super(z);
        this.b = doubleConsumer;
    }

    @Override // j$.util.stream.e8
    public final Object a(a aVar, Spliterator spliterator) {
        aVar.R(spliterator, this);
        return null;
    }

    @Override // j$.util.stream.q0, j$.util.stream.l5
    public final void accept(double d) {
        this.b.accept(d);
    }

    public final /* synthetic */ DoubleConsumer andThen(DoubleConsumer doubleConsumer) {
        return j$.time.a.e(this, doubleConsumer);
    }

    @Override // j$.util.stream.e8
    public final /* bridge */ /* synthetic */ Object b(a aVar, Spliterator spliterator) {
        g(aVar, spliterator);
        return null;
    }

    @Override // java.util.function.Supplier
    public final Object get() {
        return null;
    }

    @Override // j$.util.stream.i5
    public final /* synthetic */ void n(Double d) {
        v3.d(this, d);
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final /* bridge */ /* synthetic */ void n(Object obj) {
        n((Double) obj);
    }
}
