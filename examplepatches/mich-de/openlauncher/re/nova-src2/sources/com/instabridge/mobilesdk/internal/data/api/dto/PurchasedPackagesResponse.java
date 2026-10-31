package com.instabridge.mobilesdk.internal.data.api.dto;

import a80.m;
import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.JvmField;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 %2\u00020\u0001:\u0002$%B+\u0012\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0006\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tB;\b\u0010\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u000e\u0010\u0002\u001a\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\u0004\b\b\u0010\u000eJ\u000f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0006HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0006HÆ\u0003J-\u0010\u0016\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0017\u001a\u00020\u00062\b\u0010\u0018\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0019\u001a\u00020\u000bHÖ\u0001J\t\u0010\u001a\u001a\u00020\u001bHÖ\u0001J%\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u00002\u0006\u0010\u001f\u001a\u00020 2\u0006\u0010!\u001a\u00020\"H\u0001¢\u0006\u0002\b#R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0011R\u0011\u0010\u0007\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0011¨\u0006&"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedPackagesResponse;", b.f42142b, "purchasedMobileData", b.f42142b, "Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedMobileDatumDto;", "isEligibleForNewEsim", b.f42142b, "hasEverPurchasedPackage", "<init>", "(Ljava/util/List;ZZ)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/util/List;ZZLkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getPurchasedMobileData", "()Ljava/util/List;", "()Z", "getHasEverPurchasedPackage", "component1", "component2", "component3", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", b.f42142b, "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class PurchasedPackagesResponse {
    private final boolean hasEverPurchasedPackage;
    private final boolean isEligibleForNewEsim;

    @NotNull
    private final List<PurchasedMobileDatumDto> purchasedMobileData;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;

    @JvmField
    @NotNull
    private static final KSerializer<Object>[] $childSerializers = {new ArrayListSerializer(PurchasedMobileDatumDto$$serializer.INSTANCE), null, null};

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedPackagesResponse$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedPackagesResponse;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<PurchasedPackagesResponse> serializer() {
            return PurchasedPackagesResponse$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public PurchasedPackagesResponse() {
        this((List) null, false, false, 7, (DefaultConstructorMarker) null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ PurchasedPackagesResponse copy$default(PurchasedPackagesResponse purchasedPackagesResponse, List list, boolean z11, boolean z12, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            list = purchasedPackagesResponse.purchasedMobileData;
        }
        if ((i5 & 2) != 0) {
            z11 = purchasedPackagesResponse.isEligibleForNewEsim;
        }
        if ((i5 & 4) != 0) {
            z12 = purchasedPackagesResponse.hasEverPurchasedPackage;
        }
        return purchasedPackagesResponse.copy(list, z11, z12);
    }

    @JvmStatic
    public static final void write$Self$mobile_sdk_release(PurchasedPackagesResponse self, CompositeEncoder output, SerialDescriptor serialDesc) {
        KSerializer<Object>[] kSerializerArr = $childSerializers;
        if (output.shouldEncodeElementDefault(serialDesc, 0) || !Intrinsics.b(self.purchasedMobileData, EmptyList.f71733a)) {
            output.encodeSerializableElement(serialDesc, 0, kSerializerArr[0], self.purchasedMobileData);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.isEligibleForNewEsim) {
            output.encodeBooleanElement(serialDesc, 1, self.isEligibleForNewEsim);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.hasEverPurchasedPackage) {
            output.encodeBooleanElement(serialDesc, 2, self.hasEverPurchasedPackage);
        }
    }

    @NotNull
    public final List<PurchasedMobileDatumDto> component1() {
        return this.purchasedMobileData;
    }

    /* renamed from: component2, reason: from getter */
    public final boolean getIsEligibleForNewEsim() {
        return this.isEligibleForNewEsim;
    }

    /* renamed from: component3, reason: from getter */
    public final boolean getHasEverPurchasedPackage() {
        return this.hasEverPurchasedPackage;
    }

    @NotNull
    public final PurchasedPackagesResponse copy(@NotNull List<PurchasedMobileDatumDto> purchasedMobileData, boolean isEligibleForNewEsim, boolean hasEverPurchasedPackage) {
        Intrinsics.g(purchasedMobileData, "purchasedMobileData");
        return new PurchasedPackagesResponse(purchasedMobileData, isEligibleForNewEsim, hasEverPurchasedPackage);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PurchasedPackagesResponse)) {
            return false;
        }
        PurchasedPackagesResponse purchasedPackagesResponse = (PurchasedPackagesResponse) other;
        return Intrinsics.b(this.purchasedMobileData, purchasedPackagesResponse.purchasedMobileData) && this.isEligibleForNewEsim == purchasedPackagesResponse.isEligibleForNewEsim && this.hasEverPurchasedPackage == purchasedPackagesResponse.hasEverPurchasedPackage;
    }

    public final boolean getHasEverPurchasedPackage() {
        return this.hasEverPurchasedPackage;
    }

    @NotNull
    public final List<PurchasedMobileDatumDto> getPurchasedMobileData() {
        return this.purchasedMobileData;
    }

    public int hashCode() {
        return Boolean.hashCode(this.hasEverPurchasedPackage) + c9.f(this.purchasedMobileData.hashCode() * 31, 31, this.isEligibleForNewEsim);
    }

    public final boolean isEligibleForNewEsim() {
        return this.isEligibleForNewEsim;
    }

    @NotNull
    public String toString() {
        List<PurchasedMobileDatumDto> list = this.purchasedMobileData;
        boolean z11 = this.isEligibleForNewEsim;
        boolean z12 = this.hasEverPurchasedPackage;
        StringBuilder sb2 = new StringBuilder("PurchasedPackagesResponse(purchasedMobileData=");
        sb2.append(list);
        sb2.append(", isEligibleForNewEsim=");
        sb2.append(z11);
        sb2.append(", hasEverPurchasedPackage=");
        return m.k(sb2, z12, ")");
    }

    public PurchasedPackagesResponse(List list, boolean z11, boolean z12, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? EmptyList.f71733a : list, (i5 & 2) != 0 ? false : z11, (i5 & 4) != 0 ? false : z12);
    }

    public PurchasedPackagesResponse(int i5, List list, boolean z11, boolean z12, SerializationConstructorMarker serializationConstructorMarker) {
        this.purchasedMobileData = (i5 & 1) == 0 ? EmptyList.f71733a : list;
        if ((i5 & 2) == 0) {
            this.isEligibleForNewEsim = false;
        } else {
            this.isEligibleForNewEsim = z11;
        }
        if ((i5 & 4) == 0) {
            this.hasEverPurchasedPackage = false;
        } else {
            this.hasEverPurchasedPackage = z12;
        }
    }

    public PurchasedPackagesResponse(@NotNull List<PurchasedMobileDatumDto> purchasedMobileData, boolean z11, boolean z12) {
        Intrinsics.g(purchasedMobileData, "purchasedMobileData");
        this.purchasedMobileData = purchasedMobileData;
        this.isEligibleForNewEsim = z11;
        this.hasEverPurchasedPackage = z12;
    }
}
