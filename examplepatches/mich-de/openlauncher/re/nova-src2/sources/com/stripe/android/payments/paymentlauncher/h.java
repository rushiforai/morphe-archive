package com.stripe.android.payments.paymentlauncher;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.internal.measurement.k2;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.payments.paymentlauncher.PaymentLauncherContract;
import java.util.LinkedHashSet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h implements Parcelable.Creator {
    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        int i5;
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        String string2 = parcel.readString();
        boolean z11 = true;
        if (parcel.readInt() != 0) {
            i5 = 1;
        } else {
            i5 = 1;
            z11 = false;
        }
        int i11 = parcel.readInt();
        LinkedHashSet linkedHashSet = new LinkedHashSet(i11);
        int iH = 0;
        while (iH != i11) {
            iH = k2.h(parcel, linkedHashSet, iH, i5);
        }
        return new PaymentLauncherContract.Args.StripeIntentNextActionWithIntentArgs(string, string2, z11, linkedHashSet, parcel.readInt() != 0 ? i5 : 0, (StripeIntent) parcel.readParcelable(PaymentLauncherContract.Args.StripeIntentNextActionWithIntentArgs.class.getClassLoader()), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentLauncherContract.Args.StripeIntentNextActionWithIntentArgs[i5];
    }
}
