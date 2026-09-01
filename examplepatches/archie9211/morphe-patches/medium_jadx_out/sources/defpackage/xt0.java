package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class xt0 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ long b;
    public final /* synthetic */ long c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ xt0(Object obj, long j, long j2, Object obj2, int i) {
        this.a = i;
        this.d = obj;
        this.b = j;
        this.c = j2;
        this.e = obj2;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj2 = this.e;
        Object obj3 = this.d;
        switch (i) {
            case 0:
                cq6 cq6Var = (cq6) obj;
                cq6Var.a();
                ho2.q(cq6Var, (ez0) obj3, this.b, this.c, 0.0f, (pxf) obj2, 104);
                break;
            default:
                zl3 zl3Var = (zl3) obj;
                zl3Var.getClass();
                float fZ = zl3Var.Z(((kj3) obj3).m125getDownloadingSquareSizeD9Ej5fM());
                long j = this.b;
                zl3Var.f0(hpe.s(d46.R(new uu1(j), new uu1(j))), dfc.c(zl3Var.f()) / 2.0f, zl3Var.k0(), new uuc(zl3Var.Z(1.0f), 0.0f, 1, 0, 26));
                long j2 = this.c;
                zl3Var.t0(hpe.s(d46.R(new uu1(j2), new uu1(j2))), ((mg1) obj2).a * 360.0f, ho2.h(zl3Var.f(), 0L), new uuc(zl3Var.Z(1.0f), 0.0f, 1, 0, 26));
                oz6 oz6VarS = hpe.s(d46.R(new uu1(j2), new uu1(j2)));
                float f = fZ / 2.0f;
                float fIntBitsToFloat = Float.intBitsToFloat((int) (hk7.s(zl3Var.f()) >> 32)) - f;
                ho2.s(zl3Var, oz6VarS, (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (hk7.s(zl3Var.f()) & 4294967295L)) - f)) & 4294967295L) | (((long) Float.floatToRawIntBits(fIntBitsToFloat)) << 32), (((long) Float.floatToRawIntBits(fZ)) << 32) | (((long) Float.floatToRawIntBits(fZ)) & 4294967295L), (((long) Float.floatToRawIntBits(0.6f)) << 32) | (4294967295L & ((long) Float.floatToRawIntBits(0.6f))), null, 240);
                break;
        }
        return c1eVar;
    }
}
