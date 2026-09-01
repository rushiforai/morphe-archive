package defpackage;

import android.graphics.Rect;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class bxa extends q28 implements od5 {
    public Rect o;

    @Override // defpackage.q28
    public final void A0() {
        o78 o78VarI0 = I0();
        Rect rect = this.o;
        if (rect != null) {
            o78VarI0.l(rect);
        }
        J0(o78VarI0);
        this.o = null;
    }

    public abstract o78 I0();

    public abstract void J0(o78 o78Var);

    @Override // defpackage.od5
    public final void X(eh8 eh8Var) {
        zwa zwaVarH = sgg.K(eh8Var).H(eh8Var, true);
        Rect rect = new Rect(nk7.w0(zwaVarH.a), nk7.w0(zwaVarH.b), nk7.w0(zwaVarH.c), nk7.w0(zwaVarH.d));
        o78 o78VarI0 = I0();
        Object obj = this.o;
        if (obj != null) {
            o78VarI0.l(obj);
        }
        if (!rect.isEmpty()) {
            o78VarI0.b(rect);
        }
        J0(o78VarI0);
        this.o = rect;
    }
}
