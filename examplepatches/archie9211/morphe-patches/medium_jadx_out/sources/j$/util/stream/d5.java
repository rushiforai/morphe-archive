package j$.util.stream;

import j$.util.Objects;
import j$.util.Optional;
import j$.util.Spliterator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.BinaryOperator;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.IntFunction;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.function.ToDoubleFunction;
import java.util.function.ToIntFunction;
import java.util.function.ToLongFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class d5 extends a implements Stream {
    @Override // j$.util.stream.a
    public final g2 F(a aVar, Spliterator spliterator, boolean z, IntFunction intFunction) {
        return v3.A(aVar, spliterator, z, intFunction);
    }

    @Override // j$.util.stream.a
    public final boolean H(Spliterator spliterator, l5 l5Var) {
        boolean zE;
        do {
            zE = l5Var.e();
            if (zE) {
                break;
            }
        } while (spliterator.tryAdvance(l5Var));
        return zE;
    }

    @Override // j$.util.stream.a
    public final z6 I() {
        return z6.REFERENCE;
    }

    @Override // j$.util.stream.a
    public final y1 J(long j, IntFunction intFunction) {
        return v3.x(j, intFunction);
    }

    @Override // j$.util.stream.a
    public final Spliterator Q(a aVar, Supplier supplier, boolean z) {
        return new c8(aVar, supplier, z);
    }

    @Override // j$.util.stream.Stream
    public final boolean allMatch(Predicate predicate) {
        return ((Boolean) D(v3.V(s1.ALL, predicate))).booleanValue();
    }

    @Override // j$.util.stream.Stream
    public final boolean anyMatch(Predicate predicate) {
        return ((Boolean) D(v3.V(s1.ANY, predicate))).booleanValue();
    }

    @Override // j$.util.stream.Stream
    public final Stream b(j$.util.n nVar) {
        Objects.requireNonNull(nVar);
        return new p(this, y6.p | y6.n | y6.t, nVar, 6);
    }

    @Override // j$.util.stream.Stream
    public final Object collect(Supplier supplier, BiConsumer biConsumer, BiConsumer biConsumer2) {
        Objects.requireNonNull(supplier);
        Objects.requireNonNull(biConsumer);
        Objects.requireNonNull(biConsumer2);
        return D(new a4(z6.REFERENCE, biConsumer2, biConsumer, supplier, 3));
    }

    @Override // j$.util.stream.Stream
    public final long count() {
        return ((Long) D(new c4(2))).longValue();
    }

    @Override // j$.util.stream.Stream
    public final Stream distinct() {
        return new m(this, y6.m | y6.t);
    }

    @Override // j$.util.stream.Stream
    public final Stream dropWhile(Predicate predicate) {
        int i = v8.a;
        Objects.requireNonNull(predicate);
        return new h8(this, v8.b, predicate, 1);
    }

    @Override // j$.util.stream.Stream
    public final Stream filter(Predicate predicate) {
        Objects.requireNonNull(predicate);
        return new p(this, y6.t, predicate, 4);
    }

    @Override // j$.util.stream.Stream
    public final Optional findAny() {
        return (Optional) D(i0.d);
    }

    @Override // j$.util.stream.Stream
    public final Optional findFirst() {
        return (Optional) D(i0.c);
    }

    public void forEach(Consumer consumer) {
        Objects.requireNonNull(consumer);
        D(new p0(consumer, false));
    }

    public void forEachOrdered(Consumer consumer) {
        Objects.requireNonNull(consumer);
        D(new p0(consumer, true));
    }

    /* JADX WARN: Removed duplicated region for block: B:107:0x0155  */
    @Override // j$.util.stream.Stream
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(j$.util.stream.i r10) {
        /*
            Method dump skipped, instruction units count: 536
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.stream.d5.g(j$.util.stream.i):java.lang.Object");
    }

    @Override // j$.util.stream.g
    public final Iterator iterator() {
        Spliterator spliterator = spliterator();
        Objects.requireNonNull(spliterator);
        return new j$.util.c1(spliterator);
    }

    @Override // j$.util.stream.Stream
    public final Stream limit(long j) {
        if (j >= 0) {
            return v3.W(this, 0L, j);
        }
        j$.time.h.c(Long.toString(j));
        return null;
    }

    @Override // j$.util.stream.Stream
    public final l1 m(j$.util.n nVar) {
        Objects.requireNonNull(nVar);
        return new e1(this, y6.p | y6.n | y6.t, nVar, 2);
    }

    @Override // j$.util.stream.Stream
    public final Stream map(Function function) {
        Objects.requireNonNull(function);
        return new p(this, y6.p | y6.n, function, 5);
    }

    @Override // j$.util.stream.Stream
    public final c0 mapToDouble(ToDoubleFunction toDoubleFunction) {
        Objects.requireNonNull(toDoubleFunction);
        return new q(this, y6.p | y6.n, toDoubleFunction, 3);
    }

    @Override // j$.util.stream.Stream
    public final IntStream mapToInt(ToIntFunction toIntFunction) {
        Objects.requireNonNull(toIntFunction);
        return new u0(this, y6.p | y6.n, toIntFunction, 2);
    }

    @Override // j$.util.stream.Stream
    public final l1 mapToLong(ToLongFunction toLongFunction) {
        Objects.requireNonNull(toLongFunction);
        return new e1(this, y6.p | y6.n, toLongFunction, 3);
    }

    @Override // j$.util.stream.Stream
    public final Optional max(Comparator comparator) {
        Objects.requireNonNull(comparator);
        return reduce(new j$.util.function.a(comparator, 0));
    }

    @Override // j$.util.stream.Stream
    public final Optional min(Comparator comparator) {
        Objects.requireNonNull(comparator);
        return reduce(new j$.util.function.a(comparator, 1));
    }

    @Override // j$.util.stream.Stream
    public final boolean noneMatch(Predicate predicate) {
        return ((Boolean) D(v3.V(s1.NONE, predicate))).booleanValue();
    }

    @Override // j$.util.stream.Stream
    public final Stream peek(Consumer consumer) {
        Objects.requireNonNull(consumer);
        return new p(this, consumer);
    }

    @Override // j$.util.stream.Stream
    public final c0 q(j$.util.n nVar) {
        Objects.requireNonNull(nVar);
        return new q(this, y6.p | y6.n | y6.t, nVar, 4);
    }

    @Override // j$.util.stream.Stream
    public final Object reduce(Object obj, BiFunction biFunction, BinaryOperator binaryOperator) {
        Objects.requireNonNull(biFunction);
        Objects.requireNonNull(binaryOperator);
        return D(new a4(z6.REFERENCE, binaryOperator, biFunction, obj, 2));
    }

    @Override // j$.util.stream.Stream
    public final IntStream s(j$.util.n nVar) {
        Objects.requireNonNull(nVar);
        return new u0(this, y6.p | y6.n | y6.t, nVar, 3);
    }

    @Override // j$.util.stream.Stream
    public final Stream skip(long j) {
        if (j >= 0) {
            return j == 0 ? this : v3.W(this, j, -1L);
        }
        j$.time.h.c(Long.toString(j));
        return null;
    }

    @Override // j$.util.stream.Stream
    public final Stream sorted() {
        return new g6(this);
    }

    @Override // j$.util.stream.Stream
    public final Stream takeWhile(Predicate predicate) {
        int i = v8.a;
        Objects.requireNonNull(predicate);
        return new h8(this, v8.a, predicate, 0);
    }

    @Override // j$.util.stream.Stream
    public final Object[] toArray(IntFunction intFunction) {
        return v3.I(E(intFunction), intFunction).m(intFunction);
    }

    @Override // j$.util.stream.Stream
    public final List toList() {
        return Collections.unmodifiableList(new ArrayList(Arrays.asList(toArray())));
    }

    @Override // j$.util.stream.Stream
    public final Stream sorted(Comparator comparator) {
        return new g6(this, comparator);
    }

    @Override // j$.util.stream.Stream
    public final Object[] toArray() {
        return toArray(new u1(9));
    }

    @Override // j$.util.stream.Stream
    public final Object reduce(Object obj, BinaryOperator binaryOperator) {
        Objects.requireNonNull(binaryOperator);
        Objects.requireNonNull(binaryOperator);
        return D(new a4(z6.REFERENCE, binaryOperator, binaryOperator, obj, 2));
    }

    @Override // j$.util.stream.Stream
    public final Optional reduce(BinaryOperator binaryOperator) {
        Objects.requireNonNull(binaryOperator);
        return (Optional) D(new y3(z6.REFERENCE, binaryOperator, 2));
    }
}
