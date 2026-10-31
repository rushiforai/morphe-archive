package com.stripe.android.cards;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import gi.g;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/cards/Bin;", "Lcom/stripe/android/core/model/StripeModel;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class Bin implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<Bin> CREATOR = new g(22);

    /* renamed from: a, reason: collision with root package name */
    public final String f42483a;

    public Bin(String value) {
        Intrinsics.g(value, "value");
        this.f42483a = value;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof Bin) && Intrinsics.b(this.f42483a, ((Bin) obj).f42483a);
    }

    public final int hashCode() {
        return this.f42483a.hashCode();
    }

    /* renamed from: toString, reason: from getter */
    public final String getF42483a() {
        return this.f42483a;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42483a);
    }
}
