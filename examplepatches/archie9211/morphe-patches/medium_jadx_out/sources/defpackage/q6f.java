package defpackage;

import com.medium.android.profile.ui.you.posts.withdrawsubmission.WithdrawSubmissionConfirmationDialogFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class q6f implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ WithdrawSubmissionConfirmationDialogFragment b;
    public final /* synthetic */ r6f c;

    public /* synthetic */ q6f(WithdrawSubmissionConfirmationDialogFragment withdrawSubmissionConfirmationDialogFragment, r6f r6fVar, int i) {
        this.a = i;
        this.b = withdrawSubmissionConfirmationDialogFragment;
        this.c = r6fVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        WithdrawSubmissionConfirmationDialogFragment withdrawSubmissionConfirmationDialogFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(1672930681, new q6f(withdrawSubmissionConfirmationDialogFragment, this.c, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                vq6 vq6Var = withdrawSubmissionConfirmationDialogFragment.H0;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    hk7.l(((WithdrawSubmissionConfirmationDialogFragment.BundleInfo) vq6Var.getValue()).getPostId(), ((WithdrawSubmissionConfirmationDialogFragment.BundleInfo) vq6Var.getValue()).getPublicationId(), ((WithdrawSubmissionConfirmationDialogFragment.BundleInfo) vq6Var.getValue()).getIsPostPublished(), this.c, null, null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
