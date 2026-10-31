package com.android.billingclient.api;

import android.app.PendingIntent;
import android.content.Intent;
import android.content.IntentSender;
import android.os.Bundle;
import android.os.ResultReceiver;
import androidx.activity.result.ActivityResult;
import androidx.activity.result.IntentSenderRequest;
import androidx.activity.result.contract.ActivityResultContracts$StartIntentSenderForResult;
import com.google.android.apps.common.proguard.UsedByReflection;
import com.google.android.gms.internal.play_billing.m0;
import com.vungle.ads.internal.protos.Sdk;
import g.o;
import j.a;
import j.c;
import kotlin.jvm.internal.Intrinsics;

@UsedByReflection("PlatformActivityProxy")
/* loaded from: classes2.dex */
public class ProxyBillingActivityV2 extends o {
    private c zza;
    private c zzb;
    private c zzc;
    private c zzd;
    private ResultReceiver zze;
    private ResultReceiver zzf;
    private ResultReceiver zzg;
    private ResultReceiver zzh;

    @Override // g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.zza = registerForActivityResult(new ActivityResultContracts$StartIntentSenderForResult(), new a() { // from class: com.android.billingclient.api.zzdu
            @Override // j.a
            public final void onActivityResult(Object obj) {
                this.zza.zza((ActivityResult) obj);
            }
        });
        this.zzb = registerForActivityResult(new ActivityResultContracts$StartIntentSenderForResult(), new a() { // from class: com.android.billingclient.api.zzdv
            @Override // j.a
            public final void onActivityResult(Object obj) {
                this.zza.zzb((ActivityResult) obj);
            }
        });
        this.zzc = registerForActivityResult(new ActivityResultContracts$StartIntentSenderForResult(), new a() { // from class: com.android.billingclient.api.zzdw
            @Override // j.a
            public final void onActivityResult(Object obj) {
                this.zza.zzc((ActivityResult) obj);
            }
        });
        this.zzd = registerForActivityResult(new ActivityResultContracts$StartIntentSenderForResult(), new a() { // from class: com.android.billingclient.api.zzdx
            @Override // j.a
            public final void onActivityResult(Object obj) {
                this.zza.zzd((ActivityResult) obj);
            }
        });
        if (bundle != null) {
            if (bundle.containsKey("alternative_billing_only_dialog_result_receiver")) {
                this.zze = (ResultReceiver) bundle.getParcelable("alternative_billing_only_dialog_result_receiver");
            }
            if (bundle.containsKey("external_payment_dialog_result_receiver")) {
                this.zzf = (ResultReceiver) bundle.getParcelable("external_payment_dialog_result_receiver");
            }
            if (bundle.containsKey("external_offer_flow_result_receiver")) {
                this.zzg = (ResultReceiver) bundle.getParcelable("external_offer_flow_result_receiver");
            }
            if (bundle.containsKey("launch_external_link_result_receiver")) {
                this.zzh = (ResultReceiver) bundle.getParcelable("launch_external_link_result_receiver");
                return;
            }
            return;
        }
        m0.g("ProxyBillingActivityV2", "Launching Play Store billing dialog");
        if (getIntent().hasExtra("ALTERNATIVE_BILLING_ONLY_DIALOG_INTENT")) {
            PendingIntent pendingIntent = (PendingIntent) getIntent().getParcelableExtra("ALTERNATIVE_BILLING_ONLY_DIALOG_INTENT");
            this.zze = (ResultReceiver) getIntent().getParcelableExtra("alternative_billing_only_dialog_result_receiver");
            c cVar = this.zza;
            Intrinsics.g(pendingIntent, "pendingIntent");
            IntentSender intentSender = pendingIntent.getIntentSender();
            Intrinsics.f(intentSender, "pendingIntent.intentSender");
            cVar.a(new IntentSenderRequest(intentSender, null, 0, 0), null);
            return;
        }
        if (getIntent().hasExtra("external_payment_dialog_pending_intent")) {
            PendingIntent pendingIntent2 = (PendingIntent) getIntent().getParcelableExtra("external_payment_dialog_pending_intent");
            this.zzf = (ResultReceiver) getIntent().getParcelableExtra("external_payment_dialog_result_receiver");
            c cVar2 = this.zzb;
            Intrinsics.g(pendingIntent2, "pendingIntent");
            IntentSender intentSender2 = pendingIntent2.getIntentSender();
            Intrinsics.f(intentSender2, "pendingIntent.intentSender");
            cVar2.a(new IntentSenderRequest(intentSender2, null, 0, 0), null);
            return;
        }
        if (getIntent().hasExtra("external_offer_flow_pending_intent")) {
            PendingIntent pendingIntent3 = (PendingIntent) getIntent().getParcelableExtra("external_offer_flow_pending_intent");
            this.zzg = (ResultReceiver) getIntent().getParcelableExtra("external_offer_flow_result_receiver");
            c cVar3 = this.zzc;
            Intrinsics.g(pendingIntent3, "pendingIntent");
            IntentSender intentSender3 = pendingIntent3.getIntentSender();
            Intrinsics.f(intentSender3, "pendingIntent.intentSender");
            cVar3.a(new IntentSenderRequest(intentSender3, null, 0, 0), null);
            return;
        }
        if (getIntent().hasExtra("launch_external_link_flow_pending_intent")) {
            PendingIntent pendingIntent4 = (PendingIntent) getIntent().getParcelableExtra("launch_external_link_flow_pending_intent");
            this.zzh = (ResultReceiver) getIntent().getParcelableExtra("launch_external_link_result_receiver");
            c cVar4 = this.zzd;
            Intrinsics.g(pendingIntent4, "pendingIntent");
            IntentSender intentSender4 = pendingIntent4.getIntentSender();
            Intrinsics.f(intentSender4, "pendingIntent.intentSender");
            cVar4.a(new IntentSenderRequest(intentSender4, null, 0, 0), null);
        }
    }

    @Override // g.o, n4.i, android.app.Activity
    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        ResultReceiver resultReceiver = this.zze;
        if (resultReceiver != null) {
            bundle.putParcelable("alternative_billing_only_dialog_result_receiver", resultReceiver);
        }
        ResultReceiver resultReceiver2 = this.zzf;
        if (resultReceiver2 != null) {
            bundle.putParcelable("external_payment_dialog_result_receiver", resultReceiver2);
        }
        ResultReceiver resultReceiver3 = this.zzg;
        if (resultReceiver3 != null) {
            bundle.putParcelable("external_offer_flow_result_receiver", resultReceiver3);
        }
        ResultReceiver resultReceiver4 = this.zzh;
        if (resultReceiver4 != null) {
            bundle.putParcelable("launch_external_link_result_receiver", resultReceiver4);
        }
    }

    public final void zza(ActivityResult activityResult) {
        Intent intent = activityResult.f13598b;
        int responseCode = m0.e(intent, "ProxyBillingActivityV2").getResponseCode();
        ResultReceiver resultReceiver = this.zze;
        if (resultReceiver != null) {
            resultReceiver.send(responseCode, intent == null ? null : intent.getExtras());
        }
        int i5 = activityResult.f13597a;
        if (i5 != -1 || responseCode != 0) {
            m0.h("ProxyBillingActivityV2", "Alternative billing only dialog finished with resultCode " + i5 + " and billing's responseCode: " + responseCode);
        }
        finish();
    }

    public final void zzb(ActivityResult activityResult) {
        Intent intent = activityResult.f13598b;
        int responseCode = m0.e(intent, "ProxyBillingActivityV2").getResponseCode();
        ResultReceiver resultReceiver = this.zzf;
        if (resultReceiver != null) {
            resultReceiver.send(responseCode, intent == null ? null : intent.getExtras());
        }
        int i5 = activityResult.f13597a;
        if (i5 != -1 || responseCode != 0) {
            m0.h("ProxyBillingActivityV2", "External offer dialog finished with resultCode: " + i5 + " and billing's responseCode: " + responseCode);
        }
        finish();
    }

    public final void zzc(ActivityResult activityResult) {
        Intent intent = activityResult.f13598b;
        int i5 = activityResult.f13597a;
        Bundle extras = intent == null ? null : intent.getExtras();
        if (i5 != -1) {
            if (extras == null) {
                extras = new Bundle();
            }
            m0.h("ProxyBillingActivityV2", "External offer flow finished with resultCode: " + i5);
            extras.putInt("INTERNAL_LOG_ERROR_REASON", Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE);
            extras.putString("INTERNAL_LOG_ERROR_ADDITIONAL_DETAILS", "External offer flow finished with error resultCode: " + i5);
        }
        int responseCode = m0.e(intent, "ProxyBillingActivityV2").getResponseCode();
        ResultReceiver resultReceiver = this.zzg;
        if (resultReceiver != null) {
            resultReceiver.send(responseCode, extras);
        } else {
            m0.h("ProxyBillingActivityV2", "External offer flow result receiver is null");
        }
        if (responseCode != 0) {
            m0.h("ProxyBillingActivityV2", "External offer flow finished with billing responseCode: " + responseCode);
        }
        finish();
    }

    public final void zzd(ActivityResult activityResult) {
        Intent intent = activityResult.f13598b;
        int i5 = activityResult.f13597a;
        Bundle extras = intent == null ? null : intent.getExtras();
        if (i5 != -1) {
            if (extras == null) {
                extras = new Bundle();
            }
            m0.h("ProxyBillingActivityV2", "Launch external link flow finished with resultCode: " + i5);
            extras.putInt("INTERNAL_LOG_ERROR_REASON", Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE);
            extras.putString("INTERNAL_LOG_ERROR_ADDITIONAL_DETAILS", "Launch external link flow finished with error resultCode: " + i5);
        }
        int responseCode = m0.e(intent, "ProxyBillingActivityV2").getResponseCode();
        ResultReceiver resultReceiver = this.zzh;
        if (resultReceiver != null) {
            resultReceiver.send(responseCode, extras);
        } else {
            m0.h("ProxyBillingActivityV2", "Launch external link flow result receiver is null");
        }
        if (responseCode != 0) {
            m0.h("ProxyBillingActivityV2", "Launch external link flow finished with billing responseCode: " + responseCode);
        }
        finish();
    }
}
