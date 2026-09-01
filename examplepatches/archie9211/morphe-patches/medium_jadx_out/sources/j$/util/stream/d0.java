package j$.util.stream;

import j$.util.Spliterator;
import java.util.function.Predicate;
import java.util.function.Supplier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class d0 implements e8 {
    public final int a;
    public final Object b;
    public final Predicate c;
    public final Supplier d;

    public d0(boolean z, z6 z6Var, Object obj, Predicate predicate, Supplier supplier) {
        this.a = (z ? 0 : y6.r) | y6.u;
        this.b = obj;
        this.c = predicate;
        this.d = supplier;
    }

    @Override // j$.util.stream.e8
    public final Object a(a aVar, Spliterator spliterator) {
        f8 f8Var = (f8) this.d.get();
        aVar.R(spliterator, f8Var);
        Object obj = f8Var.get();
        return obj != null ? obj : this.b;
    }

    @Override // j$.util.stream.e8
    public final Object b(a aVar, Spliterator spliterator) {
        return new k0(this, y6.ORDERED.k(aVar.f), aVar, spliterator).invoke();
    }

    @Override // j$.util.stream.e8
    public final int f() {
        return this.a;
    }
}
