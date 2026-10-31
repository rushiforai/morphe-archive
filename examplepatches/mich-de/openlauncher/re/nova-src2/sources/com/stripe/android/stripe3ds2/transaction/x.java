package com.stripe.android.stripe3ds2.transaction;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.stripe.android.stripe3ds2.transaction.ChallengeRequestResult;
import com.stripe.android.stripe3ds2.transactions.ChallengeRequestData;
import com.stripe.android.stripe3ds2.transactions.ErrorData;

/* loaded from: classes4.dex */
public final class x {
    public static final ChallengeRequestResult.Timeout a(ChallengeRequestData challengeRequestData) {
        int i5 = a0.f45120h;
        SdkTransactionId sdkTransactionId = challengeRequestData.f45156d;
        String str = challengeRequestData.f45153a;
        String str2 = challengeRequestData.f45155c;
        String str3 = challengeRequestData.f45154b;
        xv.c cVar = xv.c.f96423c;
        String strValueOf = String.valueOf(TTAdConstant.AD_ID_IS_NULL_CODE);
        w.a aVar = xv.b.f96418b;
        return new ChallengeRequestResult.Timeout(new ErrorData(str3, str2, strValueOf, "Transaction timed-out.", "Challenge request timed-out", "CReq", str, sdkTransactionId, 4));
    }
}
