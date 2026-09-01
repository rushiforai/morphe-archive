package defpackage;

import com.medium.android.susi.ui.unrecognizedEmail.UnrecognizedEmailFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class s1e implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ UnrecognizedEmailFragment b;

    public /* synthetic */ s1e(UnrecognizedEmailFragment unrecognizedEmailFragment, int i) {
        this.a = i;
        this.b = unrecognizedEmailFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        UnrecognizedEmailFragment unrecognizedEmailFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(1021620491, new s1e(unrecognizedEmailFragment, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                vq6 vq6Var = unrecognizedEmailFragment.w0;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    m40.D(((UnrecognizedEmailFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), ((UnrecognizedEmailFragment.BundleInfo) vq6Var.getValue()).getEmail(), ((UnrecognizedEmailFragment.BundleInfo) vq6Var.getValue()).getSusiDestination(), ((UnrecognizedEmailFragment.BundleInfo) vq6Var.getValue()).getRememberMe(), new nec(4, unrecognizedEmailFragment), null, null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
