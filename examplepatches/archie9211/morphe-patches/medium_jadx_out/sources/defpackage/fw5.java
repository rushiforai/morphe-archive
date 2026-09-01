package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fw5 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ m45 b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ m45 d;
    public final /* synthetic */ m45 e;

    public /* synthetic */ fw5(m45 m45Var, m45 m45Var2, m45 m45Var3, m45 m45Var4, int i) {
        this.a = i;
        this.b = m45Var;
        this.c = m45Var2;
        this.d = m45Var3;
        this.e = m45Var4;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    g3d.a(jfc.s(o28.b, null, 3), ((w4c) p65Var.j(z4c.a)).c, ((zo7) p65Var.j(kt7.b)).a, 0L, 0.0f, 0.0f, null, pxf.E(1916610017, new fw5(this.b, this.c, this.d, this.e, 1), p65Var), p65Var, 12582912, 120);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    o28 o28Var = o28.b;
                    r28 r28VarG = w2g.G(o28Var, 0.0f, 24.0f, 0.0f, 6.0f, 5);
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
                    long j = p65Var2.T;
                    int i2 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var2.l();
                    r28 r28VarR = gx1.R(p65Var2, r28VarG);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, wv1VarA);
                    tp7.B(p65Var2, q12.e, i89VarL);
                    tp7.B(p65Var2, q12.g, Integer.valueOf(i2));
                    tp7.y(p65Var2, q12.h);
                    tp7.B(p65Var2, q12.d, r28VarR);
                    jjd.b(vo7.R(p65Var2, R.string.common_acquire_image_add_an_image), w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(jt7.c)).d, p65Var2, 48, 0, 131068);
                    hp7.t(p65Var2, jfc.e(o28Var, 12.0f));
                    bgf.n(R.string.common_acquire_image_take_photo, this.b, jfc.d(o28Var, 1.0f), p65Var2, 384);
                    bgf.n(R.string.common_acquire_image_choose_from_gallery, this.c, jfc.d(o28Var, 1.0f), p65Var2, 384);
                    bgf.n(R.string.common_acquire_image_choose_from_unsplash, this.d, jfc.d(o28Var, 1.0f), p65Var2, 384);
                    hp7.t(p65Var2, jfc.e(o28Var, 6.0f));
                    f76.w(this.e, ka1.i(z46.r, w2g.G(o28Var, 0.0f, 0.0f, 12.0f, 0.0f, 11)), false, null, null, null, kng.b, p65Var2, 805306368, 508);
                    p65Var2.p(true);
                }
                break;
        }
        return c1eVar;
    }
}
