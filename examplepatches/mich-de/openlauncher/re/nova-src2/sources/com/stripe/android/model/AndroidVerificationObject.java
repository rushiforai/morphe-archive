package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/AndroidVerificationObject;", "Lcom/stripe/android/model/StripeParamsModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class AndroidVerificationObject implements StripeParamsModel {

    @NotNull
    public static final Parcelable.Creator<AndroidVerificationObject> CREATOR = new eh.a(14);

    /* renamed from: a, reason: collision with root package name */
    public final String f43133a;

    public AndroidVerificationObject(String str) {
        this.f43133a = str;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof AndroidVerificationObject) && Intrinsics.b(this.f43133a, ((AndroidVerificationObject) obj).f43133a);
    }

    public final int hashCode() {
        String str = this.f43133a;
        if (str == null) {
            return 0;
        }
        return str.hashCode();
    }

    @Override // com.stripe.android.model.StripeParamsModel
    public final Map k0() {
        String str = this.f43133a;
        Map mapN = str != null ? a80.m.n("android_verification_token", str) : null;
        return mapN == null ? b70.h.f17594a : mapN;
    }

    public final String toString() {
        return b.c0.l("AndroidVerificationObject(androidVerificationToken=", this.f43133a, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43133a);
    }
}
