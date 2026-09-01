package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class jq4 implements jn8, rxc {
    public final ywc a;
    public sh3 b;

    public jq4(ywc ywcVar) {
        this.a = ywcVar;
    }

    @Override // defpackage.jn8
    public final void a(sh3 sh3Var) {
        this.b = sh3Var;
        this.a.a(this);
    }

    @Override // defpackage.rxc
    public final void cancel() {
        this.b.dispose();
    }

    @Override // defpackage.jn8
    public final void onComplete() {
        this.a.onComplete();
    }

    @Override // defpackage.jn8
    public final void onError(Throwable th) {
        this.a.onError(th);
    }

    @Override // defpackage.jn8
    public final void onNext(Object obj) {
        this.a.onNext(obj);
    }

    @Override // defpackage.rxc
    public final void request(long j) {
    }
}
