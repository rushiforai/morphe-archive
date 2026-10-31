package com.instabridge.mobilesdk.internal.data.repo;

import a80.m;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.EsimInstallStore;
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
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\r\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 .2\u00020\u0001:\u0002-.B3\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0005¢\u0006\u0004\b\t\u0010\nBK\b\u0010\u0012\u0006\u0010\u000b\u001a\u00020\f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\r\u001a\u0004\u0018\u00010\u000e¢\u0006\u0004\b\t\u0010\u000fJ\t\u0010\u001b\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001c\u001a\u00020\u0005HÆ\u0003J\t\u0010\u001d\u001a\u00020\u0005HÆ\u0003J\t\u0010\u001e\u001a\u00020\u0005HÆ\u0003J\t\u0010\u001f\u001a\u00020\u0005HÆ\u0003J;\u0010 \u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u0005HÆ\u0001J\u0013\u0010!\u001a\u00020\u00182\b\u0010\"\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010#\u001a\u00020\fHÖ\u0001J\t\u0010$\u001a\u00020\u0005HÖ\u0001J%\u0010%\u001a\u00020&2\u0006\u0010'\u001a\u00020\u00002\u0006\u0010(\u001a\u00020)2\u0006\u0010*\u001a\u00020+H\u0001¢\u0006\u0002\b,R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0013R\u0011\u0010\u0007\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0013R\u0011\u0010\b\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0013R\u0011\u0010\u0017\u001a\u00020\u00188F¢\u0006\u0006\u001a\u0004\b\u0019\u0010\u001a¨\u0006/"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/TravelEsim;", b.f42142b, "id", b.f42142b, EsimInstallStore.KEY_ICCID, b.f42142b, "activationCode", "smdpAddress", "manualActivationCode", "<init>", "(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(IJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getId", "()J", "getIccid", "()Ljava/lang/String;", "getActivationCode", "getSmdpAddress", "getManualActivationCode", "supportsManualEntry", b.f42142b, "getSupportsManualEntry", "()Z", "component1", "component2", "component3", "component4", "component5", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class TravelEsim {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private final String activationCode;

    @NotNull
    private final String iccid;
    private final long id;

    @NotNull
    private final String manualActivationCode;

    @NotNull
    private final String smdpAddress;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/TravelEsim$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelEsim;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<TravelEsim> serializer() {
            return TravelEsim$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public /* synthetic */ TravelEsim(int i5, long j11, String str, String str2, String str3, String str4, SerializationConstructorMarker serializationConstructorMarker) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, TravelEsim$$serializer.INSTANCE.getDescriptor());
        }
        this.id = j11;
        this.iccid = str;
        this.activationCode = str2;
        if ((i5 & 8) == 0) {
            this.smdpAddress = b.f42142b;
        } else {
            this.smdpAddress = str3;
        }
        if ((i5 & 16) == 0) {
            this.manualActivationCode = b.f42142b;
        } else {
            this.manualActivationCode = str4;
        }
    }

    public static /* synthetic */ TravelEsim copy$default(TravelEsim travelEsim, long j11, String str, String str2, String str3, String str4, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            j11 = travelEsim.id;
        }
        long j12 = j11;
        if ((i5 & 2) != 0) {
            str = travelEsim.iccid;
        }
        String str5 = str;
        if ((i5 & 4) != 0) {
            str2 = travelEsim.activationCode;
        }
        String str6 = str2;
        if ((i5 & 8) != 0) {
            str3 = travelEsim.smdpAddress;
        }
        String str7 = str3;
        if ((i5 & 16) != 0) {
            str4 = travelEsim.manualActivationCode;
        }
        return travelEsim.copy(j12, str5, str6, str7, str4);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(TravelEsim self, CompositeEncoder output, SerialDescriptor serialDesc) {
        output.encodeLongElement(serialDesc, 0, self.id);
        output.encodeStringElement(serialDesc, 1, self.iccid);
        output.encodeStringElement(serialDesc, 2, self.activationCode);
        if (output.shouldEncodeElementDefault(serialDesc, 3) || !Intrinsics.b(self.smdpAddress, b.f42142b)) {
            output.encodeStringElement(serialDesc, 3, self.smdpAddress);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 4) && Intrinsics.b(self.manualActivationCode, b.f42142b)) {
            return;
        }
        output.encodeStringElement(serialDesc, 4, self.manualActivationCode);
    }

    /* renamed from: component1, reason: from getter */
    public final long getId() {
        return this.id;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getIccid() {
        return this.iccid;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getActivationCode() {
        return this.activationCode;
    }

    @NotNull
    /* renamed from: component4, reason: from getter */
    public final String getSmdpAddress() {
        return this.smdpAddress;
    }

    @NotNull
    /* renamed from: component5, reason: from getter */
    public final String getManualActivationCode() {
        return this.manualActivationCode;
    }

    @NotNull
    public final TravelEsim copy(long id2, @NotNull String iccid, @NotNull String activationCode, @NotNull String smdpAddress, @NotNull String manualActivationCode) {
        Intrinsics.g(iccid, "iccid");
        Intrinsics.g(activationCode, "activationCode");
        Intrinsics.g(smdpAddress, "smdpAddress");
        Intrinsics.g(manualActivationCode, "manualActivationCode");
        return new TravelEsim(id2, iccid, activationCode, smdpAddress, manualActivationCode);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof TravelEsim)) {
            return false;
        }
        TravelEsim travelEsim = (TravelEsim) other;
        return this.id == travelEsim.id && Intrinsics.b(this.iccid, travelEsim.iccid) && Intrinsics.b(this.activationCode, travelEsim.activationCode) && Intrinsics.b(this.smdpAddress, travelEsim.smdpAddress) && Intrinsics.b(this.manualActivationCode, travelEsim.manualActivationCode);
    }

    @NotNull
    public final String getActivationCode() {
        return this.activationCode;
    }

    @NotNull
    public final String getIccid() {
        return this.iccid;
    }

    public final long getId() {
        return this.id;
    }

    @NotNull
    public final String getManualActivationCode() {
        return this.manualActivationCode;
    }

    @NotNull
    public final String getSmdpAddress() {
        return this.smdpAddress;
    }

    public final boolean getSupportsManualEntry() {
        return (r70.k.U0(this.smdpAddress) || r70.k.U0(this.manualActivationCode)) ? false : true;
    }

    public int hashCode() {
        return this.manualActivationCode.hashCode() + c0.e(c0.e(c0.e(Long.hashCode(this.id) * 31, 31, this.iccid), 31, this.activationCode), 31, this.smdpAddress);
    }

    @NotNull
    public String toString() {
        long j11 = this.id;
        String str = this.iccid;
        String str2 = this.activationCode;
        String str3 = this.smdpAddress;
        String str4 = this.manualActivationCode;
        StringBuilder sbL = m.l(j11, "TravelEsim(id=", ", iccid=", str);
        c0.D(sbL, ", activationCode=", str2, ", smdpAddress=", str3);
        return c0.r(sbL, ", manualActivationCode=", str4, ")");
    }

    public TravelEsim(long j11, @NotNull String iccid, @NotNull String activationCode, @NotNull String smdpAddress, @NotNull String manualActivationCode) {
        Intrinsics.g(iccid, "iccid");
        Intrinsics.g(activationCode, "activationCode");
        Intrinsics.g(smdpAddress, "smdpAddress");
        Intrinsics.g(manualActivationCode, "manualActivationCode");
        this.id = j11;
        this.iccid = iccid;
        this.activationCode = activationCode;
        this.smdpAddress = smdpAddress;
        this.manualActivationCode = manualActivationCode;
    }

    public /* synthetic */ TravelEsim(long j11, String str, String str2, String str3, String str4, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(j11, str, str2, (i5 & 8) != 0 ? b.f42142b : str3, (i5 & 16) != 0 ? b.f42142b : str4);
    }
}
