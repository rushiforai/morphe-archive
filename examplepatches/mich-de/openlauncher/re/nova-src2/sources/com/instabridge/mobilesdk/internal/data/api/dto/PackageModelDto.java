package com.instabridge.mobilesdk.internal.data.api.dto;

import a80.m;
import b.c0;
import b.c9;
import b.u4;
import com.amplitude.android.TrackingOptions;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b#\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 A2\u00020\u0001:\u0002@AB}\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0003\u0012\b\b\u0002\u0010\b\u001a\u00020\u0003\u0012\b\b\u0002\u0010\t\u001a\u00020\u0003\u0012\b\b\u0002\u0010\n\u001a\u00020\u000b\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u000e\u001a\u00020\u000f\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0011\u0010\u0012B{\b\u0010\u0012\u0006\u0010\u0013\u001a\u00020\u000b\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\u0006\u0010\b\u001a\u00020\u0003\u0012\u0006\u0010\t\u001a\u00020\u0003\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\b\u0010\f\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\r\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u000e\u001a\u00020\u000f\u0012\b\u0010\u0010\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0014\u001a\u0004\u0018\u00010\u0015¢\u0006\u0004\b\u0011\u0010\u0016J\t\u0010(\u001a\u00020\u0003HÆ\u0003J\u000b\u0010)\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010*\u001a\u00020\u0003HÆ\u0003J\t\u0010+\u001a\u00020\u0003HÆ\u0003J\t\u0010,\u001a\u00020\u0003HÆ\u0003J\t\u0010-\u001a\u00020\u0003HÆ\u0003J\t\u0010.\u001a\u00020\u000bHÆ\u0003J\u000b\u0010/\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u00100\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u00101\u001a\u00020\u000fHÆ\u0003J\u000b\u00102\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u007f\u00103\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u00032\b\b\u0002\u0010\b\u001a\u00020\u00032\b\b\u0002\u0010\t\u001a\u00020\u00032\b\b\u0002\u0010\n\u001a\u00020\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u00104\u001a\u00020\u000f2\b\u00105\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u00106\u001a\u00020\u000bHÖ\u0001J\t\u00107\u001a\u00020\u0005HÖ\u0001J%\u00108\u001a\u0002092\u0006\u0010:\u001a\u00020\u00002\u0006\u0010;\u001a\u00020<2\u0006\u0010=\u001a\u00020>H\u0001¢\u0006\u0002\b?R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0018R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u001aR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u0018R\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u0018R\u001c\u0010\b\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u001d\u0010\u001e\u001a\u0004\b\u001f\u0010\u0018R\u0011\u0010\t\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b \u0010\u0018R\u0011\u0010\n\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b!\u0010\"R\u0013\u0010\f\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b#\u0010\u001aR\u001e\u0010\r\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b$\u0010\u001e\u001a\u0004\b%\u0010\u001aR\u0011\u0010\u000e\u001a\u00020\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010&R\u0013\u0010\u0010\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b'\u0010\u001a¨\u0006B"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PackageModelDto;", b.f42142b, "packageId", b.f42142b, PendingUpgradeStore.KEY_NAME, b.f42142b, "amount", ActionCategory.SMS, "voice", "durationHours", "cycles", b.f42142b, TTConst.TRACK_TYPE, "externalPlanType", "isPremium", b.f42142b, TrackingOptions.AMP_TRACKING_OPTION_REGION, "<init>", "(JLjava/lang/String;JJJJILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V", "seen0", "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(IJLjava/lang/String;JJJJILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getPackageId", "()J", "getName", "()Ljava/lang/String;", "getAmount", "getSms", "getVoice$annotations", "()V", "getVoice", "getDurationHours", "getCycles", "()I", "getType", "getExternalPlanType$annotations", "getExternalPlanType", "()Z", "getRegion", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class PackageModelDto {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private final long amount;
    private final int cycles;
    private final long durationHours;

    @Nullable
    private final String externalPlanType;
    private final boolean isPremium;

    @Nullable
    private final String name;
    private final long packageId;

    @Nullable
    private final String region;
    private final long sms;

    @Nullable
    private final String type;
    private final long voice;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PackageModelDto$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PackageModelDto;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<PackageModelDto> serializer() {
            return PackageModelDto$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public PackageModelDto() {
        this(0L, (String) null, 0L, 0L, 0L, 0L, 0, (String) null, (String) null, false, (String) null, 2047, (DefaultConstructorMarker) null);
    }

    @SerialName("external_plan_type")
    public static /* synthetic */ void getExternalPlanType$annotations() {
    }

    @SerialName("voice")
    public static /* synthetic */ void getVoice$annotations() {
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(PackageModelDto self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.packageId != 0) {
            output.encodeLongElement(serialDesc, 0, self.packageId);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.name != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.name);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.amount != 0) {
            output.encodeLongElement(serialDesc, 2, self.amount);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.sms != 0) {
            output.encodeLongElement(serialDesc, 3, self.sms);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.voice != 0) {
            output.encodeLongElement(serialDesc, 4, self.voice);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || self.durationHours != 0) {
            output.encodeLongElement(serialDesc, 5, self.durationHours);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 6) || self.cycles != 1) {
            output.encodeIntElement(serialDesc, 6, self.cycles);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 7) || self.type != null) {
            output.encodeNullableSerializableElement(serialDesc, 7, StringSerializer.INSTANCE, self.type);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 8) || self.externalPlanType != null) {
            output.encodeNullableSerializableElement(serialDesc, 8, StringSerializer.INSTANCE, self.externalPlanType);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 9) || self.isPremium) {
            output.encodeBooleanElement(serialDesc, 9, self.isPremium);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 10) && self.region == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 10, StringSerializer.INSTANCE, self.region);
    }

    /* renamed from: component1, reason: from getter */
    public final long getPackageId() {
        return this.packageId;
    }

    /* renamed from: component10, reason: from getter */
    public final boolean getIsPremium() {
        return this.isPremium;
    }

    @Nullable
    /* renamed from: component11, reason: from getter */
    public final String getRegion() {
        return this.region;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getName() {
        return this.name;
    }

    /* renamed from: component3, reason: from getter */
    public final long getAmount() {
        return this.amount;
    }

    /* renamed from: component4, reason: from getter */
    public final long getSms() {
        return this.sms;
    }

    /* renamed from: component5, reason: from getter */
    public final long getVoice() {
        return this.voice;
    }

    /* renamed from: component6, reason: from getter */
    public final long getDurationHours() {
        return this.durationHours;
    }

    /* renamed from: component7, reason: from getter */
    public final int getCycles() {
        return this.cycles;
    }

    @Nullable
    /* renamed from: component8, reason: from getter */
    public final String getType() {
        return this.type;
    }

    @Nullable
    /* renamed from: component9, reason: from getter */
    public final String getExternalPlanType() {
        return this.externalPlanType;
    }

    @NotNull
    public final PackageModelDto copy(long packageId, @Nullable String name, long amount, long sms, long voice, long durationHours, int cycles, @Nullable String type, @Nullable String externalPlanType, boolean isPremium, @Nullable String region) {
        return new PackageModelDto(packageId, name, amount, sms, voice, durationHours, cycles, type, externalPlanType, isPremium, region);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PackageModelDto)) {
            return false;
        }
        PackageModelDto packageModelDto = (PackageModelDto) other;
        return this.packageId == packageModelDto.packageId && Intrinsics.b(this.name, packageModelDto.name) && this.amount == packageModelDto.amount && this.sms == packageModelDto.sms && this.voice == packageModelDto.voice && this.durationHours == packageModelDto.durationHours && this.cycles == packageModelDto.cycles && Intrinsics.b(this.type, packageModelDto.type) && Intrinsics.b(this.externalPlanType, packageModelDto.externalPlanType) && this.isPremium == packageModelDto.isPremium && Intrinsics.b(this.region, packageModelDto.region);
    }

    public final long getAmount() {
        return this.amount;
    }

    public final int getCycles() {
        return this.cycles;
    }

    public final long getDurationHours() {
        return this.durationHours;
    }

    @Nullable
    public final String getExternalPlanType() {
        return this.externalPlanType;
    }

    @Nullable
    public final String getName() {
        return this.name;
    }

    public final long getPackageId() {
        return this.packageId;
    }

    @Nullable
    public final String getRegion() {
        return this.region;
    }

    public final long getSms() {
        return this.sms;
    }

    @Nullable
    public final String getType() {
        return this.type;
    }

    public final long getVoice() {
        return this.voice;
    }

    public int hashCode() {
        int iHashCode = Long.hashCode(this.packageId) * 31;
        String str = this.name;
        int iA = u4.a(this.cycles, c0.d(c0.d(c0.d(c0.d((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.amount), 31, this.sms), 31, this.voice), 31, this.durationHours), 31);
        String str2 = this.type;
        int iHashCode2 = (iA + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.externalPlanType;
        int iF = c9.f((iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31, 31, this.isPremium);
        String str4 = this.region;
        return iF + (str4 != null ? str4.hashCode() : 0);
    }

    public final boolean isPremium() {
        return this.isPremium;
    }

    @NotNull
    public String toString() {
        long j11 = this.packageId;
        String str = this.name;
        long j12 = this.amount;
        long j13 = this.sms;
        long j14 = this.voice;
        long j15 = this.durationHours;
        int i5 = this.cycles;
        String str2 = this.type;
        String str3 = this.externalPlanType;
        boolean z11 = this.isPremium;
        String str4 = this.region;
        StringBuilder sbL = m.l(j11, "PackageModelDto(packageId=", ", name=", str);
        c0.B(sbL, ", amount=", j12, ", sms=");
        sbL.append(j13);
        c0.B(sbL, ", voice=", j14, ", durationHours=");
        sbL.append(j15);
        sbL.append(", cycles=");
        sbL.append(i5);
        c0.D(sbL, ", type=", str2, ", externalPlanType=", str3);
        sbL.append(", isPremium=");
        sbL.append(z11);
        sbL.append(", region=");
        sbL.append(str4);
        sbL.append(")");
        return sbL.toString();
    }

    public /* synthetic */ PackageModelDto(int i5, long j11, String str, long j12, long j13, long j14, long j15, int i11, String str2, String str3, boolean z11, String str4, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.packageId = 0L;
        } else {
            this.packageId = j11;
        }
        if ((i5 & 2) == 0) {
            this.name = null;
        } else {
            this.name = str;
        }
        if ((i5 & 4) == 0) {
            this.amount = 0L;
        } else {
            this.amount = j12;
        }
        if ((i5 & 8) == 0) {
            this.sms = 0L;
        } else {
            this.sms = j13;
        }
        if ((i5 & 16) == 0) {
            this.voice = 0L;
        } else {
            this.voice = j14;
        }
        if ((i5 & 32) == 0) {
            this.durationHours = 0L;
        } else {
            this.durationHours = j15;
        }
        this.cycles = (i5 & 64) == 0 ? 1 : i11;
        if ((i5 & 128) == 0) {
            this.type = null;
        } else {
            this.type = str2;
        }
        if ((i5 & 256) == 0) {
            this.externalPlanType = null;
        } else {
            this.externalPlanType = str3;
        }
        this.isPremium = (i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0 ? false : z11;
        if ((i5 & 1024) == 0) {
            this.region = null;
        } else {
            this.region = str4;
        }
    }

    public PackageModelDto(long j11, @Nullable String str, long j12, long j13, long j14, long j15, int i5, @Nullable String str2, @Nullable String str3, boolean z11, @Nullable String str4) {
        this.packageId = j11;
        this.name = str;
        this.amount = j12;
        this.sms = j13;
        this.voice = j14;
        this.durationHours = j15;
        this.cycles = i5;
        this.type = str2;
        this.externalPlanType = str3;
        this.isPremium = z11;
        this.region = str4;
    }

    public /* synthetic */ PackageModelDto(long j11, String str, long j12, long j13, long j14, long j15, int i5, String str2, String str3, boolean z11, String str4, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this((i11 & 1) != 0 ? 0L : j11, (i11 & 2) != 0 ? null : str, (i11 & 4) != 0 ? 0L : j12, (i11 & 8) != 0 ? 0L : j13, (i11 & 16) != 0 ? 0L : j14, (i11 & 32) == 0 ? j15 : 0L, (i11 & 64) != 0 ? 1 : i5, (i11 & 128) != 0 ? null : str2, (i11 & 256) != 0 ? null : str3, (i11 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? false : z11, (i11 & 1024) != 0 ? null : str4);
    }
}
