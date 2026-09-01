package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import java.util.function.BiConsumer;
import java.util.function.IntFunction;
import java.util.function.LongBinaryOperator;
import java.util.function.LongConsumer;
import java.util.function.LongFunction;
import java.util.function.ObjLongConsumer;
import java.util.function.Supplier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class i1 extends a implements l1 {
    public static j$.util.x0 U(Spliterator spliterator) {
        if (spliterator instanceof j$.util.x0) {
            return (j$.util.x0) spliterator;
        }
        if (!g8.a) {
            throw new UnsupportedOperationException("LongStream.adapt(Spliterator<Long> s)");
        }
        g8.a(a.class, "using LongStream.adapt(Spliterator<Long> s)");
        throw null;
    }

    @Override // j$.util.stream.a
    public final g2 F(a aVar, Spliterator spliterator, boolean z, IntFunction intFunction) {
        return v3.D(aVar, spliterator, z);
    }

    @Override // j$.util.stream.a
    public final boolean H(Spliterator spliterator, l5 l5Var) {
        LongConsumer j0Var;
        boolean zE;
        j$.util.x0 x0VarU = U(spliterator);
        if (l5Var instanceof LongConsumer) {
            j0Var = (LongConsumer) l5Var;
        } else {
            if (g8.a) {
                g8.a(a.class, "using LongStream.adapt(Sink<Long> s)");
                throw null;
            }
            Objects.requireNonNull(l5Var);
            j0Var = new j$.util.j0(l5Var, 1);
        }
        do {
            zE = l5Var.e();
            if (zE) {
                break;
            }
        } while (x0VarU.tryAdvance(j0Var));
        return zE;
    }

    @Override // j$.util.stream.a
    public final z6 I() {
        return z6.LONG_VALUE;
    }

    @Override // j$.util.stream.a
    public final y1 J(long j, IntFunction intFunction) {
        return v3.O(j);
    }

    @Override // j$.util.stream.a
    public final Spliterator Q(a aVar, Supplier supplier, boolean z) {
        return new n7(aVar, supplier, z);
    }

    @Override // j$.util.stream.l1
    public final l1 a() {
        int i = v8.a;
        Objects.requireNonNull(null);
        return new f6(this, v8.a, 1);
    }

    @Override // j$.util.stream.l1
    public final c0 asDoubleStream() {
        return new v(this, y6.n, 4);
    }

    @Override // j$.util.stream.l1
    public final j$.util.y average() {
        long j = ((long[]) collect(new e0(23), new e0(24), new e0(25)))[0];
        return j > 0 ? new j$.util.y(r4[1] / j) : j$.util.y.c;
    }

    @Override // j$.util.stream.l1
    public final l1 b(j$.util.n nVar) {
        Objects.requireNonNull(nVar);
        return new e1(this, y6.p | y6.n | y6.t, nVar, 0);
    }

    @Override // j$.util.stream.l1
    public final Stream boxed() {
        return new p(this, 0, new e0(22), 2);
    }

    @Override // j$.util.stream.l1
    public final l1 c() {
        Objects.requireNonNull(null);
        return new t(this, y6.t, 5);
    }

    @Override // j$.util.stream.l1
    public final Object collect(Supplier supplier, ObjLongConsumer objLongConsumer, BiConsumer biConsumer) {
        Objects.requireNonNull(biConsumer);
        o oVar = new o(biConsumer, 2);
        Objects.requireNonNull(supplier);
        Objects.requireNonNull(objLongConsumer);
        Objects.requireNonNull(oVar);
        return D(new a4(z6.LONG_VALUE, oVar, objLongConsumer, supplier, 0));
    }

    @Override // j$.util.stream.l1
    public final long count() {
        return ((Long) D(new c4(0))).longValue();
    }

    @Override // j$.util.stream.l1
    public final l1 d() {
        int i = v8.a;
        Objects.requireNonNull(null);
        return new f6(this, v8.b, 2);
    }

    @Override // j$.util.stream.l1
    public final l1 distinct() {
        return ((d5) boxed()).distinct().mapToLong(new e0(29));
    }

    @Override // j$.util.stream.l1
    public final l1 e() {
        Objects.requireNonNull(null);
        return new t(this, y6.p | y6.n, 3);
    }

    @Override // j$.util.stream.l1
    public final j$.util.a0 findAny() {
        return (j$.util.a0) D(h0.d);
    }

    @Override // j$.util.stream.l1
    public final j$.util.a0 findFirst() {
        return (j$.util.a0) D(h0.c);
    }

    public void forEach(LongConsumer longConsumer) {
        Objects.requireNonNull(longConsumer);
        D(new o0(longConsumer, false));
    }

    public void forEachOrdered(LongConsumer longConsumer) {
        Objects.requireNonNull(longConsumer);
        D(new o0(longConsumer, true));
    }

    @Override // j$.util.stream.l1
    public final c0 i() {
        Objects.requireNonNull(null);
        return new v(this, y6.p | y6.n, 5);
    }

    @Override // j$.util.stream.g
    public final j$.util.m0 iterator() {
        j$.util.x0 x0VarSpliterator = spliterator();
        Objects.requireNonNull(x0VarSpliterator);
        return new j$.util.e1(x0VarSpliterator);
    }

    @Override // j$.util.stream.l1
    public final boolean k() {
        return ((Boolean) D(v3.T(s1.NONE))).booleanValue();
    }

    @Override // j$.util.stream.l1
    public final l1 limit(long j) {
        if (j >= 0) {
            return v3.U(this, 0L, j);
        }
        j$.time.h.c(Long.toString(j));
        return null;
    }

    @Override // j$.util.stream.l1
    public final Stream mapToObj(LongFunction longFunction) {
        Objects.requireNonNull(longFunction);
        return new p(this, y6.p | y6.n, longFunction, 2);
    }

    @Override // j$.util.stream.l1
    public final j$.util.a0 max() {
        return reduce(new e0(26));
    }

    @Override // j$.util.stream.l1
    public final j$.util.a0 min() {
        return reduce(new e0(28));
    }

    @Override // j$.util.stream.l1
    public final boolean o() {
        return ((Boolean) D(v3.T(s1.ANY))).booleanValue();
    }

    @Override // j$.util.stream.l1
    public final l1 peek(LongConsumer longConsumer) {
        Objects.requireNonNull(longConsumer);
        return new e1(this, longConsumer);
    }

    @Override // j$.util.stream.l1
    public final long reduce(long j, LongBinaryOperator longBinaryOperator) {
        Objects.requireNonNull(longBinaryOperator);
        return ((Long) D(new w3(z6.LONG_VALUE, longBinaryOperator, j))).longValue();
    }

    @Override // j$.util.stream.l1
    public final l1 skip(long j) {
        if (j >= 0) {
            return j == 0 ? this : v3.U(this, j, -1L);
        }
        j$.time.h.c(Long.toString(j));
        return null;
    }

    @Override // j$.util.stream.l1
    public final l1 sorted() {
        return new f6(this, y6.q | y6.o, 0);
    }

    @Override // j$.util.stream.a, j$.util.stream.g
    public final j$.util.x0 spliterator() {
        return U(super.spliterator());
    }

    @Override // j$.util.stream.l1
    public final long sum() {
        return reduce(0L, new e0(27));
    }

    @Override // j$.util.stream.l1
    public final j$.util.x summaryStatistics() {
        return (j$.util.x) collect(new j$.time.format.a(12), new e0(19), new e0(20));
    }

    @Override // j$.util.stream.l1
    public final long[] toArray() {
        return (long[]) v3.L((e2) E(new e0(21))).b();
    }

    @Override // j$.util.stream.l1
    public final boolean v() {
        return ((Boolean) D(v3.T(s1.ALL))).booleanValue();
    }

    @Override // j$.util.stream.l1
    public final IntStream y() {
        Objects.requireNonNull(null);
        return new s(this, y6.p | y6.n, 4);
    }

    @Override // j$.util.stream.l1
    public final j$.util.a0 reduce(LongBinaryOperator longBinaryOperator) {
        Objects.requireNonNull(longBinaryOperator);
        return (j$.util.a0) D(new y3(z6.LONG_VALUE, longBinaryOperator, 0));
    }
}
