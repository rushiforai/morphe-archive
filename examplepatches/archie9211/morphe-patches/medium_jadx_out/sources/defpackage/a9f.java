package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a9f implements k22, cy6 {
    public final mn a;
    public final q22 b;
    public boolean c;
    public wx6 d;
    public mz1 e = w02.a;

    public a9f(mn mnVar, q22 q22Var) {
        this.a = mnVar;
        this.b = q22Var;
    }

    public final void a() {
        if (!this.c) {
            this.c = true;
            this.a.getView().setTag(R.id.wrapped_composition_tag, null);
            wx6 wx6Var = this.d;
            if (wx6Var != null) {
                wx6Var.b(this);
            }
            this.d = null;
        }
        this.b.m();
    }

    public final void b(b55 b55Var) {
        this.a.setOnReadyForComposition(new jr(this, 15, (mz1) b55Var));
    }

    @Override // defpackage.cy6
    public final void f(iy6 iy6Var, ux6 ux6Var) {
        if (ux6Var == ux6.ON_DESTROY) {
            a();
        } else {
            if (ux6Var != ux6.ON_CREATE || this.c) {
                return;
            }
            b(this.e);
        }
    }
}
