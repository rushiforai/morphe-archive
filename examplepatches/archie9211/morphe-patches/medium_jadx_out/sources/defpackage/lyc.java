package defpackage;

import android.app.Activity;
import android.app.PendingIntent;
import android.net.Uri;
import com.medium.android.payments.ui.subscription.SubscriptionBottomSheetDialogFragment;
import com.medium.android.payments.ui.subscription.SubscriptionViewModel;
import com.medium.android.payments.ui.subscription.a;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lyc {
    public final /* synthetic */ SubscriptionViewModel a;
    public final /* synthetic */ cyc b;
    public final /* synthetic */ cr0 c;
    public final /* synthetic */ Activity d;

    public lyc(SubscriptionViewModel subscriptionViewModel, cyc cycVar, cr0 cr0Var, Activity activity) {
        this.a = subscriptionViewModel;
        this.b = cycVar;
        this.c = cr0Var;
        this.d = activity;
    }

    public final void a(String str) throws PendingIntent.CanceledException {
        str.getClass();
        String strF = this.a.f();
        SubscriptionBottomSheetDialogFragment subscriptionBottomSheetDialogFragment = ((a) this.b).a;
        p13 p13Var = subscriptionBottomSheetDialogFragment.H0;
        if (p13Var != null) {
            p13Var.g(subscriptionBottomSheetDialogFragment.S(), Uri.parse(str), strF);
        } else {
            g76.g0("router");
            throw null;
        }
    }
}
