package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pz1 implements c55 {
    public static final pz1 b = new pz1(0);
    public static final pz1 c = new pz1(1);
    public static final pz1 d = new pz1(2);
    public static final pz1 e = new pz1(3);
    public static final pz1 f = new pz1(4);
    public static final pz1 g = new pz1(5);
    public static final pz1 h = new pz1(6);
    public static final pz1 i = new pz1(7);
    public static final pz1 j = new pz1(8);
    public static final pz1 k = new pz1(9);
    public static final pz1 l = new pz1(10);
    public static final pz1 m = new pz1(11);
    public static final pz1 n = new pz1(12);
    public static final pz1 o = new pz1(13);
    public static final pz1 p = new pz1(14);
    public static final pz1 q = new pz1(15);
    public static final pz1 r = new pz1(16);
    public static final pz1 s = new pz1(17);
    public static final pz1 t = new pz1(18);
    public static final pz1 u = new pz1(19);
    public final /* synthetic */ int a;

    public /* synthetic */ pz1(int i2) {
        this.a = i2;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i2 = this.a;
        c1e c1eVar = c1e.a;
        switch (i2) {
            case 0:
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Number) obj3).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    p65Var.S();
                }
                break;
            case 1:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Number) obj3).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    p65Var2.S();
                }
                break;
            case 2:
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Number) obj3).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 17) != 16)) {
                    p65Var3.S();
                }
                break;
            case 3:
                x12 x12Var4 = (x12) obj2;
                int iIntValue4 = ((Number) obj3).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 17) != 16)) {
                    p65Var4.S();
                }
                break;
            case 4:
                nhc nhcVar = (nhc) obj;
                x12 x12Var5 = (x12) obj2;
                int iIntValue5 = ((Number) obj3).intValue();
                if ((iIntValue5 & 6) == 0) {
                    iIntValue5 |= ((p65) x12Var5).f(nhcVar) ? 4 : 2;
                }
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(iIntValue5 & 1, (iIntValue5 & 19) != 18)) {
                    p65Var5.S();
                } else {
                    ok7.l(nhcVar, null, null, p65Var5, iIntValue5 & 14, 6);
                }
                break;
            case 5:
                ((Number) obj3).intValue();
                break;
            case 6:
                long j2 = ((uu1) obj).a;
                x12 x12Var6 = (x12) obj2;
                int iIntValue6 = ((Number) obj3).intValue();
                if ((iIntValue6 & 6) == 0) {
                    iIntValue6 |= ((p65) x12Var6).e(j2) ? 4 : 2;
                }
                p65 p65Var6 = (p65) x12Var6;
                if (!p65Var6.P(iIntValue6 & 1, (iIntValue6 & 19) != 18)) {
                    p65Var6.S();
                } else {
                    qv5.b(vn7.J(R.drawable.ic_download_warning_24, 0, p65Var6), vo7.R(p65Var6, R.string.cd_private), null, j2, p65Var6, 8 | ((iIntValue6 << 9) & 7168), 4);
                }
                break;
            case 7:
                long j3 = ((uu1) obj).a;
                x12 x12Var7 = (x12) obj2;
                int iIntValue7 = ((Number) obj3).intValue();
                if ((iIntValue7 & 6) == 0) {
                    iIntValue7 |= ((p65) x12Var7).e(j3) ? 4 : 2;
                }
                p65 p65Var7 = (p65) x12Var7;
                if (!p65Var7.P(iIntValue7 & 1, (iIntValue7 & 19) != 18)) {
                    p65Var7.S();
                } else {
                    qv5.b(vn7.J(R.drawable.ic_download_warning_24, 0, p65Var7), vo7.R(p65Var7, R.string.cd_private), null, j3, p65Var7, 8 | ((iIntValue7 << 9) & 7168), 4);
                }
                break;
            case 8:
                long j4 = ((uu1) obj).a;
                x12 x12Var8 = (x12) obj2;
                int iIntValue8 = ((Number) obj3).intValue();
                if ((iIntValue8 & 6) == 0) {
                    iIntValue8 |= ((p65) x12Var8).e(j4) ? 4 : 2;
                }
                p65 p65Var8 = (p65) x12Var8;
                if (!p65Var8.P(iIntValue8 & 1, (iIntValue8 & 19) != 18)) {
                    p65Var8.S();
                } else {
                    qv5.b(vn7.J(R.drawable.ic_check_mark_24, 0, p65Var8), vo7.R(p65Var8, R.string.cd_private), null, j4, p65Var8, 8 | ((iIntValue8 << 9) & 7168), 4);
                }
                break;
            case 9:
                long j5 = ((uu1) obj).a;
                x12 x12Var9 = (x12) obj2;
                int iIntValue9 = ((Number) obj3).intValue();
                if ((iIntValue9 & 6) == 0) {
                    iIntValue9 |= ((p65) x12Var9).e(j5) ? 4 : 2;
                }
                p65 p65Var9 = (p65) x12Var9;
                if (!p65Var9.P(iIntValue9 & 1, (iIntValue9 & 19) != 18)) {
                    p65Var9.S();
                } else {
                    qv5.b(vn7.J(R.drawable.ic_check_mark_24, 0, p65Var9), vo7.R(p65Var9, R.string.cd_private), null, j5, p65Var9, 8 | ((iIntValue9 << 9) & 7168), 4);
                }
                break;
            case 10:
                long j6 = ((uu1) obj).a;
                x12 x12Var10 = (x12) obj2;
                int iIntValue10 = ((Number) obj3).intValue();
                if ((iIntValue10 & 6) == 0) {
                    iIntValue10 |= ((p65) x12Var10).e(j6) ? 4 : 2;
                }
                p65 p65Var10 = (p65) x12Var10;
                if (!p65Var10.P(iIntValue10 & 1, (iIntValue10 & 19) != 18)) {
                    p65Var10.S();
                } else {
                    qv5.b(vn7.J(R.drawable.ic_download_warning_24, 0, p65Var10), vo7.R(p65Var10, R.string.cd_private), null, j6, p65Var10, 8 | ((iIntValue10 << 9) & 7168), 4);
                }
                break;
            case 11:
                long j7 = ((uu1) obj).a;
                x12 x12Var11 = (x12) obj2;
                int iIntValue11 = ((Number) obj3).intValue();
                if ((iIntValue11 & 6) == 0) {
                    iIntValue11 |= ((p65) x12Var11).e(j7) ? 4 : 2;
                }
                p65 p65Var11 = (p65) x12Var11;
                if (!p65Var11.P(iIntValue11 & 1, (iIntValue11 & 19) != 18)) {
                    p65Var11.S();
                } else {
                    rv5.a(vn7.J(R.drawable.ic_download_warning_24, 0, p65Var11), vo7.R(p65Var11, R.string.cd_private), null, j7, p65Var11, 8 | ((iIntValue11 << 9) & 7168), 4);
                }
                break;
            case 12:
                long j8 = ((uu1) obj).a;
                x12 x12Var12 = (x12) obj2;
                int iIntValue12 = ((Number) obj3).intValue();
                if ((iIntValue12 & 6) == 0) {
                    iIntValue12 |= ((p65) x12Var12).e(j8) ? 4 : 2;
                }
                p65 p65Var12 = (p65) x12Var12;
                if (!p65Var12.P(iIntValue12 & 1, (iIntValue12 & 19) != 18)) {
                    p65Var12.S();
                } else {
                    rv5.a(vn7.J(R.drawable.ic_download_warning_24, 0, p65Var12), vo7.R(p65Var12, R.string.cd_private), null, j8, p65Var12, 8 | ((iIntValue12 << 9) & 7168), 4);
                }
                break;
            case 13:
                long j9 = ((uu1) obj).a;
                x12 x12Var13 = (x12) obj2;
                int iIntValue13 = ((Number) obj3).intValue();
                if ((iIntValue13 & 6) == 0) {
                    iIntValue13 |= ((p65) x12Var13).e(j9) ? 4 : 2;
                }
                p65 p65Var13 = (p65) x12Var13;
                if (!p65Var13.P(iIntValue13 & 1, (iIntValue13 & 19) != 18)) {
                    p65Var13.S();
                } else {
                    rv5.a(vn7.J(R.drawable.ic_check_mark_24, 0, p65Var13), vo7.R(p65Var13, R.string.cd_private), null, j9, p65Var13, 8 | ((iIntValue13 << 9) & 7168), 4);
                }
                break;
            case 14:
                long j10 = ((uu1) obj).a;
                x12 x12Var14 = (x12) obj2;
                int iIntValue14 = ((Number) obj3).intValue();
                if ((iIntValue14 & 6) == 0) {
                    iIntValue14 |= ((p65) x12Var14).e(j10) ? 4 : 2;
                }
                p65 p65Var14 = (p65) x12Var14;
                if (!p65Var14.P(iIntValue14 & 1, (iIntValue14 & 19) != 18)) {
                    p65Var14.S();
                } else {
                    rv5.a(vn7.J(R.drawable.ic_download_warning_24, 0, p65Var14), vo7.R(p65Var14, R.string.cd_private), null, j10, p65Var14, 8 | ((iIntValue14 << 9) & 7168), 4);
                }
                break;
            case 15:
                long j11 = ((uu1) obj).a;
                x12 x12Var15 = (x12) obj2;
                int iIntValue15 = ((Number) obj3).intValue();
                if ((iIntValue15 & 6) == 0) {
                    iIntValue15 |= ((p65) x12Var15).e(j11) ? 4 : 2;
                }
                p65 p65Var15 = (p65) x12Var15;
                if (!p65Var15.P(iIntValue15 & 1, (iIntValue15 & 19) != 18)) {
                    p65Var15.S();
                } else {
                    rv5.a(vn7.J(R.drawable.ic_check_mark_24, 0, p65Var15), vo7.R(p65Var15, R.string.cd_private), null, j11, p65Var15, 8 | ((iIntValue15 << 9) & 7168), 4);
                }
                break;
            case 16:
                ihc ihcVar = (ihc) obj;
                x12 x12Var16 = (x12) obj2;
                int iIntValue16 = ((Number) obj3).intValue();
                if ((iIntValue16 & 6) == 0) {
                    iIntValue16 |= ((p65) x12Var16).f(ihcVar) ? 4 : 2;
                }
                p65 p65Var16 = (p65) x12Var16;
                if (!p65Var16.P(iIntValue16 & 1, (iIntValue16 & 19) != 18)) {
                    p65Var16.S();
                } else {
                    dl7.e(ihcVar, null, null, 0L, 0L, 0L, 0L, 0L, p65Var16, iIntValue16 & 14);
                }
                break;
            case 17:
                break;
            case 18:
                break;
            default:
                zl3 zl3Var = (zl3) obj;
                long j12 = ((ip8) obj2).a;
                long j13 = ((uu1) obj3).a;
                ufc ufcVar = ufc.a;
                ho2.k(zl3Var, j13, zl3Var.Z(ufc.c) / 2.0f, j12, null, 120);
                break;
        }
        return c1eVar;
    }
}
