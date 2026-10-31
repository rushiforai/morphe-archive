package com.android.billingclient.api;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Bundle;
import android.os.RemoteException;
import android.os.ResultReceiver;
import com.google.android.gms.internal.play_billing.m0;
import com.google.android.gms.internal.play_billing.q;
import java.lang.ref.WeakReference;
import java.util.concurrent.CancellationException;

/* loaded from: classes2.dex */
final class zzcf extends q {
    final WeakReference zza;
    final ResultReceiver zzb;

    public zzcf(WeakReference weakReference, ResultReceiver resultReceiver, zzch zzchVar) {
        super("com.android.vending.billing.IInAppBillingServiceCallback");
        this.zza = weakReference;
        this.zzb = resultReceiver;
    }

    @Override // com.google.android.gms.internal.play_billing.r
    public final void zza(Bundle bundle) throws RemoteException {
        ResultReceiver resultReceiver = this.zzb;
        if (resultReceiver == null) {
            m0.h("BillingClient", "Unable to send result for in-app messaging");
            return;
        }
        if (bundle == null) {
            resultReceiver.send(0, null);
            return;
        }
        Activity activity = (Activity) this.zza.get();
        PendingIntent pendingIntent = (PendingIntent) bundle.getParcelable("KEY_LAUNCH_INTENT");
        if (activity == null || pendingIntent == null) {
            resultReceiver.send(0, null);
            m0.h("BillingClient", "Unable to launch intent for in-app messaging");
            return;
        }
        try {
            Intent intent = new Intent(activity, (Class<?>) ProxyBillingActivity.class);
            intent.putExtra("in_app_message_result_receiver", resultReceiver);
            intent.putExtra("IN_APP_MESSAGE_INTENT", pendingIntent);
            activity.startActivity(intent);
        } catch (CancellationException e3) {
            this.zzb.send(0, null);
            m0.i("BillingClient", "Exception caught while launching intent for in-app messaging.", e3);
        }
    }
}
