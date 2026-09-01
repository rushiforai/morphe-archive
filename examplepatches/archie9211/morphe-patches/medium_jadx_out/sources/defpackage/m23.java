package defpackage;

import android.graphics.drawable.Drawable;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.android.postpublishing.ui.TopicData;
import com.medium.reader.R;
import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m23 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ m23(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        o28 o28Var = o28.b;
        c1e c1eVar = c1e.a;
        Object obj4 = this.b;
        switch (i) {
            case 0:
                long j = ((uu1) obj).a;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Number) obj3).intValue();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).e(j) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    n23.b(((fhd) obj4).c, j, p65Var, (iIntValue << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Number) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    String strR = vo7.R(p65Var2, R.string.create_a_new_list);
                    long j2 = ((zo7) p65Var2.j(kt7.b)).r;
                    r28 r28VarB = jfc.b(jfc.d(o28Var, 1.0f), 0.0f, 48.0f, 1);
                    vkb vkbVar = new vkb(0);
                    u37 u37Var = (u37) obj4;
                    boolean zF = p65Var2.f(u37Var);
                    Object objM = p65Var2.M();
                    if (zF || objM == w12.a) {
                        objM = new ek5(0, u37Var, u37.class, "createNewList", "createNewList()V", 0, 16);
                        p65Var2.j0(objM);
                    }
                    jjd.b(strR, jfc.r(w2g.E(hlg.r(r28VarB, false, null, vkbVar, (m45) ((qh6) objM), 11), 24.0f, 0.0f, 2), 2), j2, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var2, 0, 0, 262136);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Number) obj3).intValue();
                Collection collection = (az5) obj4;
                ((gq4) obj).getClass();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 17) != 16)) {
                    p65Var3.S();
                } else if (((t0) collection).isEmpty()) {
                    p65Var3.Y(-734144850);
                    kjd.b(vo7.R(p65Var3, R.string.publication_flow_no_topics_added), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, dl7.m(mkd.a(((eu7) p65Var3.j(kt7.c)).n, ((zo7) p65Var3.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214)), p65Var3, 0, 0, 65534);
                    p65Var3.p(false);
                } else {
                    p65Var3.Y(-733810577);
                    Iterator it2 = collection.iterator();
                    while (it2.hasNext()) {
                        fp7.f((TopicData) it2.next(), p65Var3, 0);
                    }
                    p65Var3.p(false);
                }
                return c1eVar;
            case 3:
                x12 x12Var4 = (x12) obj2;
                int iIntValue4 = ((Number) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 17) != 16)) {
                    jjd.b(((umc) ((wmc) obj4)).a, w2g.D(jfc.d(o28Var, 1.0f), 24.0f, 6.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var4.j(jt7.c)).m, p65Var4, 48, 0, 131068);
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 4:
                long j3 = ((uu1) obj).a;
                x12 x12Var5 = (x12) obj2;
                int iIntValue5 = ((Number) obj3).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(iIntValue5 & 1, (iIntValue5 & 17) != 16)) {
                    ep6.c.d((Drawable) obj4, p65Var5, 48);
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            default:
                r28 r28Var = (r28) obj;
                ((Number) obj3).intValue();
                p65 p65Var6 = (p65) ((x12) obj2);
                p65Var6.Y(-1498516085);
                wlc wlcVarN = ek7.N(i48.FastSpatial, p65Var6);
                wlc wlcVarN2 = ek7.N(i48.FastEffects, p65Var6);
                dsd dsdVar = (dsd) obj4;
                hud hudVar = d46.i;
                b2 b2Var = dsdVar.a;
                k49 k49Var = dsdVar.d;
                boolean zBooleanValue = ((Boolean) b2Var.o0()).booleanValue();
                p65Var6.Y(-1553362193);
                float f = zBooleanValue ? 1.0f : 0.8f;
                p65Var6.p(false);
                Float fValueOf = Float.valueOf(f);
                boolean zBooleanValue2 = ((Boolean) k49Var.getValue()).booleanValue();
                p65Var6.Y(-1553362193);
                float f2 = zBooleanValue2 ? 1.0f : 0.8f;
                p65Var6.p(false);
                Float fValueOf2 = Float.valueOf(f2);
                dsdVar.f();
                p65Var6.Y(386845748);
                p65Var6.p(false);
                bsd bsdVarW = k40.W(dsdVar, fValueOf, fValueOf2, wlcVarN, hudVar, p65Var6, 196608);
                boolean zBooleanValue3 = ((Boolean) dsdVar.a.o0()).booleanValue();
                p65Var6.Y(2073045083);
                float f3 = zBooleanValue3 ? 1.0f : 0.0f;
                p65Var6.p(false);
                Float fValueOf3 = Float.valueOf(f3);
                boolean zBooleanValue4 = ((Boolean) k49Var.getValue()).booleanValue();
                p65Var6.Y(2073045083);
                float f4 = zBooleanValue4 ? 1.0f : 0.0f;
                p65Var6.p(false);
                Float fValueOf4 = Float.valueOf(f4);
                dsdVar.f();
                p65Var6.Y(-281714272);
                p65Var6.p(false);
                r28 r28VarX = xz5.X(r28Var, ((Number) bsdVarW.j.getValue()).floatValue(), ((Number) bsdVarW.j.getValue()).floatValue(), ((Number) k40.W(dsdVar, fValueOf3, fValueOf4, wlcVarN2, hudVar, p65Var6, 196608).j.getValue()).floatValue(), 0.0f, null, 131064);
                p65Var6.p(false);
                return r28VarX;
        }
    }
}
