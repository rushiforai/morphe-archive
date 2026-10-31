package com.android.billingclient.api;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Bundle;
import android.os.RemoteException;
import android.os.ResultReceiver;
import com.google.android.gms.internal.play_billing.d;
import com.google.android.gms.internal.play_billing.m0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
final class zzbz extends d {
    final WeakReference zza;
    final ResultReceiver zzb;

    public zzbz(WeakReference weakReference, ResultReceiver resultReceiver, zzch zzchVar) {
        super("com.android.vending.billing.IInAppBillingGetAlternativeBillingOnlyDialogIntentCallback");
        this.zza = weakReference;
        this.zzb = resultReceiver;
    }

    @Override // com.google.android.gms.internal.play_billing.e
    public final void zza(Bundle bundle) throws RemoteException {
        if (bundle == null) {
            this.zzb.send(6, null);
            return;
        }
        if (!bundle.containsKey("RESPONSE_CODE")) {
            m0.h("BillingClient", "Response bundle doesn't contain a response code");
            this.zzb.send(6, bundle);
            return;
        }
        int iA = m0.a("BillingClient", bundle);
        if (iA != 0) {
            m0.h("BillingClient", "Unable to launch intent for alternative billing only dialog" + iA);
            this.zzb.send(iA, bundle);
            return;
        }
        PendingIntent pendingIntent = (PendingIntent) bundle.getParcelable("ALTERNATIVE_BILLING_ONLY_DIALOG_INTENT");
        if (pendingIntent == null) {
            m0.g("BillingClient", "User has acknowledged the alternative billing only dialog before.");
            this.zzb.send(0, bundle);
            return;
        }
        try {
            Activity activity = (Activity) this.zza.get();
            Intent intent = new Intent(activity, (Class<?>) ProxyBillingActivityV2.class);
            intent.putExtra("alternative_billing_only_dialog_result_receiver", this.zzb);
            intent.putExtra("ALTERNATIVE_BILLING_ONLY_DIALOG_INTENT", pendingIntent);
            activity.startActivity(intent);
        } catch (RuntimeException e3) {
            m0.i("BillingClient", "Runtime error while launching intent for alternative billing only dialog.", e3);
            Bundle bundle2 = new Bundle();
            bundle2.putInt("RESPONSE_CODE", 6);
            bundle2.putString("DEBUG_MESSAGE", "An internal error occurred.");
            bundle2.putInt("INTERNAL_LOG_ERROR_REASON", 75);
            String name = e3.getClass().getName();
            String message = e3.getMessage();
            if (message == null) {
                message = b.f42142b;
            }
            bundle2.putString("INTERNAL_LOG_ERROR_ADDITIONAL_DETAILS", name + ": " + message);
            this.zzb.send(6, bundle2);
        }
    }
}
