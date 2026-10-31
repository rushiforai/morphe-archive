package com.stripe.android.lpmfoundations.paymentmethod;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.core.strings.ResolvableString;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/DisplayableCustomPaymentMethod;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class DisplayableCustomPaymentMethod implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<DisplayableCustomPaymentMethod> CREATOR = new cf.a(23);

    /* renamed from: a, reason: collision with root package name */
    public final String f43080a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43081b;

    /* renamed from: c, reason: collision with root package name */
    public final String f43082c;

    /* renamed from: d, reason: collision with root package name */
    public final ResolvableString f43083d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f43084e;

    public DisplayableCustomPaymentMethod(String id2, String displayName, String logoUrl, ResolvableString resolvableString, boolean z11) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(displayName, "displayName");
        Intrinsics.g(logoUrl, "logoUrl");
        this.f43080a = id2;
        this.f43081b = displayName;
        this.f43082c = logoUrl;
        this.f43083d = resolvableString;
        this.f43084e = z11;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof DisplayableCustomPaymentMethod)) {
            return false;
        }
        DisplayableCustomPaymentMethod displayableCustomPaymentMethod = (DisplayableCustomPaymentMethod) obj;
        return Intrinsics.b(this.f43080a, displayableCustomPaymentMethod.f43080a) && Intrinsics.b(this.f43081b, displayableCustomPaymentMethod.f43081b) && Intrinsics.b(this.f43082c, displayableCustomPaymentMethod.f43082c) && Intrinsics.b(this.f43083d, displayableCustomPaymentMethod.f43083d) && this.f43084e == displayableCustomPaymentMethod.f43084e;
    }

    public final int hashCode() {
        int iE = c0.e(c0.e(this.f43080a.hashCode() * 31, 31, this.f43081b), 31, this.f43082c);
        ResolvableString resolvableString = this.f43083d;
        return Boolean.hashCode(this.f43084e) + ((iE + (resolvableString == null ? 0 : resolvableString.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("DisplayableCustomPaymentMethod(id=", this.f43080a, ", displayName=", this.f43081b, ", logoUrl=");
        sbW.append(this.f43082c);
        sbW.append(", subtitle=");
        sbW.append(this.f43083d);
        sbW.append(", doesNotCollectBillingDetails=");
        return a80.m.k(sbW, this.f43084e, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43080a);
        dest.writeString(this.f43081b);
        dest.writeString(this.f43082c);
        dest.writeParcelable(this.f43083d, i5);
        dest.writeInt(this.f43084e ? 1 : 0);
    }
}
