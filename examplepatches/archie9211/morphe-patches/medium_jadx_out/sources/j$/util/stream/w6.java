package j$.util.stream;

import j$.util.Optional;
import j$.util.Spliterator;
import j$.util.stream.IntStream;
import j$.util.stream.Stream;
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
public final /* synthetic */ class w6 implements Stream {
    public final /* synthetic */ java.util.stream.Stream a;

    public /* synthetic */ w6(java.util.stream.Stream stream) {
        this.a = stream;
    }

    public static /* synthetic */ Stream h(java.util.stream.Stream stream) {
        if (stream == null) {
            return null;
        }
        return stream instanceof Stream.Wrapper ? Stream.this : new w6(stream);
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ boolean allMatch(Predicate predicate) {
        return this.a.allMatch(predicate);
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ boolean anyMatch(Predicate predicate) {
        return this.a.anyMatch(predicate);
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Stream b(j$.util.n nVar) {
        return h(this.a.flatMap(v3.M(nVar)));
    }

    @Override // java.lang.AutoCloseable
    public final /* synthetic */ void close() {
        this.a.close();
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Object collect(Supplier supplier, BiConsumer biConsumer, BiConsumer biConsumer2) {
        return this.a.collect(supplier, biConsumer, biConsumer2);
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ long count() {
        return this.a.count();
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Stream distinct() {
        return h(this.a.distinct());
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Stream dropWhile(Predicate predicate) {
        return h(this.a.dropWhile(predicate));
    }

    public final /* synthetic */ boolean equals(Object obj) {
        java.util.stream.Stream stream = this.a;
        if (obj instanceof w6) {
            obj = ((w6) obj).a;
        }
        return stream.equals(obj);
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Stream filter(Predicate predicate) {
        return h(this.a.filter(predicate));
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Optional findAny() {
        return j$.time.a.E(this.a.findAny());
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Optional findFirst() {
        return j$.time.a.E(this.a.findFirst());
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ void forEach(Consumer consumer) {
        this.a.forEach(consumer);
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ void forEachOrdered(Consumer consumer) {
        this.a.forEachOrdered(consumer);
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Object g(i iVar) {
        return this.a.collect(iVar == null ? null : iVar.a);
    }

    public final /* synthetic */ int hashCode() {
        return this.a.hashCode();
    }

    @Override // j$.util.stream.g
    public final /* synthetic */ boolean isParallel() {
        return this.a.isParallel();
    }

    @Override // j$.util.stream.g
    public final /* synthetic */ Iterator iterator() {
        return this.a.iterator();
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Stream limit(long j) {
        return h(this.a.limit(j));
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ l1 m(j$.util.n nVar) {
        return j1.h(this.a.flatMapToLong(v3.M(nVar)));
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Stream map(Function function) {
        return h(this.a.map(function));
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ c0 mapToDouble(ToDoubleFunction toDoubleFunction) {
        return a0.h(this.a.mapToDouble(toDoubleFunction));
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ IntStream mapToInt(ToIntFunction toIntFunction) {
        return IntStream.VivifiedWrapper.convert(this.a.mapToInt(toIntFunction));
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ l1 mapToLong(ToLongFunction toLongFunction) {
        return j1.h(this.a.mapToLong(toLongFunction));
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Optional max(Comparator comparator) {
        return j$.time.a.E(this.a.max(comparator));
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Optional min(Comparator comparator) {
        return j$.time.a.E(this.a.min(comparator));
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ boolean noneMatch(Predicate predicate) {
        return this.a.noneMatch(predicate);
    }

    @Override // j$.util.stream.g
    public final /* synthetic */ g onClose(Runnable runnable) {
        return e.h(this.a.onClose(runnable));
    }

    @Override // j$.util.stream.g
    public final /* synthetic */ g parallel() {
        return e.h(this.a.parallel());
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Stream peek(Consumer consumer) {
        return h(this.a.peek(consumer));
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ c0 q(j$.util.n nVar) {
        return a0.h(this.a.flatMapToDouble(v3.M(nVar)));
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Optional reduce(BinaryOperator binaryOperator) {
        return j$.time.a.E(this.a.reduce(binaryOperator));
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ IntStream s(j$.util.n nVar) {
        return IntStream.VivifiedWrapper.convert(this.a.flatMapToInt(v3.M(nVar)));
    }

    @Override // j$.util.stream.g
    public final /* synthetic */ g sequential() {
        return e.h(this.a.sequential());
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Stream skip(long j) {
        return h(this.a.skip(j));
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Stream sorted() {
        return h(this.a.sorted());
    }

    @Override // j$.util.stream.g
    public final /* synthetic */ Spliterator spliterator() {
        return j$.util.b1.a(this.a.spliterator());
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Stream takeWhile(Predicate predicate) {
        return h(this.a.takeWhile(predicate));
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Object[] toArray() {
        return this.a.toArray();
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ List toList() {
        return this.a.toList();
    }

    @Override // j$.util.stream.g
    public final /* synthetic */ g unordered() {
        return e.h(this.a.unordered());
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Object[] toArray(IntFunction intFunction) {
        return this.a.toArray(intFunction);
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Object reduce(Object obj, BiFunction biFunction, BinaryOperator binaryOperator) {
        return this.a.reduce(obj, biFunction, binaryOperator);
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Stream sorted(Comparator comparator) {
        return h(this.a.sorted(comparator));
    }

    @Override // j$.util.stream.Stream
    public final /* synthetic */ Object reduce(Object obj, BinaryOperator binaryOperator) {
        return this.a.reduce(obj, binaryOperator);
    }
}
