package defpackage;

import com.medium.android.donkey.main.MainActivity;
import com.medium.android.donkey.read.web.ExternalWebViewFragment;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class g84 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ExternalWebViewFragment b;

    public /* synthetic */ g84(ExternalWebViewFragment externalWebViewFragment, int i) {
        this.a = i;
        this.b = externalWebViewFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        l78 l78VarY;
        int i = this.a;
        c1e c1eVar = c1e.a;
        ExternalWebViewFragment externalWebViewFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    jt7.a(false, pxf.E(1752736558, new g84(externalWebViewFragment, i2), p65Var), p65Var, 48, 1);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            default:
                vq6 vq6Var = externalWebViewFragment.y0;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(1 & iIntValue2, (iIntValue2 & 3) != 2)) {
                    m15 m15VarQ = externalWebViewFragment.Q();
                    if (m15VarQ instanceof MainActivity) {
                        p65Var2.Y(752657315);
                        vpc vpcVarS = ((MainActivity) m15VarQ).s();
                        hl0 hl0Var = as7.a;
                        l78VarY = guc.x(vpcVarS, new vj3(56.0f), p65Var2, 0);
                        p65Var2.p(false);
                    } else {
                        p65Var2.Y(752661032);
                        l78VarY = qo7.y(new vj3(0.0f), p65Var2);
                        p65Var2.p(false);
                    }
                    zk2 zk2Var = externalWebViewFragment.u0;
                    if (zk2Var == null) {
                        g76.g0("currentUserRepo");
                        throw null;
                    }
                    i03 i03Var = externalWebViewFragment.w0;
                    if (i03Var == null) {
                        g76.g0("mediumUris");
                        throw null;
                    }
                    c84 c84Var = new c84(externalWebViewFragment, zk2Var, i03Var, 2);
                    String url = ((ExternalWebViewFragment.BundleInfo) vq6Var.getValue()).getUrl();
                    String referrerSource = ((ExternalWebViewFragment.BundleInfo) vq6Var.getValue()).getReferrerSource();
                    py2 py2Var = externalWebViewFragment.v0;
                    if (py2Var == null) {
                        g76.g0("deepLinkHandler");
                        throw null;
                    }
                    String str = externalWebViewFragment.x0;
                    if (str == null) {
                        g76.g0(gYpYQDQkhfs.CjeWrUFdwEAT);
                        throw null;
                    }
                    v4.a(url, referrerSource, str, py2Var, c84Var, false, w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) l78VarY.getValue()).a, 7), false, p65Var2, 196608, 128);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
        }
    }
}
