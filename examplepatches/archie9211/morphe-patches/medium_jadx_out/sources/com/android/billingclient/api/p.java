package com.android.billingclient.api;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.android.billingclient.api.BillingResult;
import defpackage.bdg;
import defpackage.d0g;
import defpackage.edg;
import defpackage.lbg;
import defpackage.mbg;
import defpackage.qbg;
import defpackage.rxf;
import defpackage.sbg;
import defpackage.sv0;
import defpackage.zbg;
import defpackage.zjf;
import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p extends BroadcastReceiver {
    public BillingResult a;
    public boolean b = false;
    public final d0g c;

    public p(d0g d0gVar) {
        this.c = d0gVar;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        if (intent == null) {
            rxf.i("ProxyBillingReceiver", "Null intent!");
            return;
        }
        rxf.h("ProxyBillingReceiver", "Received intent action: ".concat(String.valueOf(intent.getAction())));
        boolean zEquals = Objects.equals(intent.getAction(), "com.android.vending.billing.IN_APP_BILLING_RESULT_UPDATE_ACTION");
        d0g d0gVar = this.c;
        if (zEquals) {
            if (!intent.hasExtra("RESPONSE_CODE")) {
                rxf.i("ProxyBillingReceiver", "Missing RESPONSE_CODE in intent.");
                if (d0gVar != null) {
                    ((zjf) d0gVar).u(null, intent.getLongExtra("billingClientTransactionId", 0L));
                    return;
                }
                return;
            }
            BillingResult.Builder builderNewBuilder = BillingResult.newBuilder();
            builderNewBuilder.setResponseCode(intent.getIntExtra("RESPONSE_CODE", 0));
            String stringExtra = intent.getStringExtra("DEBUG_MESSAGE");
            if (stringExtra == null) {
                stringExtra = "";
            }
            builderNewBuilder.setDebugMessage(stringExtra);
            BillingResult billingResultBuild = builderNewBuilder.build();
            this.a = billingResultBuild;
            if (d0gVar != null) {
                ((zjf) d0gVar).u(billingResultBuild, intent.getLongExtra("billingClientTransactionId", 0L));
                return;
            }
            return;
        }
        if (!Objects.equals(intent.getAction(), "com.android.vending.billing.PLAY_BILLING_ACTIVITY_CREATED_ACTION")) {
            rxf.i("ProxyBillingReceiver", "Unexpected broadcast action: ".concat(String.valueOf(intent.getAction())));
            return;
        }
        this.b = true;
        if (d0gVar != null) {
            long longExtra = intent.getLongExtra("billingClientTransactionId", 0L);
            zjf zjfVar = (zjf) d0gVar;
            try {
                mbg mbgVarQ = qbg.q();
                mbgVarQ.b();
                qbg.v((qbg) mbgVarQ.b, 4);
                lbg lbgVar = lbg.PLAY_BILLING_ACTIVITY_CREATED_ACTION;
                mbgVarQ.b();
                qbg.r((qbg) mbgVarQ.b, lbgVar);
                qbg qbgVar = (qbg) mbgVarQ.a();
                bdg bdgVarS = edg.s();
                zbg zbgVar = (zbg) zjfVar.b;
                if (longExtra != 0) {
                    sbg sbgVar = (sbg) zbgVar.l();
                    sbgVar.g(longExtra);
                    zbgVar = (zbg) sbgVar.a();
                }
                bdgVarS.d(zbgVar);
                bdgVarS.b();
                edg.w((edg) bdgVarS.b, qbgVar);
                ((sv0) zjfVar.c).n((edg) bdgVarS.a());
            } catch (Throwable th) {
                rxf.j("BillingLogger", "Unable to log.", th);
            }
        }
    }
}
