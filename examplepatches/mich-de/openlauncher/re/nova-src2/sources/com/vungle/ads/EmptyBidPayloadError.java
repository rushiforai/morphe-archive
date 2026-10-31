package com.vungle.ads;

import com.iab.omid.library.vungle.d;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Metadata;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\u0018\u00002\u00020\u0001B\u000f\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0004¨\u0006\u0005"}, d2 = {"Lcom/vungle/ads/EmptyBidPayloadError;", "Lcom/vungle/ads/VungleError;", "placementId", b.f42142b, "(Ljava/lang/String;)V", "vungle-ads_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class EmptyBidPayloadError extends VungleError {
    public EmptyBidPayloadError(@Nullable String str) {
        super(Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD, d.a(str, " header bidding status does not match with loadAd parameters"), null);
    }
}
