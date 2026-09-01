package defpackage;

import android.content.res.Resources;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.android.domain.post.models.Highlight;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ck5 implements c55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ yk5 b;
    public final /* synthetic */ dk5 c;
    public final /* synthetic */ l78 d;

    public /* synthetic */ ck5(dk5 dk5Var, yk5 yk5Var, l78 l78Var) {
        this.c = dk5Var;
        this.b = yk5Var;
        this.d = l78Var;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        mx mxVarX;
        int i;
        int i2 = this.a;
        c1e c1eVar = c1e.a;
        mx mxVar = null;
        o28 o28Var = o28.b;
        uob uobVar = w12.a;
        yk5 yk5Var = this.b;
        switch (i2) {
            case 0:
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(1 & iIntValue, (iIntValue & 17) != 16)) {
                    p65Var.S();
                } else {
                    r28 r28VarN = bgf.N(o28Var, "share_menu_item");
                    bq7 bq7Var = new bq7(vo7.R(p65Var, R.string.common_share), false, null, null, 28);
                    dk5 dk5Var = this.c;
                    boolean zF = p65Var.f(dk5Var);
                    Object objM = p65Var.M();
                    l78 l78Var = this.d;
                    if (zF || objM == uobVar) {
                        objM = new gd3(dk5Var, 25, l78Var);
                        p65Var.j0(objM);
                    }
                    aq7.b(bq7Var, (m45) objM, r28VarN, 0L, 0L, p65Var, 384, 24);
                    p65 p65Var2 = p65Var;
                    Highlight highlight = (Highlight) bu1.z0(((vk5) yk5Var).h);
                    if (highlight == null) {
                        p65Var2.Y(1920450322);
                        p65Var2.p(false);
                        mxVarX = null;
                    } else {
                        p65Var2.Y(1920450323);
                        mxVarX = pxf.x(highlight.getStartOffset(), highlight.getEndOffset(), 16, p65Var2, highlight.getParagraphText(), highlight.getParagraphMarkups());
                        p65Var2.p(false);
                    }
                    if (mxVarX != null && !muc.b0(mxVarX.b)) {
                        mxVar = mxVarX;
                    }
                    ap1 ap1Var = (ap1) p65Var2.j(z22.f);
                    Resources resources = (Resources) p65Var2.j(eo.c);
                    Object objM2 = p65Var2.M();
                    if (objM2 == uobVar) {
                        objM2 = kyd.M(p65Var2);
                        p65Var2.j0(objM2);
                    }
                    sb2 sb2Var = (sb2) objM2;
                    if (mxVar != null) {
                        p65Var2.Y(1921151636);
                        r28 r28VarN2 = bgf.N(o28Var, "copy_menu_item");
                        bq7 bq7Var2 = new bq7(vo7.R(p65Var2, R.string.common_copy), false, null, null, 28);
                        boolean zH = p65Var2.h(sb2Var) | p65Var2.h(resources) | p65Var2.f(mxVar) | p65Var2.h(ap1Var) | p65Var2.f(dk5Var);
                        Object objM3 = p65Var2.M();
                        if (zH || objM3 == uobVar) {
                            k84 k84Var = new k84(sb2Var, l78Var, resources, mxVar, ap1Var, dk5Var);
                            p65Var2.j0(k84Var);
                            objM3 = k84Var;
                        }
                        aq7.b(bq7Var2, (m45) objM3, r28VarN2, 0L, 0L, p65Var2, 384, 24);
                        p65Var2 = p65Var2;
                    } else {
                        p65Var2.Y(1902979405);
                    }
                    p65Var2.p(false);
                }
                break;
            default:
                pmb pmbVar = (pmb) obj;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                pmbVar.getClass();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((p65) x12Var2).f(pmbVar) ? 4 : 2;
                }
                p65 p65Var3 = (p65) x12Var2;
                if (!p65Var3.P(iIntValue2 & 1, (iIntValue2 & 19) != 18)) {
                    p65Var3.S();
                } else {
                    xn7 xn7Var = xn7.M;
                    vk5 vk5Var = (vk5) yk5Var;
                    uk5 uk5Var = vk5Var.c;
                    if (uk5Var instanceof qk5) {
                        i = R.string.highlight_unhighlight;
                    } else if (uk5Var instanceof sk5) {
                        i = R.string.highlight_highlight;
                    } else if (uk5Var instanceof rk5) {
                        i = R.string.highlight_highlighting;
                    } else if (!(uk5Var instanceof tk5)) {
                        ygf.a();
                    } else {
                        i = R.string.highlight_unhighlighting;
                    }
                    String strR = vo7.R(p65Var3, i);
                    zq0 zq0Var = z46.n;
                    r28 r28VarN3 = bgf.N(pmbVar.b(o28Var, zq0Var), "highlight_button");
                    boolean z = !d46.R(rk5.a, tk5.a).contains(vk5Var.c);
                    boolean zF2 = p65Var3.f(yk5Var);
                    dk5 dk5Var2 = this.c;
                    boolean zF3 = zF2 | p65Var3.f(dk5Var2);
                    Object objM4 = p65Var3.M();
                    if (zF3 || objM4 == uobVar) {
                        objM4 = new bk5(yk5Var, dk5Var2);
                        p65Var3.j0(objM4);
                    }
                    fo7.k(384, 80, null, p65Var3, (m45) objM4, xn7Var, r28VarN3, strR, z, false);
                    String strR2 = vo7.R(p65Var3, R.string.common_respond);
                    r28 r28VarN4 = bgf.N(pmbVar.b(o28Var, zq0Var), "respond_button");
                    boolean zF4 = p65Var3.f(dk5Var2) | p65Var3.f(yk5Var);
                    Object objM5 = p65Var3.M();
                    if (zF4 || objM5 == uobVar) {
                        objM5 = new bk5(dk5Var2, yk5Var);
                        p65Var3.j0(objM5);
                    }
                    fo7.k(384, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, null, p65Var3, (m45) objM5, xn7Var, r28VarN4, strR2, false, false);
                    Object objM6 = p65Var3.M();
                    l78 l78Var2 = this.d;
                    if (objM6 == uobVar) {
                        objM6 = new ei4(l78Var2, 6);
                        p65Var3.j0(objM6);
                    }
                    f49.l((m45) objM6, bgf.N(pmbVar.b(o28Var, zq0Var), "more_button"), false, null, null, sgg.a, p65Var3, 1572870, 60);
                    boolean zBooleanValue = ((Boolean) l78Var2.getValue()).booleanValue();
                    long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(80.0f)) << 32) | (((long) Float.floatToRawIntBits(0.0f)) & 4294967295L);
                    r28 r28VarN5 = bgf.N(o28Var, "more_menu");
                    Object objM7 = p65Var3.M();
                    if (objM7 == uobVar) {
                        objM7 = new ei4(l78Var2, 7);
                        p65Var3.j0(objM7);
                    }
                    xp7.b(zBooleanValue, (m45) objM7, r28VarN5, jFloatToRawIntBits, null, null, null, 0L, 0.0f, pxf.E(1578437173, new ck5(dk5Var2, yk5Var, l78Var2), p65Var3), p65Var3, 3504, 2032);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ck5(yk5 yk5Var, dk5 dk5Var, l78 l78Var) {
        this.b = yk5Var;
        this.c = dk5Var;
        this.d = l78Var;
    }
}
