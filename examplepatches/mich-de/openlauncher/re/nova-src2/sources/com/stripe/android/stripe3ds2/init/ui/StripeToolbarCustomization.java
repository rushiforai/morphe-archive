package com.stripe.android.stripe3ds2.init.ui;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.jvm.internal.Intrinsics;
import nv.f;
import p50.i;
import sv.a;

/* loaded from: classes4.dex */
public final class StripeToolbarCustomization extends BaseCustomization implements Parcelable, a {
    public static final Parcelable.Creator<StripeToolbarCustomization> CREATOR = new f(29);

    /* renamed from: d, reason: collision with root package name */
    public String f45044d;

    /* renamed from: e, reason: collision with root package name */
    public String f45045e;

    /* renamed from: f, reason: collision with root package name */
    public String f45046f;

    /* renamed from: g, reason: collision with root package name */
    public String f45047g;

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof StripeToolbarCustomization)) {
            return false;
        }
        StripeToolbarCustomization stripeToolbarCustomization = (StripeToolbarCustomization) obj;
        return Intrinsics.b(this.f45044d, stripeToolbarCustomization.f45044d) && Intrinsics.b(this.f45045e, stripeToolbarCustomization.f45045e) && Intrinsics.b(this.f45046f, stripeToolbarCustomization.f45046f) && Intrinsics.b(this.f45047g, stripeToolbarCustomization.f45047g);
    }

    public final int hashCode() {
        return i.q(this.f45044d, this.f45045e, this.f45046f, this.f45047g);
    }

    @Override // com.stripe.android.stripe3ds2.init.ui.BaseCustomization, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        super.writeToParcel(parcel, i5);
        parcel.writeString(this.f45044d);
        parcel.writeString(this.f45045e);
        parcel.writeString(this.f45046f);
        parcel.writeString(this.f45047g);
    }
}
