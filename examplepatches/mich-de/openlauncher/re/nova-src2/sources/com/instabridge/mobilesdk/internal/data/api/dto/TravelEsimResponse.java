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
import kotlinx.serialization.internal.SerializationConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 \u001e2\u00020\u0001:\u0002\u001d\u001eB\u0013\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005B%\b\u0010\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\u0004\b\u0004\u0010\nJ\u000b\u0010\r\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\u000e\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0007HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J%\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00002\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u001bH\u0001¢\u0006\u0002\b\u001cR\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u001f"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/TravelEsimResponse;", b.f42142b, "esim", "Lcom/instabridge/mobilesdk/internal/data/api/dto/TravelEsimDto;", "<init>", "(Lcom/instabridge/mobilesdk/internal/data/api/dto/TravelEsimDto;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILcom/instabridge/mobilesdk/internal/data/api/dto/TravelEsimDto;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getEsim", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/TravelEsimDto;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", b.f42142b, "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class TravelEsimResponse {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final TravelEsimDto esim;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/TravelEsimResponse$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/TravelEsimResponse;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<TravelEsimResponse> serializer() {
            return TravelEsimResponse$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public TravelEsimResponse() {
        this((TravelEsimDto) null, 1, (DefaultConstructorMarker) (0 == true ? 1 : 0));
    }

    public static /* synthetic */ TravelEsimResponse copy$default(TravelEsimResponse travelEsimResponse, TravelEsimDto travelEsimDto, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            travelEsimDto = travelEsimResponse.esim;
        }
        return travelEsimResponse.copy(travelEsimDto);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(TravelEsimResponse self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (!output.shouldEncodeElementDefault(serialDesc, 0) && self.esim == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 0, TravelEsimDto$$serializer.INSTANCE, self.esim);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final TravelEsimDto getEsim() {
        return this.esim;
    }

    @NotNull
    public final TravelEsimResponse copy(@Nullable TravelEsimDto esim) {
        return new TravelEsimResponse(esim);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof TravelEsimResponse) && Intrinsics.b(this.esim, ((TravelEsimResponse) other).esim);
    }

    @Nullable
    public final TravelEsimDto getEsim() {
        return this.esim;
    }

    public int hashCode() {
        TravelEsimDto travelEsimDto = this.esim;
        if (travelEsimDto == null) {
            return 0;
        }
        return travelEsimDto.hashCode();
    }

    @NotNull
    public String toString() {
        return "TravelEsimResponse(esim=" + this.esim + ")";
    }

    public /* synthetic */ TravelEsimResponse(int i5, TravelEsimDto travelEsimDto, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.esim = null;
        } else {
            this.esim = travelEsimDto;
        }
    }

    public TravelEsimResponse(@Nullable TravelEsimDto travelEsimDto) {
        this.esim = travelEsimDto;
    }

    public /* synthetic */ TravelEsimResponse(TravelEsimDto travelEsimDto, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : travelEsimDto);
    }
}
