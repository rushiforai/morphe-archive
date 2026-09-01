package com.medium.android.payments.ui.subscription;

import android.app.PendingIntent;
import com.medium.android.payments.ui.subscription.SubscriptionBottomSheetDialogFragment;
import defpackage.b09;
import defpackage.cyc;
import defpackage.g76;
import defpackage.muc;
import defpackage.p13;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class a implements cyc {
    public final /* synthetic */ SubscriptionBottomSheetDialogFragment a;

    public a(SubscriptionBottomSheetDialogFragment subscriptionBottomSheetDialogFragment) {
        this.a = subscriptionBottomSheetDialogFragment;
    }

    public final void a(String str) throws PendingIntent.CanceledException {
        SubscriptionBottomSheetDialogFragment subscriptionBottomSheetDialogFragment = this.a;
        String postId = ((SubscriptionBottomSheetDialogFragment.BundleInfo) subscriptionBottomSheetDialogFragment.K0.getValue()).getUpsellInfo().getPostId();
        String str2 = (postId == null || muc.b0(postId)) ? null : postId;
        p13 p13Var = subscriptionBottomSheetDialogFragment.H0;
        if (str2 != null) {
            if (p13Var != null) {
                b09.O(p13Var, subscriptionBottomSheetDialogFragment.S(), str2, str, null, null, null, 120);
                return;
            } else {
                g76.g0("router");
                throw null;
            }
        }
        if (p13Var != null) {
            p13Var.m(subscriptionBottomSheetDialogFragment.S(), str, false);
        } else {
            g76.g0("router");
            throw null;
        }
    }
}
