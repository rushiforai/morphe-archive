package j$.time;

import j$.time.format.v;
import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.time.temporal.TemporalAccessor;
import j$.util.Comparator;
import j$.util.Objects;
import j$.util.Optional;
import j$.util.Spliterator;
import j$.util.a0;
import j$.util.b0;
import j$.util.f0;
import j$.util.j0;
import j$.util.q1;
import j$.util.r0;
import j$.util.u0;
import j$.util.w;
import j$.util.x0;
import j$.util.y;
import j$.util.z;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.OptionalDouble;
import java.util.OptionalInt;
import java.util.OptionalLong;
import java.util.TimeZone;
import java.util.concurrent.ConcurrentMap;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.function.DoubleConsumer;
import java.util.function.Function;
import java.util.function.IntConsumer;
import java.util.function.LongConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract /* synthetic */ class a {
    public static long A(j$.time.chrono.j jVar) {
        return ((jVar.e().t() * 86400) + ((long) jVar.toLocalTime().M())) - ((long) jVar.getOffset().getTotalSeconds());
    }

    public static boolean B(r0 r0Var, Consumer consumer) {
        if (consumer instanceof DoubleConsumer) {
            return r0Var.tryAdvance((DoubleConsumer) consumer);
        }
        if (q1.a) {
            q1.a(r0Var.getClass(), "{0} calling Spliterator.OfDouble.tryAdvance((DoubleConsumer) action::accept)");
            throw null;
        }
        Objects.requireNonNull(consumer);
        return r0Var.tryAdvance((DoubleConsumer) new b0(consumer, 0));
    }

    public static boolean C(u0 u0Var, Consumer consumer) {
        if (consumer instanceof IntConsumer) {
            return u0Var.tryAdvance((IntConsumer) consumer);
        }
        if (q1.a) {
            q1.a(u0Var.getClass(), "{0} calling Spliterator.OfInt.tryAdvance((IntConsumer) action::accept)");
            throw null;
        }
        Objects.requireNonNull(consumer);
        return u0Var.tryAdvance((IntConsumer) new f0(consumer, 0));
    }

    public static boolean D(x0 x0Var, Consumer consumer) {
        if (consumer instanceof LongConsumer) {
            return x0Var.tryAdvance((LongConsumer) consumer);
        }
        if (q1.a) {
            q1.a(x0Var.getClass(), "{0} calling Spliterator.OfLong.tryAdvance((LongConsumer) action::accept)");
            throw null;
        }
        Objects.requireNonNull(consumer);
        return x0Var.tryAdvance((LongConsumer) new j0(consumer, 0));
    }

    public static Optional E(java.util.Optional optional) {
        if (optional == null) {
            return null;
        }
        return optional.isPresent() ? Optional.of(optional.get()) : Optional.empty();
    }

    public static y F(OptionalDouble optionalDouble) {
        if (optionalDouble == null) {
            return null;
        }
        return optionalDouble.isPresent() ? new y(optionalDouble.getAsDouble()) : y.c;
    }

    public static z G(OptionalInt optionalInt) {
        if (optionalInt == null) {
            return null;
        }
        return optionalInt.isPresent() ? new z(optionalInt.getAsInt()) : z.c;
    }

    public static a0 H(OptionalLong optionalLong) {
        if (optionalLong == null) {
            return null;
        }
        return optionalLong.isPresent() ? new a0(optionalLong.getAsLong()) : a0.c;
    }

    public static java.util.Optional I(Optional optional) {
        if (optional == null) {
            return null;
        }
        return optional.isPresent() ? java.util.Optional.of(optional.get()) : java.util.Optional.empty();
    }

    public static OptionalDouble J(y yVar) {
        if (yVar == null) {
            return null;
        }
        boolean z = yVar.a;
        if (!z) {
            return OptionalDouble.empty();
        }
        if (z) {
            return OptionalDouble.of(yVar.b);
        }
        throw new NoSuchElementException("No value present");
    }

    public static OptionalInt K(z zVar) {
        if (zVar == null) {
            return null;
        }
        boolean z = zVar.a;
        if (!z) {
            return OptionalInt.empty();
        }
        if (z) {
            return OptionalInt.of(zVar.b);
        }
        throw new NoSuchElementException("No value present");
    }

    public static OptionalLong L(a0 a0Var) {
        if (a0Var == null) {
            return null;
        }
        boolean z = a0Var.a;
        if (!z) {
            return OptionalLong.empty();
        }
        if (z) {
            return OptionalLong.of(a0Var.b);
        }
        throw new NoSuchElementException("No value present");
    }

    public static void M(Iterator it2, Consumer consumer) {
        if (it2 instanceof w) {
            ((w) it2).forEachRemaining(consumer);
            return;
        }
        Objects.requireNonNull(consumer);
        while (it2.hasNext()) {
            consumer.accept(it2.next());
        }
    }

    public static j$.time.chrono.a N(TemporalAccessor temporalAccessor) {
        Objects.requireNonNull(temporalAccessor, "temporal");
        Object objRequireNonNull = (j$.time.chrono.a) temporalAccessor.m(j$.time.temporal.o.b);
        j$.time.chrono.s sVar = j$.time.chrono.s.c;
        if (objRequireNonNull == null) {
            objRequireNonNull = Objects.requireNonNull(sVar, "defaultObj");
        }
        return (j$.time.chrono.a) objRequireNonNull;
    }

    public static /* synthetic */ long O(long j, long j2) {
        long j3 = j + j2;
        if (((j2 ^ j) < 0) || ((j ^ j3) >= 0)) {
            return j3;
        }
        throw new ArithmeticException();
    }

    public static /* synthetic */ List P(Object[] objArr) {
        ArrayList arrayList = new ArrayList(objArr.length);
        for (Object obj : objArr) {
            arrayList.add(Objects.requireNonNull(obj));
        }
        return Collections.unmodifiableList(arrayList);
    }

    public static /* synthetic */ Map.Entry Q(Object obj, Object obj2) {
        return new AbstractMap.SimpleImmutableEntry(Objects.requireNonNull(obj), Objects.requireNonNull(obj2));
    }

    public static /* synthetic */ long R(long j, long j2) {
        long j3 = j % j2;
        if (j3 == 0) {
            return 0L;
        }
        return (((j ^ j2) >> 63) | 1) > 0 ? j3 : j3 + j2;
    }

    public static /* synthetic */ long S(long j, long j2) {
        long j3 = j / j2;
        return (j - (j2 * j3) != 0 && (((j ^ j2) >> 63) | 1) < 0) ? j3 - 1 : j3;
    }

    public static /* synthetic */ long T(long j, long j2) {
        int iNumberOfLeadingZeros = Long.numberOfLeadingZeros(~j2) + Long.numberOfLeadingZeros(j2) + Long.numberOfLeadingZeros(~j) + Long.numberOfLeadingZeros(j);
        if (iNumberOfLeadingZeros > 65) {
            return j * j2;
        }
        if (iNumberOfLeadingZeros >= 64) {
            if ((j2 != Long.MIN_VALUE) | (j >= 0)) {
                long j3 = j * j2;
                if (j == 0 || j3 / j == j2) {
                    return j3;
                }
            }
        }
        throw new ArithmeticException();
    }

    public static /* synthetic */ long U(long j, long j2) {
        long j3 = j - j2;
        if (((j2 ^ j) >= 0) || ((j ^ j3) >= 0)) {
            return j3;
        }
        throw new ArithmeticException();
    }

    public static String V(Object obj, Object obj2) {
        String string;
        String string2;
        String str = "null";
        if (obj == null || (string = obj.toString()) == null) {
            string = "null";
        }
        int length = string.length();
        if (obj2 != null && (string2 = obj2.toString()) != null) {
            str = string2;
        }
        int length2 = str.length();
        char[] cArr = new char[length + length2 + 1];
        string.getChars(0, length, cArr, 0);
        cArr[length] = '=';
        str.getChars(0, length2, cArr, length + 1);
        return new String(cArr);
    }

    public static b W() {
        String id = TimeZone.getDefault().getID();
        Map map = ZoneId.a;
        Objects.requireNonNull(id, "zoneId");
        Objects.requireNonNull(map, "aliasMap");
        Object objRequireNonNull = (String) map.get(id);
        if (objRequireNonNull == null) {
            objRequireNonNull = Objects.requireNonNull(id, "defaultObj");
        }
        return new b(ZoneId.of((String) objRequireNonNull));
    }

    public static /* synthetic */ Comparator X(Comparator comparator, Comparator comparator2) {
        return comparator instanceof j$.util.Comparator ? ((j$.util.Comparator) comparator).thenComparing(comparator2) : Comparator.CC.$default$thenComparing(comparator, comparator2);
    }

    public static Temporal a(j$.time.chrono.b bVar, Temporal temporal) {
        return temporal.b(bVar.t(), j$.time.temporal.a.EPOCH_DAY);
    }

    public static v b(BiConsumer biConsumer, BiConsumer biConsumer2) {
        Objects.requireNonNull(biConsumer2);
        return new v(2, biConsumer, biConsumer2);
    }

    public static v c(BiFunction biFunction, Function function) {
        Objects.requireNonNull(function);
        return new v(3, biFunction, function);
    }

    public static v d(Consumer consumer, Consumer consumer2) {
        Objects.requireNonNull(consumer2);
        return new v(4, consumer, consumer2);
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [j$.util.function.b] */
    public static j$.util.function.b e(final DoubleConsumer doubleConsumer, final DoubleConsumer doubleConsumer2) {
        Objects.requireNonNull(doubleConsumer2);
        return new DoubleConsumer() { // from class: j$.util.function.b
            @Override // java.util.function.DoubleConsumer
            public final void accept(double d) {
                doubleConsumer.accept(d);
                doubleConsumer2.accept(d);
            }

            public final /* synthetic */ DoubleConsumer andThen(DoubleConsumer doubleConsumer3) {
                return j$.time.a.e(this, doubleConsumer3);
            }
        };
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [j$.util.function.e] */
    public static j$.util.function.e f(final IntConsumer intConsumer, final IntConsumer intConsumer2) {
        Objects.requireNonNull(intConsumer2);
        return new IntConsumer() { // from class: j$.util.function.e
            @Override // java.util.function.IntConsumer
            public final void accept(int i) {
                intConsumer.accept(i);
                intConsumer2.accept(i);
            }

            public final /* synthetic */ IntConsumer andThen(IntConsumer intConsumer3) {
                return j$.time.a.f(this, intConsumer3);
            }
        };
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [j$.util.function.f] */
    public static j$.util.function.f g(final LongConsumer longConsumer, final LongConsumer longConsumer2) {
        Objects.requireNonNull(longConsumer2);
        return new LongConsumer() { // from class: j$.util.function.f
            @Override // java.util.function.LongConsumer
            public final void accept(long j) {
                longConsumer.accept(j);
                longConsumer2.accept(j);
            }

            public final /* synthetic */ LongConsumer andThen(LongConsumer longConsumer3) {
                return j$.time.a.g(this, longConsumer3);
            }
        };
    }

    public static int h(j$.time.chrono.b bVar, j$.time.chrono.b bVar2) {
        int iCompare = Long.compare(bVar.t(), bVar2.t());
        if (iCompare != 0) {
            return iCompare;
        }
        return bVar.a().C().compareTo(bVar2.a().C());
    }

    public static int i(j$.time.chrono.e eVar, j$.time.chrono.e eVar2) {
        int iY = eVar.e().compareTo(eVar2.e());
        return (iY == 0 && (iY = eVar.toLocalTime().compareTo(eVar2.toLocalTime())) == 0) ? eVar.a().C().compareTo(eVar2.a().C()) : iY;
    }

    public static int j(j$.time.chrono.j jVar, j$.time.chrono.j jVar2) {
        int iCompare = Long.compare(jVar.z(), jVar2.z());
        return (iCompare == 0 && (iCompare = jVar.toLocalTime().getNano() - jVar2.toLocalTime().getNano()) == 0 && (iCompare = jVar.l().w(jVar2.l())) == 0 && (iCompare = jVar.getZone().getId().compareTo(jVar2.getZone().getId())) == 0) ? jVar.a().C().compareTo(jVar2.a().C()) : iCompare;
    }

    public static void k(ConcurrentMap concurrentMap, BiConsumer biConsumer) {
        Objects.requireNonNull(biConsumer);
        for (Map.Entry entry : concurrentMap.entrySet()) {
            try {
                biConsumer.accept(entry.getKey(), entry.getValue());
            } catch (IllegalStateException unused) {
            }
        }
    }

    public static void l(r0 r0Var, Consumer consumer) {
        if (consumer instanceof DoubleConsumer) {
            r0Var.forEachRemaining((DoubleConsumer) consumer);
        } else {
            if (q1.a) {
                q1.a(r0Var.getClass(), "{0} calling Spliterator.OfDouble.forEachRemaining((DoubleConsumer) action::accept)");
                throw null;
            }
            Objects.requireNonNull(consumer);
            r0Var.forEachRemaining((DoubleConsumer) new b0(consumer, 0));
        }
    }

    public static void m(u0 u0Var, Consumer consumer) {
        if (consumer instanceof IntConsumer) {
            u0Var.forEachRemaining((IntConsumer) consumer);
        } else {
            if (q1.a) {
                q1.a(u0Var.getClass(), "{0} calling Spliterator.OfInt.forEachRemaining((IntConsumer) action::accept)");
                throw null;
            }
            Objects.requireNonNull(consumer);
            u0Var.forEachRemaining((IntConsumer) new f0(consumer, 0));
        }
    }

    public static void n(x0 x0Var, Consumer consumer) {
        if (consumer instanceof LongConsumer) {
            x0Var.forEachRemaining((LongConsumer) consumer);
        } else {
            if (q1.a) {
                q1.a(x0Var.getClass(), "{0} calling Spliterator.OfLong.forEachRemaining((LongConsumer) action::accept)");
                throw null;
            }
            Objects.requireNonNull(consumer);
            x0Var.forEachRemaining((LongConsumer) new j0(consumer, 0));
        }
    }

    public static int o(j$.time.chrono.j jVar, j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return j$.time.temporal.o.a(jVar, nVar);
        }
        int i = j$.time.chrono.i.a[((j$.time.temporal.a) nVar).ordinal()];
        if (i != 1) {
            return i != 2 ? jVar.l().h(nVar) : jVar.getOffset().getTotalSeconds();
        }
        throw new j$.time.temporal.q("Invalid field 'InstantSeconds' for get() method, use getLong() instead");
    }

    public static int p(j$.time.chrono.m mVar, j$.time.temporal.n nVar) {
        return nVar == j$.time.temporal.a.ERA ? mVar.getValue() : j$.time.temporal.o.a(mVar, nVar);
    }

    public static long q(Spliterator spliterator) {
        if ((spliterator.characteristics() & 64) == 0) {
            return -1L;
        }
        return spliterator.estimateSize();
    }

    public static long r(j$.time.chrono.m mVar, j$.time.temporal.n nVar) {
        if (nVar == j$.time.temporal.a.ERA) {
            return mVar.getValue();
        }
        if (nVar instanceof j$.time.temporal.a) {
            throw new j$.time.temporal.q(d.a("Unsupported field: ", nVar));
        }
        return nVar.m(mVar);
    }

    public static boolean s(Spliterator spliterator, int i) {
        return (spliterator.characteristics() & i) == i;
    }

    public static boolean t(j$.time.chrono.b bVar, j$.time.temporal.n nVar) {
        return nVar instanceof j$.time.temporal.a ? ((j$.time.temporal.a) nVar).isDateBased() : nVar != null && nVar.h(bVar);
    }

    public static boolean u(j$.time.chrono.m mVar, j$.time.temporal.n nVar) {
        return nVar instanceof j$.time.temporal.a ? nVar == j$.time.temporal.a.ERA : nVar != null && nVar.h(mVar);
    }

    public static Object v(j$.time.chrono.b bVar, j$.time.format.a aVar) {
        if (aVar == j$.time.temporal.o.a || aVar == j$.time.temporal.o.e || aVar == j$.time.temporal.o.d || aVar == j$.time.temporal.o.g) {
            return null;
        }
        return aVar == j$.time.temporal.o.b ? bVar.a() : aVar == j$.time.temporal.o.c ? ChronoUnit.DAYS : aVar.g(bVar);
    }

    public static Object w(j$.time.chrono.e eVar, j$.time.format.a aVar) {
        if (aVar == j$.time.temporal.o.a || aVar == j$.time.temporal.o.e || aVar == j$.time.temporal.o.d) {
            return null;
        }
        return aVar == j$.time.temporal.o.g ? eVar.toLocalTime() : aVar == j$.time.temporal.o.b ? eVar.a() : aVar == j$.time.temporal.o.c ? ChronoUnit.NANOS : aVar.g(eVar);
    }

    public static Object x(j$.time.chrono.j jVar, j$.time.format.a aVar) {
        return (aVar == j$.time.temporal.o.e || aVar == j$.time.temporal.o.a) ? jVar.getZone() : aVar == j$.time.temporal.o.d ? jVar.getOffset() : aVar == j$.time.temporal.o.g ? jVar.toLocalTime() : aVar == j$.time.temporal.o.b ? jVar.a() : aVar == j$.time.temporal.o.c ? ChronoUnit.NANOS : aVar.g(jVar);
    }

    public static Object y(j$.time.chrono.m mVar, j$.time.format.a aVar) {
        return aVar == j$.time.temporal.o.c ? ChronoUnit.ERAS : j$.time.temporal.o.c(mVar, aVar);
    }

    public static long z(j$.time.chrono.e eVar, ZoneOffset zoneOffset) {
        Objects.requireNonNull(zoneOffset, "offset");
        return ((eVar.e().t() * 86400) + ((long) eVar.toLocalTime().M())) - ((long) zoneOffset.getTotalSeconds());
    }

    public int characteristics() {
        return 16448;
    }

    public long estimateSize() {
        return 0L;
    }

    public void forEachRemaining(Object obj) {
        Objects.requireNonNull(obj);
    }

    public boolean tryAdvance(Object obj) {
        Objects.requireNonNull(obj);
        return false;
    }

    public Spliterator trySplit() {
        return null;
    }
}
