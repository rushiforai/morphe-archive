package com.google.android.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import cf.a;
import java.util.Arrays;
import wf.v;

/* loaded from: classes3.dex */
public final class BinaryFrame extends Id3Frame {
    public static final Parcelable.Creator<BinaryFrame> CREATOR = new a(0);

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f31510b;

    public BinaryFrame(String str, byte[] bArr) {
        super(str);
        this.f31510b = bArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && BinaryFrame.class == obj.getClass()) {
            BinaryFrame binaryFrame = (BinaryFrame) obj;
            if (this.f31529a.equals(binaryFrame.f31529a) && Arrays.equals(this.f31510b, binaryFrame.f31510b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(this.f31510b) + c0.e(527, 31, this.f31529a);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f31529a);
        parcel.writeByteArray(this.f31510b);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public BinaryFrame(Parcel parcel) {
        String string = parcel.readString();
        int i5 = v.f94376a;
        super(string);
        this.f31510b = parcel.createByteArray();
    }
}
