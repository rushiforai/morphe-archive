package com.moloco.sdk.publisher;

import com.moloco.sdk.publisher.MolocoAdError;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements MolocoBidTokenListener {
    @Override // com.moloco.sdk.publisher.MolocoBidTokenListener
    public final void onBidTokenResult(String str, MolocoAdError.ErrorType errorType) {
        Intrinsics.g(str, "bidToken");
    }
}
