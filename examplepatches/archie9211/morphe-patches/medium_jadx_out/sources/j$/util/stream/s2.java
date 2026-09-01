package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import j$.util.Spliterators;
import java.util.Arrays;
import java.util.function.Consumer;
import java.util.function.DoubleConsumer;
import java.util.function.IntFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public class s2 implements a2 {
    public final double[] a;
    public int b;

    public s2(long j) {
        if (j >= 2147483639) {
            j$.time.h.c("Stream size exceeds max array size");
            throw null;
        }
        this.a = new double[(int) j];
        this.b = 0;
    }

    @Override // j$.util.stream.f2, j$.util.stream.g2
    public final f2 a(int i) {
        throw new IndexOutOfBoundsException();
    }

    @Override // j$.util.stream.f2
    public final Object b() {
        double[] dArr = this.a;
        int length = dArr.length;
        int i = this.b;
        return length == i ? dArr : Arrays.copyOf(dArr, i);
    }

    @Override // j$.util.stream.g2
    public final long count() {
        return this.b;
    }

    @Override // j$.util.stream.f2
    public final void f(int i, Object obj) {
        int i2 = this.b;
        System.arraycopy(this.a, 0, (double[]) obj, i, i2);
    }

    @Override // j$.util.stream.g2
    public final /* synthetic */ void forEach(Consumer consumer) {
        v3.q(this, consumer);
    }

    @Override // j$.util.stream.f2
    public final void g(Object obj) {
        DoubleConsumer doubleConsumer = (DoubleConsumer) obj;
        for (int i = 0; i < this.b; i++) {
            doubleConsumer.accept(this.a[i]);
        }
    }

    @Override // j$.util.stream.g2
    public final /* synthetic */ g2 j(long j, long j2, IntFunction intFunction) {
        return v3.t(this, j, j2);
    }

    @Override // j$.util.stream.g2
    public final /* synthetic */ void k(Object[] objArr, int i) {
        v3.n(this, (Double[]) objArr, i);
    }

    @Override // j$.util.stream.g2
    public final /* synthetic */ Object[] m(IntFunction intFunction) {
        return v3.m(this, intFunction);
    }

    @Override // j$.util.stream.g2
    public final int o() {
        return 0;
    }

    @Override // j$.util.stream.f2, j$.util.stream.g2
    public final j$.util.a1 spliterator() {
        int i = this.b;
        double[] dArr = this.a;
        Spliterators.a(((double[]) Objects.requireNonNull(dArr)).length, 0, i);
        return new j$.util.h1(dArr, 0, i, 1040);
    }

    public String toString() {
        double[] dArr = this.a;
        return String.format("DoubleArrayNode[%d][%s]", Integer.valueOf(dArr.length - this.b), Arrays.toString(dArr));
    }

    @Override // j$.util.stream.g2
    public final g2 a(int i) {
        throw new IndexOutOfBoundsException();
    }

    @Override // j$.util.stream.g2
    public final Spliterator spliterator() {
        int i = this.b;
        double[] dArr = this.a;
        Spliterators.a(((double[]) Objects.requireNonNull(dArr)).length, 0, i);
        return new j$.util.h1(dArr, 0, i, 1040);
    }

    public s2(double[] dArr) {
        this.a = dArr;
        this.b = dArr.length;
    }
}
