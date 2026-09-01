package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class pb implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;

    public /* synthetic */ pb(String str, int i) {
        this.a = 8;
        this.b = str;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        o28 o28Var = o28.b;
        String str = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    r28 r28VarD = jfc.d(o28Var, 1.0f);
                    wv1 wv1VarA = uv1.a(qb8.e, z46.p, p65Var, 54);
                    long j = p65Var.T;
                    int i2 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarD);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, wv1VarA);
                    tp7.B(p65Var, q12.e, i89VarL);
                    tp7.B(p65Var, q12.g, Integer.valueOf(i2));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR);
                    sn3 sn3Var = jt7.c;
                    jjd.b("Authentication through Okta / Cloudflare Access", jfc.d(o28Var, 1.0f), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkd.a(((bu7) p65Var.j(sn3Var)).e, ((zo7) p65Var.j(kt7.b)).n, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 24960, 110588);
                    String str2 = this.b;
                    if (muc.b0(str2)) {
                        p65Var.Y(-1442863781);
                    } else {
                        p65Var.Y(-1435267944);
                        jjd.b(str2, jfc.d(o28Var, 1.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).w, p65Var, 48, 0, 131068);
                    }
                    p65Var.p(false);
                    p65Var.p(true);
                }
                break;
            case 1:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    jjd.b(this.b, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var2, 0, 0, 262142);
                }
                break;
            case 2:
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    String str3 = this.b;
                    if (str3 != null) {
                        p65Var3.Y(664276402);
                        jjd.b(str3, bgf.N(o28Var, "title"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var3.j(jt7.c)).j, p65Var3, 48, 0, 131068);
                    } else {
                        p65Var3.Y(662873373);
                    }
                    p65Var3.p(false);
                }
                break;
            case 3:
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                } else {
                    String str4 = this.b;
                    if (str4 != null) {
                        p65Var4.Y(-444433918);
                        kjd.b(str4, bgf.N(o28Var, "title"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((eu7) p65Var4.j(kt7.c)).j, p65Var4, 48, 0, 65532);
                    } else {
                        p65Var4.Y(-445731764);
                    }
                    p65Var4.p(false);
                }
                break;
            case 4:
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    p65Var5.S();
                } else {
                    qv5.b(vn7.J(R.drawable.ic_more_24, 0, p65Var5), vo7.Q(R.string.common_content_description_more_options_for_post_item, new Object[]{str}, p65Var5), null, ((zo7) p65Var5.j(kt7.b)).o, p65Var5, 8, 4);
                }
                break;
            case 5:
                x12 x12Var6 = (x12) obj;
                int iIntValue6 = ((Integer) obj2).intValue();
                p65 p65Var6 = (p65) x12Var6;
                if (!p65Var6.P(iIntValue6 & 1, (iIntValue6 & 3) != 2)) {
                    p65Var6.S();
                } else {
                    if (str != null) {
                        p65Var6.Y(1109569840);
                        mq7.h(str, null, p65Var6, 0);
                    } else {
                        p65Var6.Y(1109571464);
                        zk7 zk7VarC = dy0.c(z46.d, false);
                        long j2 = p65Var6.T;
                        int i3 = (int) ((j2 >>> 32) ^ j2);
                        i89 i89VarL2 = p65Var6.l();
                        r28 r28VarR2 = gx1.R(p65Var6, o28Var);
                        r12.W.getClass();
                        ot2 ot2Var2 = q12.b;
                        p65Var6.c0();
                        if (p65Var6.S) {
                            p65Var6.k(ot2Var2);
                        } else {
                            p65Var6.m0();
                        }
                        tp7.B(p65Var6, q12.f, zk7VarC);
                        tp7.B(p65Var6, q12.e, i89VarL2);
                        tp7.B(p65Var6, q12.g, Integer.valueOf(i3));
                        tp7.y(p65Var6, q12.h);
                        tp7.B(p65Var6, q12.d, r28VarR2);
                        p65Var6.p(true);
                    }
                    p65Var6.p(false);
                }
                break;
            case 6:
                x12 x12Var7 = (x12) obj;
                int iIntValue7 = ((Integer) obj2).intValue();
                p65 p65Var7 = (p65) x12Var7;
                if (!p65Var7.P(iIntValue7 & 1, (iIntValue7 & 3) != 2)) {
                    p65Var7.S();
                } else {
                    qv5.b(vn7.J(R.drawable.ic_close_24, 0, p65Var7), vo7.Q(R.string.search_delete_search, new Object[]{str}, p65Var7), null, ((zo7) p65Var7.j(kt7.b)).o, p65Var7, 8, 4);
                }
                break;
            case 7:
                x12 x12Var8 = (x12) obj;
                int iIntValue8 = ((Integer) obj2).intValue();
                p65 p65Var8 = (p65) x12Var8;
                if (!p65Var8.P(iIntValue8 & 1, (iIntValue8 & 3) != 2)) {
                    p65Var8.S();
                } else {
                    jjd.b(this.b, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var8.j(jt7.c)).o, p65Var8, 0, 0, 131070);
                }
                break;
            case 8:
                ((Integer) obj2).getClass();
                tp7.b(str, (x12) obj, tr7.y(1));
                break;
            default:
                x12 x12Var9 = (x12) obj;
                int iIntValue9 = ((Integer) obj2).intValue();
                p65 p65Var9 = (p65) x12Var9;
                if (!p65Var9.P(iIntValue9 & 1, (iIntValue9 & 3) != 2)) {
                    p65Var9.S();
                } else {
                    jjd.b(this.b, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var9, 0, 0, 262142);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ pb(String str, int i, byte b) {
        this.a = i;
        this.b = str;
    }
}
