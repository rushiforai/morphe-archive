package com.instabridge.ai.billing;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import w70.m;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\u0003\u0010\u0004J\u0015\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00020\u0005H&¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/instabridge/ai/billing/AiEntitlementProvider;", b.f42142b, "Lcom/instabridge/ai/billing/AiTier;", "getCurrentTier", "()Lcom/instabridge/ai/billing/AiTier;", "Lw70/m;", "observeTierChanges", "()Lw70/m;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface AiEntitlementProvider {
    @NotNull
    AiTier getCurrentTier();

    @NotNull
    m observeTierChanges();
}
