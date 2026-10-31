package com.vungle.ads.fpd;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
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
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import org.jetbrains.annotations.NotNull;

@Metadata(bv = {}, d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u0000 \u001c2\u00020\u0001:\u0002\u001d\u001cB\u0007¢\u0006\u0004\b\u0015\u0010\u0016B3\b\u0017\u0012\u0006\u0010\u0017\u001a\u00020\f\u0012\n\b\u0001\u0010\u0018\u001a\u0004\u0018\u00010\f\u0012\n\b\u0001\u0010\n\u001a\u0004\u0018\u00010\f\u0012\b\u0010\u001a\u001a\u0004\u0018\u00010\u0019¢\u0006\u0004\b\u0015\u0010\u001bJ!\u0010\b\u001a\u00020\u00072\u0006\u0010\u0002\u001a\u00020\u00002\u0006\u0010\u0004\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u0005HÇ\u0001J\u000e\u0010\u000b\u001a\u00020\u00002\u0006\u0010\n\u001a\u00020\tJ\u000e\u0010\u000e\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\fJ\u0010\u0010\u0010\u001a\u00020\u00002\u0006\u0010\u000f\u001a\u00020\fH\u0007J\u0010\u0010\u0012\u001a\u00020\u00002\u0006\u0010\u0011\u001a\u00020\fH\u0007J\u0010\u0010\u0014\u001a\u00020\u00002\u0006\u0010\u0013\u001a\u00020\fH\u0007¨\u0006\u001e"}, d2 = {"Lcom/vungle/ads/fpd/Demographic;", b.f42142b, "self", "Lkotlinx/serialization/encoding/CompositeEncoder;", "output", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialDesc", b.f42142b, "write$Self", "Lcom/vungle/ads/fpd/LiftoffGender;", InneractiveMediationDefs.KEY_GENDER, "setGender", b.f42142b, InneractiveMediationDefs.KEY_AGE, "setAgeRange", "lengthOfResidence", "setLengthOfResidence", "homeValue", "setMedianHomeValueUSD", "housingCost", "setMonthlyHousingCosts", "<init>", "()V", "seen1", "ageRange", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "serializationConstructorMarker", "(ILjava/lang/Integer;Ljava/lang/Integer;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", k.O, "$serializer", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
@Serializable
/* loaded from: classes4.dex */
public final class Demographic {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    /* renamed from: a, reason: collision with root package name */
    public Integer f46689a;

    /* renamed from: b, reason: collision with root package name */
    public Integer f46690b;

    @Metadata(bv = {}, d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0086\u0003\u0018\u00002\u00020\u0001J\u000f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0002HÆ\u0001¨\u0006\u0005"}, d2 = {"Lcom/vungle/ads/fpd/Demographic$Companion;", b.f42142b, "Lkotlinx/serialization/KSerializer;", "Lcom/vungle/ads/fpd/Demographic;", "serializer", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final KSerializer<Demographic> serializer() {
            return Demographic$$serializer.INSTANCE;
        }

        public Companion() {
        }
    }

    public Demographic() {
    }

    @JvmStatic
    public static final void write$Self(@NotNull Demographic self, @NotNull CompositeEncoder output, @NotNull SerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f46689a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, IntSerializer.INSTANCE, self.f46689a);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 1) && self.f46690b == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 1, IntSerializer.INSTANCE, self.f46690b);
    }

    @NotNull
    public final Demographic setAgeRange(int age) {
        this.f46689a = Integer.valueOf(AgeRange.INSTANCE.fromAge$vungle_ads_release(age).getId());
        return this;
    }

    @NotNull
    public final Demographic setGender(@NotNull LiftoffGender gender) {
        Intrinsics.g(gender, "gender");
        this.f46690b = Integer.valueOf(gender.getValue());
        return this;
    }

    @Deprecated
    @NotNull
    public final Demographic setLengthOfResidence(int lengthOfResidence) {
        return this;
    }

    @Deprecated
    @NotNull
    public final Demographic setMedianHomeValueUSD(int homeValue) {
        return this;
    }

    @Deprecated
    @NotNull
    public final Demographic setMonthlyHousingCosts(int housingCost) {
        return this;
    }

    @Deprecated
    public /* synthetic */ Demographic(int i5, @SerialName("age_range") Integer num, @SerialName(InneractiveMediationDefs.KEY_GENDER) Integer num2, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.f46689a = null;
        } else {
            this.f46689a = num;
        }
        if ((i5 & 2) == 0) {
            this.f46690b = null;
        } else {
            this.f46690b = num2;
        }
    }
}
