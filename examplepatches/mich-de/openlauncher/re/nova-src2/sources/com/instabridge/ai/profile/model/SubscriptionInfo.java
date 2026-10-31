package com.instabridge.ai.profile.model;

import androidx.recyclerview.widget.u1;
import aq.o;
import aq.s;
import b.c0;
import b.c9;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import fo.d;
import h6.c1;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@s(generateAdapter = true)
@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\b4\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B¡\u0001\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0005\u001a\u00020\u0003\u0012\n\b\u0001\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0001\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0001\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0001\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0001\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0001\u0010\u000b\u001a\u00020\f\u0012\n\b\u0003\u0010\r\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0003\u0010\u000e\u001a\u0004\u0018\u00010\u0003\u0012\u0010\b\u0003\u0010\u000f\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u0010\u0012\n\b\u0003\u0010\u0011\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0012\u0010\u0013J\u000e\u0010.\u001a\u00020\f2\u0006\u0010/\u001a\u00020\u0003J\t\u00104\u001a\u00020\u0003HÆ\u0003J\t\u00105\u001a\u00020\u0003HÆ\u0003J\t\u00106\u001a\u00020\u0003HÆ\u0003J\u000b\u00107\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u00108\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u00109\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010:\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010;\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010<\u001a\u00020\fHÆ\u0003J\u000b\u0010=\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010>\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0011\u0010?\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u0010HÆ\u0003J\u000b\u0010@\u001a\u0004\u0018\u00010\u0003HÆ\u0003J£\u0001\u0010A\u001a\u00020\u00002\b\b\u0003\u0010\u0002\u001a\u00020\u00032\b\b\u0003\u0010\u0004\u001a\u00020\u00032\b\b\u0003\u0010\u0005\u001a\u00020\u00032\n\b\u0003\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\n\u001a\u0004\u0018\u00010\u00032\b\b\u0003\u0010\u000b\u001a\u00020\f2\n\b\u0003\u0010\r\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\u000e\u001a\u0004\u0018\u00010\u00032\u0010\b\u0003\u0010\u000f\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u00102\n\b\u0003\u0010\u0011\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010B\u001a\u00020\f2\b\u0010C\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010D\u001a\u00020EHÖ\u0001J\t\u0010F\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0015R\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0015R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0015R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u0015R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0015R\u0013\u0010\t\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u0015R\u0013\u0010\n\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u0015R\u0011\u0010\u000b\u001a\u00020\f¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u001eR\u0013\u0010\r\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001f\u0010\u0015R\u0013\u0010\u000e\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b \u0010\u0015R\u0019\u0010\u000f\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u0010¢\u0006\b\n\u0000\u001a\u0004\b!\u0010\"R\u0013\u0010\u0011\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b#\u0010\u0015R\u0011\u0010$\u001a\u00020\u00038F¢\u0006\u0006\u001a\u0004\b%\u0010\u0015R\u0011\u0010&\u001a\u00020\f8F¢\u0006\u0006\u001a\u0004\b&\u0010\u001eR\u0011\u0010'\u001a\u00020\f8F¢\u0006\u0006\u001a\u0004\b'\u0010\u001eR\u0011\u0010(\u001a\u00020\f8F¢\u0006\u0006\u001a\u0004\b(\u0010\u001eR\u0011\u0010)\u001a\u00020\f8F¢\u0006\u0006\u001a\u0004\b)\u0010\u001eR\u0011\u0010*\u001a\u00020\f8F¢\u0006\u0006\u001a\u0004\b*\u0010\u001eR\u0011\u0010+\u001a\u00020\f8F¢\u0006\u0006\u001a\u0004\b+\u0010\u001eR\u0011\u0010,\u001a\u00020\f8F¢\u0006\u0006\u001a\u0004\b,\u0010\u001eR\u0011\u0010-\u001a\u00020\f8F¢\u0006\u0006\u001a\u0004\b-\u0010\u001eR\u0014\u00100\u001a\u00020\u00038BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b1\u0010\u0015R\u0011\u00102\u001a\u00020\u00038F¢\u0006\u0006\u001a\u0004\b3\u0010\u0015¨\u0006G"}, d2 = {"Lcom/instabridge/ai/profile/model/SubscriptionInfo;", b.f42142b, "plan", b.f42142b, "status", "billingPeriod", "provider", "currentPeriodStart", "currentPeriodEnd", "cancelAt", "endedAt", "cancelAtPeriodEnd", b.f42142b, "product", "effectivePlan", "effectiveEntitlements", b.f42142b, "entitlementSource", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V", "getPlan", "()Ljava/lang/String;", "getStatus", "getBillingPeriod", "getProvider", "getCurrentPeriodStart", "getCurrentPeriodEnd", "getCancelAt", "getEndedAt", "getCancelAtPeriodEnd", "()Z", "getProduct", "getEffectivePlan", "getEffectiveEntitlements", "()Ljava/util/List;", "getEntitlementSource", "resolvedPlan", "getResolvedPlan", "isFree", "isPaid", "isActive", "isCanceled", "isCanceling", "isGooglePlay", "isStripe", "isCoveredByTeam", "hasEntitlement", TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, "premiumPlanDisplayName", "getPremiumPlanDisplayName", "displayPlanName", "getDisplayPlanName", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "component12", "component13", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class SubscriptionInfo {
    public static final int $stable = 8;

    @NotNull
    private final String billingPeriod;

    @Nullable
    private final String cancelAt;
    private final boolean cancelAtPeriodEnd;

    @Nullable
    private final String currentPeriodEnd;

    @Nullable
    private final String currentPeriodStart;

    @Nullable
    private final List<String> effectiveEntitlements;

    @Nullable
    private final String effectivePlan;

    @Nullable
    private final String endedAt;

    @Nullable
    private final String entitlementSource;

    @NotNull
    private final String plan;

    @Nullable
    private final String product;

    @Nullable
    private final String provider;

    @NotNull
    private final String status;

    public SubscriptionInfo(@o(name = "plan") @NotNull String plan, @o(name = "status") @NotNull String status, @o(name = "billing_period") @NotNull String billingPeriod, @o(name = "provider") @Nullable String str, @o(name = "current_period_start") @Nullable String str2, @o(name = "current_period_end") @Nullable String str3, @o(name = "cancel_at") @Nullable String str4, @o(name = "ended_at") @Nullable String str5, @o(name = "cancel_at_period_end") boolean z11, @o(name = "product") @Nullable String str6, @o(name = "effective_plan") @Nullable String str7, @o(name = "effective_entitlements") @Nullable List<String> list, @o(name = "entitlement_source") @Nullable String str8) {
        Intrinsics.g(plan, "plan");
        Intrinsics.g(status, "status");
        Intrinsics.g(billingPeriod, "billingPeriod");
        this.plan = plan;
        this.status = status;
        this.billingPeriod = billingPeriod;
        this.provider = str;
        this.currentPeriodStart = str2;
        this.currentPeriodEnd = str3;
        this.cancelAt = str4;
        this.endedAt = str5;
        this.cancelAtPeriodEnd = z11;
        this.product = str6;
        this.effectivePlan = str7;
        this.effectiveEntitlements = list;
        this.entitlementSource = str8;
    }

    public static /* synthetic */ SubscriptionInfo copy$default(SubscriptionInfo subscriptionInfo, String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, boolean z11, String str9, String str10, List list, String str11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = subscriptionInfo.plan;
        }
        return subscriptionInfo.copy(str, (i5 & 2) != 0 ? subscriptionInfo.status : str2, (i5 & 4) != 0 ? subscriptionInfo.billingPeriod : str3, (i5 & 8) != 0 ? subscriptionInfo.provider : str4, (i5 & 16) != 0 ? subscriptionInfo.currentPeriodStart : str5, (i5 & 32) != 0 ? subscriptionInfo.currentPeriodEnd : str6, (i5 & 64) != 0 ? subscriptionInfo.cancelAt : str7, (i5 & 128) != 0 ? subscriptionInfo.endedAt : str8, (i5 & 256) != 0 ? subscriptionInfo.cancelAtPeriodEnd : z11, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? subscriptionInfo.product : str9, (i5 & 1024) != 0 ? subscriptionInfo.effectivePlan : str10, (i5 & 2048) != 0 ? subscriptionInfo.effectiveEntitlements : list, (i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? subscriptionInfo.entitlementSource : str11);
    }

    private final String getPremiumPlanDisplayName() {
        return d.j() ? d.c().f55446k : "Pro";
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getPlan() {
        return this.plan;
    }

    @Nullable
    /* renamed from: component10, reason: from getter */
    public final String getProduct() {
        return this.product;
    }

    @Nullable
    /* renamed from: component11, reason: from getter */
    public final String getEffectivePlan() {
        return this.effectivePlan;
    }

    @Nullable
    public final List<String> component12() {
        return this.effectiveEntitlements;
    }

    @Nullable
    /* renamed from: component13, reason: from getter */
    public final String getEntitlementSource() {
        return this.entitlementSource;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getStatus() {
        return this.status;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getBillingPeriod() {
        return this.billingPeriod;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getProvider() {
        return this.provider;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getCurrentPeriodStart() {
        return this.currentPeriodStart;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getCurrentPeriodEnd() {
        return this.currentPeriodEnd;
    }

    @Nullable
    /* renamed from: component7, reason: from getter */
    public final String getCancelAt() {
        return this.cancelAt;
    }

    @Nullable
    /* renamed from: component8, reason: from getter */
    public final String getEndedAt() {
        return this.endedAt;
    }

    /* renamed from: component9, reason: from getter */
    public final boolean getCancelAtPeriodEnd() {
        return this.cancelAtPeriodEnd;
    }

    @NotNull
    public final SubscriptionInfo copy(@o(name = "plan") @NotNull String plan, @o(name = "status") @NotNull String status, @o(name = "billing_period") @NotNull String billingPeriod, @o(name = "provider") @Nullable String provider, @o(name = "current_period_start") @Nullable String currentPeriodStart, @o(name = "current_period_end") @Nullable String currentPeriodEnd, @o(name = "cancel_at") @Nullable String cancelAt, @o(name = "ended_at") @Nullable String endedAt, @o(name = "cancel_at_period_end") boolean cancelAtPeriodEnd, @o(name = "product") @Nullable String product, @o(name = "effective_plan") @Nullable String effectivePlan, @o(name = "effective_entitlements") @Nullable List<String> effectiveEntitlements, @o(name = "entitlement_source") @Nullable String entitlementSource) {
        Intrinsics.g(plan, "plan");
        Intrinsics.g(status, "status");
        Intrinsics.g(billingPeriod, "billingPeriod");
        return new SubscriptionInfo(plan, status, billingPeriod, provider, currentPeriodStart, currentPeriodEnd, cancelAt, endedAt, cancelAtPeriodEnd, product, effectivePlan, effectiveEntitlements, entitlementSource);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SubscriptionInfo)) {
            return false;
        }
        SubscriptionInfo subscriptionInfo = (SubscriptionInfo) other;
        return Intrinsics.b(this.plan, subscriptionInfo.plan) && Intrinsics.b(this.status, subscriptionInfo.status) && Intrinsics.b(this.billingPeriod, subscriptionInfo.billingPeriod) && Intrinsics.b(this.provider, subscriptionInfo.provider) && Intrinsics.b(this.currentPeriodStart, subscriptionInfo.currentPeriodStart) && Intrinsics.b(this.currentPeriodEnd, subscriptionInfo.currentPeriodEnd) && Intrinsics.b(this.cancelAt, subscriptionInfo.cancelAt) && Intrinsics.b(this.endedAt, subscriptionInfo.endedAt) && this.cancelAtPeriodEnd == subscriptionInfo.cancelAtPeriodEnd && Intrinsics.b(this.product, subscriptionInfo.product) && Intrinsics.b(this.effectivePlan, subscriptionInfo.effectivePlan) && Intrinsics.b(this.effectiveEntitlements, subscriptionInfo.effectiveEntitlements) && Intrinsics.b(this.entitlementSource, subscriptionInfo.entitlementSource);
    }

    @NotNull
    public final String getBillingPeriod() {
        return this.billingPeriod;
    }

    @Nullable
    public final String getCancelAt() {
        return this.cancelAt;
    }

    public final boolean getCancelAtPeriodEnd() {
        return this.cancelAtPeriodEnd;
    }

    @Nullable
    public final String getCurrentPeriodEnd() {
        return this.currentPeriodEnd;
    }

    @Nullable
    public final String getCurrentPeriodStart() {
        return this.currentPeriodStart;
    }

    @NotNull
    public final String getDisplayPlanName() {
        String resolvedPlan = getResolvedPlan();
        int iHashCode = resolvedPlan.hashCode();
        return iHashCode != -703703781 ? iHashCode != 111277 ? (iHashCode == 3444122 && resolvedPlan.equals("plus")) ? "Plus" : "Free" : !resolvedPlan.equals("pro") ? "Free" : getPremiumPlanDisplayName() : !resolvedPlan.equals("pro_lifetime") ? "Free" : getPremiumPlanDisplayName();
    }

    @Nullable
    public final List<String> getEffectiveEntitlements() {
        return this.effectiveEntitlements;
    }

    @Nullable
    public final String getEffectivePlan() {
        return this.effectivePlan;
    }

    @Nullable
    public final String getEndedAt() {
        return this.endedAt;
    }

    @Nullable
    public final String getEntitlementSource() {
        return this.entitlementSource;
    }

    @NotNull
    public final String getPlan() {
        return this.plan;
    }

    @Nullable
    public final String getProduct() {
        return this.product;
    }

    @Nullable
    public final String getProvider() {
        return this.provider;
    }

    @NotNull
    public final String getResolvedPlan() {
        String str = this.effectivePlan;
        return str == null ? this.plan : str;
    }

    @NotNull
    public final String getStatus() {
        return this.status;
    }

    public final boolean hasEntitlement(@NotNull String code) {
        Intrinsics.g(code, "code");
        List<String> list = this.effectiveEntitlements;
        return list != null && list.contains(code);
    }

    public int hashCode() {
        int iE = c0.e(c0.e(this.plan.hashCode() * 31, 31, this.status), 31, this.billingPeriod);
        String str = this.provider;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.currentPeriodStart;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.currentPeriodEnd;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.cancelAt;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.endedAt;
        int iF = c9.f((iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31, 31, this.cancelAtPeriodEnd);
        String str6 = this.product;
        int iHashCode5 = (iF + (str6 == null ? 0 : str6.hashCode())) * 31;
        String str7 = this.effectivePlan;
        int iHashCode6 = (iHashCode5 + (str7 == null ? 0 : str7.hashCode())) * 31;
        List<String> list = this.effectiveEntitlements;
        int iHashCode7 = (iHashCode6 + (list == null ? 0 : list.hashCode())) * 31;
        String str8 = this.entitlementSource;
        return iHashCode7 + (str8 != null ? str8.hashCode() : 0);
    }

    public final boolean isActive() {
        return Intrinsics.b(this.status, "active");
    }

    public final boolean isCanceled() {
        return Intrinsics.b(this.status, "canceled");
    }

    public final boolean isCanceling() {
        return isActive() && this.cancelAtPeriodEnd;
    }

    public final boolean isCoveredByTeam() {
        return Intrinsics.b(this.entitlementSource, "team");
    }

    public final boolean isFree() {
        return Intrinsics.b(getResolvedPlan(), "free");
    }

    public final boolean isGooglePlay() {
        return Intrinsics.b(this.provider, "google_play");
    }

    public final boolean isPaid() {
        return ul.b.Q("plus", "pro", "pro_lifetime").contains(getResolvedPlan());
    }

    public final boolean isStripe() {
        return Intrinsics.b(this.provider, "stripe");
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("SubscriptionInfo(plan=");
        sb2.append(this.plan);
        sb2.append(", status=");
        sb2.append(this.status);
        sb2.append(", billingPeriod=");
        sb2.append(this.billingPeriod);
        sb2.append(", provider=");
        sb2.append(this.provider);
        sb2.append(", currentPeriodStart=");
        sb2.append(this.currentPeriodStart);
        sb2.append(", currentPeriodEnd=");
        sb2.append(this.currentPeriodEnd);
        sb2.append(", cancelAt=");
        sb2.append(this.cancelAt);
        sb2.append(", endedAt=");
        sb2.append(this.endedAt);
        sb2.append(", cancelAtPeriodEnd=");
        sb2.append(this.cancelAtPeriodEnd);
        sb2.append(", product=");
        sb2.append(this.product);
        sb2.append(", effectivePlan=");
        sb2.append(this.effectivePlan);
        sb2.append(", effectiveEntitlements=");
        sb2.append(this.effectiveEntitlements);
        sb2.append(", entitlementSource=");
        return c1.t(sb2, this.entitlementSource, ')');
    }

    public /* synthetic */ SubscriptionInfo(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, boolean z11, String str9, String str10, List list, String str11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, str3, str4, str5, str6, str7, str8, z11, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? null : str9, (i5 & 1024) != 0 ? null : str10, (i5 & 2048) != 0 ? null : list, (i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? null : str11);
    }
}
