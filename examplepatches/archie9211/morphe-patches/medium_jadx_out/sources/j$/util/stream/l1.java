package j$.util.stream;

import java.util.function.BiConsumer;
import java.util.function.LongBinaryOperator;
import java.util.function.LongConsumer;
import java.util.function.LongFunction;
import java.util.function.ObjLongConsumer;
import java.util.function.Supplier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public interface l1 extends g {
    l1 a();

    c0 asDoubleStream();

    j$.util.y average();

    l1 b(j$.util.n nVar);

    Stream boxed();

    l1 c();

    Object collect(Supplier supplier, ObjLongConsumer objLongConsumer, BiConsumer biConsumer);

    long count();

    l1 d();

    l1 distinct();

    l1 e();

    j$.util.a0 findAny();

    j$.util.a0 findFirst();

    void forEach(LongConsumer longConsumer);

    void forEachOrdered(LongConsumer longConsumer);

    c0 i();

    @Override // j$.util.stream.g
    j$.util.m0 iterator();

    boolean k();

    l1 limit(long j);

    Stream mapToObj(LongFunction longFunction);

    j$.util.a0 max();

    j$.util.a0 min();

    boolean o();

    @Override // j$.util.stream.g
    l1 parallel();

    l1 peek(LongConsumer longConsumer);

    long reduce(long j, LongBinaryOperator longBinaryOperator);

    j$.util.a0 reduce(LongBinaryOperator longBinaryOperator);

    @Override // j$.util.stream.g
    l1 sequential();

    l1 skip(long j);

    l1 sorted();

    @Override // j$.util.stream.g
    j$.util.x0 spliterator();

    long sum();

    j$.util.x summaryStatistics();

    long[] toArray();

    boolean v();

    IntStream y();
}
