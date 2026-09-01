package j$.util.stream;

import java.util.function.Consumer;
import java.util.function.DoubleConsumer;
import java.util.function.ObjDoubleConsumer;
import java.util.function.Supplier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class d4 extends r4 implements q4, i5 {
    public final /* synthetic */ Supplier b;
    public final /* synthetic */ ObjDoubleConsumer c;
    public final /* synthetic */ o d;

    public d4(Supplier supplier, ObjDoubleConsumer objDoubleConsumer, o oVar) {
        this.b = supplier;
        this.c = objDoubleConsumer;
        this.d = oVar;
    }

    @Override // j$.util.stream.l5
    public final void accept(double d) {
        this.c.accept(this.a, d);
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
        this.a = this.d.apply(this.a, ((d4) q4Var).a);
    }

    @Override // j$.util.stream.i5
    public final /* synthetic */ void n(Double d) {
        v3.d(this, d);
    }

    public final /* synthetic */ DoubleConsumer andThen(DoubleConsumer doubleConsumer) {
        return j$.time.a.e(this, doubleConsumer);
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(long j) {
        v3.l();
        throw null;
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final /* bridge */ /* synthetic */ void n(Object obj) {
        n((Double) obj);
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(int i) {
        v3.k();
        throw null;
    }

    @Override // j$.util.stream.l5
    public final void end() {
    }
}
