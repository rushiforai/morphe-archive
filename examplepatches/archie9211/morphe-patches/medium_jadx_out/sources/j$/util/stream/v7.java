package j$.util.stream;

import j$.util.Spliterator;
import java.util.function.Consumer;
import java.util.function.IntConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class v7 extends x7 implements j$.util.u0, IntConsumer {
    public int e;

    @Override // java.util.function.IntConsumer
    public final void accept(int i) {
        this.e = i;
    }

    public final /* synthetic */ IntConsumer andThen(IntConsumer intConsumer) {
        return j$.time.a.f(this, intConsumer);
    }

    @Override // j$.util.stream.a8
    public final Spliterator b(Spliterator spliterator) {
        return new v7((j$.util.u0) spliterator, this);
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ void forEachRemaining(Consumer consumer) {
        j$.time.a.m(this, consumer);
    }

    @Override // j$.util.stream.x7
    public final void g(Object obj) {
        ((IntConsumer) obj).accept(this.e);
    }

    @Override // j$.util.stream.x7
    public final e7 j() {
        return new c7();
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ boolean tryAdvance(Consumer consumer) {
        return j$.time.a.C(this, consumer);
    }
}
