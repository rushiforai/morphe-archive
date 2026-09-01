package com.android.billingclient.api;

import android.os.ResultReceiver;
import defpackage.plf;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f extends plf {
    public final WeakReference g;
    public final ResultReceiver h;

    public f(WeakReference weakReference, ResultReceiver resultReceiver) {
        super("com.android.vending.billing.IInAppBillingGetAlternativeBillingOnlyDialogIntentCallback", 1);
        this.g = weakReference;
        this.h = resultReceiver;
    }
}
