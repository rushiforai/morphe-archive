package j$.util.stream;

import java.util.function.Consumer;
import java.util.function.DoubleBinaryOperator;
import java.util.function.DoubleConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class b4 implements q4, i5 {
    public boolean a;
    public double b;
    public final /* synthetic */ DoubleBinaryOperator c;

    public b4(DoubleBinaryOperator doubleBinaryOperator) {
        this.c = doubleBinaryOperator;
    }

    @Override // j$.util.stream.l5
    public final void accept(double d) {
        if (!this.a) {
            this.b = this.c.applyAsDouble(this.b, d);
        } else {
            this.a = false;
            this.b = d;
        }
    }

    public final /* synthetic */ Consumer andThen(Consumer consumer) {
        return j$.time.a.d(this, consumer);
    }

    @Override // j$.util.stream.l5
    public final void c(long j) {
        this.a = true;
        this.b = 0.0d;
    }

    @Override // j$.util.stream.l5
    public final boolean e() {
        return false;
    }

    @Override // java.util.function.Supplier
    public final Object get() {
        return this.a ? j$.util.y.c : new j$.util.y(this.b);
    }

    @Override // j$.util.stream.q4
    public final void i(q4 q4Var) {
        b4 b4Var = (b4) q4Var;
        if (b4Var.a) {
            return;
        }
        accept(b4Var.b);
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
