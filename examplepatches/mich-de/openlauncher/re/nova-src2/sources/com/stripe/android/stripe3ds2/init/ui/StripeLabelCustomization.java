package com.stripe.android.stripe3ds2.init.ui;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.jvm.internal.Intrinsics;
import nv.f;
import p50.i;
import sv.a;

/* loaded from: classes4.dex */
public final class StripeLabelCustomization extends BaseCustomization implements Parcelable, a {
    public static final Parcelable.Creator<StripeLabelCustomization> CREATOR = new f(27);

    /* renamed from: d, reason: collision with root package name */
    public String f45037d;

    /* renamed from: e, reason: collision with root package name */
    public String f45038e;

    /* renamed from: f, reason: collision with root package name */
    public int f45039f;

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof StripeLabelCustomization)) {
            return false;
        }
        StripeLabelCustomization stripeLabelCustomization = (StripeLabelCustomization) obj;
        return Intrinsics.b(this.f45037d, stripeLabelCustomization.f45037d) && Intrinsics.b(this.f45038e, stripeLabelCustomization.f45038e) && this.f45039f == stripeLabelCustomization.f45039f;
    }

    public final int hashCode() {
        return i.q(this.f45037d, this.f45038e, Integer.valueOf(this.f45039f));
    }

    @Override // com.stripe.android.stripe3ds2.init.ui.BaseCustomization, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        super.writeToParcel(parcel, i5);
        parcel.writeString(this.f45037d);
        parcel.writeString(this.f45038e);
        parcel.writeInt(this.f45039f);
    }
}
