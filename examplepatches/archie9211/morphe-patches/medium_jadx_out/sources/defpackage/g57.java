package defpackage;

import android.os.Looper;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class g57 {
    public static final Object k = new Object();
    public final Object a;
    public final pnb b;
    public int c;
    public boolean d;
    public volatile Object e;
    public volatile Object f;
    public int g;
    public boolean h;
    public boolean i;
    public final jn j;

    public g57(int i) {
        bv8 bv8Var = md5.e;
        this.a = new Object();
        this.b = new pnb();
        this.c = 0;
        this.f = k;
        this.j = new jn(10, this);
        this.e = bv8Var;
        this.g = 0;
    }

    public static void a(String str) {
        j23 j23Var = c70.N().f;
        if (Looper.getMainLooper().getThread() == Thread.currentThread()) {
            return;
        }
        ygf.f(ev6.x("Cannot invoke ", str, " on a background thread"));
    }

    public final void b(f57 f57Var) {
        if (f57Var.b) {
            if (!f57Var.d()) {
                f57Var.a(false);
                return;
            }
            int i = f57Var.c;
            int i2 = this.g;
            if (i >= i2) {
                return;
            }
            f57Var.c = i2;
            f57Var.a.onChanged(this.e);
        }
    }

    public final void c(f57 f57Var) {
        if (this.h) {
            this.i = true;
            return;
        }
        this.h = true;
        do {
            this.i = false;
            if (f57Var != null) {
                b(f57Var);
                f57Var = null;
            } else {
                pnb pnbVar = this.b;
                nnb nnbVar = new nnb(pnbVar);
                pnbVar.c.put(nnbVar, Boolean.FALSE);
                while (nnbVar.hasNext()) {
                    b((f57) ((Map.Entry) nnbVar.next()).getValue());
                    if (this.i) {
                        break;
                    }
                }
            }
        } while (this.i);
        this.h = false;
    }

    public final void d(iy6 iy6Var, kn8 kn8Var) {
        Object obj;
        a("observe");
        if (((ky6) iy6Var.getLifecycle()).d == vx6.DESTROYED) {
            return;
        }
        e57 e57Var = new e57(this, iy6Var, kn8Var);
        pnb pnbVar = this.b;
        mnb mnbVarD = pnbVar.d(kn8Var);
        if (mnbVarD != null) {
            obj = mnbVarD.b;
        } else {
            mnb mnbVar = new mnb(kn8Var, e57Var);
            pnbVar.d++;
            mnb mnbVar2 = pnbVar.b;
            if (mnbVar2 == null) {
                pnbVar.a = mnbVar;
                pnbVar.b = mnbVar;
            } else {
                mnbVar2.c = mnbVar;
                mnbVar.d = mnbVar2;
                pnbVar.b = mnbVar;
            }
            obj = null;
        }
        f57 f57Var = (f57) obj;
        if (f57Var != null && !f57Var.c(iy6Var)) {
            ay0.e("Cannot add the same observer with different lifecycles");
        } else {
            if (f57Var != null) {
                return;
            }
            iy6Var.getLifecycle().a(e57Var);
        }
    }

    public final void e(kn8 kn8Var) {
        Object obj;
        a("observeForever");
        d57 d57Var = new d57(this, kn8Var);
        pnb pnbVar = this.b;
        mnb mnbVarD = pnbVar.d(kn8Var);
        if (mnbVarD != null) {
            obj = mnbVarD.b;
        } else {
            mnb mnbVar = new mnb(kn8Var, d57Var);
            pnbVar.d++;
            mnb mnbVar2 = pnbVar.b;
            if (mnbVar2 == null) {
                pnbVar.a = mnbVar;
                pnbVar.b = mnbVar;
            } else {
                mnbVar2.c = mnbVar;
                mnbVar.d = mnbVar2;
                pnbVar.b = mnbVar;
            }
            obj = null;
        }
        f57 f57Var = (f57) obj;
        if (f57Var instanceof e57) {
            ay0.e("Cannot add the same observer with different lifecycles");
        } else {
            if (f57Var != null) {
                return;
            }
            d57Var.a(true);
        }
    }

    public void h(Object obj) {
        boolean z;
        synchronized (this.a) {
            z = this.f == k;
            this.f = obj;
        }
        if (z) {
            c70.N().O(this.j);
        }
    }

    public void i(kn8 kn8Var) {
        a("removeObserver");
        f57 f57Var = (f57) this.b.e(kn8Var);
        if (f57Var == null) {
            return;
        }
        f57Var.b();
        f57Var.a(false);
    }

    public void j(Object obj) {
        a("setValue");
        this.g++;
        this.e = obj;
        c(null);
    }

    public void f() {
    }

    public void g() {
    }

    public g57() {
        this.a = new Object();
        this.b = new pnb();
        this.c = 0;
        Object obj = k;
        this.f = obj;
        this.j = new jn(10, this);
        this.e = obj;
        this.g = -1;
    }
}
