package j$.util.stream;

import java.util.function.LongConsumer;
import java.util.function.LongPredicate;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class p1 extends r1 implements k5 {
    @Override // j$.util.stream.r1, j$.util.stream.l5
    public final void accept(long j) {
        if (this.a) {
            return;
        }
        LongPredicate longPredicate = null;
        longPredicate.test(j);
        throw null;
    }

    public final /* synthetic */ LongConsumer andThen(LongConsumer longConsumer) {
        return j$.time.a.g(this, longConsumer);
    }

    @Override // j$.util.stream.k5
    public final /* synthetic */ void l(Long l) {
        v3.i(this, l);
    }

    @Override // java.util.function.Consumer
    public final /* bridge */ /* synthetic */ void accept(Object obj) {
        l((Long) obj);
    }
}
