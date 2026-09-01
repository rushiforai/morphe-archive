package j$.util.stream;

import j$.util.Spliterator;
import java.util.function.Consumer;
import java.util.function.DoubleConsumer;
import java.util.function.IntFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class u2 extends o6 implements a2, v1 {
    @Override // j$.util.stream.f2, j$.util.stream.g2
    public final f2 a(int i) {
        throw new IndexOutOfBoundsException();
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(int i) {
        v3.k();
        throw null;
    }

    public final /* synthetic */ Consumer andThen(Consumer consumer) {
        return j$.time.a.d(this, consumer);
    }

    @Override // j$.util.stream.u6, j$.util.stream.f2
    public final Object b() {
        return (double[]) super.b();
    }

    @Override // j$.util.stream.l5
    public final void c(long j) {
        clear();
        s(j);
    }

    @Override // j$.util.stream.l5
    public final boolean e() {
        return false;
    }

    @Override // j$.util.stream.u6, j$.util.stream.f2
    public final void f(int i, Object obj) {
        super.f(i, (double[]) obj);
    }

    @Override // j$.util.stream.u6, j$.util.stream.f2
    public final void g(Object obj) {
        super.g((DoubleConsumer) obj);
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

    @Override // j$.util.stream.i5
    public final /* synthetic */ void n(Double d) {
        v3.d(this, d);
    }

    @Override // j$.util.stream.g2
    public final int o() {
        return 0;
    }

    @Override // j$.util.stream.o6, j$.util.stream.u6, java.lang.Iterable, j$.util.stream.g2
    public final j$.util.a1 spliterator() {
        return super.spliterator();
    }

    @Override // j$.util.stream.y1
    public final g2 build() {
        return this;
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(long j) {
        v3.l();
        throw null;
    }

    @Override // j$.util.stream.o6, j$.util.stream.u6, java.lang.Iterable, j$.util.stream.g2
    public final Spliterator spliterator() {
        return super.spliterator();
    }

    @Override // j$.util.stream.g2
    public final g2 a(int i) {
        throw new IndexOutOfBoundsException();
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final /* bridge */ /* synthetic */ void n(Object obj) {
        n((Double) obj);
    }

    @Override // j$.util.stream.v1, j$.util.stream.y1
    public final a2 build() {
        return this;
    }

    @Override // j$.util.stream.l5
    public final void end() {
    }
}
