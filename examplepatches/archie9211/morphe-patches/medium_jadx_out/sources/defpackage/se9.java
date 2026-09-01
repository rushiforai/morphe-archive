package defpackage;

import androidx.compose.ui.tooling.PreviewActivity;
import com.medium.android.pushnotificationsettings.ui.PushNotificationSettingsFragment;
import gen.model.SourceParameter;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class se9 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ se9(spa spaVar, r28 r28Var, wpa wpaVar, int i) {
        this.a = 18;
        this.b = spaVar;
        this.d = r28Var;
        this.c = wpaVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) throws Exception {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = 1;
        Object obj3 = this.d;
        Object obj4 = this.c;
        Object obj5 = this.b;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                hk7.i((tf9) obj5, (te9) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 1:
                nhc nhcVar = (nhc) obj5;
                upc upcVar = (upc) obj4;
                fj9 fj9Var = (fj9) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    br7.k(nhcVar, w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) upcVar.getValue()).a, 7), 0.0f, pxf.E(-865725789, new qg9(nhcVar, i2, fj9Var), p65Var), p65Var, 3072, 4);
                }
                break;
            case 2:
                ((Integer) obj2).getClass();
                qo7.d((lp9) obj5, (fp9) obj4, (gp9) obj3, (x12) obj, tr7.y(1));
                break;
            case 3:
                ((Integer) obj2).getClass();
                yo7.e((mq9) obj5, (iq9) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 4:
                ((Integer) obj2).getClass();
                yo7.k((kq9) obj5, (SourceParameter) obj4, (iq9) obj3, (x12) obj, tr7.y(1));
                break;
            case 5:
                ((Integer) obj2).getClass();
                rx0.B((b24) obj5, (ex9) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 6:
                String str = (String) obj5;
                String str2 = (String) obj4;
                Object[] objArr = (Object[]) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                int i3 = PreviewActivity.b;
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(1 & iIntValue2, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    wgf.z(str, str2, p65Var2, Arrays.copyOf(objArr, 0));
                }
                break;
            case 7:
                ((Integer) obj2).getClass();
                vx0.q((k1a) obj5, (i1a) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 8:
                ((Integer) obj2).getClass();
                kk7.j((tla) obj5, (v08) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 9:
                ((Integer) obj2).getClass();
                ht2.G((b24) obj5, (e9a) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 10:
                q9a q9aVar = (q9a) obj5;
                e9a e9aVar = (e9a) obj4;
                upc upcVar2 = (upc) obj3;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    f9a f9aVar = q9aVar instanceof f9a ? (f9a) q9aVar : null;
                    String str3 = f9aVar != null ? f9aVar.e : null;
                    boolean zH = p65Var3.h(e9aVar);
                    Object objM = p65Var3.M();
                    if (zH || objM == w12.a) {
                        c9a c9aVar = new c9a(0, e9aVar, e9a.class, "onBackPressed", "onBackPressed()V", 0, 0);
                        p65Var3.j0(c9aVar);
                        objM = c9aVar;
                    }
                    qk7.g(wo7.w(o28.b, ((vj3) upcVar2.getValue()).a, null, 0L, 0L, 30), str3, (m45) ((qh6) objM), null, null, null, 0L, 0L, null, p65Var3, 0, 504);
                }
                break;
            case 11:
                ((Integer) obj2).getClass();
                pba.h((nma) obj5, (String) obj4, (m45) obj3, (x12) obj, tr7.y(1));
                break;
            case 12:
                ((Integer) obj2).getClass();
                d46.p((wea) obj5, (m45) obj4, (uda) obj3, (x12) obj, tr7.y(1));
                break;
            case 13:
                ((Integer) obj2).getClass();
                f76.l((rha) obj5, (jha) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 14:
                ((Integer) obj2).getClass();
                ur7.n((hia) obj5, (cv9) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 15:
                ((Integer) obj2).getClass();
                g76.u((jja) obj5, (qia) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 16:
                ((Integer) obj2).getClass();
                g76.v((kja) obj5, (qia) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 17:
                ina inaVar = (ina) obj5;
                nla nlaVar = (nla) obj4;
                l78 l78Var = (l78) obj3;
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                } else {
                    vn7.e(inaVar, ((Boolean) l78Var.getValue()).booleanValue(), nlaVar, null, p65Var4, 0);
                }
                break;
            case 18:
                ((Integer) obj2).getClass();
                yo7.h((spa) obj5, (r28) obj3, (wpa) obj4, (x12) obj, tr7.y(1));
                break;
            case 19:
                PushNotificationSettingsFragment pushNotificationSettingsFragment = (PushNotificationSettingsFragment) obj5;
                olb olbVar = (olb) obj4;
                upc upcVar3 = (upc) obj3;
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    p65Var5.S();
                } else {
                    qb8.s(((PushNotificationSettingsFragment.BundleInfo) pushNotificationSettingsFragment.u0.getValue()).getReferrerSource(), olbVar, w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) upcVar3.getValue()).a, 7), null, p65Var5, 0);
                }
                break;
            case 20:
                ((Integer) obj2).getClass();
                qb8.d((gqa) obj5, (x45) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 21:
                ((Integer) obj2).getClass();
                qb8.g((b24) obj5, (m45) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 22:
                ((Integer) obj2).getClass();
                op8.z((gua) obj5, (vta) obj4, (r28) obj3, (x12) obj, tr7.y(385));
                break;
            case 23:
                ((Integer) obj2).getClass();
                mk7.f((String) obj5, (uza) obj4, (nhc) obj3, (x12) obj, tr7.y(1));
                break;
            case 24:
                ((Integer) obj2).getClass();
                vp7.g((j4b) obj5, (h4b) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 25:
                ((Integer) obj2).getClass();
                vp7.f((j4b) obj5, (i4b) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 26:
                ((Integer) obj2).getClass();
                mq7.m((t5b) obj5, (k5b) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 27:
                ((Integer) obj2).getClass();
                mq7.n((vpc) obj5, (bo4) obj4, (k5b) obj3, (x12) obj, tr7.y(1));
                break;
            case 28:
                ((Integer) obj2).getClass();
                er7.g((j6b) obj5, (e6b) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            default:
                ((Integer) obj2).getClass();
                rr7.k((x6b) obj5, (m6b) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ se9(int i, int i2, Object obj, Object obj2, Object obj3) {
        this.a = i2;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }

    public /* synthetic */ se9(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }
}
