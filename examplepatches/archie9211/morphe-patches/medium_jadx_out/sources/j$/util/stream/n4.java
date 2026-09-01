package j$.util.stream;

import java.util.function.Consumer;
import java.util.function.IntConsumer;
import java.util.function.ObjIntConsumer;
import java.util.function.Supplier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class n4 extends r4 implements q4, j5 {
    public final /* synthetic */ Supplier b;
    public final /* synthetic */ ObjIntConsumer c;
    public final /* synthetic */ o d;

    public n4(Supplier supplier, ObjIntConsumer objIntConsumer, o oVar) {
        this.b = supplier;
        this.c = objIntConsumer;
        this.d = oVar;
    }

    @Override // j$.util.stream.l5
    public final void accept(int i) {
        this.c.accept(this.a, i);
    }

    public final /* synthetic */ Consumer andThen(Consumer consumer) {
        return j$.time.a.d(this, consumer);
    }

    @Override // j$.util.stream.l5
    public final void c(long j) {
        this.a = this.b.get();
    }

    @Override // j$.util.stream.j5
    public final /* synthetic */ void d(Integer num) {
        v3.g(this, num);
    }

    @Override // j$.util.stream.l5
    public final boolean e() {
        return false;
    }

    @Override // j$.util.stream.q4
    public final void i(q4 q4Var) {
        this.a = this.d.apply(this.a, ((n4) q4Var).a);
    }

    public final /* synthetic */ IntConsumer andThen(IntConsumer intConsumer) {
        return j$.time.a.f(this, intConsumer);
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(long j) {
        v3.l();
        throw null;
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final /* bridge */ /* synthetic */ void n(Object obj) {
        d((Integer) obj);
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
