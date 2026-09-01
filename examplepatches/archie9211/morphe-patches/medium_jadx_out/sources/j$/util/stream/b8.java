package j$.util.stream;

import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class b8 implements l5 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Consumer b;

    public /* synthetic */ b8(Consumer consumer, int i) {
        this.a = i;
        this.b = consumer;
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final void n(Object obj) {
        int i = this.a;
        Consumer consumer = this.b;
        switch (i) {
            case 0:
                ((v6) consumer).n(obj);
                break;
            default:
                consumer.n(obj);
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

    private final void a(long j) {
    }

    private final void b(long j) {
    }

    private final void f() {
    }

    private final void g() {
    }
}
