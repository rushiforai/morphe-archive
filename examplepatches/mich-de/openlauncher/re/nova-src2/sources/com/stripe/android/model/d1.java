package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ElementsSession;
import com.stripe.android.model.PaymentMethod;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d1 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean z11;
        e1 e1Var;
        f1 f1Var;
        PaymentMethod.AllowRedisplay allowRedisplay;
        boolean z12;
        Intrinsics.g(parcel, "parcel");
        boolean z13 = false;
        if (parcel.readInt() != 0) {
            z11 = false;
            z13 = true;
        } else {
            z11 = false;
        }
        e1 e1VarValueOf = e1.valueOf(parcel.readString());
        f1 f1VarValueOf = f1.valueOf(parcel.readString());
        PaymentMethod.AllowRedisplay allowRedisplayCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethod.AllowRedisplay.CREATOR.createFromParcel(parcel);
        if (parcel.readInt() != 0) {
            z12 = true;
            e1Var = e1VarValueOf;
            f1Var = f1VarValueOf;
            allowRedisplay = allowRedisplayCreateFromParcel;
        } else {
            e1Var = e1VarValueOf;
            f1Var = f1VarValueOf;
            allowRedisplay = allowRedisplayCreateFromParcel;
            z12 = z11;
        }
        return new ElementsSession.Customer.Components.MobilePaymentElement.Enabled(z13, e1Var, f1Var, allowRedisplay, z12);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ElementsSession.Customer.Components.MobilePaymentElement.Enabled[i5];
    }
}
