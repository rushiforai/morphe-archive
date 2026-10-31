package com.stripe.android.stripe3ds2.init;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import nv.f;
import org.jetbrains.annotations.NotNull;
import rv.m;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/stripe3ds2/init/Warning;", "Landroid/os/Parcelable;", "rv/m", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class Warning implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<Warning> CREATOR = new f(18);

    /* renamed from: a, reason: collision with root package name */
    public final String f45029a;

    /* renamed from: b, reason: collision with root package name */
    public final String f45030b;

    /* renamed from: c, reason: collision with root package name */
    public final m f45031c;

    public Warning(String id2, String message, m severity) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(message, "message");
        Intrinsics.g(severity, "severity");
        this.f45029a = id2;
        this.f45030b = message;
        this.f45031c = severity;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Warning)) {
            return false;
        }
        Warning warning = (Warning) obj;
        return Intrinsics.b(this.f45029a, warning.f45029a) && Intrinsics.b(this.f45030b, warning.f45030b) && this.f45031c == warning.f45031c;
    }

    public final int hashCode() {
        return this.f45031c.hashCode() + c0.e(this.f45029a.hashCode() * 31, 31, this.f45030b);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("Warning(id=", this.f45029a, ", message=", this.f45030b, ", severity=");
        sbW.append(this.f45031c);
        sbW.append(")");
        return sbW.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f45029a);
        dest.writeString(this.f45030b);
        dest.writeString(this.f45031c.name());
    }
}
