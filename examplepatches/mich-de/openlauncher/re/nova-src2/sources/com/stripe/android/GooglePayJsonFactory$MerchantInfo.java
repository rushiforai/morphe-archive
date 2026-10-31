package com.stripe.android;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/GooglePayJsonFactory$MerchantInfo", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class GooglePayJsonFactory$MerchantInfo implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<GooglePayJsonFactory$MerchantInfo> CREATOR = new di.b(7);

    /* renamed from: a, reason: collision with root package name */
    public final String f42426a;

    /* renamed from: b, reason: collision with root package name */
    public final GooglePayJsonFactory$SoftwareInfo f42427b;

    public GooglePayJsonFactory$MerchantInfo(String str, GooglePayJsonFactory$SoftwareInfo softwareInfo) {
        Intrinsics.g(softwareInfo, "softwareInfo");
        this.f42426a = str;
        this.f42427b = softwareInfo;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof GooglePayJsonFactory$MerchantInfo)) {
            return false;
        }
        GooglePayJsonFactory$MerchantInfo googlePayJsonFactory$MerchantInfo = (GooglePayJsonFactory$MerchantInfo) obj;
        return Intrinsics.b(this.f42426a, googlePayJsonFactory$MerchantInfo.f42426a) && Intrinsics.b(this.f42427b, googlePayJsonFactory$MerchantInfo.f42427b);
    }

    public final int hashCode() {
        String str = this.f42426a;
        return this.f42427b.f42428a.hashCode() + ((str == null ? 0 : str.hashCode()) * 31);
    }

    public final String toString() {
        return "MerchantInfo(merchantName=" + this.f42426a + ", softwareInfo=" + this.f42427b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42426a);
        this.f42427b.writeToParcel(dest, i5);
    }
}
