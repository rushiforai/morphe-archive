package com.google.android.gms.wallet;

import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import fg.a;
import gi.g;

/* loaded from: classes3.dex */
public class PaymentCardRecognitionIntentResponse extends AbstractSafeParcelable {
    public static final Parcelable.Creator<PaymentCardRecognitionIntentResponse> CREATOR = new g(10);

    /* renamed from: f, reason: collision with root package name */
    public PendingIntent f33882f;

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.b0(parcel, 1, this.f33882f, i5);
        a.k0(parcel, iJ0);
    }
}
