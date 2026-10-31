package com.google.android.exoplayer2.metadata.mp4;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.google.android.exoplayer2.metadata.Metadata;
import java.util.Arrays;
import wf.v;

/* loaded from: classes3.dex */
public final class MdtaMetadataEntry implements Metadata.Entry {
    public static final Parcelable.Creator<MdtaMetadataEntry> CREATOR = new cf.a(26);

    /* renamed from: a, reason: collision with root package name */
    public final String f31544a;

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f31545b;

    /* renamed from: c, reason: collision with root package name */
    public final int f31546c;

    /* renamed from: d, reason: collision with root package name */
    public final int f31547d;

    public MdtaMetadataEntry(String str, byte[] bArr, int i5, int i11) {
        this.f31544a = str;
        this.f31545b = bArr;
        this.f31546c = i5;
        this.f31547d = i11;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && MdtaMetadataEntry.class == obj.getClass()) {
            MdtaMetadataEntry mdtaMetadataEntry = (MdtaMetadataEntry) obj;
            if (this.f31544a.equals(mdtaMetadataEntry.f31544a) && Arrays.equals(this.f31545b, mdtaMetadataEntry.f31545b) && this.f31546c == mdtaMetadataEntry.f31546c && this.f31547d == mdtaMetadataEntry.f31547d) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return ((((Arrays.hashCode(this.f31545b) + c0.e(527, 31, this.f31544a)) * 31) + this.f31546c) * 31) + this.f31547d;
    }

    public final String toString() {
        return "mdta: key=" + this.f31544a;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f31544a);
        parcel.writeByteArray(this.f31545b);
        parcel.writeInt(this.f31546c);
        parcel.writeInt(this.f31547d);
    }

    public MdtaMetadataEntry(Parcel parcel) {
        String string = parcel.readString();
        int i5 = v.f94376a;
        this.f31544a = string;
        this.f31545b = parcel.createByteArray();
        this.f31546c = parcel.readInt();
        this.f31547d = parcel.readInt();
    }
}
