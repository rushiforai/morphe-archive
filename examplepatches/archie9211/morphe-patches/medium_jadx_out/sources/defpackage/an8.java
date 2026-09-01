package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class an8 implements jn8, sh3 {
    public final jn8 a;
    public sh3 b;

    public an8(jn8 jn8Var) {
        this.a = jn8Var;
    }

    @Override // defpackage.jn8
    public final void a(sh3 sh3Var) {
        if (zh3.validate(this.b, sh3Var)) {
            this.b = sh3Var;
            this.a.a(this);
        }
    }

    @Override // defpackage.sh3
    public final void dispose() {
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
}
