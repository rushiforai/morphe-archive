package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class u5 {

    /* renamed from: a, reason: collision with root package name */
    public Object f33556a;

    /* renamed from: b, reason: collision with root package name */
    public x5 f33557b;

    /* renamed from: c, reason: collision with root package name */
    public y5 f33558c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f33559d;

    public final void a(Object obj) {
        this.f33559d = true;
        x5 x5Var = this.f33557b;
        if (x5Var != null) {
            w5 w5Var = x5Var.f33650b;
            w5Var.getClass();
            if (obj == null) {
                obj = t5.f33543g;
            }
            if (t5.f33542f.a0(w5Var, null, obj)) {
                t5.d(w5Var);
                this.f33556a = null;
                this.f33557b = null;
                this.f33558c = null;
            }
        }
    }

    public final void finalize() {
        y5 y5Var;
        x5 x5Var = this.f33557b;
        if (x5Var != null) {
            w5 w5Var = x5Var.f33650b;
            if (!w5Var.isDone()) {
                if (t5.f33542f.a0(w5Var, null, new d3(new cl.e("The completer object was garbage collected - this future would otherwise never complete. The tag was: ".concat(String.valueOf(this.f33556a)), 2)))) {
                    t5.d(w5Var);
                }
            }
        }
        if (this.f33559d || (y5Var = this.f33558c) == null) {
            return;
        }
        y5Var.i(null);
    }
}
