package com.instabridge.mobilesdk.internal.data.api.dto;

import b.c0;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 +2\u00020\u0001:\u0002*+B9\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0003\u0012\b\b\u0002\u0010\b\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bBC\b\u0010\u0012\u0006\u0010\f\u001a\u00020\u0003\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\u0006\u0010\b\u001a\u00020\t\u0012\b\u0010\r\u001a\u0004\u0018\u00010\u000e¢\u0006\u0004\b\n\u0010\u000fJ\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0018\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0019\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001a\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001b\u001a\u00020\tHÆ\u0003J;\u0010\u001c\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u00032\b\b\u0002\u0010\b\u001a\u00020\tHÆ\u0001J\u0013\u0010\u001d\u001a\u00020\t2\b\u0010\u001e\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001f\u001a\u00020\u0003HÖ\u0001J\t\u0010 \u001a\u00020!HÖ\u0001J%\u0010\"\u001a\u00020#2\u0006\u0010$\u001a\u00020\u00002\u0006\u0010%\u001a\u00020&2\u0006\u0010'\u001a\u00020(H\u0001¢\u0006\u0002\b)R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0011R\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0011R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\u0016¨\u0006,"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/TrialDto;", b.f42142b, "durationHours", b.f42142b, "data", b.f42142b, ActionCategory.SMS, "voice", "isFreeTrial", b.f42142b, "<init>", "(IJIIZ)V", "seen0", "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(IIJIIZLkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getDurationHours", "()I", "getData", "()J", "getSms", "getVoice", "()Z", "component1", "component2", "component3", "component4", "component5", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", b.f42142b, "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class TrialDto {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private final long data;
    private final int durationHours;
    private final boolean isFreeTrial;
    private final int sms;
    private final int voice;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/TrialDto$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/TrialDto;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<TrialDto> serializer() {
            return TrialDto$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public TrialDto() {
        this(0, 0L, 0, 0, false, 31, (DefaultConstructorMarker) null);
    }

    public static /* synthetic */ TrialDto copy$default(TrialDto trialDto, int i5, long j11, int i11, int i12, boolean z11, int i13, Object obj) {
        if ((i13 & 1) != 0) {
            i5 = trialDto.durationHours;
        }
        if ((i13 & 2) != 0) {
            j11 = trialDto.data;
        }
        if ((i13 & 4) != 0) {
            i11 = trialDto.sms;
        }
        if ((i13 & 8) != 0) {
            i12 = trialDto.voice;
        }
        if ((i13 & 16) != 0) {
            z11 = trialDto.isFreeTrial;
        }
        boolean z12 = z11;
        int i14 = i11;
        return trialDto.copy(i5, j11, i14, i12, z12);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(TrialDto self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.durationHours != 0) {
            output.encodeIntElement(serialDesc, 0, self.durationHours);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.data != 0) {
            output.encodeLongElement(serialDesc, 1, self.data);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.sms != 0) {
            output.encodeIntElement(serialDesc, 2, self.sms);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.voice != 0) {
            output.encodeIntElement(serialDesc, 3, self.voice);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.isFreeTrial) {
            output.encodeBooleanElement(serialDesc, 4, self.isFreeTrial);
        }
    }

    /* renamed from: component1, reason: from getter */
    public final int getDurationHours() {
        return this.durationHours;
    }

    /* renamed from: component2, reason: from getter */
    public final long getData() {
        return this.data;
    }

    /* renamed from: component3, reason: from getter */
    public final int getSms() {
        return this.sms;
    }

    /* renamed from: component4, reason: from getter */
    public final int getVoice() {
        return this.voice;
    }

    /* renamed from: component5, reason: from getter */
    public final boolean getIsFreeTrial() {
        return this.isFreeTrial;
    }

    @NotNull
    public final TrialDto copy(int durationHours, long data, int sms, int voice, boolean isFreeTrial) {
        return new TrialDto(durationHours, data, sms, voice, isFreeTrial);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof TrialDto)) {
            return false;
        }
        TrialDto trialDto = (TrialDto) other;
        return this.durationHours == trialDto.durationHours && this.data == trialDto.data && this.sms == trialDto.sms && this.voice == trialDto.voice && this.isFreeTrial == trialDto.isFreeTrial;
    }

    public final long getData() {
        return this.data;
    }

    public final int getDurationHours() {
        return this.durationHours;
    }

    public final int getSms() {
        return this.sms;
    }

    public final int getVoice() {
        return this.voice;
    }

    public int hashCode() {
        return Boolean.hashCode(this.isFreeTrial) + u4.a(this.voice, u4.a(this.sms, c0.d(Integer.hashCode(this.durationHours) * 31, 31, this.data), 31), 31);
    }

    public final boolean isFreeTrial() {
        return this.isFreeTrial;
    }

    @NotNull
    public String toString() {
        return "TrialDto(durationHours=" + this.durationHours + ", data=" + this.data + ", sms=" + this.sms + ", voice=" + this.voice + ", isFreeTrial=" + this.isFreeTrial + ")";
    }

    public /* synthetic */ TrialDto(int i5, int i11, long j11, int i12, int i13, boolean z11, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.durationHours = 0;
        } else {
            this.durationHours = i11;
        }
        if ((i5 & 2) == 0) {
            this.data = 0L;
        } else {
            this.data = j11;
        }
        if ((i5 & 4) == 0) {
            this.sms = 0;
        } else {
            this.sms = i12;
        }
        if ((i5 & 8) == 0) {
            this.voice = 0;
        } else {
            this.voice = i13;
        }
        if ((i5 & 16) == 0) {
            this.isFreeTrial = false;
        } else {
            this.isFreeTrial = z11;
        }
    }

    public TrialDto(int i5, long j11, int i11, int i12, boolean z11) {
        this.durationHours = i5;
        this.data = j11;
        this.sms = i11;
        this.voice = i12;
        this.isFreeTrial = z11;
    }

    public /* synthetic */ TrialDto(int i5, long j11, int i11, int i12, boolean z11, int i13, DefaultConstructorMarker defaultConstructorMarker) {
        this((i13 & 1) != 0 ? 0 : i5, (i13 & 2) != 0 ? 0L : j11, (i13 & 4) != 0 ? 0 : i11, (i13 & 8) != 0 ? 0 : i12, (i13 & 16) != 0 ? false : z11);
    }
}
