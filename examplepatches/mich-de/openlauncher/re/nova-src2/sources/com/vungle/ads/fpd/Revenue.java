package com.vungle.ads.fpd;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.FloatSerializer;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(bv = {}, d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0007\n\u0002\b\n\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u001e\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u0000 <2\u00020\u0001:\u0002=<B\u0007¢\u0006\u0004\b5\u00106BK\b\u0017\u0012\u0006\u00108\u001a\u000207\u0012\n\b\u0001\u0010\f\u001a\u0004\u0018\u00010\t\u0012\n\b\u0001\u0010\u000e\u001a\u0004\u0018\u00010\t\u0012\n\b\u0001\u0010\u0010\u001a\u0004\u0018\u00010\t\u0012\n\b\u0001\u0010\u0019\u001a\u0004\u0018\u00010\u0018\u0012\b\u0010:\u001a\u0004\u0018\u000109¢\u0006\u0004\b5\u0010;J!\u0010\b\u001a\u00020\u00072\u0006\u0010\u0002\u001a\u00020\u00002\u0006\u0010\u0004\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u0005HÇ\u0001J\u0010\u0010\u000b\u001a\u00020\u00002\u0006\u0010\n\u001a\u00020\tH\u0007J\u000e\u0010\r\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\tJ\u000e\u0010\u000f\u001a\u00020\u00002\u0006\u0010\u000e\u001a\u00020\tJ\u000e\u0010\u0011\u001a\u00020\u00002\u0006\u0010\u0010\u001a\u00020\tJ\u0010\u0010\u0013\u001a\u00020\u00002\u0006\u0010\u0012\u001a\u00020\tH\u0007J\u0018\u0010\u0017\u001a\u00020\u00002\u000e\u0010\u0016\u001a\n\u0012\u0004\u0012\u00020\u0015\u0018\u00010\u0014H\u0007J\u000e\u0010\u001a\u001a\u00020\u00002\u0006\u0010\u0019\u001a\u00020\u0018J\u0010\u0010\u001c\u001a\u00020\u00002\u0006\u0010\u001b\u001a\u00020\u0018H\u0007J\u0010\u0010\u001e\u001a\u00020\u00002\u0006\u0010\u001d\u001a\u00020\tH\u0007J\u0010\u0010 \u001a\u00020\u00002\u0006\u0010\u001f\u001a\u00020\tH\u0007J\u0010\u0010\"\u001a\u00020\u00002\u0006\u0010!\u001a\u00020\tH\u0007J\u0010\u0010$\u001a\u00020\u00002\u0006\u0010#\u001a\u00020\tH\u0007J\u0010\u0010&\u001a\u00020\u00002\u0006\u0010%\u001a\u00020\tH\u0007J\u0010\u0010(\u001a\u00020\u00002\u0006\u0010'\u001a\u00020\tH\u0007J\u0010\u0010*\u001a\u00020\u00002\u0006\u0010)\u001a\u00020\tH\u0007J\u0010\u0010,\u001a\u00020\u00002\u0006\u0010+\u001a\u00020\tH\u0007J\u0010\u0010.\u001a\u00020\u00002\u0006\u0010-\u001a\u00020\tH\u0007J\u0010\u00100\u001a\u00020\u00002\u0006\u0010/\u001a\u00020\tH\u0007J\u0010\u00102\u001a\u00020\u00002\u0006\u00101\u001a\u00020\tH\u0007J\u0010\u00104\u001a\u00020\u00002\u0006\u00103\u001a\u00020\tH\u0007¨\u0006>"}, d2 = {"Lcom/vungle/ads/fpd/Revenue;", b.f42142b, "self", "Lkotlinx/serialization/encoding/CompositeEncoder;", "output", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialDesc", b.f42142b, "write$Self", b.f42142b, "totalEarningsUsd", "setTotalEarningsUsd", "iaaRevenueUSD", "setIAARevenueUSD", "iapRevenueUSD", "setIAPRevenueUSD", "totalRevenueUSD", "setTotalRevenueUSD", "earningsByPlacement", "setEarningsByPlacement", b.f42142b, b.f42142b, "topNAdomain", "setTopNAdomain", b.f42142b, "isUserAPurchaser", "setIsUserAPurchaser", "isUserASubscriber", "setIsUserASubscriber", "last7DaysMedianSpendUsd", "setLast7DaysMedianSpendUsd", "last7DaysTotalSpendUsd", "setLast7DaysTotalSpendUsd", "last30DaysTotalSpendUsd", "setLast30DaysTotalSpendUsd", "last7DaysMeanSpendUsd", "setLast7DaysMeanSpendUsd", "last30DaysMedianSpendUsd", "setLast30DaysMedianSpendUsd", "last30DaysMeanSpendUsd", "setLast30DaysMeanSpendUsd", "last7DaysUserPltvUsd", "setLast7DaysUserPltvUsd", "last7DaysUserLtvUsd", "setLast7DaysUserLtvUsd", "last30DaysUserPltvUsd", "setLast30DaysUserPltvUsd", "last30DaysUserLtvUsd", "setLast30DaysUserLtvUsd", "last7DaysPlacementFillRate", "setLast7DaysPlacementFillRate", "last30DaysPlacementFillRate", "setLast30DaysPlacementFillRate", "<init>", "()V", b.f42142b, "seen1", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "serializationConstructorMarker", "(ILjava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Boolean;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", k.O, "$serializer", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
@Serializable
/* loaded from: classes4.dex */
public final class Revenue {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    /* renamed from: a, reason: collision with root package name */
    public Float f46700a;

    /* renamed from: b, reason: collision with root package name */
    public Float f46701b;

    /* renamed from: c, reason: collision with root package name */
    public Float f46702c;

    /* renamed from: d, reason: collision with root package name */
    public Boolean f46703d;

    @Metadata(bv = {}, d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0086\u0003\u0018\u00002\u00020\u0001J\u000f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0002HÆ\u0001¨\u0006\u0005"}, d2 = {"Lcom/vungle/ads/fpd/Revenue$Companion;", b.f42142b, "Lkotlinx/serialization/KSerializer;", "Lcom/vungle/ads/fpd/Revenue;", "serializer", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final KSerializer<Revenue> serializer() {
            return Revenue$$serializer.INSTANCE;
        }

        public Companion() {
        }
    }

    public Revenue() {
    }

    @JvmStatic
    public static final void write$Self(@NotNull Revenue self, @NotNull CompositeEncoder output, @NotNull SerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f46700a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, FloatSerializer.INSTANCE, self.f46700a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f46701b != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, FloatSerializer.INSTANCE, self.f46701b);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.f46702c != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, FloatSerializer.INSTANCE, self.f46702c);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 3) && self.f46703d == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 3, BooleanSerializer.INSTANCE, self.f46703d);
    }

    @Deprecated
    @NotNull
    public final Revenue setEarningsByPlacement(float earningsByPlacement) {
        return this;
    }

    @NotNull
    public final Revenue setIAARevenueUSD(float iaaRevenueUSD) {
        if (0.0f <= iaaRevenueUSD && iaaRevenueUSD <= Float.MAX_VALUE) {
            this.f46700a = Float.valueOf(iaaRevenueUSD);
        }
        return this;
    }

    @NotNull
    public final Revenue setIAPRevenueUSD(float iapRevenueUSD) {
        if (0.0f <= iapRevenueUSD && iapRevenueUSD <= Float.MAX_VALUE) {
            this.f46701b = Float.valueOf(iapRevenueUSD);
        }
        return this;
    }

    @NotNull
    public final Revenue setIsUserAPurchaser(boolean isUserAPurchaser) {
        this.f46703d = Boolean.valueOf(isUserAPurchaser);
        return this;
    }

    @Deprecated
    @NotNull
    public final Revenue setIsUserASubscriber(boolean isUserASubscriber) {
        return this;
    }

    @Deprecated
    @NotNull
    public final Revenue setLast30DaysMeanSpendUsd(float last30DaysMeanSpendUsd) {
        return this;
    }

    @Deprecated
    @NotNull
    public final Revenue setLast30DaysMedianSpendUsd(float last30DaysMedianSpendUsd) {
        return this;
    }

    @Deprecated
    @NotNull
    public final Revenue setLast30DaysPlacementFillRate(float last30DaysPlacementFillRate) {
        return this;
    }

    @Deprecated
    @NotNull
    public final Revenue setLast30DaysTotalSpendUsd(float last30DaysTotalSpendUsd) {
        return this;
    }

    @Deprecated
    @NotNull
    public final Revenue setLast30DaysUserLtvUsd(float last30DaysUserLtvUsd) {
        return this;
    }

    @Deprecated
    @NotNull
    public final Revenue setLast30DaysUserPltvUsd(float last30DaysUserPltvUsd) {
        return this;
    }

    @Deprecated
    @NotNull
    public final Revenue setLast7DaysMeanSpendUsd(float last7DaysMeanSpendUsd) {
        return this;
    }

    @Deprecated
    @NotNull
    public final Revenue setLast7DaysMedianSpendUsd(float last7DaysMedianSpendUsd) {
        return this;
    }

    @Deprecated
    @NotNull
    public final Revenue setLast7DaysPlacementFillRate(float last7DaysPlacementFillRate) {
        return this;
    }

    @Deprecated
    @NotNull
    public final Revenue setLast7DaysTotalSpendUsd(float last7DaysTotalSpendUsd) {
        return this;
    }

    @Deprecated
    @NotNull
    public final Revenue setLast7DaysUserLtvUsd(float last7DaysUserLtvUsd) {
        return this;
    }

    @Deprecated
    @NotNull
    public final Revenue setLast7DaysUserPltvUsd(float last7DaysUserPltvUsd) {
        return this;
    }

    @Deprecated
    @NotNull
    public final Revenue setTopNAdomain(@Nullable List<String> topNAdomain) {
        return this;
    }

    @Deprecated
    @NotNull
    public final Revenue setTotalEarningsUsd(float totalEarningsUsd) {
        return this;
    }

    @NotNull
    public final Revenue setTotalRevenueUSD(float totalRevenueUSD) {
        if (0.0f <= totalRevenueUSD && totalRevenueUSD <= Float.MAX_VALUE) {
            this.f46702c = Float.valueOf(totalRevenueUSD);
        }
        return this;
    }

    @Deprecated
    public /* synthetic */ Revenue(int i5, @SerialName("iaa_revenue_usd") Float f11, @SerialName("iap_revenue_usd") Float f12, @SerialName("total_revenue_usd") Float f13, @SerialName("is_user_a_purchaser") Boolean bool, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.f46700a = null;
        } else {
            this.f46700a = f11;
        }
        if ((i5 & 2) == 0) {
            this.f46701b = null;
        } else {
            this.f46701b = f12;
        }
        if ((i5 & 4) == 0) {
            this.f46702c = null;
        } else {
            this.f46702c = f13;
        }
        if ((i5 & 8) == 0) {
            this.f46703d = null;
        } else {
            this.f46703d = bool;
        }
    }
}
