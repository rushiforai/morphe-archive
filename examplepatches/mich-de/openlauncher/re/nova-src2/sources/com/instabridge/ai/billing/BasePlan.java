package com.instabridge.ai.billing;

import aq.o;
import aq.s;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@s(generateAdapter = true)
@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u001b\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0003\u0010\u0002\u001a\u00020\u00032\b\b\u0003\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/instabridge/ai/billing/BasePlan;", b.f42142b, "basePlanId", b.f42142b, "period", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getBasePlanId", "()Ljava/lang/String;", "getPeriod", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class BasePlan {
    public static final int $stable = 0;

    @NotNull
    private final String basePlanId;

    @NotNull
    private final String period;

    public BasePlan(@o(name = "base_plan_id") @NotNull String basePlanId, @o(name = "period") @NotNull String period) {
        Intrinsics.g(basePlanId, "basePlanId");
        Intrinsics.g(period, "period");
        this.basePlanId = basePlanId;
        this.period = period;
    }

    public static /* synthetic */ BasePlan copy$default(BasePlan basePlan, String str, String str2, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = basePlan.basePlanId;
        }
        if ((i5 & 2) != 0) {
            str2 = basePlan.period;
        }
        return basePlan.copy(str, str2);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getBasePlanId() {
        return this.basePlanId;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getPeriod() {
        return this.period;
    }

    @NotNull
    public final BasePlan copy(@o(name = "base_plan_id") @NotNull String basePlanId, @o(name = "period") @NotNull String period) {
        Intrinsics.g(basePlanId, "basePlanId");
        Intrinsics.g(period, "period");
        return new BasePlan(basePlanId, period);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof BasePlan)) {
            return false;
        }
        BasePlan basePlan = (BasePlan) other;
        return Intrinsics.b(this.basePlanId, basePlan.basePlanId) && Intrinsics.b(this.period, basePlan.period);
    }

    @NotNull
    public final String getBasePlanId() {
        return this.basePlanId;
    }

    @NotNull
    public final String getPeriod() {
        return this.period;
    }

    public int hashCode() {
        return this.period.hashCode() + (this.basePlanId.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("BasePlan(basePlanId=");
        sb2.append(this.basePlanId);
        sb2.append(", period=");
        return c1.t(sb2, this.period, ')');
    }
}
