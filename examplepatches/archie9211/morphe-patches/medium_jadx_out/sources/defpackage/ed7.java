package defpackage;

import com.medium.android.susi.ui.magicLink.MagicLinkBottomSheetDialogFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ed7 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ MagicLinkBottomSheetDialogFragment b;
    public final /* synthetic */ zm7 c;

    public /* synthetic */ ed7(MagicLinkBottomSheetDialogFragment magicLinkBottomSheetDialogFragment, zm7 zm7Var, int i) {
        this.a = i;
        this.b = magicLinkBottomSheetDialogFragment;
        this.c = zm7Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        MagicLinkBottomSheetDialogFragment magicLinkBottomSheetDialogFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(-607746453, new ed7(magicLinkBottomSheetDialogFragment, this.c, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    n01.K(magicLinkBottomSheetDialogFragment.f0().getReferrerSource(), magicLinkBottomSheetDialogFragment.f0().getFullName(), magicLinkBottomSheetDialogFragment.f0().getEmail(), magicLinkBottomSheetDialogFragment.f0().getSusiOperation(), magicLinkBottomSheetDialogFragment.f0().getSusiDestination(), magicLinkBottomSheetDialogFragment.f0().getRememberMe(), this.c, null, null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
