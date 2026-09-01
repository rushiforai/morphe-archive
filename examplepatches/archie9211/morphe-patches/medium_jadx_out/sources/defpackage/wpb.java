package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wpb implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ b55 b;
    public final /* synthetic */ mz1 c;
    public final /* synthetic */ b55 d;
    public final /* synthetic */ b55 e;
    public final /* synthetic */ q78 f;
    public final /* synthetic */ b55 g;

    public wpb(int i, b55 b55Var, mz1 mz1Var, b55 b55Var2, b55 b55Var3, q78 q78Var, b55 b55Var4) {
        this.a = i;
        this.b = b55Var;
        this.c = mz1Var;
        this.d = b55Var2;
        this.e = b55Var3;
        this.f = q78Var;
        this.g = b55Var4;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            fp7.e(this.a, this.b, this.c, this.d, this.e, this.f, this.g, p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
