package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import java.util.function.BiConsumer;
import java.util.function.DoubleBinaryOperator;
import java.util.function.DoubleConsumer;
import java.util.function.DoubleFunction;
import java.util.function.DoubleUnaryOperator;
import java.util.function.IntFunction;
import java.util.function.ObjDoubleConsumer;
import java.util.function.Supplier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class z extends a implements c0 {
    public static j$.util.r0 U(Spliterator spliterator) {
        if (spliterator instanceof j$.util.r0) {
            return (j$.util.r0) spliterator;
        }
        if (!g8.a) {
            throw new UnsupportedOperationException("DoubleStream.adapt(Spliterator<Double> s)");
        }
        g8.a(a.class, "using DoubleStream.adapt(Spliterator<Double> s)");
        throw null;
    }

    @Override // j$.util.stream.a
    public final g2 F(a aVar, Spliterator spliterator, boolean z, IntFunction intFunction) {
        return v3.B(aVar, spliterator, z);
    }

    @Override // j$.util.stream.a
    public final boolean H(Spliterator spliterator, l5 l5Var) {
        DoubleConsumer b0Var;
        boolean zE;
        j$.util.r0 r0VarU = U(spliterator);
        if (l5Var instanceof DoubleConsumer) {
            b0Var = (DoubleConsumer) l5Var;
        } else {
            if (g8.a) {
                g8.a(a.class, "using DoubleStream.adapt(Sink<Double> s)");
                throw null;
            }
            Objects.requireNonNull(l5Var);
            b0Var = new j$.util.b0(l5Var, 1);
        }
        do {
            zE = l5Var.e();
            if (zE) {
                break;
            }
        } while (r0VarU.tryAdvance(b0Var));
        return zE;
    }

    @Override // j$.util.stream.a
    public final z6 I() {
        return z6.DOUBLE_VALUE;
    }

    @Override // j$.util.stream.a
    public final y1 J(long j, IntFunction intFunction) {
        return v3.F(j);
    }

    @Override // j$.util.stream.a
    public final Spliterator Q(a aVar, Supplier supplier, boolean z) {
        return new j7(aVar, supplier, z);
    }

    @Override // j$.util.stream.c0
    public final c0 a() {
        int i = v8.a;
        Objects.requireNonNull(null);
        return new d6(this, v8.a, 1);
    }

    @Override // j$.util.stream.c0
    public final j$.util.y average() {
        double[] dArr = (double[]) collect(new j$.time.format.a(25), new j$.time.format.a(26), new j$.time.format.a(27));
        if (dArr[2] <= 0.0d) {
            return j$.util.y.c;
        }
        int i = j.a;
        double d = dArr[0] + dArr[1];
        double d2 = dArr[dArr.length - 1];
        if (Double.isNaN(d) && Double.isInfinite(d2)) {
            d = d2;
        }
        return new j$.util.y(d / dArr[2]);
    }

    @Override // j$.util.stream.c0
    public final c0 b(j$.util.n nVar) {
        Objects.requireNonNull(nVar);
        return new q(this, y6.p | y6.n | y6.t, nVar, 1);
    }

    @Override // j$.util.stream.c0
    public final Stream boxed() {
        return new p(this, 0, new j$.time.format.a(17), 0);
    }

    @Override // j$.util.stream.c0
    public final c0 c() {
        Objects.requireNonNull(null);
        return new v(this, y6.t, 1);
    }

    @Override // j$.util.stream.c0
    public final Object collect(Supplier supplier, ObjDoubleConsumer objDoubleConsumer, BiConsumer biConsumer) {
        Objects.requireNonNull(biConsumer);
        o oVar = new o(biConsumer, 0);
        Objects.requireNonNull(supplier);
        Objects.requireNonNull(objDoubleConsumer);
        Objects.requireNonNull(oVar);
        return D(new a4(z6.DOUBLE_VALUE, oVar, objDoubleConsumer, supplier, 1));
    }

    @Override // j$.util.stream.c0
    public final long count() {
        return ((Long) D(new c4(1))).longValue();
    }

    @Override // j$.util.stream.c0
    public final c0 d() {
        int i = v8.a;
        Objects.requireNonNull(null);
        return new d6(this, v8.b, 2);
    }

    @Override // j$.util.stream.c0
    public final c0 distinct() {
        return ((d5) boxed()).distinct().mapToDouble(new j$.time.format.a(18));
    }

    @Override // j$.util.stream.c0
    public final j$.util.y findAny() {
        return (j$.util.y) D(f0.d);
    }

    @Override // j$.util.stream.c0
    public final j$.util.y findFirst() {
        return (j$.util.y) D(f0.c);
    }

    public void forEach(DoubleConsumer doubleConsumer) {
        Objects.requireNonNull(doubleConsumer);
        D(new m0(doubleConsumer, false));
    }

    public void forEachOrdered(DoubleConsumer doubleConsumer) {
        Objects.requireNonNull(doubleConsumer);
        D(new m0(doubleConsumer, true));
    }

    @Override // j$.util.stream.g
    public final j$.util.e0 iterator() {
        j$.util.r0 r0VarSpliterator = spliterator();
        Objects.requireNonNull(r0VarSpliterator);
        return new j$.util.f1(r0VarSpliterator);
    }

    @Override // j$.util.stream.c0
    public final boolean l() {
        return ((Boolean) D(v3.P(s1.ANY))).booleanValue();
    }

    @Override // j$.util.stream.c0
    public final c0 limit(long j) {
        if (j >= 0) {
            return v3.Q(this, 0L, j);
        }
        j$.time.h.c(Long.toString(j));
        return null;
    }

    @Override // j$.util.stream.c0
    public final c0 map(DoubleUnaryOperator doubleUnaryOperator) {
        Objects.requireNonNull(doubleUnaryOperator);
        return new q(this, y6.p | y6.n, doubleUnaryOperator, 0);
    }

    @Override // j$.util.stream.c0
    public final Stream mapToObj(DoubleFunction doubleFunction) {
        Objects.requireNonNull(doubleFunction);
        return new p(this, y6.p | y6.n, doubleFunction, 0);
    }

    @Override // j$.util.stream.c0
    public final j$.util.y max() {
        return reduce(new j$.time.format.a(20));
    }

    @Override // j$.util.stream.c0
    public final j$.util.y min() {
        return reduce(new j$.time.format.a(24));
    }

    @Override // j$.util.stream.c0
    public final c0 peek(DoubleConsumer doubleConsumer) {
        Objects.requireNonNull(doubleConsumer);
        return new q(this, doubleConsumer);
    }

    @Override // j$.util.stream.c0
    public final double reduce(double d, DoubleBinaryOperator doubleBinaryOperator) {
        Objects.requireNonNull(doubleBinaryOperator);
        return ((Double) D(new e4(z6.DOUBLE_VALUE, doubleBinaryOperator, d))).doubleValue();
    }

    @Override // j$.util.stream.c0
    public final c0 skip(long j) {
        if (j >= 0) {
            return j == 0 ? this : v3.Q(this, j, -1L);
        }
        j$.time.h.c(Long.toString(j));
        return null;
    }

    @Override // j$.util.stream.c0
    public final c0 sorted() {
        return new d6(this, y6.q | y6.o, 0);
    }

    @Override // j$.util.stream.a, j$.util.stream.g
    public final j$.util.r0 spliterator() {
        return U(super.spliterator());
    }

    @Override // j$.util.stream.c0
    public final double sum() {
        double[] dArr = (double[]) collect(new j$.time.format.a(21), new j$.time.format.a(22), new j$.time.format.a(23));
        int i = j.a;
        double d = dArr[0] + dArr[1];
        double d2 = dArr[dArr.length - 1];
        return (Double.isNaN(d) && Double.isInfinite(d2)) ? d2 : d;
    }

    @Override // j$.util.stream.c0
    public final j$.util.u summaryStatistics() {
        return (j$.util.u) collect(new j$.time.format.a(10), new j$.time.format.a(28), new j$.time.format.a(16));
    }

    @Override // j$.util.stream.c0
    public final boolean t() {
        return ((Boolean) D(v3.P(s1.ALL))).booleanValue();
    }

    @Override // j$.util.stream.c0
    public final double[] toArray() {
        return (double[]) v3.J((a2) E(new j$.time.format.a(19))).b();
    }

    @Override // j$.util.stream.c0
    public final l1 u() {
        Objects.requireNonNull(null);
        return new t(this, y6.p | y6.n, 0);
    }

    @Override // j$.util.stream.c0
    public final IntStream x() {
        Objects.requireNonNull(null);
        return new s(this, y6.p | y6.n, 0);
    }

    @Override // j$.util.stream.c0
    public final boolean z() {
        return ((Boolean) D(v3.P(s1.NONE))).booleanValue();
    }

    @Override // j$.util.stream.c0
    public final j$.util.y reduce(DoubleBinaryOperator doubleBinaryOperator) {
        Objects.requireNonNull(doubleBinaryOperator);
        return (j$.util.y) D(new y3(z6.DOUBLE_VALUE, doubleBinaryOperator, 1));
    }
}
