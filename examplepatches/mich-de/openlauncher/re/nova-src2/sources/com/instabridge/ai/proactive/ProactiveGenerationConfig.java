package com.instabridge.ai.proactive;

import b.c0;
import b.c9;
import b.u4;
import b70.g;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.ai.billing.AiTier;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\b\"\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0087\b\u0018\u0000 52\u00020\u0001:\u00015B{\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0007\u001a\u00020\b\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\b\b\u0002\u0010\n\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u000b\u001a\u00020\b\u0012\b\b\u0002\u0010\f\u001a\u00020\r\u0012\b\b\u0002\u0010\u000e\u001a\u00020\r\u0012\u000e\b\u0002\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00110\u0010¢\u0006\u0004\b\u0012\u0010\u0013J\u0006\u0010#\u001a\u00020\u0000J\t\u0010$\u001a\u00020\u0003HÆ\u0003J\t\u0010%\u001a\u00020\u0003HÆ\u0003J\t\u0010&\u001a\u00020\u0003HÆ\u0003J\t\u0010'\u001a\u00020\u0003HÆ\u0003J\t\u0010(\u001a\u00020\bHÆ\u0003J\t\u0010)\u001a\u00020\bHÆ\u0003J\t\u0010*\u001a\u00020\u0003HÆ\u0003J\t\u0010+\u001a\u00020\bHÆ\u0003J\t\u0010,\u001a\u00020\rHÆ\u0003J\t\u0010-\u001a\u00020\rHÆ\u0003J\u000f\u0010.\u001a\b\u0012\u0004\u0012\u00020\u00110\u0010HÆ\u0003J}\u0010/\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\b2\b\b\u0002\u0010\t\u001a\u00020\b2\b\b\u0002\u0010\n\u001a\u00020\u00032\b\b\u0002\u0010\u000b\u001a\u00020\b2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\r2\u000e\b\u0002\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00110\u0010HÆ\u0001J\u0013\u00100\u001a\u00020\r2\b\u00101\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u00102\u001a\u00020\u0003HÖ\u0001J\t\u00103\u001a\u000204HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0015R\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0015R\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0015R\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u001aR\u0011\u0010\t\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u001aR\u0011\u0010\n\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u0015R\u0011\u0010\u000b\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u001aR\u0011\u0010\f\u001a\u00020\r¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001fR\u0011\u0010\u000e\u001a\u00020\r¢\u0006\b\n\u0000\u001a\u0004\b \u0010\u001fR\u0017\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00110\u0010¢\u0006\b\n\u0000\u001a\u0004\b!\u0010\"¨\u00066"}, d2 = {"Lcom/instabridge/ai/proactive/ProactiveGenerationConfig;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "targetPoolSize", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "poolStarvedBelow", "steadyBatchSize", "starvedBatchSize", "minIntervalMs", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "metaRefreshIntervalMs", "maxParallelGenerations", "impressionRefillMinIntervalMs", "refreshInsightsAfterMetaSuccess", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "enabled", "allowedTiers", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/billing/AiTier;", "<init>", "(IIIIJJIJZZLjava/util/Set;)V", "getTargetPoolSize", "()I", "getPoolStarvedBelow", "getSteadyBatchSize", "getStarvedBatchSize", "getMinIntervalMs", "()J", "getMetaRefreshIntervalMs", "getMaxParallelGenerations", "getImpressionRefillMinIntervalMs", "getRefreshInsightsAfterMetaSuccess", "()Z", "getEnabled", "getAllowedTiers", "()Ljava/util/Set;", "sanitized", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class ProactiveGenerationConfig {
    private static final long MAX_INSIGHT_INTERVAL_MS = 86400000;
    private static final long MAX_META_INTERVAL_MS = 86400000;
    private static final long MIN_IMPRESSION_REFILL_INTERVAL_MS = 300000;
    private static final long MIN_INSIGHT_INTERVAL_MS = 300000;
    private static final long MIN_META_INTERVAL_MS = 3600000;

    @NotNull
    private final Set<AiTier> allowedTiers;
    private final boolean enabled;
    private final long impressionRefillMinIntervalMs;
    private final int maxParallelGenerations;
    private final long metaRefreshIntervalMs;
    private final long minIntervalMs;
    private final int poolStarvedBelow;
    private final boolean refreshInsightsAfterMetaSuccess;
    private final int starvedBatchSize;
    private final int steadyBatchSize;
    private final int targetPoolSize;

    @NotNull
    private static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0005\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/instabridge/ai/proactive/ProactiveGenerationConfig$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "MIN_INSIGHT_INTERVAL_MS", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "MAX_INSIGHT_INTERVAL_MS", "MIN_META_INTERVAL_MS", "MAX_META_INTERVAL_MS", "MIN_IMPRESSION_REFILL_INTERVAL_MS", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    public ProactiveGenerationConfig() {
        this(0, 0, 0, 0, 0L, 0L, 0, 0L, false, false, null, 2047, null);
    }

    public static /* synthetic */ ProactiveGenerationConfig copy$default(ProactiveGenerationConfig proactiveGenerationConfig, int i5, int i11, int i12, int i13, long j11, long j12, int i14, long j13, boolean z11, boolean z12, Set set, int i15, Object obj) {
        return proactiveGenerationConfig.copy((i15 & 1) != 0 ? proactiveGenerationConfig.targetPoolSize : i5, (i15 & 2) != 0 ? proactiveGenerationConfig.poolStarvedBelow : i11, (i15 & 4) != 0 ? proactiveGenerationConfig.steadyBatchSize : i12, (i15 & 8) != 0 ? proactiveGenerationConfig.starvedBatchSize : i13, (i15 & 16) != 0 ? proactiveGenerationConfig.minIntervalMs : j11, (i15 & 32) != 0 ? proactiveGenerationConfig.metaRefreshIntervalMs : j12, (i15 & 64) != 0 ? proactiveGenerationConfig.maxParallelGenerations : i14, (i15 & 128) != 0 ? proactiveGenerationConfig.impressionRefillMinIntervalMs : j13, (i15 & 256) != 0 ? proactiveGenerationConfig.refreshInsightsAfterMetaSuccess : z11, (i15 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? proactiveGenerationConfig.enabled : z12, (i15 & 1024) != 0 ? proactiveGenerationConfig.allowedTiers : set);
    }

    /* renamed from: component1, reason: from getter */
    public final int getTargetPoolSize() {
        return this.targetPoolSize;
    }

    /* renamed from: component10, reason: from getter */
    public final boolean getEnabled() {
        return this.enabled;
    }

    @NotNull
    public final Set<AiTier> component11() {
        return this.allowedTiers;
    }

    /* renamed from: component2, reason: from getter */
    public final int getPoolStarvedBelow() {
        return this.poolStarvedBelow;
    }

    /* renamed from: component3, reason: from getter */
    public final int getSteadyBatchSize() {
        return this.steadyBatchSize;
    }

    /* renamed from: component4, reason: from getter */
    public final int getStarvedBatchSize() {
        return this.starvedBatchSize;
    }

    /* renamed from: component5, reason: from getter */
    public final long getMinIntervalMs() {
        return this.minIntervalMs;
    }

    /* renamed from: component6, reason: from getter */
    public final long getMetaRefreshIntervalMs() {
        return this.metaRefreshIntervalMs;
    }

    /* renamed from: component7, reason: from getter */
    public final int getMaxParallelGenerations() {
        return this.maxParallelGenerations;
    }

    /* renamed from: component8, reason: from getter */
    public final long getImpressionRefillMinIntervalMs() {
        return this.impressionRefillMinIntervalMs;
    }

    /* renamed from: component9, reason: from getter */
    public final boolean getRefreshInsightsAfterMetaSuccess() {
        return this.refreshInsightsAfterMetaSuccess;
    }

    @NotNull
    public final ProactiveGenerationConfig copy(int targetPoolSize, int poolStarvedBelow, int steadyBatchSize, int starvedBatchSize, long minIntervalMs, long metaRefreshIntervalMs, int maxParallelGenerations, long impressionRefillMinIntervalMs, boolean refreshInsightsAfterMetaSuccess, boolean enabled, @NotNull Set<? extends AiTier> allowedTiers) {
        Intrinsics.g(allowedTiers, "allowedTiers");
        return new ProactiveGenerationConfig(targetPoolSize, poolStarvedBelow, steadyBatchSize, starvedBatchSize, minIntervalMs, metaRefreshIntervalMs, maxParallelGenerations, impressionRefillMinIntervalMs, refreshInsightsAfterMetaSuccess, enabled, allowedTiers);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ProactiveGenerationConfig)) {
            return false;
        }
        ProactiveGenerationConfig proactiveGenerationConfig = (ProactiveGenerationConfig) other;
        return this.targetPoolSize == proactiveGenerationConfig.targetPoolSize && this.poolStarvedBelow == proactiveGenerationConfig.poolStarvedBelow && this.steadyBatchSize == proactiveGenerationConfig.steadyBatchSize && this.starvedBatchSize == proactiveGenerationConfig.starvedBatchSize && this.minIntervalMs == proactiveGenerationConfig.minIntervalMs && this.metaRefreshIntervalMs == proactiveGenerationConfig.metaRefreshIntervalMs && this.maxParallelGenerations == proactiveGenerationConfig.maxParallelGenerations && this.impressionRefillMinIntervalMs == proactiveGenerationConfig.impressionRefillMinIntervalMs && this.refreshInsightsAfterMetaSuccess == proactiveGenerationConfig.refreshInsightsAfterMetaSuccess && this.enabled == proactiveGenerationConfig.enabled && Intrinsics.b(this.allowedTiers, proactiveGenerationConfig.allowedTiers);
    }

    @NotNull
    public final Set<AiTier> getAllowedTiers() {
        return this.allowedTiers;
    }

    public final boolean getEnabled() {
        return this.enabled;
    }

    public final long getImpressionRefillMinIntervalMs() {
        return this.impressionRefillMinIntervalMs;
    }

    public final int getMaxParallelGenerations() {
        return this.maxParallelGenerations;
    }

    public final long getMetaRefreshIntervalMs() {
        return this.metaRefreshIntervalMs;
    }

    public final long getMinIntervalMs() {
        return this.minIntervalMs;
    }

    public final int getPoolStarvedBelow() {
        return this.poolStarvedBelow;
    }

    public final boolean getRefreshInsightsAfterMetaSuccess() {
        return this.refreshInsightsAfterMetaSuccess;
    }

    public final int getStarvedBatchSize() {
        return this.starvedBatchSize;
    }

    public final int getSteadyBatchSize() {
        return this.steadyBatchSize;
    }

    public final int getTargetPoolSize() {
        return this.targetPoolSize;
    }

    public int hashCode() {
        return this.allowedTiers.hashCode() + c9.f(c9.f(c0.d(u4.a(this.maxParallelGenerations, c0.d(c0.d(u4.a(this.starvedBatchSize, u4.a(this.steadyBatchSize, u4.a(this.poolStarvedBelow, Integer.hashCode(this.targetPoolSize) * 31, 31), 31), 31), 31, this.minIntervalMs), 31, this.metaRefreshIntervalMs), 31), 31, this.impressionRefillMinIntervalMs), 31, this.refreshInsightsAfterMetaSuccess), 31, this.enabled);
    }

    @NotNull
    public final ProactiveGenerationConfig sanitized() {
        int iE0 = kotlin.ranges.a.e0(this.targetPoolSize, 1, 10);
        return copy$default(this, iE0, kotlin.ranges.a.e0(this.poolStarvedBelow, 1, iE0), kotlin.ranges.a.e0(this.steadyBatchSize, 1, 3), kotlin.ranges.a.e0(this.starvedBatchSize, 1, 3), kotlin.ranges.a.g0(this.minIntervalMs, 300000L, 86400000L), kotlin.ranges.a.g0(this.metaRefreshIntervalMs, 3600000L, 86400000L), kotlin.ranges.a.e0(this.maxParallelGenerations, 1, 3), kotlin.ranges.a.g0(this.impressionRefillMinIntervalMs, 300000L, 86400000L), false, false, null, 1792, null);
    }

    @NotNull
    public String toString() {
        return "ProactiveGenerationConfig(targetPoolSize=" + this.targetPoolSize + ", poolStarvedBelow=" + this.poolStarvedBelow + ", steadyBatchSize=" + this.steadyBatchSize + ", starvedBatchSize=" + this.starvedBatchSize + ", minIntervalMs=" + this.minIntervalMs + ", metaRefreshIntervalMs=" + this.metaRefreshIntervalMs + ", maxParallelGenerations=" + this.maxParallelGenerations + ", impressionRefillMinIntervalMs=" + this.impressionRefillMinIntervalMs + ", refreshInsightsAfterMetaSuccess=" + this.refreshInsightsAfterMetaSuccess + ", enabled=" + this.enabled + ", allowedTiers=" + this.allowedTiers + ')';
    }

    /* JADX WARN: Multi-variable type inference failed */
    public ProactiveGenerationConfig(int i5, int i11, int i12, int i13, long j11, long j12, int i14, long j13, boolean z11, boolean z12, @NotNull Set<? extends AiTier> allowedTiers) {
        Intrinsics.g(allowedTiers, "allowedTiers");
        this.targetPoolSize = i5;
        this.poolStarvedBelow = i11;
        this.steadyBatchSize = i12;
        this.starvedBatchSize = i13;
        this.minIntervalMs = j11;
        this.metaRefreshIntervalMs = j12;
        this.maxParallelGenerations = i14;
        this.impressionRefillMinIntervalMs = j13;
        this.refreshInsightsAfterMetaSuccess = z11;
        this.enabled = z12;
        this.allowedTiers = allowedTiers;
    }

    public /* synthetic */ ProactiveGenerationConfig(int i5, int i11, int i12, int i13, long j11, long j12, int i14, long j13, boolean z11, boolean z12, Set set, int i15, DefaultConstructorMarker defaultConstructorMarker) {
        this((i15 & 1) != 0 ? 3 : i5, (i15 & 2) != 0 ? 2 : i11, (i15 & 4) != 0 ? 1 : i12, (i15 & 8) != 0 ? 1 : i13, (i15 & 16) != 0 ? 2700000L : j11, (i15 & 32) != 0 ? 21600000L : j12, (i15 & 64) == 0 ? i14 : 1, (i15 & 128) == 0 ? j13 : 2700000L, (i15 & 256) != 0 ? false : z11, (i15 & EventBridgeChannel.QUEUE_CAPACITY) == 0 ? z12 : false, (i15 & 1024) != 0 ? g.N1(AiTier.getEntries()) : set);
    }
}
