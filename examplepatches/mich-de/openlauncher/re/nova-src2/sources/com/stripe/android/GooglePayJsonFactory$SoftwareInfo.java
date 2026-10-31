package com.stripe.android;

import android.os.Parcel;
import android.os.Parcelable;
import dq.f;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0001\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"com/stripe/android/GooglePayJsonFactory$SoftwareInfo", "Landroid/os/Parcelable;", "dq/f", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class GooglePayJsonFactory$SoftwareInfo implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<GooglePayJsonFactory$SoftwareInfo> CREATOR = new di.b(8);

    /* renamed from: a, reason: collision with root package name */
    public final f f42428a;

    public GooglePayJsonFactory$SoftwareInfo(f id2) {
        Intrinsics.g(id2, "id");
        this.f42428a = id2;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof GooglePayJsonFactory$SoftwareInfo) && this.f42428a == ((GooglePayJsonFactory$SoftwareInfo) obj).f42428a;
    }

    public final int hashCode() {
        return this.f42428a.hashCode();
    }

    public final String toString() {
        return "SoftwareInfo(id=" + this.f42428a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42428a.name());
    }
}
