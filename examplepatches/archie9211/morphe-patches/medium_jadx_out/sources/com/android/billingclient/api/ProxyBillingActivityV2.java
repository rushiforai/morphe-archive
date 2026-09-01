package com.android.billingclient.api;

import android.app.ActivityOptions;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.IntentSender;
import android.os.Build;
import android.os.Bundle;
import android.os.ResultReceiver;
import com.drew.imaging.avi.hzjl.bPUi;
import defpackage.a56;
import defpackage.c7;
import defpackage.cbg;
import defpackage.d7;
import defpackage.g7;
import defpackage.k7;
import defpackage.rxf;
import defpackage.xy1;
import defpackage.y6;
import defpackage.z6;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class ProxyBillingActivityV2 extends xy1 {
    private k7 zza;
    private k7 zzb;
    private k7 zzc;
    private k7 zzd;
    private k7 zze;
    private k7 zzf;
    private ResultReceiver zzg;
    private ResultReceiver zzh;
    private ResultReceiver zzi;
    private ResultReceiver zzj;
    private ResultReceiver zzk;
    private ResultReceiver zzl;

    private static final z6 zzg() {
        int i = Build.VERSION.SDK_INT;
        if (i >= 36) {
            y6 y6Var = new y6(ActivityOptions.makeBasic());
            y6Var.a(3);
            return y6Var;
        }
        if (i < 34) {
            return null;
        }
        y6 y6Var2 = new y6(ActivityOptions.makeBasic());
        y6Var2.a(1);
        return y6Var2;
    }

    @Override // defpackage.xy1, defpackage.wy1, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        int i = 5;
        this.zza = registerForActivityResult(new g7(i), new d7() { // from class: com.android.billingclient.api.zzdw
            @Override // defpackage.d7
            public final void onActivityResult(Object obj) {
                this.zza.zza((c7) obj);
            }
        });
        this.zzb = registerForActivityResult(new g7(i), new d7() { // from class: com.android.billingclient.api.zzdx
            @Override // defpackage.d7
            public final void onActivityResult(Object obj) {
                this.zza.zzc((c7) obj);
            }
        });
        this.zzc = registerForActivityResult(new g7(i), new d7() { // from class: com.android.billingclient.api.zzdy
            @Override // defpackage.d7
            public final void onActivityResult(Object obj) {
                this.zza.zzd((c7) obj);
            }
        });
        this.zzd = registerForActivityResult(new g7(i), new d7() { // from class: com.android.billingclient.api.zzdz
            @Override // defpackage.d7
            public final void onActivityResult(Object obj) {
                this.zza.zze((c7) obj);
            }
        });
        this.zze = registerForActivityResult(new g7(i), new d7() { // from class: com.android.billingclient.api.zzea
            @Override // defpackage.d7
            public final void onActivityResult(Object obj) {
                this.zza.zzb((c7) obj);
            }
        });
        this.zzf = registerForActivityResult(new g7(i), new d7() { // from class: com.android.billingclient.api.zzeb
            @Override // defpackage.d7
            public final void onActivityResult(Object obj) {
                this.zza.zzf((c7) obj);
            }
        });
        if (bundle != null) {
            if (bundle.containsKey("alternative_billing_only_dialog_result_receiver")) {
                this.zzg = (ResultReceiver) bundle.getParcelable("alternative_billing_only_dialog_result_receiver");
            }
            if (bundle.containsKey("external_payment_dialog_result_receiver")) {
                this.zzh = (ResultReceiver) bundle.getParcelable("external_payment_dialog_result_receiver");
            }
            if (bundle.containsKey("external_offer_flow_result_receiver")) {
                this.zzi = (ResultReceiver) bundle.getParcelable("external_offer_flow_result_receiver");
            }
            if (bundle.containsKey("launch_external_link_result_receiver")) {
                this.zzj = (ResultReceiver) bundle.getParcelable("launch_external_link_result_receiver");
            }
            if (bundle.containsKey("billing_program_information_dialog_result_receiver")) {
                this.zzk = (ResultReceiver) bundle.getParcelable("billing_program_information_dialog_result_receiver");
            }
            if (bundle.containsKey("subscription_management_action_result_receiver")) {
                this.zzl = (ResultReceiver) bundle.getParcelable("subscription_management_action_result_receiver");
                return;
            }
            return;
        }
        rxf.h("ProxyBillingActivityV2", "Launching Play Store billing dialog");
        if (getIntent().hasExtra("ALTERNATIVE_BILLING_ONLY_DIALOG_INTENT")) {
            PendingIntent pendingIntent = (PendingIntent) getIntent().getParcelableExtra("ALTERNATIVE_BILLING_ONLY_DIALOG_INTENT");
            this.zzg = (ResultReceiver) getIntent().getParcelableExtra("alternative_billing_only_dialog_result_receiver");
            k7 k7Var = this.zza;
            pendingIntent.getClass();
            IntentSender intentSender = pendingIntent.getIntentSender();
            intentSender.getClass();
            k7Var.a(new a56(intentSender, null, 0, 0), zzg());
            return;
        }
        if (getIntent().hasExtra("external_payment_dialog_pending_intent")) {
            PendingIntent pendingIntent2 = (PendingIntent) getIntent().getParcelableExtra("external_payment_dialog_pending_intent");
            this.zzh = (ResultReceiver) getIntent().getParcelableExtra("external_payment_dialog_result_receiver");
            k7 k7Var2 = this.zzb;
            pendingIntent2.getClass();
            IntentSender intentSender2 = pendingIntent2.getIntentSender();
            intentSender2.getClass();
            k7Var2.a(new a56(intentSender2, null, 0, 0), zzg());
            return;
        }
        if (getIntent().hasExtra("external_offer_flow_pending_intent")) {
            PendingIntent pendingIntent3 = (PendingIntent) getIntent().getParcelableExtra("external_offer_flow_pending_intent");
            this.zzi = (ResultReceiver) getIntent().getParcelableExtra("external_offer_flow_result_receiver");
            k7 k7Var3 = this.zzc;
            pendingIntent3.getClass();
            IntentSender intentSender3 = pendingIntent3.getIntentSender();
            intentSender3.getClass();
            k7Var3.a(new a56(intentSender3, null, 0, 0), zzg());
            return;
        }
        if (getIntent().hasExtra("launch_external_link_flow_pending_intent")) {
            PendingIntent pendingIntent4 = (PendingIntent) getIntent().getParcelableExtra("launch_external_link_flow_pending_intent");
            this.zzj = (ResultReceiver) getIntent().getParcelableExtra("launch_external_link_result_receiver");
            k7 k7Var4 = this.zzd;
            pendingIntent4.getClass();
            IntentSender intentSender4 = pendingIntent4.getIntentSender();
            intentSender4.getClass();
            k7Var4.a(new a56(intentSender4, null, 0, 0), zzg());
            return;
        }
        if (getIntent().hasExtra("billing_program_information_dialog_pending_intent")) {
            PendingIntent pendingIntent5 = (PendingIntent) getIntent().getParcelableExtra("billing_program_information_dialog_pending_intent");
            this.zzk = (ResultReceiver) getIntent().getParcelableExtra("billing_program_information_dialog_result_receiver");
            k7 k7Var5 = this.zze;
            pendingIntent5.getClass();
            IntentSender intentSender5 = pendingIntent5.getIntentSender();
            intentSender5.getClass();
            k7Var5.a(new a56(intentSender5, null, 0, 0), zzg());
            return;
        }
        if (getIntent().hasExtra("SUBSCRIPTION_MANAGEMENT_INTENT")) {
            PendingIntent pendingIntent6 = (PendingIntent) getIntent().getParcelableExtra("SUBSCRIPTION_MANAGEMENT_INTENT");
            this.zzl = (ResultReceiver) getIntent().getParcelableExtra("subscription_management_action_result_receiver");
            k7 k7Var6 = this.zzf;
            pendingIntent6.getClass();
            IntentSender intentSender6 = pendingIntent6.getIntentSender();
            intentSender6.getClass();
            k7Var6.a(new a56(intentSender6, null, 0, 0), zzg());
        }
    }

    @Override // defpackage.xy1, defpackage.wy1, android.app.Activity
    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        ResultReceiver resultReceiver = this.zzg;
        if (resultReceiver != null) {
            bundle.putParcelable("alternative_billing_only_dialog_result_receiver", resultReceiver);
        }
        ResultReceiver resultReceiver2 = this.zzh;
        if (resultReceiver2 != null) {
            bundle.putParcelable("external_payment_dialog_result_receiver", resultReceiver2);
        }
        ResultReceiver resultReceiver3 = this.zzi;
        if (resultReceiver3 != null) {
            bundle.putParcelable("external_offer_flow_result_receiver", resultReceiver3);
        }
        ResultReceiver resultReceiver4 = this.zzj;
        if (resultReceiver4 != null) {
            bundle.putParcelable("launch_external_link_result_receiver", resultReceiver4);
        }
        ResultReceiver resultReceiver5 = this.zzk;
        if (resultReceiver5 != null) {
            bundle.putParcelable("billing_program_information_dialog_result_receiver", resultReceiver5);
        }
        ResultReceiver resultReceiver6 = this.zzl;
        if (resultReceiver6 != null) {
            bundle.putParcelable("subscription_management_action_result_receiver", resultReceiver6);
        }
    }

    public final void zza(c7 c7Var) {
        Intent intent = c7Var.b;
        int responseCode = rxf.f(intent, "ProxyBillingActivityV2").getResponseCode();
        ResultReceiver resultReceiver = this.zzg;
        if (resultReceiver != null) {
            resultReceiver.send(responseCode, intent == null ? null : intent.getExtras());
        }
        int i = c7Var.a;
        if (i != -1 || responseCode != 0) {
            rxf.i("ProxyBillingActivityV2", "Alternative billing only dialog finished with resultCode " + i + " and billing's responseCode: " + responseCode);
        }
        finish();
    }

    public final void zzc(c7 c7Var) {
        Intent intent = c7Var.b;
        int responseCode = rxf.f(intent, "ProxyBillingActivityV2").getResponseCode();
        ResultReceiver resultReceiver = this.zzh;
        if (resultReceiver != null) {
            resultReceiver.send(responseCode, intent == null ? null : intent.getExtras());
        }
        int i = c7Var.a;
        if (i != -1 || responseCode != 0) {
            rxf.i("ProxyBillingActivityV2", "External offer dialog finished with resultCode: " + i + " and billing's responseCode: " + responseCode);
        }
        finish();
    }

    public final void zzd(c7 c7Var) {
        Intent intent = c7Var.b;
        int i = c7Var.a;
        Bundle extras = intent == null ? null : intent.getExtras();
        if (i != -1) {
            if (extras == null) {
                extras = new Bundle();
            }
            rxf.i("ProxyBillingActivityV2", "External offer flow finished with resultCode: " + i);
            extras.putInt("INTERNAL_LOG_ERROR_REASON", cbg.ERROR_IN_ACTIVITY_RESULT.zza());
            extras.putString("INTERNAL_LOG_ERROR_ADDITIONAL_DETAILS", "External offer flow finished with error resultCode: " + i);
        }
        int responseCode = rxf.f(intent, "ProxyBillingActivityV2").getResponseCode();
        ResultReceiver resultReceiver = this.zzi;
        if (resultReceiver != null) {
            resultReceiver.send(responseCode, extras);
        } else {
            rxf.i("ProxyBillingActivityV2", "External offer flow result receiver is null");
        }
        if (responseCode != 0) {
            rxf.i("ProxyBillingActivityV2", "External offer flow finished with billing responseCode: " + responseCode);
        }
        finish();
    }

    public final void zzf(c7 c7Var) {
        Intent intent = c7Var.b;
        int responseCode = rxf.f(intent, "ProxyBillingActivityV2").getResponseCode();
        ResultReceiver resultReceiver = this.zzl;
        if (resultReceiver != null) {
            resultReceiver.send(responseCode, intent == null ? null : intent.getExtras());
        }
        int i = c7Var.a;
        if (i != -1 || responseCode != 0) {
            rxf.i("ProxyBillingActivityV2", "Subscription management action finished with resultCode: " + i + " and billing's responseCode: " + responseCode);
        }
        finish();
    }

    public final void zzb(c7 c7Var) {
        Intent intent = c7Var.b;
        String str = bPUi.yxocEYJgLqqQJ;
        int responseCode = rxf.f(intent, str).getResponseCode();
        ResultReceiver resultReceiver = this.zzk;
        if (resultReceiver != null) {
            resultReceiver.send(responseCode, intent == null ? null : intent.getExtras());
        }
        int i = c7Var.a;
        if (i != -1 || responseCode != 0) {
            rxf.i(str, "Billing program info dialog finished with resultCode " + i + " and billing's responseCode: " + responseCode);
        }
        finish();
    }

    public final void zze(c7 c7Var) {
        Intent intent = c7Var.b;
        int i = c7Var.a;
        Bundle extras = intent == null ? null : intent.getExtras();
        if (i != -1) {
            if (extras == null) {
                extras = new Bundle();
            }
            rxf.i("ProxyBillingActivityV2", "Launch external link flow finished with resultCode: " + i);
            extras.putInt("INTERNAL_LOG_ERROR_REASON", cbg.ERROR_IN_ACTIVITY_RESULT.zza());
            extras.putString("INTERNAL_LOG_ERROR_ADDITIONAL_DETAILS", "Launch external link flow finished with error resultCode: " + i);
        }
        int responseCode = rxf.f(intent, "ProxyBillingActivityV2").getResponseCode();
        ResultReceiver resultReceiver = this.zzj;
        if (resultReceiver != null) {
            resultReceiver.send(responseCode, extras);
        } else {
            rxf.i("ProxyBillingActivityV2", "Launch external link flow result receiver is null");
        }
        if (responseCode != 0) {
            rxf.i("ProxyBillingActivityV2", fiHTiFJ.PfRFkSrCDmiHC + responseCode);
        }
        finish();
    }
}
