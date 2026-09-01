package com.android.billingclient.api;

import defpackage.n92;
import defpackage.ux1;
import defpackage.vx1;
import defpackage.z73;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000`\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a\u001c\u0010\u0004\u001a\u00020\u0003*\u00020\u00002\u0006\u0010\u0002\u001a\u00020\u0001H\u0086@¢\u0006\u0004\b\u0004\u0010\u0005\u001a\u001c\u0010\b\u001a\u00020\u0007*\u00020\u00002\u0006\u0010\u0002\u001a\u00020\u0006H\u0086@¢\u0006\u0004\b\b\u0010\t\u001a\u0014\u0010\u000b\u001a\u00020\n*\u00020\u0000H\u0086@¢\u0006\u0004\b\u000b\u0010\f\u001a\u001c\u0010\u000f\u001a\u00020\u000e*\u00020\u00002\u0006\u0010\u0002\u001a\u00020\rH\u0086@¢\u0006\u0004\b\u000f\u0010\u0010\u001a\u0014\u0010\u0012\u001a\u00020\u0011*\u00020\u0000H\u0087@¢\u0006\u0004\b\u0012\u0010\f\u001a\u0014\u0010\u0013\u001a\u00020\u0003*\u00020\u0000H\u0086@¢\u0006\u0004\b\u0013\u0010\f\u001a\u001c\u0010\u0017\u001a\u00020\u0016*\u00020\u00002\u0006\u0010\u0015\u001a\u00020\u0014H\u0086@¢\u0006\u0004\b\u0017\u0010\u0018\u001a\u0014\u0010\u0019\u001a\u00020\u0003*\u00020\u0000H\u0087@¢\u0006\u0004\b\u0019\u0010\f\u001a\u001c\u0010\u001c\u001a\u00020\u001b*\u00020\u00002\u0006\u0010\u0002\u001a\u00020\u001aH\u0086@¢\u0006\u0004\b\u001c\u0010\u001d\u001a\u001c\u0010 \u001a\u00020\u001f*\u00020\u00002\u0006\u0010\u0002\u001a\u00020\u001eH\u0086@¢\u0006\u0004\b \u0010!¨\u0006\""}, d2 = {"Lcom/android/billingclient/api/BillingClient;", "Lcom/android/billingclient/api/AcknowledgePurchaseParams;", "params", "Lcom/android/billingclient/api/BillingResult;", "acknowledgePurchase", "(Lcom/android/billingclient/api/BillingClient;Lcom/android/billingclient/api/AcknowledgePurchaseParams;Ln92;)Ljava/lang/Object;", "Lcom/android/billingclient/api/ConsumeParams;", "Lcom/android/billingclient/api/ConsumeResult;", "consumePurchase", "(Lcom/android/billingclient/api/BillingClient;Lcom/android/billingclient/api/ConsumeParams;Ln92;)Ljava/lang/Object;", "Lcom/android/billingclient/api/CreateAlternativeBillingOnlyReportingDetailsResult;", "createAlternativeBillingOnlyReportingDetails", "(Lcom/android/billingclient/api/BillingClient;Ln92;)Ljava/lang/Object;", "Lcom/android/billingclient/api/BillingProgramReportingDetailsParams;", "Lcom/android/billingclient/api/CreateBillingProgramReportingDetailsResult;", "createBillingProgramReportingDetails", "(Lcom/android/billingclient/api/BillingClient;Lcom/android/billingclient/api/BillingProgramReportingDetailsParams;Ln92;)Ljava/lang/Object;", "Lcom/android/billingclient/api/CreateExternalOfferReportingDetailsResult;", "createExternalOfferReportingDetails", "isAlternativeBillingOnlyAvailable", "", "billingProgram", "Lcom/android/billingclient/api/IsBillingProgramAvailableResult;", "isBillingProgramAvailable", "(Lcom/android/billingclient/api/BillingClient;ILn92;)Ljava/lang/Object;", "isExternalOfferAvailable", "Lcom/android/billingclient/api/QueryProductDetailsParams;", "Lcom/android/billingclient/api/ProductDetailsResult;", "queryProductDetails", "(Lcom/android/billingclient/api/BillingClient;Lcom/android/billingclient/api/QueryProductDetailsParams;Ln92;)Ljava/lang/Object;", "Lcom/android/billingclient/api/QueryPurchasesParams;", "Lcom/android/billingclient/api/PurchasesResult;", "queryPurchasesAsync", "(Lcom/android/billingclient/api/BillingClient;Lcom/android/billingclient/api/QueryPurchasesParams;Ln92;)Ljava/lang/Object;", "java.com.google.android.libraries.play.billing.public.ktbilling_granule"}, k = 2, mv = {2, 3, 0}, xi = 48)
public final class BillingClientKotlinKt {
    public static final Object acknowledgePurchase(BillingClient billingClient, AcknowledgePurchaseParams acknowledgePurchaseParams, n92<? super BillingResult> n92Var) {
        final vx1 vx1Var = new vx1();
        billingClient.acknowledgePurchase(acknowledgePurchaseParams, new AcknowledgePurchaseResponseListener() { // from class: com.android.billingclient.api.BillingClientKotlinKt$$ExternalSyntheticLambda5
            @Override // com.android.billingclient.api.AcknowledgePurchaseResponseListener
            public final void onAcknowledgePurchaseResponse(BillingResult billingResult) {
                BillingClientKotlinKt.acknowledgePurchase$lambda$0(vx1Var, billingResult);
            }
        });
        return vx1Var.i(n92Var);
    }

    public static final void acknowledgePurchase$lambda$0(ux1 ux1Var, BillingResult billingResult) {
        billingResult.getClass();
        ((vx1) ux1Var).V(billingResult);
    }

    public static final Object consumePurchase(BillingClient billingClient, ConsumeParams consumeParams, n92<? super ConsumeResult> n92Var) {
        final vx1 vx1Var = new vx1();
        billingClient.consumeAsync(consumeParams, new ConsumeResponseListener() { // from class: com.android.billingclient.api.BillingClientKotlinKt$$ExternalSyntheticLambda2
            @Override // com.android.billingclient.api.ConsumeResponseListener
            public final void onConsumeResponse(BillingResult billingResult, String str) {
                BillingClientKotlinKt.consumePurchase$lambda$0(vx1Var, billingResult, str);
            }
        });
        return vx1Var.i(n92Var);
    }

    public static final void consumePurchase$lambda$0(ux1 ux1Var, BillingResult billingResult, String str) {
        billingResult.getClass();
        ((vx1) ux1Var).V(new ConsumeResult(billingResult, str));
    }

    public static final Object createAlternativeBillingOnlyReportingDetails(BillingClient billingClient, n92<? super CreateAlternativeBillingOnlyReportingDetailsResult> n92Var) {
        final vx1 vx1Var = new vx1();
        billingClient.createAlternativeBillingOnlyReportingDetailsAsync(new AlternativeBillingOnlyReportingDetailsListener() { // from class: com.android.billingclient.api.BillingClientKotlinKt$$ExternalSyntheticLambda8
            @Override // com.android.billingclient.api.AlternativeBillingOnlyReportingDetailsListener
            public final void onAlternativeBillingOnlyTokenResponse(BillingResult billingResult, AlternativeBillingOnlyReportingDetails alternativeBillingOnlyReportingDetails) {
                BillingClientKotlinKt.createAlternativeBillingOnlyReportingDetails$lambda$0(vx1Var, billingResult, alternativeBillingOnlyReportingDetails);
            }
        });
        return vx1Var.i(n92Var);
    }

    public static final void createAlternativeBillingOnlyReportingDetails$lambda$0(ux1 ux1Var, BillingResult billingResult, AlternativeBillingOnlyReportingDetails alternativeBillingOnlyReportingDetails) {
        billingResult.getClass();
        ((vx1) ux1Var).V(new CreateAlternativeBillingOnlyReportingDetailsResult(billingResult, alternativeBillingOnlyReportingDetails));
    }

    public static final Object createBillingProgramReportingDetails(BillingClient billingClient, BillingProgramReportingDetailsParams billingProgramReportingDetailsParams, n92<? super CreateBillingProgramReportingDetailsResult> n92Var) {
        final vx1 vx1Var = new vx1();
        billingClient.createBillingProgramReportingDetailsAsync(billingProgramReportingDetailsParams, new BillingProgramReportingDetailsListener() { // from class: com.android.billingclient.api.BillingClientKotlinKt$$ExternalSyntheticLambda1
            @Override // com.android.billingclient.api.BillingProgramReportingDetailsListener
            public final void onCreateBillingProgramReportingDetailsResponse(BillingResult billingResult, BillingProgramReportingDetails billingProgramReportingDetails) {
                BillingClientKotlinKt.createBillingProgramReportingDetails$lambda$0(vx1Var, billingResult, billingProgramReportingDetails);
            }
        });
        return vx1Var.i(n92Var);
    }

    public static final void createBillingProgramReportingDetails$lambda$0(ux1 ux1Var, BillingResult billingResult, BillingProgramReportingDetails billingProgramReportingDetails) {
        billingResult.getClass();
        ((vx1) ux1Var).V(new CreateBillingProgramReportingDetailsResult(billingResult, billingProgramReportingDetails));
    }

    @z73
    public static final Object createExternalOfferReportingDetails(BillingClient billingClient, n92<? super CreateExternalOfferReportingDetailsResult> n92Var) {
        final vx1 vx1Var = new vx1();
        billingClient.createExternalOfferReportingDetailsAsync(new ExternalOfferReportingDetailsListener() { // from class: com.android.billingclient.api.BillingClientKotlinKt$$ExternalSyntheticLambda6
            @Override // com.android.billingclient.api.ExternalOfferReportingDetailsListener
            public final void onExternalOfferReportingDetailsResponse(BillingResult billingResult, ExternalOfferReportingDetails externalOfferReportingDetails) {
                BillingClientKotlinKt.createExternalOfferReportingDetails$lambda$0(vx1Var, billingResult, externalOfferReportingDetails);
            }
        });
        return vx1Var.i(n92Var);
    }

    public static final void createExternalOfferReportingDetails$lambda$0(ux1 ux1Var, BillingResult billingResult, ExternalOfferReportingDetails externalOfferReportingDetails) {
        billingResult.getClass();
        ((vx1) ux1Var).V(new CreateExternalOfferReportingDetailsResult(billingResult, externalOfferReportingDetails));
    }

    public static final Object isAlternativeBillingOnlyAvailable(BillingClient billingClient, n92<? super BillingResult> n92Var) {
        final vx1 vx1Var = new vx1();
        billingClient.isAlternativeBillingOnlyAvailableAsync(new AlternativeBillingOnlyAvailabilityListener() { // from class: com.android.billingclient.api.BillingClientKotlinKt$$ExternalSyntheticLambda7
            @Override // com.android.billingclient.api.AlternativeBillingOnlyAvailabilityListener
            public final void onAlternativeBillingOnlyAvailabilityResponse(BillingResult billingResult) {
                BillingClientKotlinKt.isAlternativeBillingOnlyAvailable$lambda$0(vx1Var, billingResult);
            }
        });
        return vx1Var.i(n92Var);
    }

    public static final void isAlternativeBillingOnlyAvailable$lambda$0(ux1 ux1Var, BillingResult billingResult) {
        billingResult.getClass();
        ((vx1) ux1Var).V(billingResult);
    }

    public static final Object isBillingProgramAvailable(BillingClient billingClient, int i, n92<? super IsBillingProgramAvailableResult> n92Var) {
        final vx1 vx1Var = new vx1();
        billingClient.isBillingProgramAvailableAsync(i, new BillingProgramAvailabilityListener() { // from class: com.android.billingclient.api.BillingClientKotlinKt$$ExternalSyntheticLambda0
            @Override // com.android.billingclient.api.BillingProgramAvailabilityListener
            public final void onBillingProgramAvailabilityResponse(BillingResult billingResult, BillingProgramAvailabilityDetails billingProgramAvailabilityDetails) {
                BillingClientKotlinKt.isBillingProgramAvailable$lambda$0(vx1Var, billingResult, billingProgramAvailabilityDetails);
            }
        });
        return vx1Var.i(n92Var);
    }

    public static final void isBillingProgramAvailable$lambda$0(ux1 ux1Var, BillingResult billingResult, BillingProgramAvailabilityDetails billingProgramAvailabilityDetails) {
        billingResult.getClass();
        billingProgramAvailabilityDetails.getClass();
        ((vx1) ux1Var).V(new IsBillingProgramAvailableResult(billingResult, billingProgramAvailabilityDetails));
    }

    @z73
    public static final Object isExternalOfferAvailable(BillingClient billingClient, n92<? super BillingResult> n92Var) {
        final vx1 vx1Var = new vx1();
        billingClient.isExternalOfferAvailableAsync(new ExternalOfferAvailabilityListener() { // from class: com.android.billingclient.api.BillingClientKotlinKt$$ExternalSyntheticLambda3
            @Override // com.android.billingclient.api.ExternalOfferAvailabilityListener
            public final void onExternalOfferAvailabilityResponse(BillingResult billingResult) {
                BillingClientKotlinKt.isExternalOfferAvailable$lambda$0(vx1Var, billingResult);
            }
        });
        return vx1Var.i(n92Var);
    }

    public static final void isExternalOfferAvailable$lambda$0(ux1 ux1Var, BillingResult billingResult) {
        billingResult.getClass();
        ((vx1) ux1Var).V(billingResult);
    }

    public static final Object queryProductDetails(BillingClient billingClient, QueryProductDetailsParams queryProductDetailsParams, n92<? super ProductDetailsResult> n92Var) {
        final vx1 vx1Var = new vx1();
        billingClient.queryProductDetailsAsync(queryProductDetailsParams, new ProductDetailsResponseListener() { // from class: com.android.billingclient.api.BillingClientKotlinKt$$ExternalSyntheticLambda4
            @Override // com.android.billingclient.api.ProductDetailsResponseListener
            public final void onProductDetailsResponse(BillingResult billingResult, QueryProductDetailsResult queryProductDetailsResult) {
                BillingClientKotlinKt.queryProductDetails$lambda$0(vx1Var, billingResult, queryProductDetailsResult);
            }
        });
        return vx1Var.i(n92Var);
    }

    public static final void queryProductDetails$lambda$0(ux1 ux1Var, BillingResult billingResult, QueryProductDetailsResult queryProductDetailsResult) {
        billingResult.getClass();
        ((vx1) ux1Var).V(new ProductDetailsResult(billingResult, queryProductDetailsResult.getProductDetailsList()));
    }

    public static final Object queryPurchasesAsync(BillingClient billingClient, QueryPurchasesParams queryPurchasesParams, n92<? super PurchasesResult> n92Var) {
        final vx1 vx1Var = new vx1();
        billingClient.queryPurchasesAsync(queryPurchasesParams, new PurchasesResponseListener() { // from class: com.android.billingclient.api.BillingClientKotlinKt$$ExternalSyntheticLambda9
            @Override // com.android.billingclient.api.PurchasesResponseListener
            public final void onQueryPurchasesResponse(BillingResult billingResult, List list) {
                BillingClientKotlinKt.queryPurchasesAsync$lambda$0(vx1Var, billingResult, list);
            }
        });
        return vx1Var.i(n92Var);
    }

    public static final void queryPurchasesAsync$lambda$0(ux1 ux1Var, BillingResult billingResult, List list) {
        billingResult.getClass();
        list.getClass();
        ((vx1) ux1Var).V(new PurchasesResult(billingResult, list));
    }
}
