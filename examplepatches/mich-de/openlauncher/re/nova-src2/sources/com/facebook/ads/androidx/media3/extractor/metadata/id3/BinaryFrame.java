package com.facebook.ads.androidx.media3.extractor.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.redexgen.X.C1409Zv;
import com.facebook.ads.redexgen.X.N1;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class BinaryFrame extends Id3Frame {
    public static final Parcelable.Creator<BinaryFrame> CREATOR = new C1409Zv();
    public final byte[] A00;

    public BinaryFrame(Parcel parcel) {
        super((String) N1.A0f(parcel.readString()));
        this.A00 = (byte[]) N1.A0f(parcel.createByteArray());
    }

    public BinaryFrame(String str, byte[] bArr) {
        super(str);
        this.A00 = bArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        BinaryFrame binaryFrame = (BinaryFrame) obj;
        return super.A00.equals(((Id3Frame) binaryFrame).A00) && Arrays.equals(this.A00, binaryFrame.A00);
    }

    public final int hashCode() {
        int result = super.A00.hashCode();
        return (((17 * 31) + result) * 31) + Arrays.hashCode(this.A00);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(super.A00);
        parcel.writeByteArray(this.A00);
    }
}
