package com.android.billingclient.api;

import android.app.Activity;
import android.app.ActivityOptions;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.IntentSender;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.os.ResultReceiver;
import defpackage.cbg;
import defpackage.d0g;
import defpackage.kdg;
import defpackage.nm;
import defpackage.odg;
import defpackage.rxf;
import defpackage.sbg;
import defpackage.zbg;
import defpackage.zjf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ProxyBillingActivity extends Activity {
    static final String EXTERNAL_BROADCAST_PERMISSION = "com.google.android.finsky.permission.PLAY_BILLING_LIBRARY_BROADCAST";
    private static final String KEY_ACTIVITY_CODE = "activity_code";
    static final String KEY_IN_APP_MESSAGE_RESULT_RECEIVER = "in_app_message_result_receiver";
    private static final String KEY_SEND_CANCELLED_BROADCAST_IF_FINISHED = "send_cancelled_broadcast_if_finished";
    private static final int REQUEST_CODE_FIRST_PARTY_PURCHASE_FLOW = 110;
    private static final int REQUEST_CODE_IN_APP_MESSAGE_FLOW = 101;
    private static final int REQUEST_CODE_LAUNCH_ACTIVITY = 100;
    static final int RESULT_CODE_PLAY_CANCELED_WITH_ON_CREATE_RUNTIME_EXCEPTION = 5;
    static final int RESULT_CODE_PLAY_CANCELLED = 3;
    static final int RESULT_CODE_PLAY_CANCELLED_WITHOUT_COMPLETE_ACTION = 4;
    private static final String TAG = "ProxyBillingActivity";
    private int activityCode;
    private long billingClientTransactionId;
    d0g billingLogger;
    private ResultReceiver inAppMessageResultReceiver;
    private boolean isFlowFromFirstPartyClient;
    p proxyBillingBroadcastReceiver;
    private boolean sendCancelledBroadcastIfFinished;
    private boolean wasServiceAutoReconnected;

    private cbg getLoggingErrorReason(int i, Intent intent) {
        return intent == null ? i != -1 ? i != 0 ? i != 3 ? i != 4 ? cbg.NULL_DATA_WITH_OTHER_RESULT_CODE_IN_PROXY_BILLING_ACTIVITY_RESULT : cbg.NULL_DATA_WITH_PLAY_CANCELED_WITHOUT_COMPLETE_ACTION_RESULT_CODE : cbg.NULL_DATA_WITH_PLAY_CANCELED_RESULT_CODE : cbg.NULL_DATA_WITH_CANCELLED_RESULT_CODE_IN_PROXY_BILLING_ACTIVITY_RESULT : cbg.NULL_DATA_WITH_OK_RESULT_CODE_IN_PROXY_BILLING_ACTIVITY_RESULT : intent.getExtras() == null ? cbg.NULL_BUNDLE_IN_ACTIVITY_RESULT : i == 5 ? cbg.PLAY_STORE_ON_CREATE_RUNTIME_EXCEPTION : cbg.REASON_UNSPECIFIED;
    }

    private boolean isInAppMessageFlow(Bundle bundle) {
        if (bundle != null) {
            return bundle.containsKey(KEY_IN_APP_MESSAGE_RESULT_RECEIVER);
        }
        if (getIntent() == null) {
            return false;
        }
        return getIntent().hasExtra("IN_APP_MESSAGE_INTENT");
    }

    private boolean isKnownError(int i, Intent intent) {
        return !getLoggingErrorReason(i, intent).equals(cbg.REASON_UNSPECIFIED);
    }

    private boolean isProxyBillingBroadcastReceiverRegistered() {
        return this.proxyBillingBroadcastReceiver != null;
    }

    private Intent makeAlternativeBillingIntent(String str) {
        Intent intent = new Intent("com.android.vending.billing.ALTERNATIVE_BILLING");
        intent.setPackage(getApplicationContext().getPackageName());
        intent.putExtra("ALTERNATIVE_BILLING_USER_CHOICE_DATA", str);
        return intent;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x005e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private android.content.Intent makePurchaseUpdatedIntentWithResponseCodeAndReason(defpackage.cbg r7, long r8, boolean r10) {
        /*
            r6 = this;
            android.content.Intent r0 = r6.makePurchasesUpdatedIntent()
            java.lang.String r1 = "FAILURE_LOGGING_PAYLOAD"
            r2 = 0
            r3 = 2
            java.lang.String r4 = "DEBUG_MESSAGE"
            java.lang.String r5 = "RESPONSE_CODE"
            if (r10 == 0) goto L5e
            boolean r10 = r6.isProxyBillingBroadcastReceiverRegistered()
            if (r10 == 0) goto L29
            com.android.billingclient.api.p r10 = r6.proxyBillingBroadcastReceiver
            com.android.billingclient.api.BillingResult r10 = r10.a
            if (r10 == 0) goto L29
            int r7 = r10.getResponseCode()
            r0.putExtra(r5, r7)
            java.lang.String r7 = r10.getDebugMessage()
            r0.putExtra(r4, r7)
            goto L84
        L29:
            boolean r10 = r6.isProxyBillingBroadcastReceiverRegistered()
            if (r10 == 0) goto L5e
            com.android.billingclient.api.p r10 = r6.proxyBillingBroadcastReceiver
            boolean r10 = r10.b
            if (r10 != 0) goto L5e
            r7 = 3
            r0.putExtra(r5, r7)
            java.lang.String r10 = "Play Store is blocked."
            r0.putExtra(r4, r10)
            com.android.billingclient.api.BillingResult$Builder r4 = com.android.billingclient.api.BillingResult.newBuilder()
            r4.setResponseCode(r7)
            r4.setDebugMessage(r10)
            com.android.billingclient.api.BillingResult r7 = r4.build()
            cbg r10 = defpackage.cbg.PLAY_STORE_APP_BLOCKED
            int r4 = com.android.billingclient.api.zzcy.zza
            lbg r4 = defpackage.lbg.BROADCAST_ACTION_UNSPECIFIED
            uag r7 = com.android.billingclient.api.zzcy.zzb(r10, r3, r7, r2, r4)
            byte[] r7 = r7.b()
            r0.putExtra(r1, r7)
            goto L84
        L5e:
            r10 = 6
            r0.putExtra(r5, r10)
            java.lang.String r5 = "An internal error occurred."
            r0.putExtra(r4, r5)
            com.android.billingclient.api.BillingResult$Builder r4 = com.android.billingclient.api.BillingResult.newBuilder()
            r4.setResponseCode(r10)
            r4.setDebugMessage(r5)
            com.android.billingclient.api.BillingResult r10 = r4.build()
            int r4 = com.android.billingclient.api.zzcy.zza
            lbg r4 = defpackage.lbg.BROADCAST_ACTION_UNSPECIFIED
            uag r7 = com.android.billingclient.api.zzcy.zzb(r7, r3, r10, r2, r4)
            byte[] r7 = r7.b()
            r0.putExtra(r1, r7)
        L84:
            java.lang.String r7 = "INTENT_SOURCE"
            java.lang.String r10 = "LAUNCH_BILLING_FLOW"
            r0.putExtra(r7, r10)
            java.lang.String r7 = "billingClientTransactionId"
            r0.putExtra(r7, r8)
            boolean r6 = r6.wasServiceAutoReconnected
            java.lang.String r7 = "wasServiceAutoReconnected"
            r0.putExtra(r7, r6)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.billingclient.api.ProxyBillingActivity.makePurchaseUpdatedIntentWithResponseCodeAndReason(cbg, long, boolean):android.content.Intent");
    }

    private Intent makePurchasesUpdatedIntent() {
        Intent intent = new Intent("com.android.vending.billing.LOCAL_BROADCAST_PURCHASES_UPDATED");
        intent.setPackage(getApplicationContext().getPackageName());
        return intent;
    }

    private synchronized void registerProxyBillingBroadcastReceiver() {
        try {
            this.proxyBillingBroadcastReceiver = new p(this.billingLogger);
            IntentFilter intentFilter = new IntentFilter("com.android.vending.billing.IN_APP_BILLING_RESULT_UPDATE_ACTION");
            intentFilter.addAction("com.android.vending.billing.PLAY_BILLING_ACTIVITY_CREATED_ACTION");
            nm.A(this, this.proxyBillingBroadcastReceiver, intentFilter, EXTERNAL_BROADCAST_PERMISSION, 2);
        } catch (NoSuchMethodError | RuntimeException e) {
            this.proxyBillingBroadcastReceiver = null;
            boolean z = e instanceof NoSuchMethodError;
            d0g d0gVar = this.billingLogger;
            if (z) {
                kdg kdgVarQ = odg.q();
                kdgVarQ.b();
                odg.r((odg) kdgVarQ.b, 2);
                ((zjf) d0gVar).v((odg) kdgVarQ.a());
            } else {
                kdg kdgVarQ2 = odg.q();
                kdgVarQ2.b();
                odg.r((odg) kdgVarQ2.b, 1);
                ((zjf) d0gVar).v((odg) kdgVarQ2.a());
            }
            rxf.j(TAG, "Failed to register receiver.", e);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x003b  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00c5  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00fb  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x010b  */
    /* JADX WARN: Removed duplicated region for block: B:6:0x0012  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0014  */
    @Override // android.app.Activity
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void onActivityResult(int r10, int r11, android.content.Intent r12) {
        /*
            Method dump skipped, instruction units count: 275
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.billingclient.api.ProxyBillingActivity.onActivityResult(int, int, android.content.Intent):void");
    }

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        int i;
        PendingIntent pendingIntent;
        Bundle bundle2;
        Bundle bundle3;
        super.onCreate(bundle);
        if (!isInAppMessageFlow(bundle)) {
            try {
                i = getPackageManager().getPackageInfo(getPackageName(), 0).versionCode;
            } catch (PackageManager.NameNotFoundException e) {
                rxf.j(TAG, "Failed to get package info for current package.", e);
                i = -1;
            }
            if (this.billingLogger == null) {
                Context applicationContext = getApplicationContext();
                sbg sbgVarA = zbg.A();
                sbgVarA.i(getPackageName());
                sbgVarA.j();
                sbgVarA.e(i);
                sbgVarA.d(Build.VERSION.SDK_INT);
                sbgVarA.h();
                this.billingLogger = new zjf(applicationContext, (zbg) sbgVarA.a());
            }
            registerProxyBillingBroadcastReceiver();
        }
        if (bundle != null) {
            rxf.h(TAG, "Launching Play Store billing flow from savedInstanceState");
            this.sendCancelledBroadcastIfFinished = bundle.getBoolean(KEY_SEND_CANCELLED_BROADCAST_IF_FINISHED, false);
            if (bundle.containsKey(KEY_IN_APP_MESSAGE_RESULT_RECEIVER)) {
                this.inAppMessageResultReceiver = (ResultReceiver) bundle.getParcelable(KEY_IN_APP_MESSAGE_RESULT_RECEIVER);
            }
            this.isFlowFromFirstPartyClient = bundle.getBoolean("IS_FLOW_FROM_FIRST_PARTY_CLIENT", false);
            this.activityCode = bundle.getInt(KEY_ACTIVITY_CODE, 100);
            if (bundle.containsKey("billingClientTransactionId")) {
                this.billingClientTransactionId = bundle.getLong("billingClientTransactionId");
            }
            if (bundle.containsKey("wasServiceAutoReconnected")) {
                this.wasServiceAutoReconnected = bundle.getBoolean("wasServiceAutoReconnected");
                return;
            }
            return;
        }
        rxf.h(TAG, "Launching Play Store billing flow");
        this.activityCode = 100;
        if (getIntent().hasExtra("BUY_INTENT")) {
            pendingIntent = (PendingIntent) getIntent().getParcelableExtra("BUY_INTENT");
            if (getIntent().hasExtra("IS_FLOW_FROM_FIRST_PARTY_CLIENT") && getIntent().getBooleanExtra("IS_FLOW_FROM_FIRST_PARTY_CLIENT", false)) {
                this.isFlowFromFirstPartyClient = true;
                this.activityCode = REQUEST_CODE_FIRST_PARTY_PURCHASE_FLOW;
            }
        } else if (getIntent().hasExtra("IN_APP_MESSAGE_INTENT")) {
            pendingIntent = (PendingIntent) getIntent().getParcelableExtra("IN_APP_MESSAGE_INTENT");
            this.inAppMessageResultReceiver = (ResultReceiver) getIntent().getParcelableExtra(KEY_IN_APP_MESSAGE_RESULT_RECEIVER);
            this.activityCode = 101;
        } else {
            pendingIntent = null;
        }
        if (getIntent().hasExtra("billingClientTransactionId")) {
            this.billingClientTransactionId = getIntent().getLongExtra("billingClientTransactionId", 0L);
        }
        if (getIntent().hasExtra("wasServiceAutoReconnected")) {
            this.wasServiceAutoReconnected = getIntent().getBooleanExtra("wasServiceAutoReconnected", false);
        }
        try {
            this.sendCancelledBroadcastIfFinished = true;
            int i2 = Build.VERSION.SDK_INT;
            if (i2 >= 36) {
                bundle3 = ActivityOptions.makeBasic().setPendingIntentBackgroundActivityStartMode(3).toBundle();
            } else {
                if (i2 < 34) {
                    bundle2 = null;
                    startIntentSenderForResult(pendingIntent.getIntentSender(), this.activityCode, new Intent(), 0, 0, 0, bundle2);
                }
                bundle3 = ActivityOptions.makeBasic().setPendingIntentBackgroundActivityStartMode(1).toBundle();
            }
            bundle2 = bundle3;
            startIntentSenderForResult(pendingIntent.getIntentSender(), this.activityCode, new Intent(), 0, 0, 0, bundle2);
        } catch (IntentSender.SendIntentException e2) {
            rxf.j(TAG, "Got exception while trying to start a purchase flow.", e2);
            ResultReceiver resultReceiver = this.inAppMessageResultReceiver;
            if (resultReceiver != null) {
                resultReceiver.send(0, null);
            } else {
                Intent intentMakePurchaseUpdatedIntentWithResponseCodeAndReason = makePurchaseUpdatedIntentWithResponseCodeAndReason(cbg.INTENT_SENDER_EXCEPTION, this.billingClientTransactionId, false);
                if (this.isFlowFromFirstPartyClient) {
                    intentMakePurchaseUpdatedIntentWithResponseCodeAndReason.putExtra("IS_FIRST_PARTY_PURCHASE", true);
                }
                sendBroadcast(intentMakePurchaseUpdatedIntentWithResponseCodeAndReason);
            }
            this.sendCancelledBroadcastIfFinished = false;
            finish();
        }
    }

    @Override // android.app.Activity
    public void onDestroy() {
        BillingResult billingResult;
        super.onDestroy();
        if (isProxyBillingBroadcastReceiverRegistered()) {
            p pVar = this.proxyBillingBroadcastReceiver;
            billingResult = pVar.a;
            try {
                unregisterReceiver(pVar);
            } catch (RuntimeException e) {
                rxf.j(TAG, "Failed to unregister receiver.", e);
            }
        } else {
            billingResult = null;
        }
        if (isFinishing() && this.sendCancelledBroadcastIfFinished) {
            Intent intentMakePurchasesUpdatedIntent = makePurchasesUpdatedIntent();
            if (billingResult != null) {
                intentMakePurchasesUpdatedIntent.putExtra("RESPONSE_CODE", billingResult.getResponseCode());
                intentMakePurchasesUpdatedIntent.putExtra("DEBUG_MESSAGE", billingResult.getDebugMessage());
            } else {
                intentMakePurchasesUpdatedIntent.putExtra("RESPONSE_CODE", 1);
                intentMakePurchasesUpdatedIntent.putExtra("DEBUG_MESSAGE", "Billing dialog closed.");
            }
            if (this.isFlowFromFirstPartyClient) {
                intentMakePurchasesUpdatedIntent.putExtra("IS_FIRST_PARTY_PURCHASE", true);
            }
            int i = this.activityCode;
            if (i == REQUEST_CODE_FIRST_PARTY_PURCHASE_FLOW || i == 100) {
                intentMakePurchasesUpdatedIntent.putExtra("INTENT_SOURCE", "LAUNCH_BILLING_FLOW");
                intentMakePurchasesUpdatedIntent.putExtra("billingClientTransactionId", this.billingClientTransactionId);
            }
            sendBroadcast(intentMakePurchasesUpdatedIntent);
        }
    }

    @Override // android.app.Activity
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        ResultReceiver resultReceiver = this.inAppMessageResultReceiver;
        if (resultReceiver != null) {
            bundle.putParcelable(KEY_IN_APP_MESSAGE_RESULT_RECEIVER, resultReceiver);
        }
        bundle.putBoolean(KEY_SEND_CANCELLED_BROADCAST_IF_FINISHED, this.sendCancelledBroadcastIfFinished);
        bundle.putBoolean("IS_FLOW_FROM_FIRST_PARTY_CLIENT", this.isFlowFromFirstPartyClient);
        bundle.putInt(KEY_ACTIVITY_CODE, this.activityCode);
        bundle.putLong("billingClientTransactionId", this.billingClientTransactionId);
        bundle.putBoolean("wasServiceAutoReconnected", this.wasServiceAutoReconnected);
    }
}
