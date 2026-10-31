package com.facebook.ads.androidx.media3.extractor.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.redexgen.X.C1418a4;
import com.facebook.ads.redexgen.X.N1;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class PrivFrame extends Id3Frame {
    public static byte[] A02;
    public static final Parcelable.Creator<PrivFrame> CREATOR;
    public final String A00;
    public final byte[] A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 87);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{2, 24, 87, 79, 86, 93, 74, 5, 69, 71, 92, 67};
    }

    static {
        A01();
        CREATOR = new C1418a4();
    }

    public PrivFrame(Parcel parcel) {
        super(A00(8, 4, 66));
        this.A00 = (String) N1.A0f(parcel.readString());
        this.A01 = (byte[]) N1.A0f(parcel.createByteArray());
    }

    public PrivFrame(String str, byte[] bArr) {
        super(A00(8, 4, 66));
        this.A00 = str;
        this.A01 = bArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        PrivFrame privFrame = (PrivFrame) obj;
        return N1.A1E(this.A00, privFrame.A00) && Arrays.equals(this.A01, privFrame.A01);
    }

    public final int hashCode() {
        int i5 = 17 * 31;
        int result = this.A00 != null ? this.A00.hashCode() : 0;
        return ((i5 + result) * 31) + Arrays.hashCode(this.A01);
    }

    @Override // com.facebook.ads.androidx.media3.extractor.metadata.id3.Id3Frame
    public final String toString() {
        return super.A00 + A00(0, 8, 111) + this.A00;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.A00);
        parcel.writeByteArray(this.A01);
    }
}
