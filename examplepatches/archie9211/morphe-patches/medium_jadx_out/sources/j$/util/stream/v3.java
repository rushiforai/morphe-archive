package j$.util.stream;

import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import j$.util.Objects;
import j$.util.Spliterator;
import java.util.function.Consumer;
import java.util.function.DoubleConsumer;
import java.util.function.Function;
import java.util.function.IntConsumer;
import java.util.function.IntFunction;
import java.util.function.LongConsumer;
import java.util.function.Predicate;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class v3 implements e8 {
    public static final y2 a = new y2();
    public static final w2 b = new w2();
    public static final x2 c = new x2();
    public static final v2 d = new v2();
    public static final int[] e = new int[0];
    public static final long[] f = new long[0];
    public static final double[] g = new double[0];

    public static g2 A(a aVar, Spliterator spliterator, boolean z, IntFunction intFunction) {
        long jG = aVar.G(spliterator);
        if (jG < 0 || !spliterator.hasCharacteristics(OlympusMakernoteDirectory.TAG_MAIN_INFO)) {
            l0 l0Var = new l0();
            l0Var.a = intFunction;
            g2 g2Var = (g2) new l2(aVar, spliterator, l0Var, new u1(8), 3).invoke();
            return z ? I(g2Var, intFunction) : g2Var;
        }
        if (jG >= 2147483639) {
            j$.time.h.c("Stream size exceeds max array size");
            return null;
        }
        Object[] objArr = (Object[]) intFunction.apply((int) jG);
        new q3(spliterator, aVar, objArr).invoke();
        return new j2(objArr);
    }

    public static a2 B(a aVar, Spliterator spliterator, boolean z) {
        long jG = aVar.G(spliterator);
        if (jG < 0 || !spliterator.hasCharacteristics(OlympusMakernoteDirectory.TAG_MAIN_INFO)) {
            a2 a2Var = (a2) new l2(aVar, spliterator, new u1(2), new u1(3), 0).invoke();
            return z ? J(a2Var) : a2Var;
        }
        if (jG >= 2147483639) {
            j$.time.h.c("Stream size exceeds max array size");
            return null;
        }
        double[] dArr = new double[(int) jG];
        new n3(spliterator, aVar, dArr).invoke();
        return new s2(dArr);
    }

    public static c2 C(a aVar, Spliterator spliterator, boolean z) {
        long jG = aVar.G(spliterator);
        if (jG < 0 || !spliterator.hasCharacteristics(OlympusMakernoteDirectory.TAG_MAIN_INFO)) {
            c2 c2Var = (c2) new l2(aVar, spliterator, new u1(4), new u1(5), 1).invoke();
            return z ? K(c2Var) : c2Var;
        }
        if (jG >= 2147483639) {
            j$.time.h.c("Stream size exceeds max array size");
            return null;
        }
        int[] iArr = new int[(int) jG];
        new o3(spliterator, aVar, iArr).invoke();
        return new b3(iArr);
    }

    public static e2 D(a aVar, Spliterator spliterator, boolean z) {
        long jG = aVar.G(spliterator);
        if (jG < 0 || !spliterator.hasCharacteristics(OlympusMakernoteDirectory.TAG_MAIN_INFO)) {
            e2 e2Var = (e2) new l2(aVar, spliterator, new u1(6), new u1(7), 2).invoke();
            return z ? L(e2Var) : e2Var;
        }
        if (jG >= 2147483639) {
            j$.time.h.c("Stream size exceeds max array size");
            return null;
        }
        long[] jArr = new long[(int) jG];
        new p3(spliterator, aVar, jArr).invoke();
        return new k3(jArr);
    }

    public static i2 E(z6 z6Var, g2 g2Var, g2 g2Var2) {
        int i = h2.a[z6Var.ordinal()];
        if (i == 1) {
            return new r2(g2Var, g2Var2);
        }
        if (i == 2) {
            return new o2((c2) g2Var, (c2) g2Var2);
        }
        if (i == 3) {
            return new p2((e2) g2Var, (e2) g2Var2);
        }
        if (i == 4) {
            return new n2((a2) g2Var, (a2) g2Var2);
        }
        throw new IllegalStateException("Unknown shape " + z6Var);
    }

    public static v1 F(long j) {
        return (j < 0 || j >= 2147483639) ? new u2() : new t2(j);
    }

    public static z2 G(z6 z6Var) {
        int i = h2.a[z6Var.ordinal()];
        if (i == 1) {
            return a;
        }
        if (i == 2) {
            return b;
        }
        if (i == 3) {
            return c;
        }
        if (i == 4) {
            return d;
        }
        throw new IllegalStateException("Unknown shape " + z6Var);
    }

    public static int H(long j) {
        return (j != -1 ? y6.u : 0) | y6.t;
    }

    public static g2 I(g2 g2Var, IntFunction intFunction) {
        if (g2Var.o() <= 0) {
            return g2Var;
        }
        long jCount = g2Var.count();
        if (jCount >= 2147483639) {
            j$.time.h.c("Stream size exceeds max array size");
            return null;
        }
        Object[] objArr = (Object[]) intFunction.apply((int) jCount);
        new u3(g2Var, objArr, 1).invoke();
        return new j2(objArr);
    }

    public static a2 J(a2 a2Var) {
        if (a2Var.o() <= 0) {
            return a2Var;
        }
        long jCount = a2Var.count();
        if (jCount >= 2147483639) {
            j$.time.h.c("Stream size exceeds max array size");
            return null;
        }
        double[] dArr = new double[(int) jCount];
        new t3(a2Var, dArr, 0).invoke();
        return new s2(dArr);
    }

    public static c2 K(c2 c2Var) {
        if (c2Var.o() <= 0) {
            return c2Var;
        }
        long jCount = c2Var.count();
        if (jCount >= 2147483639) {
            j$.time.h.c("Stream size exceeds max array size");
            return null;
        }
        int[] iArr = new int[(int) jCount];
        new t3(c2Var, iArr, 0).invoke();
        return new b3(iArr);
    }

    public static e2 L(e2 e2Var) {
        if (e2Var.o() <= 0) {
            return e2Var;
        }
        long jCount = e2Var.count();
        if (jCount >= 2147483639) {
            j$.time.h.c("Stream size exceeds max array size");
            return null;
        }
        long[] jArr = new long[(int) jCount];
        new t3(e2Var, jArr, 0).invoke();
        return new k3(jArr);
    }

    public static j$.util.n M(Function function) {
        j$.util.n nVar = new j$.util.n(5);
        nVar.b = function;
        return nVar;
    }

    public static w1 N(long j) {
        return (j < 0 || j >= 2147483639) ? new d3() : new c3(j);
    }

    public static x1 O(long j) {
        return (j < 0 || j >= 2147483639) ? new m3() : new l3(j);
    }

    public static j$.time.format.v P(s1 s1Var) {
        Objects.requireNonNull(null);
        Objects.requireNonNull(s1Var);
        return new j$.time.format.v(z6.DOUBLE_VALUE, s1Var, new m1(s1Var, 2));
    }

    public static t5 Q(z zVar, long j, long j2) {
        if (j >= 0) {
            return new t5(zVar, H(j2), j, j2);
        }
        j$.time.h.a(j);
        return null;
    }

    public static j$.time.format.v R(s1 s1Var) {
        Objects.requireNonNull(null);
        Objects.requireNonNull(s1Var);
        return new j$.time.format.v(z6.INT_VALUE, s1Var, new m1(s1Var, 1));
    }

    public static p5 S(a1 a1Var, long j, long j2) {
        if (j >= 0) {
            return new p5(a1Var, H(j2), j, j2);
        }
        j$.time.h.a(j);
        return null;
    }

    public static j$.time.format.v T(s1 s1Var) {
        Objects.requireNonNull(null);
        Objects.requireNonNull(s1Var);
        return new j$.time.format.v(z6.LONG_VALUE, s1Var, new m1(s1Var, 0));
    }

    public static r5 U(i1 i1Var, long j, long j2) {
        if (j >= 0) {
            return new r5(i1Var, H(j2), j, j2);
        }
        j$.time.h.a(j);
        return null;
    }

    public static j$.time.format.v V(s1 s1Var, Predicate predicate) {
        Objects.requireNonNull(predicate);
        Objects.requireNonNull(s1Var);
        return new j$.time.format.v(z6.REFERENCE, s1Var, new j$.time.format.v(6, s1Var, predicate));
    }

    public static n5 W(d5 d5Var, long j, long j2) {
        if (j >= 0) {
            return new n5(d5Var, H(j2), j, j2);
        }
        j$.time.h.a(j);
        return null;
    }

    public static Spliterator Y(z6 z6Var, Spliterator spliterator, long j, long j2) {
        long jZ = z(j, j2);
        int i = u5.a[z6Var.ordinal()];
        if (i == 1) {
            return new s7(spliterator, j, jZ);
        }
        if (i == 2) {
            return new p7((j$.util.u0) spliterator, j, jZ);
        }
        if (i == 3) {
            return new q7((j$.util.x0) spliterator, j, jZ);
        }
        if (i == 4) {
            return new o7((j$.util.r0) spliterator, j, jZ);
        }
        throw new IllegalStateException("Unknown shape " + z6Var);
    }

    public static void c() {
        throw new IllegalStateException("called wrong accept method");
    }

    public static void d(i5 i5Var, Double d2) {
        if (g8.a) {
            g8.a(i5Var.getClass(), "{0} calling Sink.OfDouble.accept(Double)");
            throw null;
        }
        i5Var.accept(d2.doubleValue());
    }

    public static void g(j5 j5Var, Integer num) {
        if (g8.a) {
            g8.a(j5Var.getClass(), "{0} calling Sink.OfInt.accept(Integer)");
            throw null;
        }
        j5Var.accept(num.intValue());
    }

    public static void i(k5 k5Var, Long l) {
        if (g8.a) {
            g8.a(k5Var.getClass(), "{0} calling Sink.OfLong.accept(Long)");
            throw null;
        }
        k5Var.accept(l.longValue());
    }

    public static void k() {
        throw new IllegalStateException("called wrong accept method");
    }

    public static void l() {
        throw new IllegalStateException("called wrong accept method");
    }

    public static Object[] m(f2 f2Var, IntFunction intFunction) {
        if (g8.a) {
            g8.a(f2Var.getClass(), "{0} calling Node.OfPrimitive.asArray");
            throw null;
        }
        if (f2Var.count() >= 2147483639) {
            j$.time.h.c("Stream size exceeds max array size");
            return null;
        }
        Object[] objArr = (Object[]) intFunction.apply((int) f2Var.count());
        f2Var.k(objArr, 0);
        return objArr;
    }

    public static void n(a2 a2Var, Double[] dArr, int i) {
        if (g8.a) {
            g8.a(a2Var.getClass(), "{0} calling Node.OfDouble.copyInto(Double[], int)");
            throw null;
        }
        double[] dArr2 = (double[]) a2Var.b();
        for (int i2 = 0; i2 < dArr2.length; i2++) {
            dArr[i + i2] = Double.valueOf(dArr2[i2]);
        }
    }

    public static void o(c2 c2Var, Integer[] numArr, int i) {
        if (g8.a) {
            g8.a(c2Var.getClass(), "{0} calling Node.OfInt.copyInto(Integer[], int)");
            throw null;
        }
        int[] iArr = (int[]) c2Var.b();
        for (int i2 = 0; i2 < iArr.length; i2++) {
            numArr[i + i2] = Integer.valueOf(iArr[i2]);
        }
    }

    public static void p(e2 e2Var, Long[] lArr, int i) {
        if (g8.a) {
            g8.a(e2Var.getClass(), "{0} calling Node.OfInt.copyInto(Long[], int)");
            throw null;
        }
        long[] jArr = (long[]) e2Var.b();
        for (int i2 = 0; i2 < jArr.length; i2++) {
            lArr[i + i2] = Long.valueOf(jArr[i2]);
        }
    }

    public static void q(a2 a2Var, Consumer consumer) {
        if (consumer instanceof DoubleConsumer) {
            a2Var.g((DoubleConsumer) consumer);
        } else {
            if (g8.a) {
                g8.a(a2Var.getClass(), "{0} calling Node.OfLong.forEachRemaining(Consumer)");
                throw null;
            }
            ((j$.util.r0) a2Var.spliterator()).forEachRemaining(consumer);
        }
    }

    public static void r(c2 c2Var, Consumer consumer) {
        if (consumer instanceof IntConsumer) {
            c2Var.g((IntConsumer) consumer);
        } else {
            if (g8.a) {
                g8.a(c2Var.getClass(), "{0} calling Node.OfInt.forEachRemaining(Consumer)");
                throw null;
            }
            ((j$.util.u0) c2Var.spliterator()).forEachRemaining(consumer);
        }
    }

    public static void s(e2 e2Var, Consumer consumer) {
        if (consumer instanceof LongConsumer) {
            e2Var.g((LongConsumer) consumer);
        } else {
            if (g8.a) {
                g8.a(e2Var.getClass(), "{0} calling Node.OfLong.forEachRemaining(Consumer)");
                throw null;
            }
            ((j$.util.x0) e2Var.spliterator()).forEachRemaining(consumer);
        }
    }

    public static a2 t(a2 a2Var, long j, long j2) {
        if (j == 0 && j2 == a2Var.count()) {
            return a2Var;
        }
        long j3 = j2 - j;
        j$.util.r0 r0Var = (j$.util.r0) a2Var.spliterator();
        v1 v1VarF = F(j3);
        v1VarF.c(j3);
        int i = 0;
        for (int i2 = 0; i2 < j && r0Var.tryAdvance((DoubleConsumer) new z1(i)); i2++) {
        }
        if (j2 == a2Var.count()) {
            r0Var.forEachRemaining((DoubleConsumer) v1VarF);
        } else {
            while (i < j3 && r0Var.tryAdvance((DoubleConsumer) v1VarF)) {
                i++;
            }
        }
        v1VarF.end();
        return v1VarF.build();
    }

    public static c2 u(c2 c2Var, long j, long j2) {
        if (j == 0 && j2 == c2Var.count()) {
            return c2Var;
        }
        long j3 = j2 - j;
        j$.util.u0 u0Var = (j$.util.u0) c2Var.spliterator();
        w1 w1VarN = N(j3);
        w1VarN.c(j3);
        int i = 0;
        for (int i2 = 0; i2 < j && u0Var.tryAdvance((IntConsumer) new b2(i)); i2++) {
        }
        if (j2 == c2Var.count()) {
            u0Var.forEachRemaining((IntConsumer) w1VarN);
        } else {
            while (i < j3 && u0Var.tryAdvance((IntConsumer) w1VarN)) {
                i++;
            }
        }
        w1VarN.end();
        return w1VarN.build();
    }

    public static e2 v(e2 e2Var, long j, long j2) {
        if (j == 0 && j2 == e2Var.count()) {
            return e2Var;
        }
        long j3 = j2 - j;
        j$.util.x0 x0Var = (j$.util.x0) e2Var.spliterator();
        x1 x1VarO = O(j3);
        x1VarO.c(j3);
        int i = 0;
        for (int i2 = 0; i2 < j && x0Var.tryAdvance((LongConsumer) new d2(i)); i2++) {
        }
        if (j2 == e2Var.count()) {
            x0Var.forEachRemaining((LongConsumer) x1VarO);
        } else {
            while (i < j3 && x0Var.tryAdvance((LongConsumer) x1VarO)) {
                i++;
            }
        }
        x1VarO.end();
        return x1VarO.build();
    }

    public static g2 w(g2 g2Var, long j, long j2, IntFunction intFunction) {
        if (j == 0 && j2 == g2Var.count()) {
            return g2Var;
        }
        Spliterator spliterator = g2Var.spliterator();
        long j3 = j2 - j;
        y1 y1VarX = x(j3, intFunction);
        y1VarX.c(j3);
        int i = 0;
        for (int i2 = 0; i2 < j && spliterator.tryAdvance(new u1(i)); i2++) {
        }
        if (j2 == g2Var.count()) {
            spliterator.forEachRemaining(y1VarX);
        } else {
            while (i < j3 && spliterator.tryAdvance(y1VarX)) {
                i++;
            }
        }
        y1VarX.end();
        return y1VarX.build();
    }

    public static y1 x(long j, IntFunction intFunction) {
        return (j < 0 || j >= 2147483639) ? new s3() : new a3(j, intFunction);
    }

    public static long y(long j, long j2, long j3) {
        if (j >= 0) {
            return Math.max(-1L, Math.min(j - j2, j3));
        }
        return -1L;
    }

    public static long z(long j, long j2) {
        long j3 = j2 >= 0 ? j + j2 : Long.MAX_VALUE;
        if (j3 >= 0) {
            return j3;
        }
        return Long.MAX_VALUE;
    }

    public abstract q4 X();

    @Override // j$.util.stream.e8
    public Object a(a aVar, Spliterator spliterator) {
        q4 q4VarX = X();
        aVar.R(spliterator, q4VarX);
        return q4VarX.get();
    }

    @Override // j$.util.stream.e8
    public Object b(a aVar, Spliterator spliterator) {
        return ((q4) new x4(this, aVar, spliterator).invoke()).get();
    }

    @Override // j$.util.stream.e8
    public int f() {
        return 0;
    }
}
