package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class l02 implements b55 {
    public final /* synthetic */ int a;

    public /* synthetic */ l02(int i) {
        this.a = i;
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
                    jjd.b(vo7.R(p65Var, R.string.responses_locked_close_discussion), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var, 0, 0, 262142);
                }
                break;
            case 1:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    jjd.b(vo7.R(p65Var2, R.string.responses_post_locked_confirmation_text), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var2, 0, 0, 262142);
                }
                break;
            case 2:
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    qv5.b(vn7.J(R.drawable.ic_shield_24, 0, p65Var3), vo7.R(p65Var3, R.string.common_rules), null, ((zo7) p65Var3.j(kt7.b)).o, p65Var3, 8, 4);
                }
                break;
            case 3:
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                } else {
                    qv5.b(vn7.J(R.drawable.ic_more_24, 0, p65Var4), vo7.R(p65Var4, R.string.common_more_options), null, ((zo7) p65Var4.j(kt7.b)).o, p65Var4, 8, 4);
                }
                break;
            case 4:
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    p65Var5.S();
                } else {
                    jjd.b(vo7.R(p65Var5, R.string.responses_hide_hide_responses), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var5, 0, 0, 262142);
                }
                break;
            case 5:
                x12 x12Var6 = (x12) obj;
                int iIntValue6 = ((Integer) obj2).intValue();
                p65 p65Var6 = (p65) x12Var6;
                if (!p65Var6.P(iIntValue6 & 1, (iIntValue6 & 3) != 2)) {
                    p65Var6.S();
                } else {
                    jjd.b(vo7.R(p65Var6, R.string.common_delete), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var6, 0, 0, 262142);
                }
                break;
            case 6:
                x12 x12Var7 = (x12) obj;
                int iIntValue7 = ((Integer) obj2).intValue();
                p65 p65Var7 = (p65) x12Var7;
                if (!p65Var7.P(iIntValue7 & 1, (iIntValue7 & 3) != 2)) {
                    p65Var7.S();
                } else {
                    jjd.b(vo7.R(p65Var7, R.string.response_delete_confirmation_text), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var7, 0, 0, 262142);
                }
                break;
            case 7:
                x12 x12Var8 = (x12) obj;
                int iIntValue8 = ((Integer) obj2).intValue();
                p65 p65Var8 = (p65) x12Var8;
                if (!p65Var8.P(iIntValue8 & 1, (iIntValue8 & 3) != 2)) {
                    p65Var8.S();
                } else {
                    omb ombVarA = nmb.a(qb8.a, z46.n, p65Var8, 48);
                    long j = p65Var8.T;
                    int i2 = (int) ((j >>> 32) ^ j);
                    i89 i89VarL = p65Var8.l();
                    o28 o28Var = o28.b;
                    r28 r28VarR = gx1.R(p65Var8, o28Var);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var8.c0();
                    if (p65Var8.S) {
                        p65Var8.k(ot2Var);
                    } else {
                        p65Var8.m0();
                    }
                    tp7.B(p65Var8, q12.f, ombVarA);
                    tp7.B(p65Var8, q12.e, i89VarL);
                    tp7.B(p65Var8, q12.g, Integer.valueOf(i2));
                    tp7.y(p65Var8, q12.h);
                    tp7.B(p65Var8, q12.d, r28VarR);
                    qv5.b(vn7.J(R.drawable.ic_thumbs_down_24, 0, p65Var8), null, null, uu1.b(0.5f, ((zo7) p65Var8.j(kt7.b)).n), p65Var8, 56, 4);
                    jjd.b(vo7.R(p65Var8, R.string.common_show_less_like_this), w2g.i(w2g.G(o28Var, 12.0f, 0.0f, 0.0f, 0.0f, 14), 0.5f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var8, 48, 0, 262140);
                    p65Var8.p(true);
                }
                break;
            case 8:
                x12 x12Var9 = (x12) obj;
                int iIntValue9 = ((Integer) obj2).intValue();
                p65 p65Var9 = (p65) x12Var9;
                if (!p65Var9.P(iIntValue9 & 1, (iIntValue9 & 3) != 2)) {
                    p65Var9.S();
                } else {
                    jjd.b(vo7.R(p65Var9, R.string.common_unclap), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var9, 0, 0, 262142);
                }
                break;
            case 9:
                x12 x12Var10 = (x12) obj;
                int iIntValue10 = ((Integer) obj2).intValue();
                p65 p65Var10 = (p65) x12Var10;
                if (!p65Var10.P(iIntValue10 & 1, (iIntValue10 & 3) != 2)) {
                    p65Var10.S();
                } else {
                    jjd.b(vo7.R(p65Var10, R.string.common_display_settings), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var10, 0, 0, 262142);
                }
                break;
            case 10:
                x12 x12Var11 = (x12) obj;
                int iIntValue11 = ((Integer) obj2).intValue();
                p65 p65Var11 = (p65) x12Var11;
                if (!p65Var11.P(iIntValue11 & 1, (iIntValue11 & 3) != 2)) {
                    p65Var11.S();
                } else {
                    jjd.b(vo7.R(p65Var11, R.string.common_unfollow_collection), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var11, 0, 0, 262142);
                }
                break;
            case 11:
                x12 x12Var12 = (x12) obj;
                int iIntValue12 = ((Integer) obj2).intValue();
                p65 p65Var12 = (p65) x12Var12;
                if (!p65Var12.P(iIntValue12 & 1, (iIntValue12 & 3) != 2)) {
                    p65Var12.S();
                } else {
                    jjd.b(vo7.R(p65Var12, R.string.common_follow_collection), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var12, 0, 0, 262142);
                }
                break;
            case 12:
                x12 x12Var13 = (x12) obj;
                int iIntValue13 = ((Integer) obj2).intValue();
                p65 p65Var13 = (p65) x12Var13;
                if (!p65Var13.P(iIntValue13 & 1, (iIntValue13 & 3) != 2)) {
                    p65Var13.S();
                } else {
                    jjd.b(vo7.R(p65Var13, R.string.common_unmute_author), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var13, 0, 0, 262142);
                }
                break;
            case 13:
                x12 x12Var14 = (x12) obj;
                int iIntValue14 = ((Integer) obj2).intValue();
                p65 p65Var14 = (p65) x12Var14;
                if (!p65Var14.P(iIntValue14 & 1, (iIntValue14 & 3) != 2)) {
                    p65Var14.S();
                } else {
                    jjd.b(vo7.R(p65Var14, R.string.common_mute_author), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var14, 0, 0, 262142);
                }
                break;
            case 14:
                x12 x12Var15 = (x12) obj;
                int iIntValue15 = ((Integer) obj2).intValue();
                p65 p65Var15 = (p65) x12Var15;
                if (!p65Var15.P(iIntValue15 & 1, (iIntValue15 & 3) != 2)) {
                    p65Var15.S();
                } else {
                    jjd.b(vo7.R(p65Var15, R.string.common_unmute_publication), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var15, 0, 0, 262142);
                }
                break;
            case 15:
                x12 x12Var16 = (x12) obj;
                int iIntValue16 = ((Integer) obj2).intValue();
                p65 p65Var16 = (p65) x12Var16;
                if (!p65Var16.P(iIntValue16 & 1, (iIntValue16 & 3) != 2)) {
                    p65Var16.S();
                } else {
                    jjd.b(vo7.R(p65Var16, R.string.common_mute_publication), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var16, 0, 0, 262142);
                }
                break;
            case 16:
                x12 x12Var17 = (x12) obj;
                int iIntValue17 = ((Integer) obj2).intValue();
                p65 p65Var17 = (p65) x12Var17;
                if (!p65Var17.P(iIntValue17 & 1, (iIntValue17 & 3) != 2)) {
                    p65Var17.S();
                } else {
                    jjd.b(vo7.R(p65Var17, R.string.common_post_report_story), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var17, 0, 0, 262142);
                }
                break;
            case 17:
                x12 x12Var18 = (x12) obj;
                int iIntValue18 = ((Integer) obj2).intValue();
                p65 p65Var18 = (p65) x12Var18;
                if (!p65Var18.P(iIntValue18 & 1, (iIntValue18 & 3) != 2)) {
                    p65Var18.S();
                } else {
                    jjd.b(vo7.R(p65Var18, R.string.common_unpin_story), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var18, 0, 0, 262142);
                }
                break;
            case 18:
                x12 x12Var19 = (x12) obj;
                int iIntValue19 = ((Integer) obj2).intValue();
                p65 p65Var19 = (p65) x12Var19;
                if (!p65Var19.P(iIntValue19 & 1, (iIntValue19 & 3) != 2)) {
                    p65Var19.S();
                } else {
                    jjd.b(vo7.R(p65Var19, R.string.common_pin_story), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var19, 0, 0, 262142);
                }
                break;
            case 19:
                x12 x12Var20 = (x12) obj;
                int iIntValue20 = ((Integer) obj2).intValue();
                p65 p65Var20 = (p65) x12Var20;
                if (!p65Var20.P(iIntValue20 & 1, (iIntValue20 & 3) != 2)) {
                    p65Var20.S();
                } else {
                    jjd.b(vo7.R(p65Var20, R.string.common_edit), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var20, 0, 0, 262142);
                }
                break;
            case 20:
                x12 x12Var21 = (x12) obj;
                int iIntValue21 = ((Integer) obj2).intValue();
                p65 p65Var21 = (p65) x12Var21;
                if (!p65Var21.P(iIntValue21 & 1, (iIntValue21 & 3) != 2)) {
                    p65Var21.S();
                } else {
                    jjd.b(vo7.R(p65Var21, R.string.common_delete), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var21, 0, 0, 262142);
                }
                break;
            case 21:
                x12 x12Var22 = (x12) obj;
                int iIntValue22 = ((Integer) obj2).intValue();
                p65 p65Var22 = (p65) x12Var22;
                if (!p65Var22.P(iIntValue22 & 1, (iIntValue22 & 3) != 2)) {
                    p65Var22.S();
                } else {
                    jjd.b(vo7.R(p65Var22, R.string.story_stats), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var22, 0, 0, 262142);
                }
                break;
            case 22:
                x12 x12Var23 = (x12) obj;
                int iIntValue23 = ((Integer) obj2).intValue();
                p65 p65Var23 = (p65) x12Var23;
                if (!p65Var23.P(iIntValue23 & 1, (iIntValue23 & 3) != 2)) {
                    p65Var23.S();
                } else {
                    omb ombVarA2 = nmb.a(qb8.a, z46.n, p65Var23, 48);
                    long j2 = p65Var23.T;
                    int i3 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var23.l();
                    o28 o28Var2 = o28.b;
                    r28 r28VarR2 = gx1.R(p65Var23, o28Var2);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var23.c0();
                    if (p65Var23.S) {
                        p65Var23.k(ot2Var2);
                    } else {
                        p65Var23.m0();
                    }
                    tp7.B(p65Var23, q12.f, ombVarA2);
                    tp7.B(p65Var23, q12.e, i89VarL2);
                    tp7.B(p65Var23, q12.g, Integer.valueOf(i3));
                    tp7.y(p65Var23, q12.h);
                    tp7.B(p65Var23, q12.d, r28VarR2);
                    qv5.b(vn7.J(R.drawable.ic_thumbs_down_filled_24, 0, p65Var23), null, null, 0L, p65Var23, 56, 12);
                    jjd.b(vo7.R(p65Var23, R.string.common_undo_show_less_like_this), w2g.G(o28Var2, 12.0f, 0.0f, 0.0f, 0.0f, 14), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var23, 48, 0, 262140);
                    p65Var23.p(true);
                }
                break;
            case 23:
                x12 x12Var24 = (x12) obj;
                int iIntValue24 = ((Integer) obj2).intValue();
                p65 p65Var24 = (p65) x12Var24;
                if (!p65Var24.P(iIntValue24 & 1, (iIntValue24 & 3) != 2)) {
                    p65Var24.S();
                } else {
                    omb ombVarA3 = nmb.a(qb8.a, z46.n, p65Var24, 48);
                    long j3 = p65Var24.T;
                    int i4 = (int) ((j3 >>> 32) ^ j3);
                    i89 i89VarL3 = p65Var24.l();
                    o28 o28Var3 = o28.b;
                    r28 r28VarR3 = gx1.R(p65Var24, o28Var3);
                    r12.W.getClass();
                    ot2 ot2Var3 = q12.b;
                    p65Var24.c0();
                    if (p65Var24.S) {
                        p65Var24.k(ot2Var3);
                    } else {
                        p65Var24.m0();
                    }
                    tp7.B(p65Var24, q12.f, ombVarA3);
                    tp7.B(p65Var24, q12.e, i89VarL3);
                    tp7.B(p65Var24, q12.g, Integer.valueOf(i4));
                    tp7.y(p65Var24, q12.h);
                    tp7.B(p65Var24, q12.d, r28VarR3);
                    qv5.b(vn7.J(R.drawable.ic_thumbs_down_24, 0, p65Var24), null, null, 0L, p65Var24, 56, 12);
                    jjd.b(vo7.R(p65Var24, R.string.common_show_less_like_this), w2g.G(o28Var3, 12.0f, 0.0f, 0.0f, 0.0f, 14), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var24, 48, 0, 262140);
                    p65Var24.p(true);
                }
                break;
            case 24:
                x12 x12Var25 = (x12) obj;
                int iIntValue25 = ((Integer) obj2).intValue();
                p65 p65Var25 = (p65) x12Var25;
                if (!p65Var25.P(iIntValue25 & 1, (iIntValue25 & 3) != 2)) {
                    p65Var25.S();
                } else {
                    w2g.e(vn7.J(R.drawable.ic_member_24, 0, p65Var25), vo7.R(p65Var25, R.string.cd_member_only), null, null, null, 0.0f, null, p65Var25, 8, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
                }
                break;
            case 25:
                x12 x12Var26 = (x12) obj;
                int iIntValue26 = ((Integer) obj2).intValue();
                p65 p65Var26 = (p65) x12Var26;
                if (!p65Var26.P(iIntValue26 & 1, (iIntValue26 & 3) != 2)) {
                    p65Var26.S();
                } else {
                    rv5.a(vn7.J(R.drawable.ic_newsletter, 0, p65Var26), null, null, ((zo7) p65Var26.j(kt7.b)).n, p65Var26, 56, 4);
                }
                break;
            case 26:
                x12 x12Var27 = (x12) obj;
                int iIntValue27 = ((Integer) obj2).intValue();
                p65 p65Var27 = (p65) x12Var27;
                if (!p65Var27.P(iIntValue27 & 1, (iIntValue27 & 3) != 2)) {
                    p65Var27.S();
                } else {
                    rv5.a(vn7.J(R.drawable.ic_unlisted_24, 0, p65Var27), null, null, ((zo7) p65Var27.j(kt7.b)).n, p65Var27, 56, 4);
                }
                break;
            case 27:
                x12 x12Var28 = (x12) obj;
                int iIntValue28 = ((Integer) obj2).intValue();
                p65 p65Var28 = (p65) x12Var28;
                if (!p65Var28.P(iIntValue28 & 1, (iIntValue28 & 3) != 2)) {
                    p65Var28.S();
                } else {
                    jjd.b(vo7.R(p65Var28, R.string.clear_reading_history_title), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var28, 0, 0, 262142);
                }
                break;
            case 28:
                x12 x12Var29 = (x12) obj;
                int iIntValue29 = ((Integer) obj2).intValue();
                p65 p65Var29 = (p65) x12Var29;
                if (!p65Var29.P(iIntValue29 & 1, (iIntValue29 & 3) != 2)) {
                    p65Var29.S();
                } else {
                    jjd.b(vo7.R(p65Var29, R.string.clear_reading_history_description), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var29, 0, 0, 262142);
                }
                break;
            default:
                x12 x12Var30 = (x12) obj;
                int iIntValue30 = ((Integer) obj2).intValue();
                p65 p65Var30 = (p65) x12Var30;
                if (!p65Var30.P(iIntValue30 & 1, (iIntValue30 & 3) != 2)) {
                    p65Var30.S();
                } else {
                    pr7.g(p65Var30, 0);
                }
                break;
        }
        return c1eVar;
    }
}
