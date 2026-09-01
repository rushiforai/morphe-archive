package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f18 extends x0 {
    public final k49 j;
    public boolean k;

    public f18(Context context) {
        super(context, null);
        this.j = qo7.u(i02.a);
    }

    @Override // defpackage.x0
    public final void a(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(576708319);
        int i2 = (p65Var.h(this) ? 4 : 2) | i;
        int i3 = 1;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            ((b55) this.j.getValue()).invoke(p65Var, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v08(i, i3, this);
        }
    }

    @Override // defpackage.x0
    public final boolean getShouldCreateCompositionOnAttachedToWindow() {
        return this.k;
    }
}
