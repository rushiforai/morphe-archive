package j$.util.stream;

import j$.util.Spliterator;
import j$.util.stream.IntStream;
import java.util.Iterator;
import java.util.function.BiConsumer;
import java.util.function.LongBinaryOperator;
import java.util.function.LongConsumer;
import java.util.function.LongFunction;
import java.util.function.ObjLongConsumer;
import java.util.function.Supplier;
import java.util.stream.LongStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class j1 implements l1 {
    public final /* synthetic */ LongStream a;

    public /* synthetic */ j1(LongStream longStream) {
        this.a = longStream;
    }

    public static /* synthetic */ l1 h(LongStream longStream) {
        if (longStream == null) {
            return null;
        }
        return longStream instanceof k1 ? ((k1) longStream).a : new j1(longStream);
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ l1 a() {
        return h(this.a.takeWhile(null));
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ c0 asDoubleStream() {
        return a0.h(this.a.asDoubleStream());
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ j$.util.y average() {
        return j$.time.a.F(this.a.average());
    }

    @Override // j$.util.stream.l1
    public final l1 b(j$.util.n nVar) {
        LongStream longStream = this.a;
        j$.util.n nVar2 = new j$.util.n(6);
        nVar2.b = nVar;
        return h(longStream.flatMap(nVar2));
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ Stream boxed() {
        return w6.h(this.a.boxed());
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ l1 c() {
        return h(this.a.filter(null));
    }

    @Override // java.lang.AutoCloseable
    public final /* synthetic */ void close() {
        this.a.close();
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ Object collect(Supplier supplier, ObjLongConsumer objLongConsumer, BiConsumer biConsumer) {
        return this.a.collect(supplier, objLongConsumer, biConsumer);
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ long count() {
        return this.a.count();
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ l1 d() {
        return h(this.a.dropWhile(null));
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ l1 distinct() {
        return h(this.a.distinct());
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ l1 e() {
        return h(this.a.map(null));
    }

    public final /* synthetic */ boolean equals(Object obj) {
        LongStream longStream = this.a;
        if (obj instanceof j1) {
            obj = ((j1) obj).a;
        }
        return longStream.equals(obj);
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ j$.util.a0 findAny() {
        return j$.time.a.H(this.a.findAny());
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ j$.util.a0 findFirst() {
        return j$.time.a.H(this.a.findFirst());
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ void forEach(LongConsumer longConsumer) {
        this.a.forEach(longConsumer);
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ void forEachOrdered(LongConsumer longConsumer) {
        this.a.forEachOrdered(longConsumer);
    }

    public final /* synthetic */ int hashCode() {
        return this.a.hashCode();
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ c0 i() {
        return a0.h(this.a.mapToDouble(null));
    }

    @Override // j$.util.stream.g
    public final /* synthetic */ boolean isParallel() {
        return this.a.isParallel();
    }

    /* JADX WARN: Type inference failed for: r1v2, types: [java.util.PrimitiveIterator$OfLong] */
    @Override // j$.util.stream.l1, j$.util.stream.g
    public final /* synthetic */ j$.util.m0 iterator() {
        ?? it2 = this.a.iterator();
        if (it2 == 0) {
            return null;
        }
        return it2 instanceof j$.util.l0 ? ((j$.util.l0) it2).a : new j$.util.k0(it2);
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ boolean k() {
        return this.a.noneMatch(null);
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ l1 limit(long j) {
        return h(this.a.limit(j));
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ Stream mapToObj(LongFunction longFunction) {
        return w6.h(this.a.mapToObj(longFunction));
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ j$.util.a0 max() {
        return j$.time.a.H(this.a.max());
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ j$.util.a0 min() {
        return j$.time.a.H(this.a.min());
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ boolean o() {
        return this.a.anyMatch(null);
    }

    @Override // j$.util.stream.g
    public final /* synthetic */ g onClose(Runnable runnable) {
        return e.h(this.a.onClose(runnable));
    }

    @Override // j$.util.stream.g
    public final /* synthetic */ g parallel() {
        return e.h(this.a.parallel());
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ l1 peek(LongConsumer longConsumer) {
        return h(this.a.peek(longConsumer));
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ j$.util.a0 reduce(LongBinaryOperator longBinaryOperator) {
        return j$.time.a.H(this.a.reduce(longBinaryOperator));
    }

    @Override // j$.util.stream.g
    public final /* synthetic */ g sequential() {
        return e.h(this.a.sequential());
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ l1 skip(long j) {
        return h(this.a.skip(j));
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ l1 sorted() {
        return h(this.a.sorted());
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [java.util.Spliterator$OfLong] */
    @Override // j$.util.stream.l1, j$.util.stream.g
    public final /* synthetic */ j$.util.x0 spliterator() {
        return j$.util.v0.a(this.a.spliterator());
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ long sum() {
        return this.a.sum();
    }

    @Override // j$.util.stream.l1
    public final j$.util.x summaryStatistics() {
        this.a.summaryStatistics();
        throw new Error("Java 8+ API desugaring (library desugaring) cannot convert from java.util.LongSummaryStatistics");
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ long[] toArray() {
        return this.a.toArray();
    }

    @Override // j$.util.stream.g
    public final /* synthetic */ g unordered() {
        return e.h(this.a.unordered());
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ boolean v() {
        return this.a.allMatch(null);
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ IntStream y() {
        return IntStream.VivifiedWrapper.convert(this.a.mapToInt(null));
    }

    @Override // j$.util.stream.l1, j$.util.stream.g
    public final /* synthetic */ l1 parallel() {
        return h(this.a.parallel());
    }

    @Override // j$.util.stream.l1
    public final /* synthetic */ long reduce(long j, LongBinaryOperator longBinaryOperator) {
        return this.a.reduce(j, longBinaryOperator);
    }

    @Override // j$.util.stream.l1, j$.util.stream.g
    public final /* synthetic */ l1 sequential() {
        return h(this.a.sequential());
    }

    @Override // j$.util.stream.g
    public final /* synthetic */ Spliterator spliterator() {
        return j$.util.b1.a(this.a.spliterator());
    }

    @Override // j$.util.stream.g
    public final /* synthetic */ Iterator iterator() {
        return this.a.iterator();
    }
}
