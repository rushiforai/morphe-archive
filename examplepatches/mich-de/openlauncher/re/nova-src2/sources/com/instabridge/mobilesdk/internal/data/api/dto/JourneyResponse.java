package com.instabridge.mobilesdk.internal.data.api.dto;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.JourneyState;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0018\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 12\u00020\u0001:\u000201BC\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\f\u0010\rBM\b\u0010\u0012\u0006\u0010\u000e\u001a\u00020\u0005\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u0010¢\u0006\u0004\b\f\u0010\u0011J\u000b\u0010\u001d\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0010\u0010\u001e\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u0015J\u0010\u0010\u001f\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0002\u0010\u0017J\u000b\u0010 \u001a\u0004\u0018\u00010\tHÆ\u0003J\u000b\u0010!\u001a\u0004\u0018\u00010\u000bHÆ\u0003JJ\u0010\"\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000bHÆ\u0001¢\u0006\u0002\u0010#J\u0013\u0010$\u001a\u00020\u00072\b\u0010%\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010&\u001a\u00020\u0005HÖ\u0001J\t\u0010'\u001a\u00020\tHÖ\u0001J%\u0010(\u001a\u00020)2\u0006\u0010*\u001a\u00020\u00002\u0006\u0010+\u001a\u00020,2\u0006\u0010-\u001a\u00020.H\u0001¢\u0006\u0002\b/R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u0016\u001a\u0004\b\u0014\u0010\u0015R\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\n\n\u0002\u0010\u0018\u001a\u0004\b\u0006\u0010\u0017R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u001aR\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u001c¨\u00062"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/JourneyResponse;", b.f42142b, "state", "Lcom/instabridge/mobilesdk/JourneyState;", "stateValue", b.f42142b, "isValidUsCard", b.f42142b, "brandName", b.f42142b, "offerClaimed", "Lcom/instabridge/mobilesdk/internal/data/api/dto/OfferClaimedInfo;", "<init>", "(Lcom/instabridge/mobilesdk/JourneyState;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/data/api/dto/OfferClaimedInfo;)V", "seen0", "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILcom/instabridge/mobilesdk/JourneyState;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/data/api/dto/OfferClaimedInfo;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getState", "()Lcom/instabridge/mobilesdk/JourneyState;", "getStateValue", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "getBrandName", "()Ljava/lang/String;", "getOfferClaimed", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/OfferClaimedInfo;", "component1", "component2", "component3", "component4", "component5", "copy", "(Lcom/instabridge/mobilesdk/JourneyState;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/data/api/dto/OfferClaimedInfo;)Lcom/instabridge/mobilesdk/internal/data/api/dto/JourneyResponse;", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class JourneyResponse {
    public static final int $stable = 0;

    @Nullable
    private final String brandName;

    @Nullable
    private final Boolean isValidUsCard;

    @Nullable
    private final OfferClaimedInfo offerClaimed;

    @Nullable
    private final JourneyState state;

    @Nullable
    private final Integer stateValue;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @JvmField
    @NotNull
    private static final KSerializer<Object>[] $childSerializers = {JourneyState.INSTANCE.serializer(), null, null, null, null};

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/JourneyResponse$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/JourneyResponse;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<JourneyResponse> serializer() {
            return JourneyResponse$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public JourneyResponse() {
        this((JourneyState) null, (Integer) null, (Boolean) null, (String) null, (OfferClaimedInfo) null, 31, (DefaultConstructorMarker) null);
    }

    public static /* synthetic */ JourneyResponse copy$default(JourneyResponse journeyResponse, JourneyState journeyState, Integer num, Boolean bool, String str, OfferClaimedInfo offerClaimedInfo, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            journeyState = journeyResponse.state;
        }
        if ((i5 & 2) != 0) {
            num = journeyResponse.stateValue;
        }
        if ((i5 & 4) != 0) {
            bool = journeyResponse.isValidUsCard;
        }
        if ((i5 & 8) != 0) {
            str = journeyResponse.brandName;
        }
        if ((i5 & 16) != 0) {
            offerClaimedInfo = journeyResponse.offerClaimed;
        }
        OfferClaimedInfo offerClaimedInfo2 = offerClaimedInfo;
        Boolean bool2 = bool;
        return journeyResponse.copy(journeyState, num, bool2, str, offerClaimedInfo2);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(JourneyResponse self, CompositeEncoder output, SerialDescriptor serialDesc) {
        KSerializer<Object>[] kSerializerArr = $childSerializers;
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.state != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, kSerializerArr[0], self.state);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.stateValue != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, IntSerializer.INSTANCE, self.stateValue);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.isValidUsCard != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, BooleanSerializer.INSTANCE, self.isValidUsCard);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.brandName != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.brandName);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 4) && self.offerClaimed == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 4, OfferClaimedInfo$$serializer.INSTANCE, self.offerClaimed);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final JourneyState getState() {
        return this.state;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final Integer getStateValue() {
        return this.stateValue;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final Boolean getIsValidUsCard() {
        return this.isValidUsCard;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getBrandName() {
        return this.brandName;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final OfferClaimedInfo getOfferClaimed() {
        return this.offerClaimed;
    }

    @NotNull
    public final JourneyResponse copy(@Nullable JourneyState state, @Nullable Integer stateValue, @Nullable Boolean isValidUsCard, @Nullable String brandName, @Nullable OfferClaimedInfo offerClaimed) {
        return new JourneyResponse(state, stateValue, isValidUsCard, brandName, offerClaimed);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof JourneyResponse)) {
            return false;
        }
        JourneyResponse journeyResponse = (JourneyResponse) other;
        return this.state == journeyResponse.state && Intrinsics.b(this.stateValue, journeyResponse.stateValue) && Intrinsics.b(this.isValidUsCard, journeyResponse.isValidUsCard) && Intrinsics.b(this.brandName, journeyResponse.brandName) && Intrinsics.b(this.offerClaimed, journeyResponse.offerClaimed);
    }

    @Nullable
    public final String getBrandName() {
        return this.brandName;
    }

    @Nullable
    public final OfferClaimedInfo getOfferClaimed() {
        return this.offerClaimed;
    }

    @Nullable
    public final JourneyState getState() {
        return this.state;
    }

    @Nullable
    public final Integer getStateValue() {
        return this.stateValue;
    }

    public int hashCode() {
        JourneyState journeyState = this.state;
        int iHashCode = (journeyState == null ? 0 : journeyState.hashCode()) * 31;
        Integer num = this.stateValue;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        Boolean bool = this.isValidUsCard;
        int iHashCode3 = (iHashCode2 + (bool == null ? 0 : bool.hashCode())) * 31;
        String str = this.brandName;
        int iHashCode4 = (iHashCode3 + (str == null ? 0 : str.hashCode())) * 31;
        OfferClaimedInfo offerClaimedInfo = this.offerClaimed;
        return iHashCode4 + (offerClaimedInfo != null ? offerClaimedInfo.hashCode() : 0);
    }

    @Nullable
    public final Boolean isValidUsCard() {
        return this.isValidUsCard;
    }

    @NotNull
    public String toString() {
        return "JourneyResponse(state=" + this.state + ", stateValue=" + this.stateValue + ", isValidUsCard=" + this.isValidUsCard + ", brandName=" + this.brandName + ", offerClaimed=" + this.offerClaimed + ")";
    }

    public /* synthetic */ JourneyResponse(int i5, JourneyState journeyState, Integer num, Boolean bool, String str, OfferClaimedInfo offerClaimedInfo, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.state = null;
        } else {
            this.state = journeyState;
        }
        if ((i5 & 2) == 0) {
            this.stateValue = null;
        } else {
            this.stateValue = num;
        }
        if ((i5 & 4) == 0) {
            this.isValidUsCard = null;
        } else {
            this.isValidUsCard = bool;
        }
        if ((i5 & 8) == 0) {
            this.brandName = null;
        } else {
            this.brandName = str;
        }
        if ((i5 & 16) == 0) {
            this.offerClaimed = null;
        } else {
            this.offerClaimed = offerClaimedInfo;
        }
    }

    public JourneyResponse(@Nullable JourneyState journeyState, @Nullable Integer num, @Nullable Boolean bool, @Nullable String str, @Nullable OfferClaimedInfo offerClaimedInfo) {
        this.state = journeyState;
        this.stateValue = num;
        this.isValidUsCard = bool;
        this.brandName = str;
        this.offerClaimed = offerClaimedInfo;
    }

    public /* synthetic */ JourneyResponse(JourneyState journeyState, Integer num, Boolean bool, String str, OfferClaimedInfo offerClaimedInfo, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : journeyState, (i5 & 2) != 0 ? null : num, (i5 & 4) != 0 ? null : bool, (i5 & 8) != 0 ? null : str, (i5 & 16) != 0 ? null : offerClaimedInfo);
    }
}
