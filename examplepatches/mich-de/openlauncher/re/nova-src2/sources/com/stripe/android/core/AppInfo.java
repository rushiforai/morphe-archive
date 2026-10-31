package com.stripe.android.core;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import xq.b;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/core/AppInfo;", "Landroid/os/Parcelable;", "stripe-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final /* data */ class AppInfo implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<AppInfo> CREATOR = new b(0);

    /* renamed from: a, reason: collision with root package name */
    public final String f42546a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42547b;

    /* renamed from: c, reason: collision with root package name */
    public final String f42548c;

    /* renamed from: d, reason: collision with root package name */
    public final String f42549d;

    public AppInfo(String name, String str, String str2, String str3) {
        Intrinsics.g(name, "name");
        this.f42546a = name;
        this.f42547b = str;
        this.f42548c = str2;
        this.f42549d = str3;
    }

    public final Map b() {
        return MapsKt.j0(new Pair(PendingUpgradeStore.KEY_NAME, this.f42546a), new Pair("version", this.f42547b), new Pair(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, this.f42548c), new Pair("partner_id", this.f42549d));
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
        return Intrinsics.b(this.f42546a, appInfo.f42546a) && Intrinsics.b(this.f42547b, appInfo.f42547b) && Intrinsics.b(this.f42548c, appInfo.f42548c) && Intrinsics.b(this.f42549d, appInfo.f42549d);
    }

    public final int hashCode() {
        int iHashCode = this.f42546a.hashCode() * 31;
        String str = this.f42547b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f42548c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f42549d;
        return iHashCode3 + (str3 != null ? str3.hashCode() : 0);
    }

    public final String toString() {
        return c0.s(c0.w("AppInfo(name=", this.f42546a, ", version=", this.f42547b, ", url="), this.f42548c, ", partnerId=", this.f42549d, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42546a);
        dest.writeString(this.f42547b);
        dest.writeString(this.f42548c);
        dest.writeString(this.f42549d);
    }
}
