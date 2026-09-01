package com.android.billingclient.api;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Bundle;
import android.os.ResultReceiver;
import defpackage.cbg;
import defpackage.plf;
import defpackage.rxf;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h extends plf {
    public final WeakReference g;
    public final ResultReceiver h;

    public /* synthetic */ h(WeakReference weakReference, ResultReceiver resultReceiver) {
        super(3);
        this.g = weakReference;
        this.h = resultReceiver;
    }

    @Override // defpackage.plf
    public final void p(Bundle bundle) {
        ResultReceiver resultReceiver = this.h;
        if (bundle == null) {
            resultReceiver.send(6, null);
            return;
        }
        if (!bundle.containsKey("RESPONSE_CODE")) {
            rxf.i("BillingClient", "Response bundle doesn't contain a response code");
            resultReceiver.send(6, bundle);
            return;
        }
        int iA = rxf.a("BillingClient", bundle);
        if (iA != 0) {
            rxf.i("BillingClient", "Unable to launch intent for external offer dialog" + iA);
            resultReceiver.send(iA, bundle);
            return;
        }
        PendingIntent pendingIntent = (PendingIntent) bundle.getParcelable("EXTERNAL_PAYMENT_DIALOG_INTENT");
        if (pendingIntent == null) {
            rxf.i("BillingClient", "The PendingIntent for the external offer dialog is null");
            Bundle bundle2 = new Bundle();
            bundle2.putInt("RESPONSE_CODE", 6);
            bundle2.putString("DEBUG_MESSAGE", "An internal error occurred.");
            resultReceiver.send(6, bundle2);
            return;
        }
        try {
            Activity activity = (Activity) this.g.get();
            Intent intent = new Intent(activity, (Class<?>) ProxyBillingActivityV2.class);
            intent.putExtra("external_payment_dialog_result_receiver", resultReceiver);
            intent.putExtra("external_payment_dialog_pending_intent", pendingIntent);
            activity.startActivity(intent);
        } catch (RuntimeException e) {
            rxf.j("BillingClient", "Runtime error while launching intent for the external offer dialog.", e);
            Bundle bundle3 = new Bundle();
            bundle3.putInt("RESPONSE_CODE", 6);
            bundle3.putString("DEBUG_MESSAGE", "An internal error occurred.");
            bundle3.putInt("INTERNAL_LOG_ERROR_REASON", cbg.RUNTIME_EXCEPTION_ON_LAUNCHING_EXTERNAL_PAYMENT_DIALOG_INTENT.zza());
            String name = e.getClass().getName();
            String message = e.getMessage();
            if (message == null) {
                message = "";
            }
            bundle3.putString("INTERNAL_LOG_ERROR_ADDITIONAL_DETAILS", name + ": " + message);
            resultReceiver.send(6, bundle3);
        }
    }
}
