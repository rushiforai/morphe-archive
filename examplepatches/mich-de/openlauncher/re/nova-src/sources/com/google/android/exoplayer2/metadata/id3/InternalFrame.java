package com.google.android.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import cf.a;
import wf.v;

/* loaded from: classes3.dex */
public final class InternalFrame extends Id3Frame {
    public static final Parcelable.Creator<InternalFrame> CREATOR = new a(5);

    /* renamed from: b, reason: collision with root package name */
    public final String f31530b;

    /* renamed from: c, reason: collision with root package name */
    public final String f31531c;

    /* renamed from: d, reason: collision with root package name */
    public final String f31532d;

    public InternalFrame(String str, String str2, String str3) {
        super("----");
        this.f31530b = str;
        this.f31531c = str2;
        this.f31532d = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && InternalFrame.class == obj.getClass()) {
            InternalFrame internalFrame = (InternalFrame) obj;
            if (v.a(this.f31531c, internalFrame.f31531c) && v.a(this.f31530b, internalFrame.f31530b) && v.a(this.f31532d, internalFrame.f31532d)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        String str = this.f31530b;
        int iHashCode = (527 + (str != null ? str.hashCode() : 0)) * 31;
        String str2 = this.f31531c;
        int iHashCode2 = (iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31;
        String str3 = this.f31532d;
        return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
    }

    @Override // com.google.android.exoplayer2.metadata.id3.Id3Frame
    public final String toString() {
        return this.f31529a + ": domain=" + this.f31530b + ", description=" + this.f31531c;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f31529a);
        parcel.writeString(this.f31530b);
        parcel.writeString(this.f31532d);
    }

    public InternalFrame(Parcel parcel) {
        super("----");
        String string = parcel.readString();
        int i5 = v.f94376a;
        this.f31530b = string;
        this.f31531c = parcel.readString();
        this.f31532d = parcel.readString();
    }
}
