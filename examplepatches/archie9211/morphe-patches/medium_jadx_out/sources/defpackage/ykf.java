package defpackage;

import android.os.Bundle;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ykf {
    public Boolean a;
    public boolean b;
    public final /* synthetic */ mn0 c;
    public final int d;
    public final Bundle e;
    public final /* synthetic */ mn0 f;

    public ykf(mn0 mn0Var, int i, Bundle bundle) {
        this.f = mn0Var;
        Boolean bool = Boolean.TRUE;
        this.c = mn0Var;
        this.a = bool;
        this.b = false;
        this.d = i;
        this.e = bundle;
    }

    public abstract boolean a();

    public abstract void b(h42 h42Var);

    public final void c() {
        d();
        mn0 mn0Var = this.c;
        synchronized (mn0Var.k) {
            mn0Var.k.remove(this);
        }
    }

    public final void d() {
        synchronized (this) {
            this.a = null;
        }
    }
}
