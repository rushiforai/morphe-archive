package defpackage;

import com.medium.android.donkey.read.web.ExternalWebViewBottomSheetDialogFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class e84 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ExternalWebViewBottomSheetDialogFragment b;

    public /* synthetic */ e84(ExternalWebViewBottomSheetDialogFragment externalWebViewBottomSheetDialogFragment, int i) {
        this.a = i;
        this.b = externalWebViewBottomSheetDialogFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        ExternalWebViewBottomSheetDialogFragment externalWebViewBottomSheetDialogFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    jt7.a(false, pxf.E(2018358880, new e84(externalWebViewBottomSheetDialogFragment, i2), p65Var), p65Var, 48, 1);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            default:
                vq6 vq6Var = externalWebViewBottomSheetDialogFragment.L0;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    zk2 zk2Var = externalWebViewBottomSheetDialogFragment.H0;
                    if (zk2Var == null) {
                        g76.g0("currentUserRepo");
                        throw null;
                    }
                    i03 i03Var = externalWebViewBottomSheetDialogFragment.K0;
                    if (i03Var == null) {
                        g76.g0("mediumUris");
                        throw null;
                    }
                    c84 c84Var = new c84(externalWebViewBottomSheetDialogFragment, zk2Var, i03Var, 1);
                    String url = ((ExternalWebViewBottomSheetDialogFragment.BundleInfo) vq6Var.getValue()).getUrl();
                    String referrerSource = ((ExternalWebViewBottomSheetDialogFragment.BundleInfo) vq6Var.getValue()).getReferrerSource();
                    py2 py2Var = externalWebViewBottomSheetDialogFragment.I0;
                    if (py2Var == null) {
                        g76.g0("deepLinkHandler");
                        throw null;
                    }
                    String str = externalWebViewBottomSheetDialogFragment.J0;
                    if (str == null) {
                        g76.g0("appVersionName");
                        throw null;
                    }
                    v4.a(url, referrerSource, str, py2Var, c84Var, true, null, false, p65Var2, 12779520, 64);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
        }
    }
}
