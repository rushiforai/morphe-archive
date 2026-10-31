package com.google.android.exoplayer2.metadata.icy;

import ab.w;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.google.android.exoplayer2.metadata.Metadata;
import fe.v0;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class IcyInfo implements Metadata.Entry {
    public static final Parcelable.Creator<IcyInfo> CREATOR = new w(28);

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f31503a;

    /* renamed from: b, reason: collision with root package name */
    public final String f31504b;

    /* renamed from: c, reason: collision with root package name */
    public final String f31505c;

    public IcyInfo(String str, String str2, byte[] bArr) {
        this.f31503a = bArr;
        this.f31504b = str;
        this.f31505c = str2;
    }

    @Override // com.google.android.exoplayer2.metadata.Metadata.Entry
    public final void W(v0 v0Var) {
        String str = this.f31504b;
        if (str != null) {
            v0Var.f55009a = str;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || IcyInfo.class != obj.getClass()) {
            return false;
        }
        return Arrays.equals(this.f31503a, ((IcyInfo) obj).f31503a);
    }

    public final int hashCode() {
        return Arrays.hashCode(this.f31503a);
    }

    public final String toString() {
        return c0.o(c0.w("ICY: title=\"", this.f31504b, "\", url=\"", this.f31505c, "\", rawMetadata.length=\""), this.f31503a.length, "\"");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeByteArray(this.f31503a);
        parcel.writeString(this.f31504b);
        parcel.writeString(this.f31505c);
    }

    public IcyInfo(Parcel parcel) {
        byte[] bArrCreateByteArray = parcel.createByteArray();
        bArrCreateByteArray.getClass();
        this.f31503a = bArrCreateByteArray;
        this.f31504b = parcel.readString();
        this.f31505c = parcel.readString();
    }
}
