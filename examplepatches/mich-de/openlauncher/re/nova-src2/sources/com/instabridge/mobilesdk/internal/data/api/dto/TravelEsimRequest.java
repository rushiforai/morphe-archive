package com.instabridge.mobilesdk.internal.data.api.dto;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
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

@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 '2\u00020\u0001:\u0002&'B+\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tB9\b\u0010\u0012\u0006\u0010\n\u001a\u00020\u0003\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\f¢\u0006\u0004\b\b\u0010\rJ\u0010\u0010\u0015\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u000fJ\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u0010\u0010\u0017\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0002\u0010\u0013J2\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001¢\u0006\u0002\u0010\u0019J\u0013\u0010\u001a\u001a\u00020\u00072\b\u0010\u001b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001c\u001a\u00020\u0003HÖ\u0001J\t\u0010\u001d\u001a\u00020\u0005HÖ\u0001J%\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020\u00002\u0006\u0010!\u001a\u00020\"2\u0006\u0010#\u001a\u00020$H\u0001¢\u0006\u0002\b%R\u0015\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u0010\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\n\n\u0002\u0010\u0014\u001a\u0004\b\u0006\u0010\u0013¨\u0006("}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/TravelEsimRequest;", b.f42142b, "corruptedEsimId", b.f42142b, "deviceId", b.f42142b, "isNewEsimRequired", b.f42142b, "<init>", "(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;)V", "seen0", "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getCorruptedEsimId", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getDeviceId", "()Ljava/lang/String;", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "component1", "component2", "component3", "copy", "(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;)Lcom/instabridge/mobilesdk/internal/data/api/dto/TravelEsimRequest;", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class TravelEsimRequest {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final Integer corruptedEsimId;

    @Nullable
    private final String deviceId;

    @Nullable
    private final Boolean isNewEsimRequired;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/TravelEsimRequest$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/TravelEsimRequest;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<TravelEsimRequest> serializer() {
            return TravelEsimRequest$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public TravelEsimRequest() {
        this((Integer) null, (String) null, (Boolean) null, 7, (DefaultConstructorMarker) null);
    }

    public static /* synthetic */ TravelEsimRequest copy$default(TravelEsimRequest travelEsimRequest, Integer num, String str, Boolean bool, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            num = travelEsimRequest.corruptedEsimId;
        }
        if ((i5 & 2) != 0) {
            str = travelEsimRequest.deviceId;
        }
        if ((i5 & 4) != 0) {
            bool = travelEsimRequest.isNewEsimRequired;
        }
        return travelEsimRequest.copy(num, str, bool);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(TravelEsimRequest self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.corruptedEsimId != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, IntSerializer.INSTANCE, self.corruptedEsimId);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.deviceId != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.deviceId);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 2) && self.isNewEsimRequired == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 2, BooleanSerializer.INSTANCE, self.isNewEsimRequired);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final Integer getCorruptedEsimId() {
        return this.corruptedEsimId;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getDeviceId() {
        return this.deviceId;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final Boolean getIsNewEsimRequired() {
        return this.isNewEsimRequired;
    }

    @NotNull
    public final TravelEsimRequest copy(@Nullable Integer corruptedEsimId, @Nullable String deviceId, @Nullable Boolean isNewEsimRequired) {
        return new TravelEsimRequest(corruptedEsimId, deviceId, isNewEsimRequired);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof TravelEsimRequest)) {
            return false;
        }
        TravelEsimRequest travelEsimRequest = (TravelEsimRequest) other;
        return Intrinsics.b(this.corruptedEsimId, travelEsimRequest.corruptedEsimId) && Intrinsics.b(this.deviceId, travelEsimRequest.deviceId) && Intrinsics.b(this.isNewEsimRequired, travelEsimRequest.isNewEsimRequired);
    }

    @Nullable
    public final Integer getCorruptedEsimId() {
        return this.corruptedEsimId;
    }

    @Nullable
    public final String getDeviceId() {
        return this.deviceId;
    }

    public int hashCode() {
        Integer num = this.corruptedEsimId;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        String str = this.deviceId;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        Boolean bool = this.isNewEsimRequired;
        return iHashCode2 + (bool != null ? bool.hashCode() : 0);
    }

    @Nullable
    public final Boolean isNewEsimRequired() {
        return this.isNewEsimRequired;
    }

    @NotNull
    public String toString() {
        return "TravelEsimRequest(corruptedEsimId=" + this.corruptedEsimId + ", deviceId=" + this.deviceId + ", isNewEsimRequired=" + this.isNewEsimRequired + ")";
    }

    public /* synthetic */ TravelEsimRequest(int i5, Integer num, String str, Boolean bool, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.corruptedEsimId = null;
        } else {
            this.corruptedEsimId = num;
        }
        if ((i5 & 2) == 0) {
            this.deviceId = null;
        } else {
            this.deviceId = str;
        }
        if ((i5 & 4) == 0) {
            this.isNewEsimRequired = null;
        } else {
            this.isNewEsimRequired = bool;
        }
    }

    public TravelEsimRequest(@Nullable Integer num, @Nullable String str, @Nullable Boolean bool) {
        this.corruptedEsimId = num;
        this.deviceId = str;
        this.isNewEsimRequired = bool;
    }

    public /* synthetic */ TravelEsimRequest(Integer num, String str, Boolean bool, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : num, (i5 & 2) != 0 ? null : str, (i5 & 4) != 0 ? null : bool);
    }
}
