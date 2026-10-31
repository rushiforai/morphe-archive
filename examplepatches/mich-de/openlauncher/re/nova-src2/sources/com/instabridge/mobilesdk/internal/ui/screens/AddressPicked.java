package com.instabridge.mobilesdk.internal.ui.screens;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.mobilesdk.internal.data.api.dto.AddressInfo;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0005HÆ\u0003J+\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0005HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\f¨\u0006\u0018"}, d2 = {"Lcom/instabridge/mobilesdk/internal/ui/screens/AddressPicked;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, PlaceTypes.ADDRESS, "Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;", "firstName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "lastName", "<init>", "(Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;Ljava/lang/String;Ljava/lang/String;)V", "getAddress", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;", "getFirstName", "()Ljava/lang/String;", "getLastName", "component1", "component2", "component3", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final /* data */ class AddressPicked {

    @NotNull
    private final AddressInfo address;

    @Nullable
    private final String firstName;

    @Nullable
    private final String lastName;

    public AddressPicked(@NotNull AddressInfo address, @Nullable String str, @Nullable String str2) {
        Intrinsics.g(address, "address");
        this.address = address;
        this.firstName = str;
        this.lastName = str2;
    }

    public static /* synthetic */ AddressPicked copy$default(AddressPicked addressPicked, AddressInfo addressInfo, String str, String str2, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            addressInfo = addressPicked.address;
        }
        if ((i5 & 2) != 0) {
            str = addressPicked.firstName;
        }
        if ((i5 & 4) != 0) {
            str2 = addressPicked.lastName;
        }
        return addressPicked.copy(addressInfo, str, str2);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final AddressInfo getAddress() {
        return this.address;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getFirstName() {
        return this.firstName;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getLastName() {
        return this.lastName;
    }

    @NotNull
    public final AddressPicked copy(@NotNull AddressInfo address, @Nullable String firstName, @Nullable String lastName) {
        Intrinsics.g(address, "address");
        return new AddressPicked(address, firstName, lastName);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AddressPicked)) {
            return false;
        }
        AddressPicked addressPicked = (AddressPicked) other;
        return Intrinsics.b(this.address, addressPicked.address) && Intrinsics.b(this.firstName, addressPicked.firstName) && Intrinsics.b(this.lastName, addressPicked.lastName);
    }

    @NotNull
    public final AddressInfo getAddress() {
        return this.address;
    }

    @Nullable
    public final String getFirstName() {
        return this.firstName;
    }

    @Nullable
    public final String getLastName() {
        return this.lastName;
    }

    public int hashCode() {
        int iHashCode = this.address.hashCode() * 31;
        String str = this.firstName;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.lastName;
        return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        AddressInfo addressInfo = this.address;
        String str = this.firstName;
        String str2 = this.lastName;
        StringBuilder sb2 = new StringBuilder("AddressPicked(address=");
        sb2.append(addressInfo);
        sb2.append(", firstName=");
        sb2.append(str);
        sb2.append(", lastName=");
        return b.c0.q(sb2, str2, ")");
    }
}
