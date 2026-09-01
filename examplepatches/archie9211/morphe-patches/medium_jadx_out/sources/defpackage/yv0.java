package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yv0 implements b55 {
    public final /* synthetic */ float a;
    public final /* synthetic */ float b;

    public yv0(float f, float f2) {
        this.a = f;
        this.b = f2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            dy0.a(jfc.m(o28.b, this.a, this.b), p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
