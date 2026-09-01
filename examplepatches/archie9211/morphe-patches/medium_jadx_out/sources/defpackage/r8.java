package defpackage;

import android.content.Context;
import android.net.Uri;
import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import com.medium.android.core.navigation.s;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.susi.ui.addInfo.AddInfoFragment;
import com.medium.android.susi.ui.unrecognizedEmail.UnrecognizedEmailFragment;
import com.medium.proto.event.SignUpSignInUnrecognizedEmailOtherSigninClicked;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class r8 implements e07 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ r8(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.e07
    public final void a(d07 d07Var) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                c9 c9Var = (c9) obj;
                d07Var.getClass();
                s26 s26Var = c9Var.a;
                String str = c9Var.b.j;
                str.getClass();
                AddInfoFragment addInfoFragment = (AddInfoFragment) s26Var.c;
                s sVarZ = addInfoFragment.Z();
                Context contextS = addInfoFragment.S();
                if (addInfoFragment.u0 != null) {
                    ((p13) sVarZ).f(contextS, Uri.parse(i03.D), str);
                    return;
                } else {
                    g76.g0("mediumUris");
                    throw null;
                }
            case 1:
                c9 c9Var2 = (c9) obj;
                d07Var.getClass();
                s26 s26Var2 = c9Var2.a;
                String str2 = c9Var2.b.j;
                str2.getClass();
                AddInfoFragment addInfoFragment2 = (AddInfoFragment) s26Var2.c;
                s sVarZ2 = addInfoFragment2.Z();
                Context contextS2 = addInfoFragment2.S();
                if (addInfoFragment2.u0 != null) {
                    ((p13) sVarZ2).f(contextS2, Uri.parse(i03.E), str2);
                    return;
                } else {
                    g76.g0("mediumUris");
                    throw null;
                }
            default:
                x1e x1eVar = (x1e) obj;
                d07Var.getClass();
                e2e e2eVar = x1eVar.b;
                a13 a13Var = e2eVar.f;
                String str3 = e2eVar.j;
                String str4 = e2eVar.b;
                String strU = gp7.u(e2eVar.k);
                l3d l3dVar = l3d.MEDIUM;
                SusiOperation susiOperation = e2eVar.l;
                a13Var.getClass();
                susiOperation.getClass();
                str3.getClass();
                str4.getClass();
                rqd.a(a13Var.a, new SignUpSignInUnrecognizedEmailOtherSigninClicked(null, "app", susiOperation.getValue(), a13Var.b.p(), l3dVar != null ? l3dVar.getValue() : null, null, 33, null), str4, strU, false, null, str3, 24);
                lig ligVar = ((UnrecognizedEmailFragment) x1eVar.a.b).v0;
                if (ligVar != null) {
                    ligVar.H().b.m(R.id.authFragment, false);
                    return;
                } else {
                    g76.g0(pUlNWdybf.dQZearbvPy);
                    throw null;
                }
        }
    }
}
