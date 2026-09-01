package j$.util.stream;

import j$.util.Objects;
import java.util.function.Consumer;
import java.util.function.IntConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class f5 implements j5 {
    public final l5 a;

    public f5(l5 l5Var) {
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

    @Override // j$.util.stream.j5
    public final /* synthetic */ void d(Integer num) {
        v3.g(this, num);
    }

    @Override // j$.util.stream.l5
    public boolean e() {
        return this.a.e();
    }

    @Override // j$.util.stream.l5
    public void end() {
        this.a.end();
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(long j) {
        v3.l();
        throw null;
    }

    public final /* synthetic */ IntConsumer andThen(IntConsumer intConsumer) {
        return j$.time.a.f(this, intConsumer);
    }

    @Override // java.util.function.Consumer
    public final /* bridge */ /* synthetic */ void accept(Object obj) {
        d((Integer) obj);
    }
}
