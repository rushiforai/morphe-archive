package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterators;
import java.util.function.Consumer;
import java.util.function.LongConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class r6 extends t6 implements j$.util.x0 {
    public final /* synthetic */ s6 g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r6(s6 s6Var, int i, int i2, int i3, int i4) {
        super(s6Var, i, i2, i3, i4);
        this.g = s6Var;
    }

    @Override // j$.util.stream.t6
    public final void a(int i, Object obj, Object obj2) {
        ((LongConsumer) obj2).accept(((long[]) obj)[i]);
    }

    @Override // j$.util.stream.t6
    public final j$.util.a1 b(Object obj, int i, int i2) {
        long[] jArr = (long[]) obj;
        int i3 = i2 + i;
        Spliterators.a(((long[]) Objects.requireNonNull(jArr)).length, i, i3);
        return new j$.util.o1(jArr, i, i3, 1040);
    }

    @Override // j$.util.stream.t6
    public final j$.util.a1 c(int i, int i2, int i3, int i4) {
        return new r6(this.g, i, i2, i3, i4);
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ void forEachRemaining(Consumer consumer) {
        j$.time.a.n(this, consumer);
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ boolean tryAdvance(Consumer consumer) {
        return j$.time.a.D(this, consumer);
    }
}
