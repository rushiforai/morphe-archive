package defpackage;

import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class p02 implements b55 {
    public final /* synthetic */ int a;

    public /* synthetic */ p02(int i) {
        this.a = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        o28 o28Var = o28.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    rh4 rh4Var = jfc.c;
                    zk7 zk7VarC = dy0.c(z46.d, false);
                    long j = p65Var.T;
                    int i2 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, rh4Var);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, zk7VarC);
                    tp7.B(p65Var, q12.e, i89VarL);
                    tp7.B(p65Var, q12.g, Integer.valueOf(i2));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR);
                    xz5.o(iy0.a.a(o28Var, z46.h), null, 0.0f, 0L, 0L, 0, p65Var, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                    p65Var.p(true);
                }
                break;
            case 1:
                ((Integer) obj2).getClass();
                k50.w((x12) obj, tr7.y(1));
                break;
            case 2:
                ((Integer) obj2).getClass();
                d46.b((x12) obj, tr7.y(1));
                break;
            case 3:
                ((Integer) obj2).getClass();
                f76.d((x12) obj, tr7.y(1));
                break;
            case 4:
                mz1 mz1Var = r40.b;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
                    int iS = w2g.s(p65Var2);
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, o28Var);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, wv1VarA);
                    tp7.B(p65Var2, q12.e, i89VarL2);
                    cu cuVar = q12.g;
                    if (p65Var2.S || !g76.L(p65Var2.M(), Integer.valueOf(iS))) {
                        lv8.w(iS, p65Var2, iS, cuVar);
                    }
                    tp7.B(p65Var2, q12.d, r28VarR2);
                    mz1Var.f(xv1.a, p65Var2, 6);
                    p65Var2.p(true);
                }
                break;
            case 5:
                break;
            case 6:
                ((Integer) obj).getClass();
                ec1 ec1Var = (ec1) obj2;
                ec1Var.getClass();
                break;
            case 7:
                String str = (String) obj;
                gb2 gb2Var = (gb2) obj2;
                str.getClass();
                gb2Var.getClass();
                if (str.length() != 0) {
                }
                break;
            case 8:
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    qv5.b(vn7.J(R.drawable.ic_round_restart_alt_24, 0, p65Var3), "Restart app", null, 0L, p65Var3, 56, 12);
                }
                break;
            case 9:
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                } else {
                    jjd.b(vo7.R(p65Var4, R.string.custom_app_icon_app_need_restart_confirm_title), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var4, 0, 0, 262142);
                }
                break;
            case 10:
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    p65Var5.S();
                } else {
                    jjd.b(vo7.R(p65Var5, R.string.custom_app_icon_app_need_restart_confirm_text), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var5, 0, 0, 262142);
                }
                break;
            case 11:
                x12 x12Var6 = (x12) obj;
                int iIntValue6 = ((Integer) obj2).intValue();
                p65 p65Var6 = (p65) x12Var6;
                if (!p65Var6.P(iIntValue6 & 1, (iIntValue6 & 3) != 2)) {
                    p65Var6.S();
                }
                break;
            case 12:
                x12 x12Var7 = (x12) obj;
                int iIntValue7 = ((Integer) obj2).intValue();
                p65 p65Var7 = (p65) x12Var7;
                if (!p65Var7.P(iIntValue7 & 1, (iIntValue7 & 3) != 2)) {
                    p65Var7.S();
                }
                break;
            case 13:
                x12 x12Var8 = (x12) obj;
                int iIntValue8 = ((Integer) obj2).intValue();
                p65 p65Var8 = (p65) x12Var8;
                if (!p65Var8.P(iIntValue8 & 1, (iIntValue8 & 3) != 2)) {
                    p65Var8.S();
                } else {
                    qv5.b(vn7.J(R.drawable.ic_share_24, 0, p65Var8), vo7.R(p65Var8, R.string.common_share_catalog), null, ((zo7) p65Var8.j(kt7.b)).o, p65Var8, 8, 4);
                }
                break;
            case 14:
                x12 x12Var9 = (x12) obj;
                int iIntValue9 = ((Integer) obj2).intValue();
                p65 p65Var9 = (p65) x12Var9;
                if (!p65Var9.P(iIntValue9 & 1, (iIntValue9 & 3) != 2)) {
                    p65Var9.S();
                } else {
                    qv5.b(vn7.J(R.drawable.ic_more_24, 0, p65Var9), vo7.R(p65Var9, R.string.common_more_options), null, ((zo7) p65Var9.j(kt7.b)).o, p65Var9, 8, 4);
                }
                break;
            case 15:
                x12 x12Var10 = (x12) obj;
                int iIntValue10 = ((Integer) obj2).intValue();
                p65 p65Var10 = (p65) x12Var10;
                if (!p65Var10.P(iIntValue10 & 1, (iIntValue10 & 3) != 2)) {
                    p65Var10.S();
                } else {
                    jjd.b(vo7.R(p65Var10, R.string.common_share_catalog), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var10, 0, 0, 262142);
                }
                break;
            case 16:
                x12 x12Var11 = (x12) obj;
                int iIntValue11 = ((Integer) obj2).intValue();
                p65 p65Var11 = (p65) x12Var11;
                if (!p65Var11.P(iIntValue11 & 1, (iIntValue11 & 3) != 2)) {
                    p65Var11.S();
                } else {
                    jjd.b(vo7.R(p65Var11, R.string.common_edit_catalog_info), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var11, 0, 0, 262142);
                }
                break;
            case 17:
                x12 x12Var12 = (x12) obj;
                int iIntValue12 = ((Integer) obj2).intValue();
                p65 p65Var12 = (p65) x12Var12;
                if (!p65Var12.P(iIntValue12 & 1, (iIntValue12 & 3) != 2)) {
                    p65Var12.S();
                } else {
                    jjd.b(vo7.R(p65Var12, R.string.common_make_catalog_private), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var12, 0, 0, 262142);
                }
                break;
            case 18:
                x12 x12Var13 = (x12) obj;
                int iIntValue13 = ((Integer) obj2).intValue();
                p65 p65Var13 = (p65) x12Var13;
                if (!p65Var13.P(iIntValue13 & 1, (iIntValue13 & 3) != 2)) {
                    p65Var13.S();
                } else {
                    jjd.b(vo7.R(p65Var13, R.string.common_make_catalog_public), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var13, 0, 0, 262142);
                }
                break;
            case 19:
                x12 x12Var14 = (x12) obj;
                int iIntValue14 = ((Integer) obj2).intValue();
                p65 p65Var14 = (p65) x12Var14;
                if (!p65Var14.P(iIntValue14 & 1, (iIntValue14 & 3) != 2)) {
                    p65Var14.S();
                } else {
                    jjd.b(vo7.R(p65Var14, R.string.common_report_catalog), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var14, 0, 0, 262142);
                }
                break;
            case 20:
                x12 x12Var15 = (x12) obj;
                int iIntValue15 = ((Integer) obj2).intValue();
                p65 p65Var15 = (p65) x12Var15;
                if (!p65Var15.P(iIntValue15 & 1, (iIntValue15 & 3) != 2)) {
                    p65Var15.S();
                } else {
                    jjd.b(vo7.R(p65Var15, R.string.common_delete_catalog), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var15, 0, 0, 262142);
                }
                break;
            case 21:
                x12 x12Var16 = (x12) obj;
                int iIntValue16 = ((Integer) obj2).intValue();
                p65 p65Var16 = (p65) x12Var16;
                if (!p65Var16.P(iIntValue16 & 1, (iIntValue16 & 3) != 2)) {
                    p65Var16.S();
                } else {
                    jjd.b(vo7.R(p65Var16, R.string.add_link_dialog_title), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var16.j(jt7.c)).d, p65Var16, 0, 0, 131070);
                }
                break;
            case 22:
                x12 x12Var17 = (x12) obj;
                int iIntValue17 = ((Integer) obj2).intValue();
                p65 p65Var17 = (p65) x12Var17;
                if (!p65Var17.P(iIntValue17 & 1, (iIntValue17 & 3) != 2)) {
                    p65Var17.S();
                } else {
                    jjd.b(vo7.R(p65Var17, R.string.common_post_delete_story_title), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var17, 0, 0, 262142);
                }
                break;
            case 23:
                x12 x12Var18 = (x12) obj;
                int iIntValue18 = ((Integer) obj2).intValue();
                p65 p65Var18 = (p65) x12Var18;
                if (!p65Var18.P(iIntValue18 & 1, (iIntValue18 & 3) != 2)) {
                    p65Var18.S();
                } else {
                    qv5.b(vn7.J(R.drawable.ic_settings_24, 0, p65Var18), vo7.R(p65Var18, R.string.digest_settings), w2g.C(bo.B(o28Var, 1.0f, ((zo7) p65Var18.j(kt7.b)).z, bmb.a), 8.0f), 0L, p65Var18, 8, 8);
                }
                break;
            case 24:
                x12 x12Var19 = (x12) obj;
                int iIntValue19 = ((Integer) obj2).intValue();
                p65 p65Var19 = (p65) x12Var19;
                if (!p65Var19.P(iIntValue19 & 1, (iIntValue19 & 3) != 2)) {
                    p65Var19.S();
                } else {
                    qv5.b(vn7.J(R.drawable.ic_more_24, 0, p65Var19), vo7.R(p65Var19, R.string.common_more_options), null, ((zo7) p65Var19.j(kt7.b)).o, p65Var19, 8, 4);
                }
                break;
            case 25:
                x12 x12Var20 = (x12) obj;
                int iIntValue20 = ((Integer) obj2).intValue();
                p65 p65Var20 = (p65) x12Var20;
                if (!p65Var20.P(iIntValue20 & 1, (iIntValue20 & 3) != 2)) {
                    p65Var20.S();
                } else {
                    jjd.b(vo7.R(p65Var20, R.string.edit_profile_discard_title), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var20, 0, 0, 262142);
                }
                break;
            case 26:
                x12 x12Var21 = (x12) obj;
                int iIntValue21 = ((Integer) obj2).intValue();
                p65 p65Var21 = (p65) x12Var21;
                if (!p65Var21.P(iIntValue21 & 1, (iIntValue21 & 3) != 2)) {
                    p65Var21.S();
                } else {
                    jjd.b(vo7.R(p65Var21, R.string.edit_profile_discard_text), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var21, 0, 0, 262142);
                }
                break;
            case 27:
                x12 x12Var22 = (x12) obj;
                int iIntValue22 = ((Integer) obj2).intValue();
                p65 p65Var22 = (p65) x12Var22;
                if (!p65Var22.P(iIntValue22 & 1, (iIntValue22 & 3) != 2)) {
                    p65Var22.S();
                } else {
                    qv5.b(vn7.J(R.drawable.ic_more_24, 0, p65Var22), vo7.R(p65Var22, R.string.common_more_options), null, 0L, p65Var22, 8, 12);
                }
                break;
            case 28:
                x12 x12Var23 = (x12) obj;
                int iIntValue23 = ((Integer) obj2).intValue();
                p65 p65Var23 = (p65) x12Var23;
                if (!p65Var23.P(iIntValue23 & 1, (iIntValue23 & 3) != 2)) {
                    p65Var23.S();
                } else {
                    jjd.b(vo7.R(p65Var23, R.string.external_web_copy_link), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var23, 0, 0, 262142);
                }
                break;
            default:
                x12 x12Var24 = (x12) obj;
                int iIntValue24 = ((Integer) obj2).intValue();
                p65 p65Var24 = (p65) x12Var24;
                if (!p65Var24.P(iIntValue24 & 1, (iIntValue24 & 3) != 2)) {
                    p65Var24.S();
                } else {
                    jjd.b(vo7.R(p65Var24, R.string.external_web_share_via), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var24, 0, 0, 262142);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ p02(int i, int i2) {
        this.a = i2;
    }
}
