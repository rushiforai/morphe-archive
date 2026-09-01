package defpackage;

import com.medium.android.susi.ui.auth.AuthFragment;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ac0 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ AuthFragment b;
    public final /* synthetic */ zg7 c;

    public /* synthetic */ ac0(AuthFragment authFragment, zg7 zg7Var, int i) {
        this.a = i;
        this.b = authFragment;
        this.c = zg7Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        AuthFragment authFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    jt7.a(false, pxf.E(-263607744, new ac0(authFragment, this.c, i2), p65Var), p65Var, 48, 1);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            default:
                vq6 vq6Var = authFragment.B0;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    List list = authFragment.v0;
                    if (list == null) {
                        g76.g0("facebookPermissions");
                        throw null;
                    }
                    String str = authFragment.u0;
                    if (str == null) {
                        g76.g0("googleServerClientId");
                        throw null;
                    }
                    o41 o41Var = authFragment.w0;
                    if (o41Var == null) {
                        g76.g0("facebookCallbackManager");
                        throw null;
                    }
                    aa7 aa7Var = authFragment.x0;
                    if (aa7Var == null) {
                        g76.g0("facebookLoginManager");
                        throw null;
                    }
                    gsa.j(list, str, o41Var, aa7Var, this.c, ((AuthFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), ((AuthFragment.BundleInfo) vq6Var.getValue()).getSusiDestination(), ((AuthFragment.BundleInfo) vq6Var.getValue()).getSusiOperation(), null, null, p65Var2, 0);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
        }
    }
}
