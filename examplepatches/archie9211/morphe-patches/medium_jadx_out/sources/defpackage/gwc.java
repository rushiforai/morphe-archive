package defpackage;

import com.medium.android.newsletters.consent.SubscribeToNewsletterConsentDialogFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class gwc implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ SubscribeToNewsletterConsentDialogFragment b;
    public final /* synthetic */ hwc c;

    public /* synthetic */ gwc(SubscribeToNewsletterConsentDialogFragment subscribeToNewsletterConsentDialogFragment, hwc hwcVar, int i) {
        this.a = i;
        this.b = subscribeToNewsletterConsentDialogFragment;
        this.c = hwcVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        hwc hwcVar = this.c;
        SubscribeToNewsletterConsentDialogFragment subscribeToNewsletterConsentDialogFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(-1136920120, new gwc(subscribeToNewsletterConsentDialogFragment, hwcVar, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                iq1 iq1Var = subscribeToNewsletterConsentDialogFragment.J0;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    kp7.h(((owc) iq1Var.getValue()).k, ((owc) iq1Var.getValue()).j, hwcVar, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
