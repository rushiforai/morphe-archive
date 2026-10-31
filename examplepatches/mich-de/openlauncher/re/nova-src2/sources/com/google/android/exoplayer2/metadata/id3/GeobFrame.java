package com.google.android.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import cf.a;
import java.util.Arrays;
import wf.v;

/* loaded from: classes3.dex */
public final class GeobFrame extends Id3Frame {
    public static final Parcelable.Creator<GeobFrame> CREATOR = new a(4);

    /* renamed from: b, reason: collision with root package name */
    public final String f31525b;

    /* renamed from: c, reason: collision with root package name */
    public final String f31526c;

    /* renamed from: d, reason: collision with root package name */
    public final String f31527d;

    /* renamed from: e, reason: collision with root package name */
    public final byte[] f31528e;

    public GeobFrame(String str, String str2, String str3, byte[] bArr) {
        super("GEOB");
        this.f31525b = str;
        this.f31526c = str2;
        this.f31527d = str3;
        this.f31528e = bArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && GeobFrame.class == obj.getClass()) {
            GeobFrame geobFrame = (GeobFrame) obj;
            if (v.a(this.f31525b, geobFrame.f31525b) && v.a(this.f31526c, geobFrame.f31526c) && v.a(this.f31527d, geobFrame.f31527d) && Arrays.equals(this.f31528e, geobFrame.f31528e)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        String str = this.f31525b;
        int iHashCode = (527 + (str != null ? str.hashCode() : 0)) * 31;
        String str2 = this.f31526c;
        int iHashCode2 = (iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31;
        String str3 = this.f31527d;
        return Arrays.hashCode(this.f31528e) + ((iHashCode2 + (str3 != null ? str3.hashCode() : 0)) * 31);
    }

    @Override // com.google.android.exoplayer2.metadata.id3.Id3Frame
    public final String toString() {
        return this.f31529a + ": mimeType=" + this.f31525b + ", filename=" + this.f31526c + ", description=" + this.f31527d;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f31525b);
        parcel.writeString(this.f31526c);
        parcel.writeString(this.f31527d);
        parcel.writeByteArray(this.f31528e);
    }

    public GeobFrame(Parcel parcel) {
        super("GEOB");
        String string = parcel.readString();
        int i5 = v.f94376a;
        this.f31525b = string;
        this.f31526c = parcel.readString();
        this.f31527d = parcel.readString();
        this.f31528e = parcel.createByteArray();
    }
}
