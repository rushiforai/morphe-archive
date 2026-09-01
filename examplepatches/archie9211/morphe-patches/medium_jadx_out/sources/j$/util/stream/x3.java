package j$.util.stream;

import java.util.function.Consumer;
import java.util.function.LongConsumer;
import java.util.function.ObjLongConsumer;
import java.util.function.Supplier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class x3 extends r4 implements q4, k5 {
    public final /* synthetic */ Supplier b;
    public final /* synthetic */ ObjLongConsumer c;
    public final /* synthetic */ o d;

    public x3(Supplier supplier, ObjLongConsumer objLongConsumer, o oVar) {
        this.b = supplier;
        this.c = objLongConsumer;
        this.d = oVar;
    }

    @Override // j$.util.stream.l5
    public final void accept(long j) {
        this.c.accept(this.a, j);
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
        this.a = this.d.apply(this.a, ((x3) q4Var).a);
    }

    @Override // j$.util.stream.k5
    public final /* synthetic */ void l(Long l) {
        v3.i(this, l);
    }

    public final /* synthetic */ LongConsumer andThen(LongConsumer longConsumer) {
        return j$.time.a.g(this, longConsumer);
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(int i) {
        v3.k();
        throw null;
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final /* bridge */ /* synthetic */ void n(Object obj) {
        l((Long) obj);
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
