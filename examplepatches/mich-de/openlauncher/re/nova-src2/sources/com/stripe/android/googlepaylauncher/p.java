package com.stripe.android.googlepaylauncher;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.googlepaylauncher.GooglePayPaymentMethodLauncherContractV2;
import com.stripe.android.model.ClientAttributionMetadata;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new GooglePayPaymentMethodLauncherContractV2.Args(GooglePayPaymentMethodLauncher$Config.CREATOR.createFromParcel(parcel), parcel.readString(), parcel.readLong(), parcel.readString(), parcel.readString(), (CardBrandFilter) parcel.readParcelable(GooglePayPaymentMethodLauncherContractV2.Args.class.getClassLoader()), (CardFundingFilter) parcel.readParcelable(GooglePayPaymentMethodLauncherContractV2.Args.class.getClassLoader()), parcel.readInt() == 0 ? null : ClientAttributionMetadata.CREATOR.createFromParcel(parcel), parcel.readInt() != 0);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new GooglePayPaymentMethodLauncherContractV2.Args[i5];
    }
}
