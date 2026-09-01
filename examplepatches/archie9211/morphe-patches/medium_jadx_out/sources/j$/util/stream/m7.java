package j$.util.stream;

import java.util.function.Consumer;
import java.util.function.LongConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class m7 implements k5 {
    public final /* synthetic */ int a;
    public final /* synthetic */ LongConsumer b;

    public /* synthetic */ m7(LongConsumer longConsumer, int i) {
        this.a = i;
        this.b = longConsumer;
    }

    @Override // j$.util.stream.k5, j$.util.stream.l5
    public final void accept(long j) {
        int i = this.a;
        LongConsumer longConsumer = this.b;
        switch (i) {
            case 0:
                longConsumer.accept(j);
                break;
            default:
                ((s6) longConsumer).accept(j);
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

    @Override // j$.util.stream.k5
    public final /* synthetic */ void l(Long l) {
        switch (this.a) {
            case 0:
                v3.i(this, l);
                break;
            default:
                v3.i(this, l);
                break;
        }
    }

    public final /* synthetic */ LongConsumer andThen(LongConsumer longConsumer) {
        switch (this.a) {
        }
        return j$.time.a.g(this, longConsumer);
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

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final /* bridge */ /* synthetic */ void n(Object obj) {
        switch (this.a) {
            case 0:
                l((Long) obj);
                break;
            default:
                l((Long) obj);
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
