package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tq0 implements sh3 {
    public final jn8 a;
    public final uq0 b;
    public boolean c;
    public boolean d;
    public xp e;
    public boolean f;
    public volatile boolean g;
    public long h;

    public tq0(jn8 jn8Var, uq0 uq0Var) {
        this.a = jn8Var;
        this.b = uq0Var;
    }

    public final void a() {
        xp xpVar;
        Object[] objArr;
        while (!this.g) {
            synchronized (this) {
                try {
                    xpVar = this.e;
                    if (xpVar == null) {
                        this.d = false;
                        return;
                    }
                    this.e = null;
                } catch (Throwable th) {
                    throw th;
                }
            }
            for (Object[] objArr2 = (Object[]) xpVar.c; objArr2 != null; objArr2 = objArr2[4]) {
                for (int i = 0; i < 4 && (objArr = objArr2[i]) != null; i++) {
                    if (this.g || hj8.accept(objArr, this.a)) {
                        break;
                    }
                }
            }
        }
    }

    public final void b(long j, Object obj) {
        if (this.g) {
            return;
        }
        if (!this.f) {
            synchronized (this) {
                try {
                    if (this.g) {
                        return;
                    }
                    if (this.h == j) {
                        return;
                    }
                    if (this.d) {
                        xp xpVar = this.e;
                        if (xpVar == null) {
                            xpVar = new xp(2, (byte) 0);
                            this.e = xpVar;
                        }
                        xpVar.d(obj);
                        return;
                    }
                    this.c = true;
                    this.f = true;
                } catch (Throwable th) {
                    throw th;
                }
            }
        }
        if (this.g) {
            return;
        }
        hj8.accept(obj, this.a);
    }

    @Override // defpackage.sh3
    public final void dispose() {
        if (this.g) {
            return;
        }
        this.g = true;
        this.b.F0(this);
    }
}
