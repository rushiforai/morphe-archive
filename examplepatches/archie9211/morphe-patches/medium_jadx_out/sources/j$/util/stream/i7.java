package j$.util.stream;

import java.util.function.Consumer;
import java.util.function.DoubleConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class i7 implements i5 {
    public final /* synthetic */ int a;
    public final /* synthetic */ DoubleConsumer b;

    public /* synthetic */ i7(DoubleConsumer doubleConsumer, int i) {
        this.a = i;
        this.b = doubleConsumer;
    }

    @Override // j$.util.stream.i5, j$.util.stream.l5
    public final void accept(double d) {
        int i = this.a;
        DoubleConsumer doubleConsumer = this.b;
        switch (i) {
            case 0:
                doubleConsumer.accept(d);
                break;
            default:
                ((o6) doubleConsumer).accept(d);
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

    @Override // j$.util.stream.i5
    public final /* synthetic */ void n(Double d) {
        switch (this.a) {
            case 0:
                v3.d(this, d);
                break;
            default:
                v3.d(this, d);
                break;
        }
    }

    public final /* synthetic */ DoubleConsumer andThen(DoubleConsumer doubleConsumer) {
        switch (this.a) {
        }
        return j$.time.a.e(this, doubleConsumer);
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(int i) {
        switch (this.a) {
            case 0:
                v3.k();
                throw null;
            default:
                v3.k();
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
                n((Double) obj);
                break;
            default:
                n((Double) obj);
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
