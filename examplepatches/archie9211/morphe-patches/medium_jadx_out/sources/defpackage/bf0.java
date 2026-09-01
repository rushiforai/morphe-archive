package defpackage;

import android.content.Context;
import android.net.Uri;
import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import com.medium.android.addressbook.ui.findfriends.FindFriendsFragment;
import com.medium.android.core.navigation.s;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.home.ui.home.HomeFragment;
import com.medium.android.susi.ui.unrecognizedEmail.UnrecognizedEmailFragment;
import com.medium.proto.event.SignUpSignInUnrecognizedEmailSignupClicked;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class bf0 implements e07 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ bf0(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.e07
    public final void a(d07 d07Var) {
        String str;
        int i = this.a;
        String str2 = QFTsJPDEnO.SExJpFPGmb;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                ff0 ff0Var = (ff0) obj;
                d07Var.getClass();
                String str3 = ff0Var.e.a;
                SourceParameter sourceParameter = ff0Var.i;
                str3.getClass();
                sw9 sw9Var = ((iv9) obj2).a;
                vx0.c0(f76.F(sw9Var), null, null, new gs9(sw9Var, str3, sourceParameter, null, 11), 3);
                return;
            case 1:
                d07Var.getClass();
                ((ls0) obj2).b(((ms0) obj).b);
                return;
            case 2:
                d07Var.getClass();
                ((ua4) obj2).c(((ab4) obj).g);
                return;
            case 3:
                eb4 eb4Var = (eb4) obj;
                d07Var.getClass();
                ((ua4) obj2).a(eb4Var.d, eb4Var.f);
                return;
            case 4:
                d07Var.getClass();
                ((ua4) obj2).c(((db4) obj).f);
                return;
            case 5:
                String str4 = (String) obj;
                d07Var.getClass();
                str4.getClass();
                FindFriendsFragment findFriendsFragment = (FindFriendsFragment) ((hi4) obj2).a.b;
                py2 py2Var = findFriendsFragment.v0;
                if (py2Var == null) {
                    g76.g0("deepLinkHandler");
                    throw null;
                }
                Context contextS = findFriendsFragment.S();
                if (findFriendsFragment.w0 != null) {
                    py2Var.a(contextS, Uri.parse(i03.C), str4, null);
                    return;
                } else {
                    g76.g0(str2);
                    throw null;
                }
            case 6:
                zib zibVar = (zib) obj2;
                pq5 pq5Var = (pq5) obj;
                d07Var.getClass();
                boolean z = zibVar.c;
                if (z && (str = zibVar.d) != null) {
                    str.getClass();
                    rq5 rq5Var = pq5Var.a;
                    rq5Var.getClass();
                    rq5Var.a.f();
                    HomeFragment homeFragment = ((dq5) rq5Var.b).a;
                    ((p13) homeFragment.Z()).b(homeFragment.S(), str);
                    return;
                }
                if (z) {
                    rq5 rq5Var2 = pq5Var.a;
                    rq5Var2.a.f();
                    HomeFragment homeFragment2 = ((dq5) rq5Var2.b).a;
                    ((p13) homeFragment2.Z()).e0(homeFragment2.S(), Uri.parse("https://play.google.com/store/account/subscriptions"));
                    return;
                }
                rq5 rq5Var3 = pq5Var.a;
                SourceParameter sourceParameter2 = pq5Var.b.f;
                rq5Var3.getClass();
                sourceParameter2.getClass();
                rq5Var3.a.f();
                gq5 gq5Var = rq5Var3.b;
                String strU = gp7.u(sourceParameter2);
                HomeFragment homeFragment3 = ((dq5) gq5Var).a;
                s sVarZ = homeFragment3.Z();
                Context contextS2 = homeFragment3.S();
                if (homeFragment3.v0 != null) {
                    ((p13) sVarZ).f(contextS2, Uri.parse(i03.k), strU);
                    return;
                } else {
                    g76.g0(str2);
                    throw null;
                }
            case 7:
                x1e x1eVar = (x1e) obj2;
                c2e c2eVar = (c2e) obj;
                d07Var.getClass();
                String str5 = c2eVar.a.a.b;
                if (!huc.b(str5)) {
                    str5 = null;
                }
                if (str5 == null) {
                    str5 = c2eVar.b;
                }
                String str6 = str5;
                SusiDestination susiDestination = c2eVar.e;
                SourceParameter sourceParameter3 = c2eVar.d;
                boolean z2 = c2eVar.f;
                str6.getClass();
                sourceParameter3.getClass();
                e2e e2eVar = x1eVar.b;
                a13 a13Var = e2eVar.f;
                String str7 = e2eVar.j;
                String str8 = e2eVar.b;
                String strU2 = gp7.u(e2eVar.k);
                l3d l3dVar = l3d.MEDIUM;
                SusiOperation susiOperation = e2eVar.l;
                a13Var.getClass();
                susiOperation.getClass();
                str7.getClass();
                str8.getClass();
                rqd.a(a13Var.a, new SignUpSignInUnrecognizedEmailSignupClicked(null, "app", susiOperation.getValue(), a13Var.b.p(), l3dVar != null ? l3dVar.getValue() : null, null, 33, null), str8, strU2, false, null, str7, 24);
                lig ligVar = ((UnrecognizedEmailFragment) x1eVar.a.b).v0;
                if (ligVar != null) {
                    b09.T(ligVar, gp7.u(sourceParameter3), null, str6, susiDestination, z2, 2);
                    return;
                } else {
                    g76.g0("susiRouter");
                    throw null;
                }
            case 8:
                d07Var.getClass();
                ((jt) obj2).a("https://medium.com/_/admin/v2/users/" + ((oae) obj).b + "/dismissable-flags");
                return;
            case 9:
                d07Var.getClass();
                ((x45) obj2).invoke(((bfe) obj).a);
                return;
            default:
                d07Var.getClass();
                SourceParameter sourceParameter4 = ((nhe) obj).b;
                sourceParameter4.getClass();
                ((khe) obj2).a.q(sourceParameter4);
                return;
        }
    }
}
