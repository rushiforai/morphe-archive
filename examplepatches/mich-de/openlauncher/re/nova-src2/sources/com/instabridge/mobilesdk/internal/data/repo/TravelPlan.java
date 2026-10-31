package com.instabridge.mobilesdk.internal.data.repo;

import b.c0;
import b.c9;
import b.u4;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.events.Identify;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.DoubleSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u001e\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 <2\u00020\u0001:\u0002;<B?\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\f\u0010\rBQ\b\u0010\u0012\u0006\u0010\u000e\u001a\u00020\u0005\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u0010¢\u0006\u0004\b\f\u0010\u0011J\t\u0010&\u001a\u00020\u0003HÆ\u0003J\t\u0010'\u001a\u00020\u0005HÆ\u0003J\t\u0010(\u001a\u00020\u0007HÆ\u0003J\t\u0010)\u001a\u00020\tHÆ\u0003J\u0010\u0010*\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u001bJ\u0010\u0010+\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0002\u0010\u001eJN\u0010,\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0007HÆ\u0001¢\u0006\u0002\u0010-J\u0013\u0010.\u001a\u00020/2\b\u00100\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u00101\u001a\u00020\u0005HÖ\u0001J\t\u00102\u001a\u00020\tHÖ\u0001J%\u00103\u001a\u0002042\u0006\u00105\u001a\u00020\u00002\u0006\u00106\u001a\u0002072\u0006\u00108\u001a\u000209H\u0001¢\u0006\u0002\b:R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0015\u0010\n\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u001c\u001a\u0004\b\u001a\u0010\u001bR\u0015\u0010\u000b\u001a\u0004\u0018\u00010\u0007¢\u0006\n\n\u0002\u0010\u001f\u001a\u0004\b\u001d\u0010\u001eR\u0011\u0010 \u001a\u00020\u00038F¢\u0006\u0006\u001a\u0004\b!\u0010\u0013R\u0011\u0010\"\u001a\u00020\t8F¢\u0006\u0006\u001a\u0004\b#\u0010\u0019R\u0013\u0010$\u001a\u0004\u0018\u00010\u00078F¢\u0006\u0006\u001a\u0004\b%\u0010\u001e¨\u0006="}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/TravelPlan;", b.f42142b, "dataBytes", b.f42142b, "durationHours", b.f42142b, "totalPrice", b.f42142b, TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, b.f42142b, "savingsPercent", "subTotal", "<init>", "(JIDLjava/lang/String;Ljava/lang/Integer;Ljava/lang/Double;)V", "seen0", "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(IJIDLjava/lang/String;Ljava/lang/Integer;Ljava/lang/Double;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getDataBytes", "()J", "getDurationHours", "()I", "getTotalPrice", "()D", "getCurrency", "()Ljava/lang/String;", "getSavingsPercent", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getSubTotal", "()Ljava/lang/Double;", "Ljava/lang/Double;", "dataMb", "getDataMb", DatabaseConstants.KEY_FIELD, "getKey", "pricePerGb", "getPricePerGb", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "(JIDLjava/lang/String;Ljava/lang/Integer;Ljava/lang/Double;)Lcom/instabridge/mobilesdk/internal/data/repo/TravelPlan;", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class TravelPlan {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private final String currency;
    private final long dataBytes;
    private final int durationHours;

    @Nullable
    private final Integer savingsPercent;

    @Nullable
    private final Double subTotal;
    private final double totalPrice;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/TravelPlan$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelPlan;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<TravelPlan> serializer() {
            return TravelPlan$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public /* synthetic */ TravelPlan(int i5, long j11, int i11, double d5, String str, Integer num, Double d11, SerializationConstructorMarker serializationConstructorMarker) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, TravelPlan$$serializer.INSTANCE.getDescriptor());
        }
        this.dataBytes = j11;
        this.durationHours = i11;
        this.totalPrice = d5;
        this.currency = str;
        if ((i5 & 16) == 0) {
            this.savingsPercent = null;
        } else {
            this.savingsPercent = num;
        }
        if ((i5 & 32) == 0) {
            this.subTotal = null;
        } else {
            this.subTotal = d11;
        }
    }

    public static /* synthetic */ TravelPlan copy$default(TravelPlan travelPlan, long j11, int i5, double d5, String str, Integer num, Double d11, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            j11 = travelPlan.dataBytes;
        }
        long j12 = j11;
        if ((i11 & 2) != 0) {
            i5 = travelPlan.durationHours;
        }
        int i12 = i5;
        if ((i11 & 4) != 0) {
            d5 = travelPlan.totalPrice;
        }
        double d12 = d5;
        if ((i11 & 8) != 0) {
            str = travelPlan.currency;
        }
        return travelPlan.copy(j12, i12, d12, str, (i11 & 16) != 0 ? travelPlan.savingsPercent : num, (i11 & 32) != 0 ? travelPlan.subTotal : d11);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(TravelPlan self, CompositeEncoder output, SerialDescriptor serialDesc) {
        output.encodeLongElement(serialDesc, 0, self.dataBytes);
        output.encodeIntElement(serialDesc, 1, self.durationHours);
        output.encodeDoubleElement(serialDesc, 2, self.totalPrice);
        output.encodeStringElement(serialDesc, 3, self.currency);
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.savingsPercent != null) {
            output.encodeNullableSerializableElement(serialDesc, 4, IntSerializer.INSTANCE, self.savingsPercent);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 5) && self.subTotal == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 5, DoubleSerializer.INSTANCE, self.subTotal);
    }

    /* renamed from: component1, reason: from getter */
    public final long getDataBytes() {
        return this.dataBytes;
    }

    /* renamed from: component2, reason: from getter */
    public final int getDurationHours() {
        return this.durationHours;
    }

    /* renamed from: component3, reason: from getter */
    public final double getTotalPrice() {
        return this.totalPrice;
    }

    @NotNull
    /* renamed from: component4, reason: from getter */
    public final String getCurrency() {
        return this.currency;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final Integer getSavingsPercent() {
        return this.savingsPercent;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final Double getSubTotal() {
        return this.subTotal;
    }

    @NotNull
    public final TravelPlan copy(long dataBytes, int durationHours, double totalPrice, @NotNull String currency, @Nullable Integer savingsPercent, @Nullable Double subTotal) {
        Intrinsics.g(currency, "currency");
        return new TravelPlan(dataBytes, durationHours, totalPrice, currency, savingsPercent, subTotal);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof TravelPlan)) {
            return false;
        }
        TravelPlan travelPlan = (TravelPlan) other;
        return this.dataBytes == travelPlan.dataBytes && this.durationHours == travelPlan.durationHours && Double.compare(this.totalPrice, travelPlan.totalPrice) == 0 && Intrinsics.b(this.currency, travelPlan.currency) && Intrinsics.b(this.savingsPercent, travelPlan.savingsPercent) && Intrinsics.b(this.subTotal, travelPlan.subTotal);
    }

    @NotNull
    public final String getCurrency() {
        return this.currency;
    }

    public final long getDataBytes() {
        return this.dataBytes;
    }

    public final long getDataMb() {
        return this.dataBytes / 1000000;
    }

    public final int getDurationHours() {
        return this.durationHours;
    }

    @NotNull
    public final String getKey() {
        return this.dataBytes + Identify.UNSET_VALUE + this.durationHours;
    }

    @Nullable
    public final Double getPricePerGb() {
        if (getDataMb() > 0) {
            return Double.valueOf(this.totalPrice / (getDataMb() / 1000.0d));
        }
        return null;
    }

    @Nullable
    public final Integer getSavingsPercent() {
        return this.savingsPercent;
    }

    @Nullable
    public final Double getSubTotal() {
        return this.subTotal;
    }

    public final double getTotalPrice() {
        return this.totalPrice;
    }

    public int hashCode() {
        int iE = c0.e(c9.c(this.totalPrice, u4.a(this.durationHours, Long.hashCode(this.dataBytes) * 31, 31), 31), 31, this.currency);
        Integer num = this.savingsPercent;
        int iHashCode = (iE + (num == null ? 0 : num.hashCode())) * 31;
        Double d5 = this.subTotal;
        return iHashCode + (d5 != null ? d5.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        return "TravelPlan(dataBytes=" + this.dataBytes + ", durationHours=" + this.durationHours + ", totalPrice=" + this.totalPrice + ", currency=" + this.currency + ", savingsPercent=" + this.savingsPercent + ", subTotal=" + this.subTotal + ")";
    }

    public TravelPlan(long j11, int i5, double d5, @NotNull String currency, @Nullable Integer num, @Nullable Double d11) {
        Intrinsics.g(currency, "currency");
        this.dataBytes = j11;
        this.durationHours = i5;
        this.totalPrice = d5;
        this.currency = currency;
        this.savingsPercent = num;
        this.subTotal = d11;
    }

    public /* synthetic */ TravelPlan(long j11, int i5, double d5, String str, Integer num, Double d11, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(j11, i5, d5, str, (i11 & 16) != 0 ? null : num, (i11 & 32) != 0 ? null : d11);
    }
}
