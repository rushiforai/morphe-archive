package com.google.android.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import cf.a;
import wf.v;

/* loaded from: classes3.dex */
public final class UrlLinkFrame extends Id3Frame {
    public static final Parcelable.Creator<UrlLinkFrame> CREATOR = new a(9);

    /* renamed from: b, reason: collision with root package name */
    public final String f31542b;

    /* renamed from: c, reason: collision with root package name */
    public final String f31543c;

    public UrlLinkFrame(String str, String str2, String str3) {
        super(str);
        this.f31542b = str2;
        this.f31543c = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && UrlLinkFrame.class == obj.getClass()) {
            UrlLinkFrame urlLinkFrame = (UrlLinkFrame) obj;
            if (this.f31529a.equals(urlLinkFrame.f31529a) && v.a(this.f31542b, urlLinkFrame.f31542b) && v.a(this.f31543c, urlLinkFrame.f31543c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iE = c0.e(527, 31, this.f31529a);
        String str = this.f31542b;
        int iHashCode = (iE + (str != null ? str.hashCode() : 0)) * 31;
        String str2 = this.f31543c;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    @Override // com.google.android.exoplayer2.metadata.id3.Id3Frame
    public final String toString() {
        return this.f31529a + ": url=" + this.f31543c;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f31529a);
        parcel.writeString(this.f31542b);
        parcel.writeString(this.f31543c);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public UrlLinkFrame(Parcel parcel) {
        String string = parcel.readString();
        int i5 = v.f94376a;
        super(string);
        this.f31542b = parcel.readString();
        this.f31543c = parcel.readString();
    }
}
