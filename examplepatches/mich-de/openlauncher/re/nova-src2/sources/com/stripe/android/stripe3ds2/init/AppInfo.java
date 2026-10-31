package com.stripe.android.stripe3ds2.init;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import nv.f;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/init/AppInfo;", "Landroid/os/Parcelable;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class AppInfo implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<AppInfo> CREATOR = new f(17);

    /* renamed from: a, reason: collision with root package name */
    public final String f45027a;

    /* renamed from: b, reason: collision with root package name */
    public final int f45028b;

    public AppInfo(String sdkAppId, int i5) {
        Intrinsics.g(sdkAppId, "sdkAppId");
        this.f45027a = sdkAppId;
        this.f45028b = i5;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof AppInfo)) {
            return false;
        }
        AppInfo appInfo = (AppInfo) obj;
        return Intrinsics.b(this.f45027a, appInfo.f45027a) && this.f45028b == appInfo.f45028b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f45028b) + (this.f45027a.hashCode() * 31);
    }

    public final String toString() {
        return "AppInfo(sdkAppId=" + this.f45027a + ", version=" + this.f45028b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f45027a);
        dest.writeInt(this.f45028b);
    }
}
