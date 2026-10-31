package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        Parcelable.Creator<PaymentSheet$Colors> creator = PaymentSheet$Colors.CREATOR;
        PaymentSheet$Colors paymentSheet$ColorsCreateFromParcel = creator.createFromParcel(parcel);
        PaymentSheet$Colors paymentSheet$ColorsCreateFromParcel2 = creator.createFromParcel(parcel);
        PaymentSheet$Shapes paymentSheet$ShapesCreateFromParcel = PaymentSheet$Shapes.CREATOR.createFromParcel(parcel);
        PaymentSheet$Typography paymentSheet$TypographyCreateFromParcel = PaymentSheet$Typography.CREATOR.createFromParcel(parcel);
        PaymentSheet$PrimaryButton paymentSheet$PrimaryButtonCreateFromParcel = PaymentSheet$PrimaryButton.CREATOR.createFromParcel(parcel);
        PaymentSheet$Appearance.Embedded embeddedCreateFromParcel = PaymentSheet$Appearance.Embedded.CREATOR.createFromParcel(parcel);
        Parcelable.Creator<PaymentSheet$Insets> creator2 = PaymentSheet$Insets.CREATOR;
        return new PaymentSheet$Appearance(paymentSheet$ColorsCreateFromParcel, paymentSheet$ColorsCreateFromParcel2, paymentSheet$ShapesCreateFromParcel, paymentSheet$TypographyCreateFromParcel, paymentSheet$PrimaryButtonCreateFromParcel, embeddedCreateFromParcel, creator2.createFromParcel(parcel), PaymentSheet$Spacing.CREATOR.createFromParcel(parcel), creator2.createFromParcel(parcel), ou.r0.valueOf(parcel.readString()), parcel.readFloat());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSheet$Appearance[i5];
    }
}
