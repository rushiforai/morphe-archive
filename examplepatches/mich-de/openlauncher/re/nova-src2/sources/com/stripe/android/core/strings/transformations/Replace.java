package com.stripe.android.core.strings.transformations;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import gi.g;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/core/strings/transformations/Replace;", "Lcom/stripe/android/core/strings/transformations/TransformOperation;", "stripe-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class Replace implements TransformOperation {

    @NotNull
    public static final Parcelable.Creator<Replace> CREATOR = new g(23);

    /* renamed from: a, reason: collision with root package name */
    public final String f42588a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42589b;

    public Replace(String original, String replacement) {
        Intrinsics.g(original, "original");
        Intrinsics.g(replacement, "replacement");
        this.f42588a = original;
        this.f42589b = replacement;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Replace)) {
            return false;
        }
        Replace replace = (Replace) obj;
        return Intrinsics.b(this.f42588a, replace.f42588a) && Intrinsics.b(this.f42589b, replace.f42589b);
    }

    public final int hashCode() {
        return this.f42589b.hashCode() + (this.f42588a.hashCode() * 31);
    }

    public final String toString() {
        return c0.n("Replace(original=", this.f42588a, ", replacement=", this.f42589b, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42588a);
        dest.writeString(this.f42589b);
    }
}
