package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class h0c implements jn8, sh3 {
    public final jn8 a;
    public sh3 b;
    public boolean c;
    public xp d;
    public volatile boolean e;

    public h0c(jn8 jn8Var) {
        this.a = jn8Var;
    }

    @Override // defpackage.jn8
    public final void a(sh3 sh3Var) {
        if (zh3.validate(this.b, sh3Var)) {
            this.b = sh3Var;
            this.a.a(this);
        }
    }

    public final void b() {
        Object[] objArr;
        while (true) {
            synchronized (this) {
                try {
                    xp xpVar = this.d;
                    if (xpVar == null) {
                        this.c = false;
                        return;
                    }
                    this.d = null;
                    jn8 jn8Var = this.a;
                    for (Object[] objArr2 = (Object[]) xpVar.c; objArr2 != null; objArr2 = objArr2[4]) {
                        for (int i = 0; i < 4 && (objArr = objArr2[i]) != null; i++) {
                            if (hj8.acceptFull(objArr, jn8Var)) {
                                return;
                            }
                        }
                    }
                } catch (Throwable th) {
                    throw th;
                }
            }
        }
    }

    @Override // defpackage.sh3
    public final void dispose() {
        this.b.dispose();
    }

    @Override // defpackage.jn8
    public final void onComplete() {
        if (this.e) {
            return;
        }
        synchronized (this) {
            try {
                if (this.e) {
                    return;
                }
                if (!this.c) {
                    this.e = true;
                    this.c = true;
                    this.a.onComplete();
                } else {
                    xp xpVar = this.d;
                    if (xpVar == null) {
                        xpVar = new xp(2, (byte) 0);
                        this.d = xpVar;
                    }
                    xpVar.d(hj8.complete());
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // defpackage.jn8
    public final void onError(Throwable th) {
        if (this.e) {
            ok7.H(th);
            return;
        }
        synchronized (this) {
            try {
                boolean z = true;
                if (!this.e) {
                    if (this.c) {
                        this.e = true;
                        xp xpVar = this.d;
                        if (xpVar == null) {
                            xpVar = new xp(2, (byte) 0);
                            this.d = xpVar;
                        }
                        ((Object[]) xpVar.c)[0] = hj8.error(th);
                        return;
                    }
                    this.e = true;
                    this.c = true;
                    z = false;
                }
                if (z) {
                    ok7.H(th);
                } else {
                    this.a.onError(th);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // defpackage.jn8
    public final void onNext(Object obj) {
        if (this.e) {
            return;
        }
        if (obj == null) {
            this.b.dispose();
            onError(new NullPointerException("onNext called with null. Null values are generally not allowed in 2.x operators and sources."));
            return;
        }
        synchronized (this) {
            try {
                if (this.e) {
                    return;
                }
                if (!this.c) {
                    this.c = true;
                    this.a.onNext(obj);
                    b();
                } else {
                    xp xpVar = this.d;
                    if (xpVar == null) {
                        xpVar = new xp(2, (byte) 0);
                        this.d = xpVar;
                    }
                    xpVar.d(hj8.next(obj));
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
