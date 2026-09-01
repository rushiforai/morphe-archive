package j$.util.stream;

import java.util.function.BiConsumer;
import java.util.function.BinaryOperator;
import java.util.function.Consumer;
import java.util.function.Supplier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class i4 extends r4 implements q4 {
    public final /* synthetic */ Supplier b;
    public final /* synthetic */ BiConsumer c;
    public final /* synthetic */ BinaryOperator d;

    public i4(Supplier supplier, BiConsumer biConsumer, BinaryOperator binaryOperator) {
        this.b = supplier;
        this.c = biConsumer;
        this.d = binaryOperator;
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final void n(Object obj) {
        this.c.accept(this.a, obj);
    }

    public final /* synthetic */ Consumer andThen(Consumer consumer) {
        return j$.time.a.d(this, consumer);
    }

    @Override // j$.util.stream.l5
    public final void c(long j) {
        this.a = this.b.get();
    }

    @Override // j$.util.stream.l5
    public final boolean e() {
        return false;
    }

    @Override // j$.util.stream.q4
    public final void i(q4 q4Var) {
        this.a = this.d.apply(this.a, ((i4) q4Var).a);
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(int i) {
        v3.k();
        throw null;
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(long j) {
        v3.l();
        throw null;
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(double d) {
        v3.c();
        throw null;
    }

    @Override // j$.util.stream.l5
    public final void end() {
    }
}
