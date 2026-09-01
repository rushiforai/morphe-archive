package j$.util.stream;

import j$.util.Objects;
import java.util.function.Consumer;
import java.util.function.LongConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class g5 implements k5 {
    public final l5 a;

    public g5(l5 l5Var) {
        this.a = (l5) Objects.requireNonNull(l5Var);
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(double d) {
        v3.c();
        throw null;
    }

    public final /* synthetic */ Consumer andThen(Consumer consumer) {
        return j$.time.a.d(this, consumer);
    }

    @Override // j$.util.stream.l5
    public void c(long j) {
        this.a.c(j);
    }

    @Override // j$.util.stream.l5
    public boolean e() {
        return this.a.e();
    }

    @Override // j$.util.stream.l5
    public void end() {
        this.a.end();
    }

    @Override // j$.util.stream.k5
    public final /* synthetic */ void l(Long l) {
        v3.i(this, l);
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(int i) {
        v3.k();
        throw null;
    }

    public final /* synthetic */ LongConsumer andThen(LongConsumer longConsumer) {
        return j$.time.a.g(this, longConsumer);
    }

    @Override // java.util.function.Consumer
    public final /* bridge */ /* synthetic */ void accept(Object obj) {
        l((Long) obj);
    }
}
