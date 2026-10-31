package com.stripe.android.core.strings;

import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import gi.g;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/core/strings/ConcatenatedResolvableString;", "Lcom/stripe/android/core/strings/ResolvableString;", "stripe-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class ConcatenatedResolvableString implements ResolvableString {

    @NotNull
    public static final Parcelable.Creator<ConcatenatedResolvableString> CREATOR = new g(11);

    /* renamed from: a, reason: collision with root package name */
    public final ResolvableString f42581a;

    /* renamed from: b, reason: collision with root package name */
    public final ResolvableString f42582b;

    public ConcatenatedResolvableString(ResolvableString first, ResolvableString second) {
        Intrinsics.g(first, "first");
        Intrinsics.g(second, "second");
        this.f42581a = first;
        this.f42582b = second;
    }

    @Override // com.stripe.android.core.strings.ResolvableString
    public final String T(Context context) {
        Intrinsics.g(context, "context");
        return c0.E(this.f42581a.T(context), this.f42582b.T(context));
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ConcatenatedResolvableString)) {
            return false;
        }
        ConcatenatedResolvableString concatenatedResolvableString = (ConcatenatedResolvableString) obj;
        return Intrinsics.b(this.f42581a, concatenatedResolvableString.f42581a) && Intrinsics.b(this.f42582b, concatenatedResolvableString.f42582b);
    }

    public final int hashCode() {
        return this.f42582b.hashCode() + (this.f42581a.hashCode() * 31);
    }

    public final String toString() {
        return "ConcatenatedResolvableString(first=" + this.f42581a + ", second=" + this.f42582b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f42581a, i5);
        dest.writeParcelable(this.f42582b, i5);
    }
}
