package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fu0 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ float b;

    public /* synthetic */ fu0(int i, float f) {
        this.a = i;
        this.b = f;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        float f = this.b;
        switch (i) {
            case 0:
                tjb tjbVar = (tjb) obj;
                tjbVar.getClass();
                tjbVar.v(f);
                break;
            case 1:
                il3 il3Var = (il3) obj;
                il3Var.getClass();
                il3Var.a(j45.Expanded, 0.0f);
                il3Var.a(j45.Collapsed, f);
                break;
            default:
                cq6 cq6Var = (cq6) obj;
                cq6Var.getClass();
                float fZ = cq6Var.Z(f);
                cq6Var.a();
                long j = uu1.g;
                uu1 uu1Var = new uu1(j);
                long j2 = uu1.b;
                ho2.q(cq6Var, hpe.r(d46.R(uu1Var, new uu1(j2)), 0.0f, fZ), 0L, 0L, 0.0f, null, 62);
                List listR = d46.R(new uu1(j2), new uu1(j));
                m50 m50Var = cq6Var.a.b;
                ho2.q(cq6Var, hpe.r(listR, Float.intBitsToFloat((int) (m50Var.B() >> 32)) - fZ, Float.intBitsToFloat((int) (m50Var.B() >> 32))), 0L, 0L, 0.0f, null, 62);
                break;
        }
        return c1eVar;
    }
}
