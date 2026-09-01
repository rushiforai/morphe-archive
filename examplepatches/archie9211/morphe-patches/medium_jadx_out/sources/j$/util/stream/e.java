package j$.util.stream;

import j$.util.Spliterator;
import j$.util.stream.IntStream;
import java.util.Iterator;
import java.util.stream.BaseStream;
import java.util.stream.DoubleStream;
import java.util.stream.LongStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class e implements g {
    public final /* synthetic */ BaseStream a;

    public /* synthetic */ e(BaseStream baseStream) {
        this.a = baseStream;
    }

    public static /* synthetic */ g h(BaseStream baseStream) {
        if (baseStream == null) {
            return null;
        }
        return baseStream instanceof f ? ((f) baseStream).a : baseStream instanceof DoubleStream ? a0.h((DoubleStream) baseStream) : baseStream instanceof java.util.stream.IntStream ? IntStream.VivifiedWrapper.convert((java.util.stream.IntStream) baseStream) : baseStream instanceof LongStream ? j1.h((LongStream) baseStream) : baseStream instanceof java.util.stream.Stream ? w6.h((java.util.stream.Stream) baseStream) : new e(baseStream);
    }

    @Override // java.lang.AutoCloseable
    public final /* synthetic */ void close() {
        this.a.close();
    }

    public final /* synthetic */ boolean equals(Object obj) {
        BaseStream baseStream = this.a;
        if (obj instanceof e) {
            obj = ((e) obj).a;
        }
        return baseStream.equals(obj);
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

    @Override // j$.util.stream.g
    public final /* synthetic */ g onClose(Runnable runnable) {
        return h(this.a.onClose(runnable));
    }

    @Override // j$.util.stream.g
    public final /* synthetic */ g parallel() {
        return h(this.a.parallel());
    }

    @Override // j$.util.stream.g
    public final /* synthetic */ g sequential() {
        return h(this.a.sequential());
    }

    @Override // j$.util.stream.g
    public final /* synthetic */ Spliterator spliterator() {
        return j$.util.b1.a(this.a.spliterator());
    }

    @Override // j$.util.stream.g
    public final /* synthetic */ g unordered() {
        return h(this.a.unordered());
    }
}
