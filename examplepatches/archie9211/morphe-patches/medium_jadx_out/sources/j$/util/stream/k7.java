package j$.util.stream;

import java.util.function.Consumer;
import java.util.function.IntConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class k7 implements j5 {
    public final /* synthetic */ int a;
    public final /* synthetic */ IntConsumer b;

    public /* synthetic */ k7(IntConsumer intConsumer, int i) {
        this.a = i;
        this.b = intConsumer;
    }

    @Override // j$.util.stream.j5, j$.util.stream.l5
    public final void accept(int i) {
        int i2 = this.a;
        IntConsumer intConsumer = this.b;
        switch (i2) {
            case 0:
                intConsumer.accept(i);
                break;
            default:
                ((q6) intConsumer).accept(i);
                break;
        }
    }

    public final /* synthetic */ Consumer andThen(Consumer consumer) {
        switch (this.a) {
        }
        return j$.time.a.d(this, consumer);
    }

    @Override // j$.util.stream.l5
    public final void c(long j) {
        int i = this.a;
    }

    @Override // j$.util.stream.j5
    public final /* synthetic */ void d(Integer num) {
        switch (this.a) {
            case 0:
                v3.g(this, num);
                break;
            default:
                v3.g(this, num);
                break;
        }
    }

    @Override // j$.util.stream.l5
    public final boolean e() {
        switch (this.a) {
        }
        return false;
    }

    @Override // j$.util.stream.l5
    public final void end() {
        int i = this.a;
    }

    public final /* synthetic */ IntConsumer andThen(IntConsumer intConsumer) {
        switch (this.a) {
        }
        return j$.time.a.f(this, intConsumer);
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(double d) {
        switch (this.a) {
            case 0:
                v3.c();
                throw null;
            default:
                v3.c();
                throw null;
        }
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(long j) {
        switch (this.a) {
            case 0:
                v3.l();
                throw null;
            default:
                v3.l();
                throw null;
        }
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final /* bridge */ /* synthetic */ void n(Object obj) {
        switch (this.a) {
            case 0:
                d((Integer) obj);
                break;
            default:
                d((Integer) obj);
                break;
        }
    }

    private final void a(long j) {
    }

    private final void b(long j) {
    }

    private final void f() {
    }

    private final void g() {
    }
}
