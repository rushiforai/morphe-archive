package j$.util.stream;

import j$.util.Spliterator;
import j$.util.stream.IntStream;
import j$.util.stream.Stream;
import java.util.DoubleSummaryStatistics;
import java.util.Iterator;
import java.util.OptionalDouble;
import java.util.Spliterator;
import java.util.function.BiConsumer;
import java.util.function.DoubleBinaryOperator;
import java.util.function.DoubleConsumer;
import java.util.function.DoubleFunction;
import java.util.function.DoublePredicate;
import java.util.function.DoubleToIntFunction;
import java.util.function.DoubleToLongFunction;
import java.util.function.DoubleUnaryOperator;
import java.util.function.ObjDoubleConsumer;
import java.util.function.Supplier;
import java.util.stream.BaseStream;
import java.util.stream.DoubleStream;
import java.util.stream.LongStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class b0 implements DoubleStream {
    public final /* synthetic */ c0 a;

    public /* synthetic */ b0(c0 c0Var) {
        this.a = c0Var;
    }

    public static /* synthetic */ DoubleStream h(c0 c0Var) {
        if (c0Var == null) {
            return null;
        }
        return c0Var instanceof a0 ? ((a0) c0Var).a : new b0(c0Var);
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ boolean allMatch(DoublePredicate doublePredicate) {
        return this.a.t();
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ boolean anyMatch(DoublePredicate doublePredicate) {
        return this.a.l();
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ OptionalDouble average() {
        return j$.time.a.J(this.a.average());
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ java.util.stream.Stream boxed() {
        return Stream.Wrapper.convert(this.a.boxed());
    }

    @Override // java.util.stream.BaseStream, java.lang.AutoCloseable
    public final /* synthetic */ void close() throws Exception {
        this.a.close();
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ Object collect(Supplier supplier, ObjDoubleConsumer objDoubleConsumer, BiConsumer biConsumer) {
        return this.a.collect(supplier, objDoubleConsumer, biConsumer);
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ long count() {
        return this.a.count();
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ DoubleStream distinct() {
        return h(this.a.distinct());
    }

    public final /* synthetic */ DoubleStream dropWhile(DoublePredicate doublePredicate) {
        return h(this.a.d());
    }

    public final /* synthetic */ boolean equals(Object obj) {
        c0 c0Var = this.a;
        if (obj instanceof b0) {
            obj = ((b0) obj).a;
        }
        return c0Var.equals(obj);
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ DoubleStream filter(DoublePredicate doublePredicate) {
        return h(this.a.c());
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ OptionalDouble findAny() {
        return j$.time.a.J(this.a.findAny());
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ OptionalDouble findFirst() {
        return j$.time.a.J(this.a.findFirst());
    }

    @Override // java.util.stream.DoubleStream
    public final DoubleStream flatMap(DoubleFunction doubleFunction) {
        c0 c0Var = this.a;
        j$.util.n nVar = new j$.util.n(4);
        nVar.b = doubleFunction;
        return h(c0Var.b(nVar));
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ void forEach(DoubleConsumer doubleConsumer) {
        this.a.forEach(doubleConsumer);
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ void forEachOrdered(DoubleConsumer doubleConsumer) {
        this.a.forEachOrdered(doubleConsumer);
    }

    public final /* synthetic */ int hashCode() {
        return this.a.hashCode();
    }

    @Override // java.util.stream.BaseStream
    public final /* synthetic */ boolean isParallel() {
        return this.a.isParallel();
    }

    @Override // java.util.stream.DoubleStream, java.util.stream.BaseStream
    /* JADX INFO: renamed from: iterator, reason: avoid collision after fix types in other method */
    public final /* synthetic */ Iterator<Double> iterator2() {
        j$.util.e0 it2 = this.a.iterator();
        if (it2 == null) {
            return null;
        }
        return it2 instanceof j$.util.c0 ? ((j$.util.c0) it2).a : new j$.util.d0(it2);
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ DoubleStream limit(long j) {
        return h(this.a.limit(j));
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ DoubleStream map(DoubleUnaryOperator doubleUnaryOperator) {
        return h(this.a.map(doubleUnaryOperator));
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ java.util.stream.IntStream mapToInt(DoubleToIntFunction doubleToIntFunction) {
        return IntStream.Wrapper.convert(this.a.x());
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ LongStream mapToLong(DoubleToLongFunction doubleToLongFunction) {
        return k1.h(this.a.u());
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ java.util.stream.Stream mapToObj(DoubleFunction doubleFunction) {
        return Stream.Wrapper.convert(this.a.mapToObj(doubleFunction));
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ OptionalDouble max() {
        return j$.time.a.J(this.a.max());
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ OptionalDouble min() {
        return j$.time.a.J(this.a.min());
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ boolean noneMatch(DoublePredicate doublePredicate) {
        return this.a.z();
    }

    @Override // java.util.stream.BaseStream
    public final /* synthetic */ BaseStream onClose(Runnable runnable) {
        return f.h(this.a.onClose(runnable));
    }

    @Override // java.util.stream.DoubleStream, java.util.stream.BaseStream
    public final /* synthetic */ BaseStream parallel() {
        return f.h(this.a.parallel());
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ DoubleStream peek(DoubleConsumer doubleConsumer) {
        return h(this.a.peek(doubleConsumer));
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ OptionalDouble reduce(DoubleBinaryOperator doubleBinaryOperator) {
        return j$.time.a.J(this.a.reduce(doubleBinaryOperator));
    }

    @Override // java.util.stream.DoubleStream, java.util.stream.BaseStream
    public final /* synthetic */ BaseStream sequential() {
        return f.h(this.a.sequential());
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ DoubleStream skip(long j) {
        return h(this.a.skip(j));
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ DoubleStream sorted() {
        return h(this.a.sorted());
    }

    @Override // java.util.stream.DoubleStream, java.util.stream.BaseStream
    public final /* synthetic */ Spliterator<Double> spliterator() {
        return j$.util.q0.a(this.a.spliterator());
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ double sum() {
        return this.a.sum();
    }

    @Override // java.util.stream.DoubleStream
    public final DoubleSummaryStatistics summaryStatistics() {
        this.a.summaryStatistics();
        throw new Error("Java 8+ API desugaring (library desugaring) cannot convert to java.util.DoubleSummaryStatistics");
    }

    public final /* synthetic */ DoubleStream takeWhile(DoublePredicate doublePredicate) {
        return h(this.a.a());
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ double[] toArray() {
        return this.a.toArray();
    }

    @Override // java.util.stream.BaseStream
    public final /* synthetic */ BaseStream unordered() {
        return f.h(this.a.unordered());
    }

    @Override // java.util.stream.DoubleStream, java.util.stream.BaseStream
    public final /* synthetic */ DoubleStream parallel() {
        return h(this.a.parallel());
    }

    @Override // java.util.stream.DoubleStream
    public final /* synthetic */ double reduce(double d, DoubleBinaryOperator doubleBinaryOperator) {
        return this.a.reduce(d, doubleBinaryOperator);
    }

    @Override // java.util.stream.DoubleStream, java.util.stream.BaseStream
    public final /* synthetic */ DoubleStream sequential() {
        return h(this.a.sequential());
    }

    @Override // java.util.stream.DoubleStream, java.util.stream.BaseStream
    /* JADX INFO: renamed from: spliterator, reason: avoid collision after fix types in other method */
    public final /* synthetic */ Spliterator<Double> spliterator2() {
        return Spliterator.Wrapper.convert(this.a.spliterator());
    }

    @Override // java.util.stream.DoubleStream, java.util.stream.BaseStream
    public final /* synthetic */ Iterator<Double> iterator() {
        return this.a.iterator();
    }
}
