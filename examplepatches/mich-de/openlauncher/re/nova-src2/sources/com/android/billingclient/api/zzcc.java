package com.android.billingclient.api;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Bundle;
import android.os.RemoteException;
import android.os.ResultReceiver;
import com.google.android.gms.internal.play_billing.h;
import com.google.android.gms.internal.play_billing.m0;
import com.google.android.gms.internal.play_billing.w4;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.lang.ref.WeakReference;
import java.util.Objects;

/* loaded from: classes2.dex */
final class zzcc extends h {
    final WeakReference zza;
    final ResultReceiver zzb;
    final /* synthetic */ BillingClientImpl zzc;

    public /* synthetic */ zzcc(BillingClientImpl billingClientImpl, WeakReference weakReference, LaunchExternalLinkResponseListener launchExternalLinkResponseListener, zzch zzchVar) {
        Objects.requireNonNull(billingClientImpl);
        this.zzc = billingClientImpl;
        this.zza = weakReference;
        this.zzb = BillingClientImpl.zzg(billingClientImpl, launchExternalLinkResponseListener);
    }

    @Override // com.google.android.gms.internal.play_billing.i
    public final void zza(Bundle bundle) throws RemoteException {
        if (bundle == null) {
            m0.h("BillingClient", "Response bundle is null.");
            this.zzc.zzbs(w4.NULL_BUNDLE_RETURNED_BY_PHONESKY, 37, zzdc.zzh);
            this.zzb.send(6, null);
            return;
        }
        if (!bundle.containsKey("RESPONSE_CODE")) {
            m0.h("BillingClient", "Response bundle doesn't contain a response code.");
            this.zzc.zzbs(w4.MISSING_RESPONSE_CODE_IN_PHONESKY_BUNDLE, 37, zzdc.zzh);
            this.zzb.send(6, bundle);
            return;
        }
        int iA = m0.a("BillingClient", bundle);
        if (iA != 0) {
            m0.h("BillingClient", "Unable to launch intent for launch external link dialog. Response code: " + iA);
            this.zzb.send(iA, bundle);
            return;
        }
        PendingIntent pendingIntent = (PendingIntent) bundle.getParcelable("EXTERNAL_PAYMENT_DIALOG_INTENT");
        if (pendingIntent == null) {
            m0.h("BillingClient", "Pending intent not found in response bundle.");
            Bundle bundle2 = new Bundle();
            bundle2.putInt("RESPONSE_CODE", 6);
            bundle2.putString("DEBUG_MESSAGE", "An internal error occurred.");
            this.zzb.send(6, bundle);
            return;
        }
        try {
            Activity activity = (Activity) this.zza.get();
            Intent intent = new Intent(activity, (Class<?>) ProxyBillingActivityV2.class);
            intent.putExtra("launch_external_link_result_receiver", this.zzb);
            intent.putExtra("launch_external_link_flow_pending_intent", pendingIntent);
            activity.startActivity(intent);
        } catch (RuntimeException e3) {
            m0.i("BillingClient", "Runtime error while launching intent for launch external link dialog.", e3);
            Bundle bundle3 = new Bundle();
            bundle3.putInt("RESPONSE_CODE", 6);
            bundle3.putString("DEBUG_MESSAGE", "An internal error occurred.");
            bundle3.putInt("INTERNAL_LOG_ERROR_REASON", 143);
            String name = e3.getClass().getName();
            String message = e3.getMessage();
            if (message == null) {
                message = b.f42142b;
            }
            bundle3.putString("INTERNAL_LOG_ERROR_ADDITIONAL_DETAILS", name + ": " + message);
            this.zzb.send(6, bundle3);
        }
    }
}
