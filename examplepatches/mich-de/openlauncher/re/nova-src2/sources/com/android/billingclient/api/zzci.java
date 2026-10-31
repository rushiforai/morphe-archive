package com.android.billingclient.api;

import java.util.Collections;
import java.util.List;

/* loaded from: classes2.dex */
final class zzci implements AcknowledgePurchaseResponseListener, BillingClientStateListener, ConsumeResponseListener, PurchaseHistoryResponseListener, PurchasesResponseListener, PurchasesUpdatedListener, SkuDetailsResponseListener {
    private final long zza;

    public zzci() {
        this.zza = 0L;
    }

    public static native void nativeOnAcknowledgePurchaseResponse(int i5, String str, long j11);

    public static native void nativeOnBillingServiceDisconnected();

    public static native void nativeOnBillingSetupFinished(int i5, String str, long j11);

    public static native void nativeOnConsumePurchaseResponse(int i5, String str, String str2, long j11);

    public static native void nativeOnPriceChangeConfirmationResult(int i5, String str, long j11);

    public static native void nativeOnPurchaseHistoryResponse(int i5, String str, PurchaseHistoryRecord[] purchaseHistoryRecordArr, long j11);

    public static native void nativeOnPurchasesUpdated(int i5, String str, Purchase[] purchaseArr);

    public static native void nativeOnQueryPurchasesResponse(int i5, String str, Purchase[] purchaseArr, long j11);

    public static native void nativeOnSkuDetailsResponse(int i5, String str, SkuDetails[] skuDetailsArr, long j11);

    @Override // com.android.billingclient.api.AcknowledgePurchaseResponseListener
    public final void onAcknowledgePurchaseResponse(BillingResult billingResult) {
        nativeOnAcknowledgePurchaseResponse(billingResult.getResponseCode(), billingResult.getDebugMessage(), this.zza);
    }

    @Override // com.android.billingclient.api.BillingClientStateListener
    public final void onBillingServiceDisconnected() {
        nativeOnBillingServiceDisconnected();
    }

    @Override // com.android.billingclient.api.BillingClientStateListener
    public final void onBillingSetupFinished(BillingResult billingResult) {
        nativeOnBillingSetupFinished(billingResult.getResponseCode(), billingResult.getDebugMessage(), this.zza);
    }

    @Override // com.android.billingclient.api.ConsumeResponseListener
    public final void onConsumeResponse(BillingResult billingResult, String str) {
        nativeOnConsumePurchaseResponse(billingResult.getResponseCode(), billingResult.getDebugMessage(), str, this.zza);
    }

    @Override // com.android.billingclient.api.PurchaseHistoryResponseListener
    public final void onPurchaseHistoryResponse(BillingResult billingResult, List<PurchaseHistoryRecord> list) {
        if (list == null) {
            list = Collections.EMPTY_LIST;
        }
        nativeOnPurchaseHistoryResponse(billingResult.getResponseCode(), billingResult.getDebugMessage(), (PurchaseHistoryRecord[]) list.toArray(new PurchaseHistoryRecord[list.size()]), this.zza);
    }

    @Override // com.android.billingclient.api.PurchasesUpdatedListener
    public final void onPurchasesUpdated(BillingResult billingResult, List<Purchase> list) {
        if (list == null) {
            list = Collections.EMPTY_LIST;
        }
        nativeOnPurchasesUpdated(billingResult.getResponseCode(), billingResult.getDebugMessage(), (Purchase[]) list.toArray(new Purchase[list.size()]));
    }

    @Override // com.android.billingclient.api.PurchasesResponseListener
    public final void onQueryPurchasesResponse(BillingResult billingResult, List<Purchase> list) {
        nativeOnQueryPurchasesResponse(billingResult.getResponseCode(), billingResult.getDebugMessage(), (Purchase[]) list.toArray(new Purchase[list.size()]), this.zza);
    }

    @Override // com.android.billingclient.api.SkuDetailsResponseListener
    public final void onSkuDetailsResponse(BillingResult billingResult, List<SkuDetails> list) {
        if (list == null) {
            list = Collections.EMPTY_LIST;
        }
        nativeOnSkuDetailsResponse(billingResult.getResponseCode(), billingResult.getDebugMessage(), (SkuDetails[]) list.toArray(new SkuDetails[list.size()]), this.zza);
    }

    public zzci(long j11) {
        this.zza = j11;
    }
}
