package com.google.android.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import cf.a;
import wf.v;

/* loaded from: classes3.dex */
public final class CommentFrame extends Id3Frame {
    public static final Parcelable.Creator<CommentFrame> CREATOR = new a(3);

    /* renamed from: b, reason: collision with root package name */
    public final String f31522b;

    /* renamed from: c, reason: collision with root package name */
    public final String f31523c;

    /* renamed from: d, reason: collision with root package name */
    public final String f31524d;

    public CommentFrame(String str, String str2, String str3) {
        super("COMM");
        this.f31522b = str;
        this.f31523c = str2;
        this.f31524d = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && CommentFrame.class == obj.getClass()) {
            CommentFrame commentFrame = (CommentFrame) obj;
            if (v.a(this.f31523c, commentFrame.f31523c) && v.a(this.f31522b, commentFrame.f31522b) && v.a(this.f31524d, commentFrame.f31524d)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        String str = this.f31522b;
        int iHashCode = (527 + (str != null ? str.hashCode() : 0)) * 31;
        String str2 = this.f31523c;
        int iHashCode2 = (iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31;
        String str3 = this.f31524d;
        return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
    }

    @Override // com.google.android.exoplayer2.metadata.id3.Id3Frame
    public final String toString() {
        return this.f31529a + ": language=" + this.f31522b + ", description=" + this.f31523c;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f31529a);
        parcel.writeString(this.f31522b);
        parcel.writeString(this.f31524d);
    }

    public CommentFrame(Parcel parcel) {
        super("COMM");
        String string = parcel.readString();
        int i5 = v.f94376a;
        this.f31522b = string;
        this.f31523c = parcel.readString();
        this.f31524d = parcel.readString();
    }
}
