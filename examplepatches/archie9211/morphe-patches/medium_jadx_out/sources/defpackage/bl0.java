package defpackage;

import android.content.Context;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class bl0 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ long b;

    public /* synthetic */ bl0(int i, long j) {
        this.a = i;
        this.b = j;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        fy3 fy3Var = fy3.a;
        long j = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                bl7 bl7Var = (bl7) obj;
                tk7 tk7Var = (tk7) obj2;
                bl7Var.getClass();
                tk7Var.getClass();
                int iI0 = bl7Var.i0(xj3.a(j));
                int iI02 = bl7Var.i0(xj3.b(j));
                t99 t99VarS = tk7Var.s(h72.i(-iI0, -iI02, ((f72) obj3).a));
                break;
            case 1:
                bl7 bl7Var2 = (bl7) obj;
                tk7 tk7Var2 = (tk7) obj2;
                bl7Var2.getClass();
                tk7Var2.getClass();
                int iI03 = bl7Var2.i0(xj3.a(j));
                int iI04 = bl7Var2.i0(xj3.b(j));
                t99 t99VarS2 = tk7Var2.s(h72.i(-iI03, -iI04, ((f72) obj3).a));
                break;
            case 2:
                r28 r28Var = (r28) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                r28Var.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).f(r28Var) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    jjd.b(vo7.T((Context) p65Var.j(eo.b), j), r28Var, 0L, 0L, 0L, null, new jgd(5), 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).o, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, (iIntValue << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 0, 130044);
                } else {
                    p65Var.S();
                }
                break;
            case 3:
                gq4 gq4Var = (gq4) obj;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                gq4Var.getClass();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((p65) x12Var2).f(gq4Var) ? 4 : 2;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 19) != 18)) {
                    for (int i2 = 0; i2 < 4; i2++) {
                        float f = 1.0f;
                        if (1.0f <= 0.0d) {
                            z16.a("invalid weight; must be greater than zero");
                        }
                        if (1.0f > Float.MAX_VALUE) {
                            f = Float.MAX_VALUE;
                        }
                        dy0.a(flb.a0(jfc.e(new sq6(f, true), 40.0f), j, rv8.r), p65Var2, 0);
                    }
                } else {
                    p65Var2.S();
                }
                break;
            case 4:
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 17) != 16)) {
                    String strR = vo7.R(p65Var3, R.string.onboarding_starter_packs_explore);
                    mkd mkdVar = ((bu7) p65Var3.j(jt7.c)).n;
                    long j2 = this.b;
                    jjd.b(strR, null, 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkd.a(mkdVar, j2, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var3, 0, 24960, 110590);
                    hp7.t(p65Var3, jfc.l(o28.b, 12.0f));
                    qv5.b(vn7.J(R.drawable.ic_arrow_right_16, 0, p65Var3), null, null, j2, p65Var3, 56, 4);
                } else {
                    p65Var3.S();
                }
                break;
            default:
                x12 x12Var4 = (x12) obj2;
                int iIntValue4 = ((Integer) obj3).intValue();
                ((gq4) obj).getClass();
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 17) != 16)) {
                    mkd mkdVar2 = ((bu7) p65Var4.j(jt7.c)).m;
                    p65 p65Var5 = p65Var4;
                    long j3 = this.b;
                    ok7.r(108.0f, 48, 4, j3, p65Var5, null, mkdVar2);
                    ok7.r(120.0f, 48, 4, j3, p65Var5, null, mkdVar2);
                    for (int i3 = 0; i3 < 20; i3++) {
                        p65 p65Var6 = p65Var5;
                        long j4 = j3;
                        g76.G(0, 1, j4, p65Var6, null);
                        p65Var5 = p65Var6;
                        j3 = j4;
                    }
                } else {
                    p65Var4.S();
                }
                break;
        }
        return c1eVar;
    }
}
