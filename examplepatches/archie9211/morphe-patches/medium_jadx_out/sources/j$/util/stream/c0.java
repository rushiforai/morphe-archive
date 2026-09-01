package j$.util.stream;

import java.util.function.BiConsumer;
import java.util.function.DoubleBinaryOperator;
import java.util.function.DoubleConsumer;
import java.util.function.DoubleFunction;
import java.util.function.DoubleUnaryOperator;
import java.util.function.ObjDoubleConsumer;
import java.util.function.Supplier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public interface c0 extends g {
    c0 a();

    j$.util.y average();

    c0 b(j$.util.n nVar);

    Stream boxed();

    c0 c();

    Object collect(Supplier supplier, ObjDoubleConsumer objDoubleConsumer, BiConsumer biConsumer);

    long count();

    c0 d();

    c0 distinct();

    j$.util.y findAny();

    j$.util.y findFirst();

    void forEach(DoubleConsumer doubleConsumer);

    void forEachOrdered(DoubleConsumer doubleConsumer);

    @Override // j$.util.stream.g
    j$.util.e0 iterator();

    boolean l();

    c0 limit(long j);

    c0 map(DoubleUnaryOperator doubleUnaryOperator);

    Stream mapToObj(DoubleFunction doubleFunction);

    j$.util.y max();

    j$.util.y min();

    @Override // j$.util.stream.g
    c0 parallel();

    c0 peek(DoubleConsumer doubleConsumer);

    double reduce(double d, DoubleBinaryOperator doubleBinaryOperator);

    j$.util.y reduce(DoubleBinaryOperator doubleBinaryOperator);

    @Override // j$.util.stream.g
    c0 sequential();

    c0 skip(long j);

    c0 sorted();

    @Override // j$.util.stream.g
    j$.util.r0 spliterator();

    double sum();

    j$.util.u summaryStatistics();

    boolean t();

    double[] toArray();

    l1 u();

    IntStream x();

    boolean z();
}
