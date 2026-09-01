package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import java.util.function.BiConsumer;
import java.util.function.IntBinaryOperator;
import java.util.function.IntConsumer;
import java.util.function.IntFunction;
import java.util.function.ObjIntConsumer;
import java.util.function.Supplier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class a1 extends a implements IntStream {
    public static j$.util.u0 U(Spliterator spliterator) {
        if (spliterator instanceof j$.util.u0) {
            return (j$.util.u0) spliterator;
        }
        if (!g8.a) {
            throw new UnsupportedOperationException("IntStream.adapt(Spliterator<Integer> s)");
        }
        g8.a(a.class, "using IntStream.adapt(Spliterator<Integer> s)");
        throw null;
    }

    @Override // j$.util.stream.a
    public final g2 F(a aVar, Spliterator spliterator, boolean z, IntFunction intFunction) {
        return v3.C(aVar, spliterator, z);
    }

    @Override // j$.util.stream.a
    public final boolean H(Spliterator spliterator, l5 l5Var) {
        IntConsumer f0Var;
        boolean zE;
        j$.util.u0 u0VarU = U(spliterator);
        if (l5Var instanceof IntConsumer) {
            f0Var = (IntConsumer) l5Var;
        } else {
            if (g8.a) {
                g8.a(a.class, "using IntStream.adapt(Sink<Integer> s)");
                throw null;
            }
            Objects.requireNonNull(l5Var);
            f0Var = new j$.util.f0(l5Var, 1);
        }
        do {
            zE = l5Var.e();
            if (zE) {
                break;
            }
        } while (u0VarU.tryAdvance(f0Var));
        return zE;
    }

    @Override // j$.util.stream.a
    public final z6 I() {
        return z6.INT_VALUE;
    }

    @Override // j$.util.stream.a
    public final y1 J(long j, IntFunction intFunction) {
        return v3.N(j);
    }

    @Override // j$.util.stream.a
    public final Spliterator Q(a aVar, Supplier supplier, boolean z) {
        return new l7(aVar, supplier, z);
    }

    @Override // j$.util.stream.IntStream
    public final IntStream a() {
        int i = v8.a;
        Objects.requireNonNull(null);
        return new e6(this, v8.a, 1);
    }

    @Override // j$.util.stream.IntStream
    public final c0 asDoubleStream() {
        return new v(this, 0, 2);
    }

    @Override // j$.util.stream.IntStream
    public final l1 asLongStream() {
        return new t(this, 0, 1);
    }

    @Override // j$.util.stream.IntStream
    public final j$.util.y average() {
        long j = ((long[]) collect(new e0(14), new e0(15), new e0(16)))[0];
        return j > 0 ? new j$.util.y(r4[1] / j) : j$.util.y.c;
    }

    @Override // j$.util.stream.IntStream
    public final Stream boxed() {
        return new p(this, 0, new e0(18), 1);
    }

    @Override // j$.util.stream.IntStream
    public final IntStream c() {
        Objects.requireNonNull(null);
        return new s(this, y6.t, 3);
    }

    @Override // j$.util.stream.IntStream
    public final Object collect(Supplier supplier, ObjIntConsumer objIntConsumer, BiConsumer biConsumer) {
        Objects.requireNonNull(biConsumer);
        o oVar = new o(biConsumer, 1);
        Objects.requireNonNull(supplier);
        Objects.requireNonNull(objIntConsumer);
        Objects.requireNonNull(oVar);
        return D(new a4(z6.INT_VALUE, oVar, objIntConsumer, supplier, 4));
    }

    @Override // j$.util.stream.IntStream
    public final long count() {
        return ((Long) D(new c4(3))).longValue();
    }

    @Override // j$.util.stream.IntStream
    public final IntStream d() {
        int i = v8.a;
        Objects.requireNonNull(null);
        return new e6(this, v8.b, 2);
    }

    @Override // j$.util.stream.IntStream
    public final IntStream distinct() {
        return ((d5) boxed()).distinct().mapToInt(new e0(17));
    }

    @Override // j$.util.stream.IntStream
    public final IntStream e() {
        Objects.requireNonNull(null);
        return new s(this, y6.p | y6.n, 1);
    }

    @Override // j$.util.stream.IntStream
    public final c0 f() {
        Objects.requireNonNull(null);
        return new v(this, y6.p | y6.n, 3);
    }

    @Override // j$.util.stream.IntStream
    public final j$.util.z findAny() {
        return (j$.util.z) D(g0.d);
    }

    @Override // j$.util.stream.IntStream
    public final j$.util.z findFirst() {
        return (j$.util.z) D(g0.c);
    }

    @Override // j$.util.stream.IntStream
    public void forEach(IntConsumer intConsumer) {
        Objects.requireNonNull(intConsumer);
        D(new n0(intConsumer, false));
    }

    @Override // j$.util.stream.IntStream
    public void forEachOrdered(IntConsumer intConsumer) {
        Objects.requireNonNull(intConsumer);
        D(new n0(intConsumer, true));
    }

    @Override // j$.util.stream.g
    public final j$.util.i0 iterator() {
        j$.util.u0 u0VarSpliterator = spliterator();
        Objects.requireNonNull(u0VarSpliterator);
        return new j$.util.d1(u0VarSpliterator);
    }

    @Override // j$.util.stream.IntStream
    public final l1 j() {
        Objects.requireNonNull(null);
        return new t(this, y6.p | y6.n, 2);
    }

    @Override // j$.util.stream.IntStream
    public final IntStream limit(long j) {
        if (j >= 0) {
            return v3.S(this, 0L, j);
        }
        j$.time.h.c(Long.toString(j));
        return null;
    }

    @Override // j$.util.stream.IntStream
    public final Stream mapToObj(IntFunction intFunction) {
        Objects.requireNonNull(intFunction);
        return new p(this, y6.p | y6.n, intFunction, 1);
    }

    @Override // j$.util.stream.IntStream
    public final j$.util.z max() {
        return reduce(new e0(13));
    }

    @Override // j$.util.stream.IntStream
    public final j$.util.z min() {
        return reduce(new e0(9));
    }

    @Override // j$.util.stream.IntStream
    public final boolean n() {
        return ((Boolean) D(v3.R(s1.ALL))).booleanValue();
    }

    @Override // j$.util.stream.IntStream
    public final IntStream p(l0 l0Var) {
        Objects.requireNonNull(l0Var);
        return new u0(this, y6.p | y6.n | y6.t, l0Var, 1);
    }

    @Override // j$.util.stream.IntStream
    public final IntStream peek(IntConsumer intConsumer) {
        Objects.requireNonNull(intConsumer);
        return new u0(this, intConsumer);
    }

    @Override // j$.util.stream.IntStream
    public final boolean r() {
        return ((Boolean) D(v3.R(s1.NONE))).booleanValue();
    }

    @Override // j$.util.stream.IntStream
    public final int reduce(int i, IntBinaryOperator intBinaryOperator) {
        Objects.requireNonNull(intBinaryOperator);
        return ((Integer) D(new l4(z6.INT_VALUE, intBinaryOperator, i))).intValue();
    }

    @Override // j$.util.stream.IntStream
    public final IntStream skip(long j) {
        if (j >= 0) {
            return j == 0 ? this : v3.S(this, j, -1L);
        }
        j$.time.h.c(Long.toString(j));
        return null;
    }

    @Override // j$.util.stream.IntStream
    public final IntStream sorted() {
        return new e6(this, y6.q | y6.o, 0);
    }

    @Override // j$.util.stream.a, j$.util.stream.g
    public final j$.util.u0 spliterator() {
        return U(super.spliterator());
    }

    @Override // j$.util.stream.IntStream
    public final int sum() {
        return reduce(0, new e0(12));
    }

    @Override // j$.util.stream.IntStream
    public final j$.util.v summaryStatistics() {
        return (j$.util.v) collect(new j$.time.format.a(11), new e0(10), new e0(11));
    }

    @Override // j$.util.stream.IntStream
    public final int[] toArray() {
        return (int[]) v3.K((c2) E(new e0(8))).b();
    }

    @Override // j$.util.stream.IntStream
    public final boolean w() {
        return ((Boolean) D(v3.R(s1.ANY))).booleanValue();
    }

    @Override // j$.util.stream.IntStream
    public final j$.util.z reduce(IntBinaryOperator intBinaryOperator) {
        Objects.requireNonNull(intBinaryOperator);
        return (j$.util.z) D(new y3(z6.INT_VALUE, intBinaryOperator, 3));
    }
}
