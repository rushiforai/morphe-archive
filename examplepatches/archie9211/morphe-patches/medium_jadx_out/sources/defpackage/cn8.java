package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cn8 implements jn8, xqa {
    public final jn8 a;
    public sh3 b;
    public xqa c;
    public boolean d;
    public final o19 e;

    public cn8(jn8 jn8Var, o19 o19Var) {
        this.a = jn8Var;
        this.e = o19Var;
    }

    @Override // defpackage.jn8
    public final void a(sh3 sh3Var) {
        if (zh3.validate(this.b, sh3Var)) {
            this.b = sh3Var;
            if (sh3Var instanceof xqa) {
                this.c = (xqa) sh3Var;
            }
            this.a.a(this);
        }
    }

    @Override // defpackage.fec
    public final void clear() {
        this.c.clear();
    }

    @Override // defpackage.sh3
    public final void dispose() {
        this.b.dispose();
    }

    @Override // defpackage.fec
    public final boolean isEmpty() {
        return this.c.isEmpty();
    }

    @Override // defpackage.fec
    public final boolean offer(Object obj) {
        throw new UnsupportedOperationException("Should not be called!");
    }

    @Override // defpackage.jn8
    public final void onComplete() {
        if (this.d) {
            return;
        }
        this.d = true;
        this.a.onComplete();
    }

    @Override // defpackage.jn8
    public final void onError(Throwable th) {
        if (this.d) {
            ok7.H(th);
        } else {
            this.d = true;
            this.a.onError(th);
        }
    }

    @Override // defpackage.jn8
    public final void onNext(Object obj) {
        if (this.d) {
            return;
        }
        try {
            this.a.onNext(this.e.a(obj));
        } catch (Throwable th) {
            pwd.c0(th);
            this.b.dispose();
            onError(th);
        }
    }

    @Override // defpackage.fec
    public final Object poll() {
        Object objPoll = this.c.poll();
        if (objPoll != null) {
            return this.e.a(objPoll);
        }
        return null;
    }
}
