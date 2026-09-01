package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class epa implements c55 {
    public final /* synthetic */ boolean a;
    public final /* synthetic */ long b;
    public final /* synthetic */ npa c;

    public epa(boolean z, long j, npa npaVar) {
        this.a = z;
        this.b = j;
        this.c = npaVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Number) obj3).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            k40.f(Boolean.valueOf(this.a), null, ek7.N(i48.DefaultEffects, p65Var), null, pxf.E(-2064098104, new dpa(this.b, this.c), p65Var), p65Var, 24576, 10);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
