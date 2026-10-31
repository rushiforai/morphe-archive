package com.android.launcher3.logging;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import di.b;

/* loaded from: classes2.dex */
public final class InstanceId implements Parcelable {
    public static final Parcelable.Creator<InstanceId> CREATOR = new b(17);

    /* renamed from: a, reason: collision with root package name */
    public final int f21168a;

    public InstanceId(int i5) {
        this.f21168a = Math.min(Math.max(0, i5), 1048576);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof InstanceId) {
            return this.f21168a == ((InstanceId) obj).f21168a;
        }
        return false;
    }

    public final int hashCode() {
        return this.f21168a;
    }

    public final String toString() {
        return c0.o(new StringBuilder(), this.f21168a, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.f21168a);
    }
}
