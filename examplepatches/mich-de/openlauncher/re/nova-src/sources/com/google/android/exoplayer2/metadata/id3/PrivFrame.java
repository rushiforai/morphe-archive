package com.google.android.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import cf.a;
import java.util.Arrays;
import wf.v;

/* loaded from: classes3.dex */
public final class PrivFrame extends Id3Frame {
    public static final Parcelable.Creator<PrivFrame> CREATOR = new a(7);

    /* renamed from: b, reason: collision with root package name */
    public final String f31538b;

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f31539c;

    public PrivFrame(String str, byte[] bArr) {
        super("PRIV");
        this.f31538b = str;
        this.f31539c = bArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && PrivFrame.class == obj.getClass()) {
            PrivFrame privFrame = (PrivFrame) obj;
            if (v.a(this.f31538b, privFrame.f31538b) && Arrays.equals(this.f31539c, privFrame.f31539c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        String str = this.f31538b;
        return Arrays.hashCode(this.f31539c) + ((527 + (str != null ? str.hashCode() : 0)) * 31);
    }

    @Override // com.google.android.exoplayer2.metadata.id3.Id3Frame
    public final String toString() {
        return this.f31529a + ": owner=" + this.f31538b;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f31538b);
        parcel.writeByteArray(this.f31539c);
    }

    public PrivFrame(Parcel parcel) {
        super("PRIV");
        String string = parcel.readString();
        int i5 = v.f94376a;
        this.f31538b = string;
        this.f31539c = parcel.createByteArray();
    }
}
