package com.stripe.android.stripe3ds2.init.ui;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.jvm.internal.Intrinsics;
import nv.f;
import p50.i;
import sv.a;

/* loaded from: classes4.dex */
public final class StripeButtonCustomization extends BaseCustomization implements Parcelable, a {
    public static final Parcelable.Creator<StripeButtonCustomization> CREATOR = new f(26);

    /* renamed from: d, reason: collision with root package name */
    public String f45035d;

    /* renamed from: e, reason: collision with root package name */
    public int f45036e;

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof StripeButtonCustomization)) {
            return false;
        }
        StripeButtonCustomization stripeButtonCustomization = (StripeButtonCustomization) obj;
        return Intrinsics.b(this.f45035d, stripeButtonCustomization.f45035d) && this.f45036e == stripeButtonCustomization.f45036e;
    }

    public final int hashCode() {
        return i.q(this.f45035d, Integer.valueOf(this.f45036e));
    }

    @Override // com.stripe.android.stripe3ds2.init.ui.BaseCustomization, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        super.writeToParcel(parcel, i5);
        parcel.writeString(this.f45035d);
        parcel.writeInt(this.f45036e);
    }
}
