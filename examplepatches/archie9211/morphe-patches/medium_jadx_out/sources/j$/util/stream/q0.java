package j$.util.stream;

import j$.util.Spliterator;
import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class q0 implements e8, f8 {
    public final boolean a;

    public q0(boolean z) {
        this.a = z;
    }

    public /* synthetic */ void accept(double d) {
        v3.c();
        throw null;
    }

    public final /* synthetic */ Consumer andThen(Consumer consumer) {
        return j$.time.a.d(this, consumer);
    }

    @Override // j$.util.stream.l5
    public final boolean e() {
        return false;
    }

    @Override // j$.util.stream.e8
    public final int f() {
        if (this.a) {
            return 0;
        }
        return y6.r;
    }

    public final void g(a aVar, Spliterator spliterator) {
        if (this.a) {
            new r0(aVar, spliterator, this).invoke();
        } else {
            new s0(aVar, spliterator, aVar.S(this)).invoke();
        }
    }

    public /* synthetic */ void accept(int i) {
        v3.k();
        throw null;
    }

    public /* synthetic */ void accept(long j) {
        v3.l();
        throw null;
    }

    @Override // j$.util.stream.l5
    public final void c(long j) {
    }

    @Override // j$.util.stream.l5
    public final void end() {
    }
}
