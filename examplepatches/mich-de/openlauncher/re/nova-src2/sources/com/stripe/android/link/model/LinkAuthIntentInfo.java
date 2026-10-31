package com.stripe.android.link.model;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/model/LinkAuthIntentInfo;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class LinkAuthIntentInfo implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<LinkAuthIntentInfo> CREATOR = new ji.a(21);

    /* renamed from: a, reason: collision with root package name */
    public final String f43022a;

    /* renamed from: b, reason: collision with root package name */
    public final ConsentPresentation f43023b;

    public LinkAuthIntentInfo(String linkAuthIntentId, ConsentPresentation consentPresentation) {
        Intrinsics.g(linkAuthIntentId, "linkAuthIntentId");
        this.f43022a = linkAuthIntentId;
        this.f43023b = consentPresentation;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LinkAuthIntentInfo)) {
            return false;
        }
        LinkAuthIntentInfo linkAuthIntentInfo = (LinkAuthIntentInfo) obj;
        return Intrinsics.b(this.f43022a, linkAuthIntentInfo.f43022a) && Intrinsics.b(this.f43023b, linkAuthIntentInfo.f43023b);
    }

    public final int hashCode() {
        int iHashCode = this.f43022a.hashCode() * 31;
        ConsentPresentation consentPresentation = this.f43023b;
        return iHashCode + (consentPresentation == null ? 0 : consentPresentation.hashCode());
    }

    public final String toString() {
        return "LinkAuthIntentInfo(linkAuthIntentId=" + this.f43022a + ", consentPresentation=" + this.f43023b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43022a);
        dest.writeParcelable(this.f43023b, i5);
    }
}
