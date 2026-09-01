package defpackage;

import com.medium.android.donkey.post.PostFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class mg9 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ PostFragment b;
    public final /* synthetic */ jz1 c;

    public /* synthetic */ mg9(PostFragment postFragment, jz1 jz1Var, int i) {
        this.a = i;
        this.b = postFragment;
        this.c = jz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        uob uobVar = w12.a;
        c1e c1eVar = c1e.a;
        jz1 jz1Var = this.c;
        PostFragment postFragment = this.b;
        int i2 = 2;
        int i3 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(-1216187935, new mg9(postFragment, jz1Var, i3), p65Var), p65Var, 48, 1);
                }
                break;
            case 1:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    if (((Boolean) postFragment.x0.getValue()).booleanValue()) {
                        p65Var2.Y(889476012);
                        Object objM = p65Var2.M();
                        if (objM == uobVar) {
                            objM = new lg9(1);
                            p65Var2.j0(objM);
                        }
                        hlg.a((m45) objM, pxf.E(624302644, new mg9(postFragment, jz1Var, i2), p65Var2), null, pxf.E(-979156238, new ig9(postFragment, i3), p65Var2), null, pwd.f, pwd.g, null, 0L, 0L, 0L, 0L, null, p65Var2, 1772598, 0, 16276);
                    } else {
                        p65Var2.Y(823245473);
                    }
                    p65Var2.p(false);
                }
                break;
            default:
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    boolean zH = p65Var3.h(postFragment) | p65Var3.h(jz1Var);
                    Object objM2 = p65Var3.M();
                    if (zH || objM2 == uobVar) {
                        objM2 = new ps5(postFragment, 29, jz1Var);
                        p65Var3.j0(objM2);
                    }
                    f76.w((m45) objM2, null, false, null, null, null, pwd.d, p65Var3, 805306368, 510);
                }
                break;
        }
        return c1eVar;
    }
}
