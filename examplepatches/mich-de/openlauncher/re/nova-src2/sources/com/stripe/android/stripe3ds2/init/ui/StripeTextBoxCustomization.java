package com.stripe.android.stripe3ds2.init.ui;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.jvm.internal.Intrinsics;
import nv.f;
import p50.i;
import sv.a;

/* loaded from: classes4.dex */
public final class StripeTextBoxCustomization extends BaseCustomization implements Parcelable, a {
    public static final Parcelable.Creator<StripeTextBoxCustomization> CREATOR = new f(28);

    /* renamed from: d, reason: collision with root package name */
    public int f45040d;

    /* renamed from: e, reason: collision with root package name */
    public String f45041e;

    /* renamed from: f, reason: collision with root package name */
    public int f45042f;

    /* renamed from: g, reason: collision with root package name */
    public String f45043g;

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof StripeTextBoxCustomization)) {
            return false;
        }
        StripeTextBoxCustomization stripeTextBoxCustomization = (StripeTextBoxCustomization) obj;
        return this.f45040d == stripeTextBoxCustomization.f45040d && Intrinsics.b(this.f45041e, stripeTextBoxCustomization.f45041e) && this.f45042f == stripeTextBoxCustomization.f45042f && Intrinsics.b(this.f45043g, stripeTextBoxCustomization.f45043g);
    }

    public final int hashCode() {
        return i.q(Integer.valueOf(this.f45040d), this.f45041e, Integer.valueOf(this.f45042f), this.f45043g);
    }

    @Override // com.stripe.android.stripe3ds2.init.ui.BaseCustomization, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        super.writeToParcel(parcel, i5);
        parcel.writeInt(this.f45040d);
        parcel.writeString(this.f45041e);
        parcel.writeInt(this.f45042f);
        parcel.writeString(this.f45043g);
    }
}
