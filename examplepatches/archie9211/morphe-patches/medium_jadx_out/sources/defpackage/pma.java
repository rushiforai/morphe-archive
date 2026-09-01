package defpackage;

import com.medium.android.donkey.main.MainActivity;
import com.medium.android.pushnotificationsettings.ui.PushNotificationSettingsFragment;
import com.medium.android.responses.ResponsesFragment;
import defpackage.c1e;
import defpackage.p65;
import defpackage.pgb;
import defpackage.vq6;
import defpackage.x12;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class pma implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ pma(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        uob uobVar = w12.a;
        int i2 = 1;
        c1e c1eVar = c1e.a;
        Object obj3 = this.c;
        Object obj4 = this.b;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                vn7.f((sma) obj4, (nla) obj3, (x12) obj, tr7.y(1));
                break;
            case 1:
                ((Integer) obj2).getClass();
                nk7.L((vna) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 2:
                PushNotificationSettingsFragment pushNotificationSettingsFragment = (PushNotificationSettingsFragment) obj4;
                olb olbVar = (olb) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(1379818868, new se9(pushNotificationSettingsFragment, olbVar, guc.z(((MainActivity) pushNotificationSettingsFragment.Q()).s(), p65Var, 0), 19), p65Var), p65Var, 48, 1);
                }
                break;
            case 3:
                ((Integer) obj2).getClass();
                kp7.b((kra) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            case 4:
                ((Integer) obj2).getClass();
                tp7.k((mra) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            case 5:
                ((Integer) obj2).getClass();
                vp7.e((pra) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            case 6:
                mz1 mz1Var = (mz1) obj4;
                kta ktaVar = (kta) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    mz1Var.f(ktaVar, p65Var2, 48);
                }
                break;
            case 7:
                ((Integer) obj2).getClass();
                op8.y((vta) obj4, (r28) obj3, (x12) obj, tr7.y(49));
                break;
            case 8:
                ((Integer) obj2).getClass();
                mq7.l((t5b) obj4, (k5b) obj3, (x12) obj, tr7.y(1));
                break;
            case 9:
                k5b k5bVar = (k5b) obj4;
                upc upcVar = (upc) obj3;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    mq7.l((t5b) upcVar.getValue(), k5bVar, p65Var3, 0);
                }
                break;
            case 10:
                ((Integer) obj2).getClass();
                rr7.j((x6b) obj4, (m6b) obj3, (x12) obj, tr7.y(1));
                break;
            case 11:
                m6b m6bVar = (m6b) obj4;
                upc upcVar2 = (upc) obj3;
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                } else {
                    rr7.j((x6b) upcVar2.getValue(), m6bVar, p65Var4, 0);
                }
                break;
            case 12:
                c7b c7bVar = (c7b) obj4;
                upc upcVar3 = (upc) obj3;
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    p65Var5.S();
                } else {
                    ek7.q((n7b) upcVar3.getValue(), c7bVar, p65Var5, 0);
                }
                break;
            case 13:
                ((Integer) obj2).getClass();
                ek7.q((n7b) obj4, (c7b) obj3, (x12) obj, tr7.y(1));
                break;
            case 14:
                x9b x9bVar = (x9b) obj4;
                i9b i9bVar = (i9b) obj3;
                x12 x12Var6 = (x12) obj;
                int iIntValue6 = ((Integer) obj2).intValue();
                p65 p65Var6 = (p65) x12Var6;
                if (!p65Var6.P(iIntValue6 & 1, (iIntValue6 & 3) != 2)) {
                    p65Var6.S();
                } else {
                    if (x9bVar instanceof u9b) {
                        p65Var6.Y(24325855);
                        u9b u9bVar = (u9b) x9bVar;
                        int i3 = u9bVar.g;
                        boolean z = u9bVar.h;
                        boolean z2 = u9bVar.f;
                        boolean zF = p65Var6.f(i9bVar);
                        Object objM = p65Var6.M();
                        if (zF || objM == uobVar) {
                            uta utaVar = new uta(0, i9bVar, i9b.class, "onRepostClicked", "onRepostClicked()V", 0, 18);
                            p65Var6.j0(utaVar);
                            objM = utaVar;
                        }
                        ok7.f(i3, z, z2, (m45) ((qh6) objM), rv8.X(o28.b, rv8.v), p65Var6, 0);
                    } else {
                        p65Var6.Y(14484843);
                    }
                    p65Var6.p(false);
                }
                break;
            case 15:
                ((Integer) obj2).getClass();
                il7.e((mkd) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 16:
                ((Integer) obj2).getClass();
                odb.a((mdb) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            case 17:
                ((Integer) obj2).getClass();
                rdb.a((pdb) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            case 18:
                ((Integer) obj2).getClass();
                yo7.i((sdb) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            case 19:
                final ResponsesFragment responsesFragment = (ResponsesFragment) obj4;
                final tfb tfbVar = (tfb) obj3;
                x12 x12Var7 = (x12) obj;
                int iIntValue7 = ((Integer) obj2).intValue();
                p65 p65Var7 = (p65) x12Var7;
                if (!p65Var7.P(iIntValue7 & 1, (iIntValue7 & 3) != 2)) {
                    p65Var7.S();
                } else {
                    jt7.a(false, pxf.E(1815122954, new b55() { // from class: com.medium.android.responses.b
                        @Override // defpackage.b55
                        public final Object invoke(Object obj5, Object obj6) {
                            vq6 vq6Var = responsesFragment.w0;
                            x12 x12Var8 = (x12) obj5;
                            int iIntValue8 = ((Integer) obj6).intValue();
                            p65 p65Var8 = (p65) x12Var8;
                            if (p65Var8.P(iIntValue8 & 1, (iIntValue8 & 3) != 2)) {
                                pgb.g(((ResponsesFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), ((ResponsesFragment.BundleInfo) vq6Var.getValue()).getResponsesReference(), tfbVar, null, null, p65Var8, 0);
                            } else {
                                p65Var8.S();
                            }
                            return c1e.a;
                        }
                    }, p65Var7), p65Var7, 48, 1);
                }
                break;
            case 20:
                nib nibVar = (nib) obj4;
                xgb xgbVar = (xgb) obj3;
                x12 x12Var8 = (x12) obj;
                int iIntValue8 = ((Integer) obj2).intValue();
                p65 p65Var8 = (p65) x12Var8;
                if (!p65Var8.P(iIntValue8 & 1, (iIntValue8 & 3) != 2)) {
                    p65Var8.S();
                } else {
                    boolean zH = p65Var8.h(nibVar) | p65Var8.f(xgbVar);
                    Object objM2 = p65Var8.M();
                    if (zH || objM2 == uobVar) {
                        objM2 = new nbb(nibVar, i2, xgbVar);
                        p65Var8.j0(objM2);
                    }
                    f76.w((m45) objM2, null, false, null, null, null, yi2.p, p65Var8, 805306368, 510);
                }
                break;
            case 21:
                ((Integer) obj2).getClass();
                pgb.a((whb) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 22:
                c55 c55Var = (c55) obj4;
                cqb cqbVar = (cqb) obj3;
                x12 x12Var9 = (x12) obj;
                int iIntValue9 = ((Integer) obj2).intValue();
                p65 p65Var9 = (p65) x12Var9;
                if (!p65Var9.P(iIntValue9 & 1, (iIntValue9 & 3) != 2)) {
                    p65Var9.S();
                } else {
                    c55Var.f(cqbVar.a, p65Var9, 0);
                }
                break;
            case 23:
                yqa yqaVar = (yqa) obj4;
                b55 b55Var = (b55) obj3;
                x12 x12Var10 = (x12) obj;
                int iIntValue10 = ((Integer) obj2).intValue();
                p65 p65Var10 = (p65) x12Var10;
                if (!p65Var10.P(iIntValue10 & 1, (iIntValue10 & 3) != 2)) {
                    p65Var10.S();
                } else {
                    k40.c(zpb.a.a(yqaVar), b55Var, p65Var10, 8);
                }
                break;
            case 24:
                mz1 mz1Var2 = (mz1) obj4;
                ypb ypbVar = (ypb) obj3;
                x12 x12Var11 = (x12) obj;
                int iIntValue11 = ((Integer) obj2).intValue();
                p65 p65Var11 = (p65) x12Var11;
                if (!p65Var11.P(iIntValue11 & 1, (iIntValue11 & 3) != 2)) {
                    p65Var11.S();
                } else {
                    mz1Var2.f(ypbVar, p65Var11, 6);
                }
                break;
            case 25:
                oya oyaVar = (oya) obj4;
                float fFloatValue = ((Float) obj).floatValue();
                ((Float) obj2).getClass();
                float f = oyaVar.a;
                oyaVar.a = ((xrb) obj3).a(fFloatValue - f) + f;
                break;
            case 26:
                avb avbVar = (avb) obj4;
                hub hubVar = (hub) obj3;
                x12 x12Var12 = (x12) obj;
                int iIntValue12 = ((Integer) obj2).intValue();
                p65 p65Var12 = (p65) x12Var12;
                if (!p65Var12.P(iIntValue12 & 1, (iIntValue12 & 3) != 2)) {
                    p65Var12.S();
                } else {
                    er7.o(avbVar.a, hubVar, null, null, p65Var12, 0, 12);
                }
                break;
            case 27:
                ((Integer) obj2).getClass();
                rr7.n((tvb) obj4, (iv9) obj3, (x12) obj, tr7.y(1));
                break;
            case 28:
                ((Integer) obj2).getClass();
                dm2.q((d2c) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            default:
                ((Integer) obj2).getClass();
                ep7.m((b5c) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ pma(Object obj, Object obj2, int i, int i2) {
        this.a = i2;
        this.b = obj;
        this.c = obj2;
    }
}
