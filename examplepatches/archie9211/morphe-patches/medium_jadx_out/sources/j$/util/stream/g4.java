package j$.util.stream;

import j$.util.Optional;
import java.util.function.BinaryOperator;
import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class g4 implements q4 {
    public boolean a;
    public Object b;
    public final /* synthetic */ BinaryOperator c;

    public g4(BinaryOperator binaryOperator) {
        this.c = binaryOperator;
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final void n(Object obj) {
        if (!this.a) {
            this.b = this.c.apply(this.b, obj);
        } else {
            this.a = false;
            this.b = obj;
        }
    }

    public final /* synthetic */ Consumer andThen(Consumer consumer) {
        return j$.time.a.d(this, consumer);
    }

    @Override // j$.util.stream.l5
    public final void c(long j) {
        this.a = true;
        this.b = null;
    }

    @Override // j$.util.stream.l5
    public final boolean e() {
        return false;
    }

    @Override // java.util.function.Supplier
    public final Object get() {
        return this.a ? Optional.empty() : Optional.of(this.b);
    }

    @Override // j$.util.stream.q4
    public final void i(q4 q4Var) {
        g4 g4Var = (g4) q4Var;
        if (g4Var.a) {
            return;
        }
        n(g4Var.b);
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
