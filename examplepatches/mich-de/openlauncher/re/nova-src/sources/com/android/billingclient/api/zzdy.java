package com.android.billingclient.api;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.android.billingclient.api.BillingResult;
import com.google.android.gms.internal.play_billing.m0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes2.dex */
final class zzdy extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        if (intent == null || !intent.hasExtra("RESPONSE_CODE")) {
            m0.h("ProxyBillingBroadcastReceiver", "Null intent or intent missing response code!");
            return;
        }
        BillingResult.Builder builderNewBuilder = BillingResult.newBuilder();
        builderNewBuilder.setResponseCode(intent.getIntExtra("RESPONSE_CODE", 0));
        String stringExtra = intent.getStringExtra("DEBUG_MESSAGE");
        if (stringExtra == null) {
            stringExtra = b.f42142b;
        }
        builderNewBuilder.setDebugMessage(stringExtra);
        builderNewBuilder.build();
    }
}
