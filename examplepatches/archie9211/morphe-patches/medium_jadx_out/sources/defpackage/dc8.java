package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dc8 implements b55 {
    public final /* synthetic */ xb8 a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ wlc d;
    public final /* synthetic */ b55 e;

    public dc8(xb8 xb8Var, boolean z, boolean z2, wlc wlcVar, b55 b55Var) {
        this.a = xb8Var;
        this.b = z;
        this.c = z2;
        this.d = wlcVar;
        this.e = b55Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            mkd mkdVarA = pyd.a(hc8.h, p65Var);
            boolean z = this.c;
            xb8 xb8Var = this.a;
            fo7.v(((uu1) wec.a(!z ? xb8Var.g : this.b ? xb8Var.b : xb8Var.e, this.d, null, p65Var, 0, 12).getValue()).a, mkdVarA, this.e, p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
