package defpackage;

import android.app.PendingIntent;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.data.notification.YMl.DtuT;
import com.medium.android.donkey.write.EditPostFragment;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class up3 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ EditPostFragment b;

    public /* synthetic */ up3(EditPostFragment editPostFragment, int i) {
        this.a = i;
        this.b = editPostFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) throws PendingIntent.CanceledException {
        int i = this.a;
        int i2 = 5;
        int i3 = 4;
        n92 n92Var = null;
        uob uobVar = w12.a;
        int i4 = 0;
        int i5 = 1;
        c1e c1eVar = c1e.a;
        EditPostFragment editPostFragment = this.b;
        int i6 = 2;
        int i7 = 3;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                int i8 = EditPostFragment.Q0;
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    l78 l78VarZ = guc.z(editPostFragment.j1().z, p65Var, 0);
                    Object objM = p65Var.M();
                    if (objM == uobVar) {
                        objM = bjc.b(new rr1(l78VarZ, i2));
                        p65Var.j0(objM);
                    }
                    upc upcVar = (upc) objM;
                    ht3 ht3VarJ1 = editPostFragment.j1();
                    iv2 iv2Var = editPostFragment.F0;
                    if (iv2Var == null) {
                        g76.g0("binding");
                        throw null;
                    }
                    boolean zF = p65Var.f(ht3VarJ1) | p65Var.f((EditPostBodyView) iv2Var.h);
                    Object objM2 = p65Var.M();
                    if (zF || objM2 == uobVar) {
                        objM2 = new gq3(editPostFragment);
                        p65Var.j0(objM2);
                    }
                    WeakHashMap weakHashMap = f5f.w;
                    m40.j((rp3) upcVar.getValue(), (gq3) objM2, op8.p0(o28.b, new y0e(tr7.o(p65Var).e, tr7.o(p65Var).c)), p65Var, 0);
                    iv2 iv2Var2 = editPostFragment.F0;
                    if (iv2Var2 == null) {
                        g76.g0("binding");
                        throw null;
                    }
                    EditPostBodyView editPostBodyView = (EditPostBodyView) iv2Var2.h;
                    boolean zH = p65Var.h(editPostFragment);
                    Object objM3 = p65Var.M();
                    if (zH || objM3 == uobVar) {
                        objM3 = new sp3(editPostFragment, i6);
                        p65Var.j0(objM3);
                    }
                    kyd.h(editPostBodyView, (x45) objM3, p65Var);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                int i9 = EditPostFragment.Q0;
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    l78 l78VarZ2 = guc.z(editPostFragment.j1().z, p65Var2, 0);
                    as3 as3Var = (as3) guc.z(editPostFragment.j1().B, p65Var2, 0).getValue();
                    if (as3Var instanceof wr3) {
                        p65Var2.Y(-106230442);
                        String str = ((wr3) as3Var).a;
                        ht3 ht3VarJ12 = editPostFragment.j1();
                        boolean zH2 = p65Var2.h(ht3VarJ12);
                        Object objM4 = p65Var2.M();
                        if (zH2 || objM4 == uobVar) {
                            gu1 gu1Var = new gu1(0, ht3VarJ12, ht3.class, DtuT.yLLXhjokyaS, "onDialogClosed()V", 0, 29);
                            p65Var2.j0(gu1Var);
                            objM4 = gu1Var;
                        }
                        m45 m45Var = (m45) ((qh6) objM4);
                        boolean zH3 = p65Var2.h(editPostFragment);
                        Object objM5 = p65Var2.M();
                        if (zH3 || objM5 == uobVar) {
                            objM5 = new up3(editPostFragment, i6);
                            p65Var2.j0(objM5);
                        }
                        sgg.l(str, m45Var, (b55) objM5, null, p65Var2, 0);
                        p65Var2.p(false);
                    } else if (as3Var instanceof zr3) {
                        p65Var2.Y(-106214034);
                        boolean zH4 = p65Var2.h(editPostFragment);
                        Object objM6 = p65Var2.M();
                        if (zH4 || objM6 == uobVar) {
                            objM6 = new tp3(editPostFragment, i5);
                            p65Var2.j0(objM6);
                        }
                        m45 m45Var2 = (m45) objM6;
                        boolean zH5 = p65Var2.h(editPostFragment);
                        Object objM7 = p65Var2.M();
                        if (zH5 || objM7 == uobVar) {
                            objM7 = new tp3(editPostFragment, i6);
                            p65Var2.j0(objM7);
                        }
                        gq7.e(m45Var2, (m45) objM7, null, p65Var2, 0);
                        p65Var2.p(false);
                    } else if (as3Var instanceof xr3) {
                        p65Var2.Y(-106196620);
                        boolean zH6 = p65Var2.h(editPostFragment);
                        Object objM8 = p65Var2.M();
                        if (zH6 || objM8 == uobVar) {
                            objM8 = new tp3(editPostFragment, i7);
                            p65Var2.j0(objM8);
                        }
                        m45 m45Var3 = (m45) objM8;
                        boolean zH7 = p65Var2.h(editPostFragment);
                        Object objM9 = p65Var2.M();
                        if (zH7 || objM9 == uobVar) {
                            objM9 = new tp3(editPostFragment, i3);
                            p65Var2.j0(objM9);
                        }
                        m45 m45Var4 = (m45) objM9;
                        boolean zH8 = p65Var2.h(editPostFragment);
                        Object objM10 = p65Var2.M();
                        if (zH8 || objM10 == uobVar) {
                            objM10 = new tp3(editPostFragment, i2);
                            p65Var2.j0(objM10);
                        }
                        m45 m45Var5 = (m45) objM10;
                        ht3 ht3VarJ13 = editPostFragment.j1();
                        boolean zH9 = p65Var2.h(ht3VarJ13);
                        Object objM11 = p65Var2.M();
                        if (zH9 || objM11 == uobVar) {
                            objM11 = new hq3(0, ht3VarJ13, ht3.class, "onDialogClosed", "onDialogClosed()V", 0, 1);
                            p65Var2.j0(objM11);
                        }
                        bgf.m(m45Var3, m45Var4, m45Var5, (m45) ((qh6) objM11), null, p65Var2, 0);
                        p65Var2.p(false);
                    } else if (as3Var instanceof yr3) {
                        p65Var2.Y(1004708549);
                        boolean zH10 = p65Var2.h(editPostFragment) | p65Var2.f(as3Var);
                        Object objM12 = p65Var2.M();
                        if (zH10 || objM12 == uobVar) {
                            objM12 = new gd3(editPostFragment, i7, (yr3) as3Var);
                            p65Var2.j0(objM12);
                        }
                        m45 m45Var6 = (m45) objM12;
                        ht3 ht3VarJ14 = editPostFragment.j1();
                        boolean zH11 = p65Var2.h(ht3VarJ14);
                        Object objM13 = p65Var2.M();
                        if (zH11 || objM13 == uobVar) {
                            hq3 hq3Var = new hq3(0, ht3VarJ14, ht3.class, "onDialogClosed", "onDialogClosed()V", 0, 0);
                            p65Var2.j0(hq3Var);
                            objM13 = hq3Var;
                        }
                        pwd.m(m45Var6, (m45) ((qh6) objM13), null, p65Var2, 0);
                        p65Var2.p(false);
                    } else {
                        if (as3Var != null) {
                            throw ho2.L(p65Var2, -106230691, false);
                        }
                        p65Var2.Y(-106122833);
                        p65Var2.p(false);
                    }
                    ps3 ps3Var = (ps3) l78VarZ2.getValue();
                    boolean zF2 = p65Var2.f(l78VarZ2) | p65Var2.h(editPostFragment);
                    Object objM14 = p65Var2.M();
                    if (zF2 || objM14 == uobVar) {
                        objM14 = new rc0(editPostFragment, l78VarZ2, n92Var, 9);
                        p65Var2.j0(objM14);
                    }
                    kyd.k(p65Var2, (b55) objM14, ps3Var);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                String str2 = (String) obj;
                String str3 = (String) obj2;
                int i10 = EditPostFragment.Q0;
                str3.getClass();
                editPostFragment.j1().h();
                iv2 iv2Var3 = editPostFragment.F0;
                if (iv2Var3 != null) {
                    ((EditPostBodyView) iv2Var3.h).c(new jw1(str2, str3));
                    return c1eVar;
                }
                g76.g0("binding");
                throw null;
            case 3:
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                int i11 = EditPostFragment.Q0;
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    l78 l78VarZ3 = guc.z(editPostFragment.j1().z, p65Var3, 0);
                    Object objM15 = p65Var3.M();
                    if (objM15 == uobVar) {
                        objM15 = bjc.b(new rr1(l78VarZ3, i7));
                        p65Var3.j0(objM15);
                    }
                    upc upcVar2 = (upc) objM15;
                    Object objM16 = p65Var3.M();
                    if (objM16 == uobVar) {
                        objM16 = bjc.b(new rr1(l78VarZ3, i3));
                        p65Var3.j0(objM16);
                    }
                    upc upcVar3 = (upc) objM16;
                    boolean zF3 = p65Var3.f(editPostFragment.j1()) | p65Var3.f((String) upcVar3.getValue());
                    Object objM17 = p65Var3.M();
                    if (zF3 || objM17 == uobVar) {
                        objM17 = new fq3(editPostFragment, upcVar3);
                        p65Var3.j0(objM17);
                    }
                    jt7.a(false, pxf.E(-439598822, new ag1((fq3) objM17, 21, upcVar2), p65Var3), p65Var3, 48, 1);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 4:
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                int i12 = EditPostFragment.Q0;
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    jt7.a(false, pxf.E(912786914, new up3(editPostFragment, i4), p65Var4), p65Var4, 48, 1);
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 5:
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                int i13 = EditPostFragment.Q0;
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    jt7.a(false, pxf.E(916089547, new up3(editPostFragment, i5), p65Var5), p65Var5, 48, 1);
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            default:
                ((p13) editPostFragment.Z()).h0(editPostFragment.S(), (String) obj, (String) obj2);
                return c1eVar;
        }
    }
}
