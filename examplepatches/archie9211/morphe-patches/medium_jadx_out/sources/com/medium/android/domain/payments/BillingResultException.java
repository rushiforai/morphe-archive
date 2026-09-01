package com.medium.android.domain.payments;

import com.android.billingclient.api.BillingResult;
import defpackage.muc;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Lcom/medium/android/domain/payments/BillingResultException;", "Ljava/lang/RuntimeException;", "Lkotlin/RuntimeException;", "domain_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class BillingResultException extends RuntimeException {
    public final BillingResult a;

    /* JADX WARN: Illegal instructions before constructor call */
    public BillingResultException(BillingResult billingResult) {
        int responseCode = billingResult.getResponseCode();
        String debugMessage = billingResult.getDebugMessage();
        debugMessage.getClass();
        debugMessage = muc.b0(debugMessage) ? null : debugMessage;
        super("Unexpected Billing Result. Response code: " + responseCode + ", Debug Message: " + (debugMessage == null ? "none" : debugMessage));
        this.a = billingResult;
    }
}
