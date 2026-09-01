package com.android.billingclient.api;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Bundle;
import defpackage.cbg;
import defpackage.plf;
import defpackage.rxf;
import j$.util.Objects;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i extends plf {
    public final WeakReference g;
    public final d h;
    public final /* synthetic */ a i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i(a aVar, WeakReference weakReference, LaunchExternalLinkResponseListener launchExternalLinkResponseListener) {
        super(3);
        Objects.requireNonNull(aVar);
        this.i = aVar;
        this.g = weakReference;
        this.h = new d(aVar, aVar.e, launchExternalLinkResponseListener);
    }

    @Override // defpackage.plf
    public final void p(Bundle bundle) {
        a aVar = this.i;
        d dVar = this.h;
        if (bundle == null) {
            rxf.i("BillingClient", "Response bundle is null.");
            aVar.N(37, n.h, cbg.NULL_BUNDLE_RETURNED_BY_PHONESKY);
            dVar.send(6, null);
            return;
        }
        if (!bundle.containsKey("RESPONSE_CODE")) {
            rxf.i("BillingClient", "Response bundle doesn't contain a response code.");
            aVar.N(37, n.h, cbg.MISSING_RESPONSE_CODE_IN_PHONESKY_BUNDLE);
            dVar.send(6, bundle);
            return;
        }
        int iA = rxf.a("BillingClient", bundle);
        if (iA != 0) {
            rxf.i("BillingClient", "Unable to launch intent for launch external link dialog. Response code: " + iA);
            dVar.send(iA, bundle);
            return;
        }
        PendingIntent pendingIntent = (PendingIntent) bundle.getParcelable("EXTERNAL_PAYMENT_DIALOG_INTENT");
        if (pendingIntent == null) {
            rxf.i("BillingClient", "Pending intent not found in response bundle.");
            Bundle bundle2 = new Bundle();
            bundle2.putInt("RESPONSE_CODE", 6);
            bundle2.putString("DEBUG_MESSAGE", "An internal error occurred.");
            dVar.send(6, bundle);
            return;
        }
        try {
            Activity activity = (Activity) this.g.get();
            Intent intent = new Intent(activity, (Class<?>) ProxyBillingActivityV2.class);
            intent.putExtra("launch_external_link_result_receiver", dVar);
            intent.putExtra("launch_external_link_flow_pending_intent", pendingIntent);
            activity.startActivity(intent);
        } catch (RuntimeException e) {
            rxf.j("BillingClient", "Runtime error while launching intent for launch external link dialog.", e);
            Bundle bundle3 = new Bundle();
            bundle3.putInt("RESPONSE_CODE", 6);
            bundle3.putString("DEBUG_MESSAGE", "An internal error occurred.");
            bundle3.putInt("INTERNAL_LOG_ERROR_REASON", cbg.RUNTIME_EXCEPTION_ON_LAUNCH_EXTERNAL_LINK_INTENT.zza());
            String name = e.getClass().getName();
            String message = e.getMessage();
            if (message == null) {
                message = "";
            }
            bundle3.putString("INTERNAL_LOG_ERROR_ADDITIONAL_DETAILS", name + ": " + message);
            dVar.send(6, bundle3);
        }
    }
}
