package j$.util.stream;

import j$.util.Spliterator;
import j$.util.stream.Stream;
import java.util.IntSummaryStatistics;
import java.util.Iterator;
import java.util.OptionalDouble;
import java.util.OptionalInt;
import java.util.function.BiConsumer;
import java.util.function.IntBinaryOperator;
import java.util.function.IntConsumer;
import java.util.function.IntFunction;
import java.util.function.IntPredicate;
import java.util.function.IntToDoubleFunction;
import java.util.function.IntToLongFunction;
import java.util.function.IntUnaryOperator;
import java.util.function.ObjIntConsumer;
import java.util.function.Supplier;
import java.util.stream.BaseStream;
import java.util.stream.DoubleStream;
import java.util.stream.LongStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public interface IntStream extends g {
    IntStream a();

    c0 asDoubleStream();

    l1 asLongStream();

    j$.util.y average();

    Stream boxed();

    IntStream c();

    Object collect(Supplier supplier, ObjIntConsumer objIntConsumer, BiConsumer biConsumer);

    long count();

    IntStream d();

    IntStream distinct();

    IntStream e();

    c0 f();

    j$.util.z findAny();

    j$.util.z findFirst();

    void forEach(IntConsumer intConsumer);

    void forEachOrdered(IntConsumer intConsumer);

    @Override // j$.util.stream.g
    j$.util.i0 iterator();

    l1 j();

    IntStream limit(long j);

    Stream mapToObj(IntFunction intFunction);

    j$.util.z max();

    j$.util.z min();

    boolean n();

    IntStream p(l0 l0Var);

    @Override // j$.util.stream.g
    IntStream parallel();

    IntStream peek(IntConsumer intConsumer);

    boolean r();

    int reduce(int i, IntBinaryOperator intBinaryOperator);

    j$.util.z reduce(IntBinaryOperator intBinaryOperator);

    @Override // j$.util.stream.g
    IntStream sequential();

    IntStream skip(long j);

    IntStream sorted();

    @Override // j$.util.stream.g
    j$.util.u0 spliterator();

    int sum();

    j$.util.v summaryStatistics();

    int[] toArray();

    boolean w();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public final /* synthetic */ class VivifiedWrapper implements IntStream {
        public final /* synthetic */ java.util.stream.IntStream a;

        public /* synthetic */ VivifiedWrapper(java.util.stream.IntStream intStream) {
            this.a = intStream;
        }

        public static /* synthetic */ IntStream convert(java.util.stream.IntStream intStream) {
            if (intStream == null) {
                return null;
            }
            return intStream instanceof Wrapper ? IntStream.this : new VivifiedWrapper(intStream);
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ IntStream a() {
            return convert(this.a.takeWhile(null));
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ c0 asDoubleStream() {
            return a0.h(this.a.asDoubleStream());
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ l1 asLongStream() {
            return j1.h(this.a.asLongStream());
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ j$.util.y average() {
            return j$.time.a.F(this.a.average());
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ Stream boxed() {
            return w6.h(this.a.boxed());
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ IntStream c() {
            return convert(this.a.filter(null));
        }

        @Override // java.lang.AutoCloseable
        public final /* synthetic */ void close() {
            this.a.close();
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ Object collect(Supplier supplier, ObjIntConsumer objIntConsumer, BiConsumer biConsumer) {
            return this.a.collect(supplier, objIntConsumer, biConsumer);
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ long count() {
            return this.a.count();
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ IntStream d() {
            return convert(this.a.dropWhile(null));
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ IntStream distinct() {
            return convert(this.a.distinct());
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ IntStream e() {
            return convert(this.a.map(null));
        }

        public final /* synthetic */ boolean equals(Object obj) {
            java.util.stream.IntStream intStream = this.a;
            if (obj instanceof VivifiedWrapper) {
                obj = ((VivifiedWrapper) obj).a;
            }
            return intStream.equals(obj);
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ c0 f() {
            return a0.h(this.a.mapToDouble(null));
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ j$.util.z findAny() {
            return j$.time.a.G(this.a.findAny());
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ j$.util.z findFirst() {
            return j$.time.a.G(this.a.findFirst());
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ void forEach(IntConsumer intConsumer) {
            this.a.forEach(intConsumer);
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ void forEachOrdered(IntConsumer intConsumer) {
            this.a.forEachOrdered(intConsumer);
        }

        public final /* synthetic */ int hashCode() {
            return this.a.hashCode();
        }

        @Override // j$.util.stream.g
        public final /* synthetic */ boolean isParallel() {
            return this.a.isParallel();
        }

        /* JADX WARN: Type inference failed for: r1v2, types: [java.util.PrimitiveIterator$OfInt] */
        @Override // j$.util.stream.IntStream, j$.util.stream.g
        public final /* synthetic */ j$.util.i0 iterator() {
            ?? it2 = this.a.iterator();
            if (it2 == 0) {
                return null;
            }
            return it2 instanceof j$.util.h0 ? ((j$.util.h0) it2).a : new j$.util.g0(it2);
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ l1 j() {
            return j1.h(this.a.mapToLong(null));
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ IntStream limit(long j) {
            return convert(this.a.limit(j));
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ Stream mapToObj(IntFunction intFunction) {
            return w6.h(this.a.mapToObj(intFunction));
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ j$.util.z max() {
            return j$.time.a.G(this.a.max());
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ j$.util.z min() {
            return j$.time.a.G(this.a.min());
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ boolean n() {
            return this.a.allMatch(null);
        }

        @Override // j$.util.stream.g
        public final /* synthetic */ g onClose(Runnable runnable) {
            return e.h(this.a.onClose(runnable));
        }

        @Override // j$.util.stream.IntStream
        public final IntStream p(l0 l0Var) {
            java.util.stream.IntStream intStream = this.a;
            l0 l0Var2 = new l0();
            l0Var2.a = l0Var;
            return convert(intStream.flatMap(l0Var2));
        }

        @Override // j$.util.stream.g
        public final /* synthetic */ g parallel() {
            return e.h(this.a.parallel());
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ IntStream peek(IntConsumer intConsumer) {
            return convert(this.a.peek(intConsumer));
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ boolean r() {
            return this.a.noneMatch(null);
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ j$.util.z reduce(IntBinaryOperator intBinaryOperator) {
            return j$.time.a.G(this.a.reduce(intBinaryOperator));
        }

        @Override // j$.util.stream.g
        public final /* synthetic */ g sequential() {
            return e.h(this.a.sequential());
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ IntStream skip(long j) {
            return convert(this.a.skip(j));
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ IntStream sorted() {
            return convert(this.a.sorted());
        }

        /* JADX WARN: Type inference failed for: r0v2, types: [java.util.Spliterator$OfInt] */
        @Override // j$.util.stream.IntStream, j$.util.stream.g
        public final /* synthetic */ j$.util.u0 spliterator() {
            return j$.util.s0.a(this.a.spliterator());
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ int sum() {
            return this.a.sum();
        }

        @Override // j$.util.stream.IntStream
        public final j$.util.v summaryStatistics() {
            this.a.summaryStatistics();
            throw new Error("Java 8+ API desugaring (library desugaring) cannot convert from java.util.IntSummaryStatistics");
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ int[] toArray() {
            return this.a.toArray();
        }

        @Override // j$.util.stream.g
        public final /* synthetic */ g unordered() {
            return e.h(this.a.unordered());
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ boolean w() {
            return this.a.anyMatch(null);
        }

        @Override // j$.util.stream.IntStream, j$.util.stream.g
        public final /* synthetic */ IntStream parallel() {
            return convert(this.a.parallel());
        }

        @Override // j$.util.stream.IntStream
        public final /* synthetic */ int reduce(int i, IntBinaryOperator intBinaryOperator) {
            return this.a.reduce(i, intBinaryOperator);
        }

        @Override // j$.util.stream.IntStream, j$.util.stream.g
        public final /* synthetic */ IntStream sequential() {
            return convert(this.a.sequential());
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

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public final /* synthetic */ class Wrapper implements java.util.stream.IntStream {
        public /* synthetic */ Wrapper() {
        }

        public static /* synthetic */ java.util.stream.IntStream convert(IntStream intStream) {
            if (intStream == null) {
                return null;
            }
            return intStream instanceof VivifiedWrapper ? ((VivifiedWrapper) intStream).a : intStream.new Wrapper();
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ boolean allMatch(IntPredicate intPredicate) {
            return IntStream.this.n();
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ boolean anyMatch(IntPredicate intPredicate) {
            return IntStream.this.w();
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ DoubleStream asDoubleStream() {
            return b0.h(IntStream.this.asDoubleStream());
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ LongStream asLongStream() {
            return k1.h(IntStream.this.asLongStream());
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ OptionalDouble average() {
            return j$.time.a.J(IntStream.this.average());
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ java.util.stream.Stream boxed() {
            return Stream.Wrapper.convert(IntStream.this.boxed());
        }

        @Override // java.util.stream.BaseStream, java.lang.AutoCloseable
        public final /* synthetic */ void close() throws Exception {
            IntStream.this.close();
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ Object collect(Supplier supplier, ObjIntConsumer objIntConsumer, BiConsumer biConsumer) {
            return IntStream.this.collect(supplier, objIntConsumer, biConsumer);
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ long count() {
            return IntStream.this.count();
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ java.util.stream.IntStream distinct() {
            return convert(IntStream.this.distinct());
        }

        public final /* synthetic */ java.util.stream.IntStream dropWhile(IntPredicate intPredicate) {
            return convert(IntStream.this.d());
        }

        public final /* synthetic */ boolean equals(Object obj) {
            IntStream intStream = IntStream.this;
            if (obj instanceof Wrapper) {
                obj = IntStream.this;
            }
            return intStream.equals(obj);
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ java.util.stream.IntStream filter(IntPredicate intPredicate) {
            return convert(IntStream.this.c());
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ OptionalInt findAny() {
            return j$.time.a.K(IntStream.this.findAny());
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ OptionalInt findFirst() {
            return j$.time.a.K(IntStream.this.findFirst());
        }

        @Override // java.util.stream.IntStream
        public final java.util.stream.IntStream flatMap(IntFunction intFunction) {
            IntStream intStream = IntStream.this;
            l0 l0Var = new l0();
            l0Var.a = intFunction;
            return convert(intStream.p(l0Var));
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ void forEach(IntConsumer intConsumer) {
            IntStream.this.forEach(intConsumer);
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ void forEachOrdered(IntConsumer intConsumer) {
            IntStream.this.forEachOrdered(intConsumer);
        }

        public final /* synthetic */ int hashCode() {
            return IntStream.this.hashCode();
        }

        @Override // java.util.stream.BaseStream
        public final /* synthetic */ boolean isParallel() {
            return IntStream.this.isParallel();
        }

        @Override // java.util.stream.IntStream, java.util.stream.BaseStream
        /* JADX INFO: renamed from: iterator, reason: avoid collision after fix types in other method */
        public final /* synthetic */ Iterator<Integer> iterator2() {
            j$.util.i0 it2 = IntStream.this.iterator();
            if (it2 == null) {
                return null;
            }
            return it2 instanceof j$.util.g0 ? ((j$.util.g0) it2).a : new j$.util.h0(it2);
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ java.util.stream.IntStream limit(long j) {
            return convert(IntStream.this.limit(j));
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ java.util.stream.IntStream map(IntUnaryOperator intUnaryOperator) {
            return convert(IntStream.this.e());
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ DoubleStream mapToDouble(IntToDoubleFunction intToDoubleFunction) {
            return b0.h(IntStream.this.f());
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ LongStream mapToLong(IntToLongFunction intToLongFunction) {
            return k1.h(IntStream.this.j());
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ java.util.stream.Stream mapToObj(IntFunction intFunction) {
            return Stream.Wrapper.convert(IntStream.this.mapToObj(intFunction));
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ OptionalInt max() {
            return j$.time.a.K(IntStream.this.max());
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ OptionalInt min() {
            return j$.time.a.K(IntStream.this.min());
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ boolean noneMatch(IntPredicate intPredicate) {
            return IntStream.this.r();
        }

        @Override // java.util.stream.BaseStream
        public final /* synthetic */ BaseStream onClose(Runnable runnable) {
            return f.h(IntStream.this.onClose(runnable));
        }

        @Override // java.util.stream.IntStream, java.util.stream.BaseStream
        public final /* synthetic */ BaseStream parallel() {
            return f.h(IntStream.this.parallel());
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ java.util.stream.IntStream peek(IntConsumer intConsumer) {
            return convert(IntStream.this.peek(intConsumer));
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ OptionalInt reduce(IntBinaryOperator intBinaryOperator) {
            return j$.time.a.K(IntStream.this.reduce(intBinaryOperator));
        }

        @Override // java.util.stream.IntStream, java.util.stream.BaseStream
        public final /* synthetic */ BaseStream sequential() {
            return f.h(IntStream.this.sequential());
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ java.util.stream.IntStream skip(long j) {
            return convert(IntStream.this.skip(j));
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ java.util.stream.IntStream sorted() {
            return convert(IntStream.this.sorted());
        }

        @Override // java.util.stream.IntStream, java.util.stream.BaseStream
        public final /* synthetic */ java.util.Spliterator<Integer> spliterator() {
            return j$.util.t0.a(IntStream.this.spliterator());
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ int sum() {
            return IntStream.this.sum();
        }

        @Override // java.util.stream.IntStream
        public final IntSummaryStatistics summaryStatistics() {
            IntStream.this.summaryStatistics();
            throw new Error("Java 8+ API desugaring (library desugaring) cannot convert to java.util.IntSummaryStatistics");
        }

        public final /* synthetic */ java.util.stream.IntStream takeWhile(IntPredicate intPredicate) {
            return convert(IntStream.this.a());
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ int[] toArray() {
            return IntStream.this.toArray();
        }

        @Override // java.util.stream.BaseStream
        public final /* synthetic */ BaseStream unordered() {
            return f.h(IntStream.this.unordered());
        }

        @Override // java.util.stream.IntStream, java.util.stream.BaseStream
        public final /* synthetic */ java.util.stream.IntStream parallel() {
            return convert(IntStream.this.parallel());
        }

        @Override // java.util.stream.IntStream
        public final /* synthetic */ int reduce(int i, IntBinaryOperator intBinaryOperator) {
            return IntStream.this.reduce(i, intBinaryOperator);
        }

        @Override // java.util.stream.IntStream, java.util.stream.BaseStream
        public final /* synthetic */ java.util.stream.IntStream sequential() {
            return convert(IntStream.this.sequential());
        }

        @Override // java.util.stream.IntStream, java.util.stream.BaseStream
        /* JADX INFO: renamed from: spliterator, reason: avoid collision after fix types in other method */
        public final /* synthetic */ java.util.Spliterator<Integer> spliterator2() {
            return Spliterator.Wrapper.convert(IntStream.this.spliterator());
        }

        @Override // java.util.stream.IntStream, java.util.stream.BaseStream
        public final /* synthetic */ Iterator<Integer> iterator() {
            return IntStream.this.iterator();
        }
    }
}
