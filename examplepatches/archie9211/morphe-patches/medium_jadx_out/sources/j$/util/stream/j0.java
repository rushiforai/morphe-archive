package j$.util.stream;

import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class j0 implements f8 {
    public boolean a;
    public Object b;

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept, reason: merged with bridge method [inline-methods] and merged with bridge method [inline-methods] and merged with bridge method [inline-methods] */
    public final void n(Object obj) {
        if (this.a) {
            return;
        }
        this.a = true;
        this.b = obj;
    }

    public final /* synthetic */ Consumer andThen(Consumer consumer) {
        return j$.time.a.d(this, consumer);
    }

    @Override // j$.util.stream.l5
    public final boolean e() {
        return this.a;
    }

    @Override // j$.util.stream.l5
    public /* synthetic */ void accept(int i) {
        v3.k();
        throw null;
    }

    @Override // j$.util.stream.l5
    public /* synthetic */ void accept(long j) {
        v3.l();
        throw null;
    }

    @Override // j$.util.stream.l5
    public /* synthetic */ void accept(double d) {
        v3.c();
        throw null;
    }

    @Override // j$.util.stream.l5
    public final void c(long j) {
    }

    @Override // j$.util.stream.l5
    public final void end() {
    }
}
