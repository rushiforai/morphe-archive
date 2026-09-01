package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sw0 implements b55 {
    public final /* synthetic */ mx0 a;
    public final /* synthetic */ float b;
    public final /* synthetic */ float c;
    public final /* synthetic */ boolean d;
    public final /* synthetic */ m3c e;
    public final /* synthetic */ long f;
    public final /* synthetic */ long g;
    public final /* synthetic */ float h;
    public final /* synthetic */ b55 i;
    public final /* synthetic */ mz1 j;

    public sw0(mx0 mx0Var, float f, float f2, boolean z, m3c m3cVar, long j, long j2, float f3, b55 b55Var, mz1 mz1Var) {
        this.a = mx0Var;
        this.b = f;
        this.c = f2;
        this.d = z;
        this.e = m3cVar;
        this.f = j;
        this.g = j2;
        this.h = f3;
        this.i = b55Var;
        this.j = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            o7f.j(this.a.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
