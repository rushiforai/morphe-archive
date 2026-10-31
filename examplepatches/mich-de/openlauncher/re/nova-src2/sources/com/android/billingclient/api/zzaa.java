package com.android.billingclient.api;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.Bundle;
import com.android.billingclient.api.BillingResult;
import com.google.android.gms.internal.play_billing.i0;
import com.google.android.gms.internal.play_billing.k0;
import com.google.android.gms.internal.play_billing.m0;
import com.google.android.gms.internal.play_billing.o0;
import com.google.android.gms.internal.play_billing.r4;
import com.google.android.gms.internal.play_billing.w4;
import com.google.android.gms.internal.play_billing.z4;
import java.util.ArrayList;
import java.util.Objects;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
final class zzaa extends BroadcastReceiver {
    final /* synthetic */ zzab zza;
    private boolean zzb;
    private final boolean zzc;

    public zzaa(zzab zzabVar, boolean z11) {
        Objects.requireNonNull(zzabVar);
        this.zza = zzabVar;
        this.zzc = z11;
    }

    private final void zzd(Bundle bundle, BillingResult billingResult, int i5, z4 z4Var, long j11, boolean z11) {
        try {
            if (bundle.getByteArray("FAILURE_LOGGING_PAYLOAD") != null) {
                this.zza.zzf.zzd(r4.u(bundle.getByteArray("FAILURE_LOGGING_PAYLOAD")), j11, z11);
            } else {
                this.zza.zzf.zzd(zzcy.zzb(w4.BILLING_RESULT_RECEIVED_FROM_PHONESKY, i5, billingResult, null, z4Var), j11, z11);
            }
        } catch (Throwable unused) {
            m0.h("BillingBroadcastManager", "Failed parsing Api failure.");
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:112:0x02a5  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x02b3  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x003e  */
    @Override // android.content.BroadcastReceiver
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onReceive(Context context, Intent intent) {
        z4 z4Var;
        BillingResult billingResultE;
        int iIntValue;
        String action = intent.getAction();
        int iHashCode = action.hashCode();
        z4 z4Var2 = z4.LOCAL_PURCHASES_UPDATED_ACTION;
        z4 z4Var3 = z4.PURCHASES_UPDATED_ACTION;
        z4 z4Var4 = z4.ALTERNATIVE_BILLING_ACTION;
        if (iHashCode != -1484087650) {
            if (iHashCode != -337612916) {
                z4Var = (iHashCode == 345207161 && action.equals("com.android.vending.billing.ALTERNATIVE_BILLING")) ? z4Var4 : z4.BROADCAST_ACTION_UNSPECIFIED;
            } else if (action.equals("com.android.vending.billing.LOCAL_BROADCAST_PURCHASES_UPDATED")) {
                z4Var = z4Var2;
            }
        } else if (action.equals("com.android.vending.billing.PURCHASES_UPDATED")) {
            z4Var = z4Var3;
        }
        int i5 = (z4Var.equals(z4Var2) || z4Var.equals(z4Var4)) ? 2 : z4Var.equals(z4Var3) ? 32 : 1;
        Bundle extras = intent.getExtras();
        ArrayList arrayList = null;
        if (extras == null) {
            m0.h("BillingBroadcastManager", "Bundle is null.");
            zzab zzabVar = this.zza;
            zzcz zzczVar = zzabVar.zzf;
            BillingResult billingResult = zzdc.zzh;
            zzczVar.zza(zzcy.zzb(w4.NULL_BUNDLE_IN_BROADCAST_RECEIVER, i5, billingResult, null, z4Var));
            if (zzabVar.zzb != null) {
                zzabVar.zzb.onPurchasesUpdated(billingResult, null);
                return;
            }
            return;
        }
        int i11 = 0;
        if (i5 == 2) {
            int i12 = m0.f33450a;
            BillingResult.Builder builderNewBuilder = BillingResult.newBuilder();
            builderNewBuilder.setResponseCode(m0.a("BillingBroadcastManager", intent.getExtras()));
            Bundle extras2 = intent.getExtras();
            if (extras2 == null) {
                m0.h("BillingBroadcastManager", "Unexpected null bundle received!");
            } else {
                Object obj = extras2.get("SUB_RESPONSE_CODE");
                if (obj == null) {
                    m0.g("BillingBroadcastManager", "getOnPurchasesUpdatedSubResponseCodeFromBundle() got null response code, assuming OK");
                } else if (obj instanceof Integer) {
                    iIntValue = ((Integer) obj).intValue();
                    builderNewBuilder.setOnPurchasesUpdatedSubResponseCode(iIntValue);
                    builderNewBuilder.setDebugMessage(m0.f("BillingBroadcastManager", intent.getExtras()));
                    billingResultE = builderNewBuilder.build();
                } else {
                    m0.h("BillingBroadcastManager", "Unexpected type for bundle sub response code: ".concat(obj.getClass().getName()));
                }
            }
            iIntValue = 0;
            builderNewBuilder.setOnPurchasesUpdatedSubResponseCode(iIntValue);
            builderNewBuilder.setDebugMessage(m0.f("BillingBroadcastManager", intent.getExtras()));
            billingResultE = builderNewBuilder.build();
        } else {
            billingResultE = m0.e(intent, "BillingBroadcastManager");
        }
        long j11 = extras.getLong("billingClientTransactionId", 0L);
        boolean z11 = extras.getBoolean("wasServiceAutoReconnected", false);
        if (z4Var.equals(z4Var3) || z4Var.equals(z4Var2)) {
            BillingResult billingResult2 = billingResultE;
            int i13 = i5;
            z4 z4Var5 = z4Var;
            ArrayList<String> stringArrayList = extras.getStringArrayList("INAPP_PURCHASE_DATA_LIST");
            ArrayList<String> stringArrayList2 = extras.getStringArrayList("INAPP_DATA_SIGNATURE_LIST");
            ArrayList arrayList2 = new ArrayList();
            if (stringArrayList == null || stringArrayList2 == null) {
                Purchase purchaseJ = m0.j(extras.getString("INAPP_PURCHASE_DATA"), extras.getString("INAPP_DATA_SIGNATURE"));
                if (purchaseJ == null) {
                    m0.g("BillingHelper", "Couldn't find single purchase data as well.");
                    if (billingResult2.getResponseCode() != 0) {
                        this.zza.zzf.zzh(zzcy.zzc(i13, z4Var5), j11, z11);
                    } else {
                        zzd(extras, billingResult2, i13, z4Var5, j11, z11);
                    }
                    this.zza.zzb.onPurchasesUpdated(billingResult2, arrayList);
                    return;
                }
                arrayList2.add(purchaseJ);
            } else {
                m0.g("BillingHelper", "Found purchase list of " + stringArrayList.size() + " items");
                while (i11 < stringArrayList.size() && i11 < stringArrayList2.size()) {
                    Purchase purchaseJ2 = m0.j(stringArrayList.get(i11), stringArrayList2.get(i11));
                    if (purchaseJ2 != null) {
                        arrayList2.add(purchaseJ2);
                    }
                    i11++;
                }
            }
            arrayList = arrayList2;
            if (billingResult2.getResponseCode() != 0) {
            }
            this.zza.zzb.onPurchasesUpdated(billingResult2, arrayList);
            return;
        }
        if (z4Var.equals(z4Var4)) {
            if (billingResultE.getResponseCode() != 0) {
                BillingResult billingResult3 = billingResultE;
                zzd(extras, billingResult3, i5, z4Var, j11, z11);
                PurchasesUpdatedListener purchasesUpdatedListener = this.zza.zzb;
                i0 i0Var = k0.f33433b;
                purchasesUpdatedListener.onPurchasesUpdated(billingResult3, o0.f33465e);
                return;
            }
            z4 z4Var6 = z4Var;
            int i14 = i5;
            zzab zzabVar2 = this.zza;
            if (zzabVar2.zzc == null && zzabVar2.zzd == null && zzabVar2.zze == null) {
                m0.h("BillingBroadcastManager", "No valid alternative billing listener is registered.");
                zzcz zzczVar2 = zzabVar2.zzf;
                BillingResult billingResult4 = zzdc.zzh;
                zzczVar2.zzd(zzcy.zzb(w4.NULL_DEVELOPER_MANAGED_BILLING_LISTENER, i14, billingResult4, null, z4Var6), j11, z11);
                PurchasesUpdatedListener purchasesUpdatedListener2 = zzabVar2.zzb;
                i0 i0Var2 = k0.f33433b;
                purchasesUpdatedListener2.onPurchasesUpdated(billingResult4, o0.f33465e);
                return;
            }
            String string = extras.getString("ALTERNATIVE_BILLING_USER_CHOICE_DATA");
            if (string == null) {
                m0.h("BillingBroadcastManager", "Couldn't find alternative billing user choice data in bundle.");
                zzcz zzczVar3 = zzabVar2.zzf;
                BillingResult billingResult5 = zzdc.zzh;
                zzczVar3.zzd(zzcy.zzb(w4.MISSING_ALTERNATIVE_BILLING_USER_CHOICE_DATA, i14, billingResult5, null, z4Var6), j11, z11);
                PurchasesUpdatedListener purchasesUpdatedListener3 = zzabVar2.zzb;
                i0 i0Var3 = k0.f33433b;
                purchasesUpdatedListener3.onPurchasesUpdated(billingResult5, o0.f33465e);
                return;
            }
            try {
                if (zzabVar2.zzd != null) {
                    zzabVar2.zzd.userSelectedAlternativeBilling(new UserChoiceDetails(string));
                } else if (zzabVar2.zze != null) {
                    zzabVar2.zze.onUserSelectedDeveloperBilling(new DeveloperProvidedBillingDetails(string));
                } else {
                    JSONArray jSONArrayOptJSONArray = new JSONObject(string).optJSONArray("products");
                    ArrayList arrayList3 = new ArrayList();
                    if (jSONArrayOptJSONArray != null) {
                        while (i11 < jSONArrayOptJSONArray.length()) {
                            JSONObject jSONObjectOptJSONObject = jSONArrayOptJSONArray.optJSONObject(i11);
                            if (jSONObjectOptJSONObject != null) {
                                arrayList3.add(new zzc(jSONObjectOptJSONObject, null));
                            }
                            i11++;
                        }
                    }
                    zzabVar2.zzc.zza();
                }
                this.zza.zzf.zzh(zzcy.zzc(i14, z4Var6), j11, z11);
            } catch (JSONException unused) {
                m0.h("BillingBroadcastManager", "Error when parsing invalid user choice data: [" + string + "]");
                zzab zzabVar3 = this.zza;
                zzcz zzczVar4 = zzabVar3.zzf;
                BillingResult billingResult6 = zzdc.zzh;
                zzczVar4.zzd(zzcy.zzb(w4.INVALID_ALTERNATIVE_BILLING_USER_CHOICE_DATA, i14, billingResult6, null, z4Var6), j11, z11);
                PurchasesUpdatedListener purchasesUpdatedListener4 = zzabVar3.zzb;
                i0 i0Var4 = k0.f33433b;
                purchasesUpdatedListener4.onPurchasesUpdated(billingResult6, o0.f33465e);
            }
        }
    }

    public final synchronized void zza(Context context, IntentFilter intentFilter) {
        try {
            if (this.zzb) {
                return;
            }
            if (Build.VERSION.SDK_INT >= 33) {
                context.registerReceiver(this, intentFilter, true != this.zzc ? 4 : 2);
            } else {
                context.registerReceiver(this, intentFilter);
            }
            this.zzb = true;
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized void zzb(Context context, IntentFilter intentFilter, String str) {
        zzaa zzaaVar;
        try {
            try {
                if (this.zzb) {
                    return;
                }
                if (Build.VERSION.SDK_INT >= 33) {
                    zzaaVar = this;
                    context.registerReceiver(zzaaVar, intentFilter, "com.google.android.finsky.permission.PLAY_BILLING_LIBRARY_BROADCAST", null, true != this.zzc ? 4 : 2);
                } else {
                    zzaaVar = this;
                    context.registerReceiver(this, intentFilter, "com.google.android.finsky.permission.PLAY_BILLING_LIBRARY_BROADCAST", null);
                }
                zzaaVar.zzb = true;
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            throw th;
        }
    }

    public final synchronized void zzc(Context context) {
        if (!this.zzb) {
            m0.h("BillingBroadcastManager", "Receiver is not registered.");
        } else {
            context.unregisterReceiver(this);
            this.zzb = false;
        }
    }
}
