package defpackage;

import com.medium.android.catalogs.addnotetolistitem.AddNoteToListItemDialogFragment;
import com.medium.android.susi.ui.apple.a;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class r implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ r(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        uob uobVar = w12.a;
        int i2 = 2;
        c1e c1eVar = c1e.a;
        Object obj3 = this.c;
        Object obj4 = this.b;
        int i3 = 1;
        switch (i) {
            case 0:
                b55 b55Var = (b55) obj4;
                q qVar = (q) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    boolean zF = p65Var.f(b55Var) | p65Var.f(qVar);
                    Object objM = p65Var.M();
                    if (zF || objM == uobVar) {
                        objM = new n(b55Var, i3, qVar);
                        p65Var.j0(objM);
                    }
                    f49.l((m45) objM, null, false, null, null, pxf.E(-1573527186, new k6c(i2, qVar), p65Var), p65Var, 1572864, 62);
                }
                break;
            case 1:
                String str = (String) obj3;
                String str2 = (String) obj;
                SourceParameter sourceParameter = (SourceParameter) obj2;
                str2.getClass();
                sourceParameter.getClass();
                str.getClass();
                b09.P(((iaa) obj4).a, str, null, str2, sourceParameter, 2);
                break;
            case 2:
                ua uaVar = (ua) obj4;
                AddNoteToListItemDialogFragment addNoteToListItemDialogFragment = (AddNoteToListItemDialogFragment) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    r40.d(uaVar.t, uaVar.s, new x9(addNoteToListItemDialogFragment, uaVar), new y9(addNoteToListItemDialogFragment, uaVar), null, p65Var2, 0);
                }
                break;
            case 3:
                ((Integer) obj2).getClass();
                r40.e((na) obj4, (x9) obj3, (x12) obj, tr7.y(1));
                break;
            case 4:
                x9 x9Var = (x9) obj4;
                upc upcVar = (upc) obj3;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    r40.e((na) upcVar.getValue(), x9Var, p65Var3, 0);
                }
                break;
            case 5:
                m45 m45Var = (m45) obj4;
                l78 l78Var = (l78) obj3;
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                } else {
                    t40.d((String) l78Var.getValue(), m45Var, null, p65Var4, 6);
                }
                break;
            case 6:
                ((Integer) obj2).getClass();
                k50.p((gc) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 7:
                ((Integer) obj2).getClass();
                rd.a((b55) obj4, (b55) obj3, (x12) obj, tr7.y(7));
                break;
            case 8:
                xe xeVar = (xe) obj4;
                me meVar = (me) obj3;
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    p65Var5.S();
                } else {
                    String strD = vo7.D(R.plurals.followed_collections_title, xeVar.a(), new Object[]{String.valueOf(xeVar.a())}, p65Var5);
                    boolean zF2 = p65Var5.f(meVar);
                    Object objM2 = p65Var5.M();
                    if (zF2 || objM2 == uobVar) {
                        objM2 = new l8(i2, meVar);
                        p65Var5.j0(objM2);
                    }
                    qk7.g(null, strD, (m45) objM2, null, null, null, 0L, 0L, null, p65Var5, 0, 505);
                }
                break;
            case 9:
                nf nfVar = (nf) obj4;
                zg7 zg7Var = (zg7) obj3;
                x12 x12Var6 = (x12) obj;
                int iIntValue6 = ((Integer) obj2).intValue();
                p65 p65Var6 = (p65) x12Var6;
                if (!p65Var6.P(iIntValue6 & 1, (iIntValue6 & 3) != 2)) {
                    p65Var6.S();
                } else {
                    String strD2 = vo7.D(R.plurals.followed_tags_title, nfVar.a(), new Object[]{String.valueOf(nfVar.a())}, p65Var6);
                    boolean zF3 = p65Var6.f(zg7Var);
                    Object objM3 = p65Var6.M();
                    if (zF3 || objM3 == uobVar) {
                        objM3 = new l8(3, zg7Var);
                        p65Var6.j0(objM3);
                    }
                    qk7.g(null, strD2, (m45) objM3, null, null, null, 0L, 0L, null, p65Var6, 0, 505);
                }
                break;
            case 10:
                bg bgVar = (bg) obj4;
                tf tfVar = (tf) obj3;
                x12 x12Var7 = (x12) obj;
                int iIntValue7 = ((Integer) obj2).intValue();
                p65 p65Var7 = (p65) x12Var7;
                if (!p65Var7.P(iIntValue7 & 1, (iIntValue7 & 3) != 2)) {
                    p65Var7.S();
                } else {
                    String strD3 = vo7.D(R.plurals.followed_writers_title, bgVar.a(), new Object[]{String.valueOf(bgVar.a())}, p65Var7);
                    boolean zF4 = p65Var7.f(tfVar);
                    Object objM4 = p65Var7.M();
                    if (zF4 || objM4 == uobVar) {
                        x8 x8Var = new x8(0, tfVar, tf.class, "onBackPressed", "onBackPressed()V", 0, 28);
                        p65Var7.j0(x8Var);
                        objM4 = x8Var;
                    }
                    qk7.g(null, strD3, (m45) ((qh6) objM4), null, null, null, 0L, 0L, null, p65Var7, 0, 505);
                }
                break;
            case 11:
                qg qgVar = (qg) obj4;
                ig igVar = (ig) obj3;
                x12 x12Var8 = (x12) obj;
                int iIntValue8 = ((Integer) obj2).intValue();
                p65 p65Var8 = (p65) x12Var8;
                if (!p65Var8.P(iIntValue8 & 1, (iIntValue8 & 3) != 2)) {
                    p65Var8.S();
                } else {
                    String strD4 = vo7.D(R.plurals.muted_collections_title, qgVar.a(), new Object[]{String.valueOf(qgVar.a())}, p65Var8);
                    boolean zF5 = p65Var8.f(igVar);
                    Object objM5 = p65Var8.M();
                    if (zF5 || objM5 == uobVar) {
                        vf vfVar = new vf(0, igVar, ig.class, "onBackPressed", "onBackPressed()V", 0, 3);
                        p65Var8.j0(vfVar);
                        objM5 = vfVar;
                    }
                    qk7.g(null, strD4, (m45) ((qh6) objM5), null, null, null, 0L, 0L, null, p65Var8, 0, 505);
                }
                break;
            case 12:
                eh ehVar = (eh) obj4;
                wg wgVar = (wg) obj3;
                x12 x12Var9 = (x12) obj;
                int iIntValue9 = ((Integer) obj2).intValue();
                p65 p65Var9 = (p65) x12Var9;
                if (!p65Var9.P(iIntValue9 & 1, (iIntValue9 & 3) != 2)) {
                    p65Var9.S();
                } else {
                    String strD5 = vo7.D(R.plurals.muted_writers_title, ehVar.a(), new Object[]{String.valueOf(ehVar.a())}, p65Var9);
                    boolean zF6 = p65Var9.f(wgVar);
                    Object objM6 = p65Var9.M();
                    if (zF6 || objM6 == uobVar) {
                        vf vfVar2 = new vf(0, wgVar, wg.class, "onBackPressed", "onBackPressed()V", 0, 6);
                        p65Var9.j0(vfVar2);
                        objM6 = vfVar2;
                    }
                    qk7.g(null, strD5, (m45) ((qh6) objM6), null, null, null, 0L, 0L, null, p65Var9, 0, 505);
                }
                break;
            case 13:
                float fFloatValue = ((Float) obj).floatValue();
                ((pl) obj4).a(fFloatValue, ((Float) obj2).floatValue());
                ((oya) obj3).a = fFloatValue;
                break;
            case 14:
                float fFloatValue2 = ((Float) obj).floatValue();
                float fFloatValue3 = ((Float) obj2).floatValue();
                sl slVar = ((nl) obj4).a;
                slVar.i.h(fFloatValue2);
                slVar.j.h(fFloatValue3);
                ((oya) obj3).a = fFloatValue2;
                break;
            case 15:
                ((Integer) obj2).getClass();
                f76.a((a) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 16:
                wu4 wu4Var = (wu4) obj4;
                zg7 zg7Var2 = (zg7) obj3;
                x12 x12Var10 = (x12) obj;
                int iIntValue10 = ((Integer) obj2).intValue();
                p65 p65Var10 = (p65) x12Var10;
                if (!p65Var10.P(iIntValue10 & 1, (iIntValue10 & 3) != 2)) {
                    p65Var10.S();
                } else {
                    n01.x(wu4Var, it4.S, zg7Var2, null, null, null, null, (((long) Float.floatToRawIntBits(76.0f)) << 32) | (((long) Float.floatToRawIntBits(16.0f)) & 4294967295L), p65Var10, 12582960, 120);
                }
                break;
            case 17:
                c55 c55Var = (c55) obj4;
                nx0 nx0Var = (nx0) obj3;
                x12 x12Var11 = (x12) obj;
                int iIntValue11 = ((Integer) obj2).intValue();
                p65 p65Var11 = (p65) x12Var11;
                if (!p65Var11.P(iIntValue11 & 1, (iIntValue11 & 3) != 2)) {
                    p65Var11.S();
                } else {
                    c55Var.f(nx0Var.b, p65Var11, 0);
                }
                break;
            case 18:
                lvc lvcVar = (lvc) obj;
                f72 f72Var = (f72) obj2;
                break;
            case 19:
                mz1 mz1Var = (mz1) obj4;
                jy0 jy0Var = (jy0) obj3;
                x12 x12Var12 = (x12) obj;
                int iIntValue12 = ((Integer) obj2).intValue();
                p65 p65Var12 = (p65) x12Var12;
                if (!p65Var12.P(iIntValue12 & 1, (iIntValue12 & 3) != 2)) {
                    p65Var12.S();
                } else {
                    mz1Var.f(jy0Var, p65Var12, 0);
                }
                break;
            case 20:
                ((Integer) obj2).getClass();
                y91.l((v81) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 21:
                l78 l78Var2 = (l78) obj3;
                int iIntValue13 = ((Integer) obj).intValue();
                int iIntValue14 = ((Integer) obj2).intValue();
                ArrayList arrayListN1 = bu1.n1((az5) l78Var2.getValue());
                arrayListN1.add(iIntValue14, arrayListN1.remove(iIntValue13));
                l78Var2.setValue(bo.f0(arrayListN1));
                ((y81) obj4).w(iIntValue13, iIntValue14);
                break;
            case 22:
                ((Integer) obj2).getClass();
                vx0.c((sd1) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            case 23:
                ((Integer) obj2).getClass();
                g01.a((rg1) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 24:
                ((Integer) obj2).getClass();
                vv2.g((ui9) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 25:
                ((Integer) obj2).getClass();
                xz5.e((nf1) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            case 26:
                ((Integer) obj2).getClass();
                d46.e((pf1) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            case 27:
                ((Integer) obj2).getClass();
                f76.h((rf1) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            case 28:
                ((Integer) obj2).getClass();
                g76.g((tf1) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            default:
                ((Integer) obj2).getClass();
                xf1.a((vf1) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ r(Object obj, Object obj2, int i, int i2) {
        this.a = i2;
        this.b = obj;
        this.c = obj2;
    }
}
