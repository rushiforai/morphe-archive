package com.facebook.ads.androidx.media3.extractor.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.redexgen.X.C1408Zu;
import com.facebook.ads.redexgen.X.N1;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class ApicFrame extends Id3Frame {
    public static byte[] A04;
    public static final Parcelable.Creator<ApicFrame> CREATOR;
    public final int A00;
    public final String A01;
    public final String A02;
    public final byte[] A03;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 112);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A04 = new byte[]{88, 84, 16, 17, 7, 23, 6, 29, 4, 0, 29, 27, 26, 73, 23, 13, 64, 68, 64, 72, 121, 84, 93, 72, 16, 105, 120, 97, 107};
    }

    static {
        A01();
        CREATOR = new C1408Zu();
    }

    public ApicFrame(Parcel parcel) {
        super(A00(25, 4, 88));
        this.A02 = (String) N1.A0f(parcel.readString());
        this.A01 = parcel.readString();
        this.A00 = parcel.readInt();
        this.A03 = (byte[]) N1.A0f(parcel.createByteArray());
    }

    public ApicFrame(String str, String str2, int i5, byte[] bArr) {
        super(A00(25, 4, 88));
        this.A02 = str;
        this.A01 = str2;
        this.A00 = i5;
        this.A03 = bArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        ApicFrame apicFrame = (ApicFrame) obj;
        if (this.A00 == apicFrame.A00 && N1.A1E(this.A02, apicFrame.A02) && N1.A1E(this.A01, apicFrame.A01) && Arrays.equals(this.A03, apicFrame.A03)) {
            return true;
        }
        return false;
    }

    public final int hashCode() {
        int result = this.A00;
        int result2 = ((17 * 31) + result) * 31;
        int result3 = this.A02 != null ? this.A02.hashCode() : 0;
        return ((((result2 + result3) * 31) + (this.A01 != null ? this.A01.hashCode() : 0)) * 31) + Arrays.hashCode(this.A03);
    }

    @Override // com.facebook.ads.androidx.media3.extractor.metadata.id3.Id3Frame
    public final String toString() {
        return super.A00 + A00(14, 11, 93) + this.A02 + A00(0, 14, 4) + this.A01;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.A02);
        parcel.writeString(this.A01);
        parcel.writeInt(this.A00);
        parcel.writeByteArray(this.A03);
    }
}
