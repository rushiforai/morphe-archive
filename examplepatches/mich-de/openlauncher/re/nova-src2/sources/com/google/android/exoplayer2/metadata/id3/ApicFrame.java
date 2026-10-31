package com.google.android.exoplayer2.metadata.id3;

import ab.w;
import android.os.Parcel;
import android.os.Parcelable;
import fe.v0;
import java.util.Arrays;
import wf.v;

/* loaded from: classes3.dex */
public final class ApicFrame extends Id3Frame {
    public static final Parcelable.Creator<ApicFrame> CREATOR = new w(29);

    /* renamed from: b, reason: collision with root package name */
    public final String f31506b;

    /* renamed from: c, reason: collision with root package name */
    public final String f31507c;

    /* renamed from: d, reason: collision with root package name */
    public final int f31508d;

    /* renamed from: e, reason: collision with root package name */
    public final byte[] f31509e;

    public ApicFrame(String str, String str2, int i5, byte[] bArr) {
        super("APIC");
        this.f31506b = str;
        this.f31507c = str2;
        this.f31508d = i5;
        this.f31509e = bArr;
    }

    @Override // com.google.android.exoplayer2.metadata.Metadata.Entry
    public final void W(v0 v0Var) {
        v0Var.a(this.f31508d, this.f31509e);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && ApicFrame.class == obj.getClass()) {
            ApicFrame apicFrame = (ApicFrame) obj;
            if (this.f31508d == apicFrame.f31508d && v.a(this.f31506b, apicFrame.f31506b) && v.a(this.f31507c, apicFrame.f31507c) && Arrays.equals(this.f31509e, apicFrame.f31509e)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int i5 = (527 + this.f31508d) * 31;
        String str = this.f31506b;
        int iHashCode = (i5 + (str != null ? str.hashCode() : 0)) * 31;
        String str2 = this.f31507c;
        return Arrays.hashCode(this.f31509e) + ((iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31);
    }

    @Override // com.google.android.exoplayer2.metadata.id3.Id3Frame
    public final String toString() {
        return this.f31529a + ": mimeType=" + this.f31506b + ", description=" + this.f31507c;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f31506b);
        parcel.writeString(this.f31507c);
        parcel.writeInt(this.f31508d);
        parcel.writeByteArray(this.f31509e);
    }

    public ApicFrame(Parcel parcel) {
        super("APIC");
        String string = parcel.readString();
        int i5 = v.f94376a;
        this.f31506b = string;
        this.f31507c = parcel.readString();
        this.f31508d = parcel.readInt();
        this.f31509e = parcel.createByteArray();
    }
}
