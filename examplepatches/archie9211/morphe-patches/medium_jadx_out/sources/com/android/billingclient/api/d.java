package com.android.billingclient.api;

import android.os.Bundle;
import android.os.Handler;
import android.os.ResultReceiver;
import com.android.billingclient.api.BillingResult;
import defpackage.cbg;
import defpackage.lbg;
import defpackage.rxf;
import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d extends ResultReceiver {
    public final /* synthetic */ LaunchExternalLinkResponseListener a;
    public final /* synthetic */ a b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(a aVar, Handler handler, LaunchExternalLinkResponseListener launchExternalLinkResponseListener) {
        super(handler);
        this.a = launchExternalLinkResponseListener;
        Objects.requireNonNull(aVar);
        this.b = aVar;
    }

    @Override // android.os.ResultReceiver
    public final void onReceiveResult(int i, Bundle bundle) {
        BillingResult.Builder builderNewBuilder = BillingResult.newBuilder();
        builderNewBuilder.setResponseCode(i);
        LaunchExternalLinkResponseListener launchExternalLinkResponseListener = this.a;
        if (i != 0) {
            a aVar = this.b;
            if (bundle == null) {
                aVar.x(launchExternalLinkResponseListener, n.h, cbg.NULL_BUNDLE_IN_LAUNCH_EXTERNAL_LINK_RESULT_RECEIVER, null);
                return;
            }
            builderNewBuilder.setDebugMessage(rxf.g("BillingClient", bundle));
            int i2 = bundle.getInt("INTERNAL_LOG_ERROR_REASON");
            cbg cbgVarZzb = i2 != 0 ? cbg.zzb(i2) : cbg.BILLING_RESULT_RECEIVED_FROM_PHONESKY;
            BillingResult billingResultBuild = builderNewBuilder.build();
            String string = bundle.getString("INTERNAL_LOG_ERROR_ADDITIONAL_DETAILS");
            int i3 = zzcy.zza;
            aVar.A(zzcy.zzb(cbgVarZzb, 37, billingResultBuild, string, lbg.BROADCAST_ACTION_UNSPECIFIED));
        }
        launchExternalLinkResponseListener.onLaunchExternalLinkResponse(builderNewBuilder.build());
    }
}
