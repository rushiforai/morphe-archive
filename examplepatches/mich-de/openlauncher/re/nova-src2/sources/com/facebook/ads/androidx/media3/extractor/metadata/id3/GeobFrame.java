package com.facebook.ads.androidx.media3.extractor.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.redexgen.X.C1413Zz;
import com.facebook.ads.redexgen.X.N1;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class GeobFrame extends Id3Frame {
    public static byte[] A04;
    public static String[] A05 = {"E27OPP", "LQtXMc51IH9cBDSQz4x", "ss0SR7FhOoQBIuQTZ6Qztcjw9jR9hSj2", "nME9IqysYduOLHQ4sDt0IwkSmHeOH0Nr", "Q", "LA", "bdhCKpdRxreOwFGHy8iEphp80sQOO86R", "v"};
    public static final Parcelable.Creator<GeobFrame> CREATOR;
    public final String A00;
    public final String A01;
    public final String A02;
    public final byte[] A03;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 124);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        byte[] bArr = {-50, -62, 6, 7, 21, 5, 20, 11, 18, 22, 11, 17, 16, -33, -19, -31, 39, 42, 45, 38, 47, 34, 46, 38, -2, -12, -38, 39, 35, 39, 31, 14, 51, 42, 31, -9, -3, -5, 5, -8};
        if (A05[3].charAt(10) == 'k') {
            throw new RuntimeException();
        }
        A05[3] = "dTFcQP1Jtz13qPJouOIyfgNERD63vnNj";
        A04 = bArr;
    }

    static {
        A01();
        CREATOR = new C1413Zz();
    }

    public GeobFrame(Parcel parcel) {
        super(A00(36, 4, 58));
        this.A02 = (String) N1.A0f(parcel.readString());
        this.A01 = (String) N1.A0f(parcel.readString());
        this.A00 = (String) N1.A0f(parcel.readString());
        this.A03 = (byte[]) N1.A0f(parcel.createByteArray());
    }

    public GeobFrame(String str, String str2, String str3, byte[] bArr) {
        super(A00(36, 4, 58));
        this.A02 = str;
        this.A01 = str2;
        this.A00 = str3;
        this.A03 = bArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        GeobFrame geobFrame = (GeobFrame) obj;
        if (N1.A1E(this.A02, geobFrame.A02) && N1.A1E(this.A01, geobFrame.A01) && N1.A1E(this.A00, geobFrame.A00) && Arrays.equals(this.A03, geobFrame.A03)) {
            return true;
        }
        return false;
    }

    public final int hashCode() {
        int i5 = 17 * 31;
        int iHashCode = 0;
        int result = this.A02 != null ? this.A02.hashCode() : 0;
        int result2 = (i5 + result) * 31;
        int result3 = this.A01 != null ? this.A01.hashCode() : 0;
        int i11 = (result2 + result3) * 31;
        if (this.A00 != null) {
            String str = this.A00;
            String[] strArr = A05;
            String str2 = strArr[7];
            String str3 = strArr[4];
            int length = str2.length();
            int result4 = str3.length();
            if (length != result4) {
                throw new RuntimeException();
            }
            A05[2] = "LQfWiwlA0VVt21qytm8GIpYwcSmoc9LN";
            iHashCode = str.hashCode();
        }
        int result5 = (i11 + iHashCode) * 31;
        return result5 + Arrays.hashCode(this.A03);
    }

    @Override // com.facebook.ads.androidx.media3.extractor.metadata.id3.Id3Frame
    public final String toString() {
        return super.A00 + A00(25, 11, 62) + this.A02 + A00(14, 11, 69) + this.A01 + A00(0, 14, 38) + this.A00;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.A02);
        parcel.writeString(this.A01);
        parcel.writeString(this.A00);
        parcel.writeByteArray(this.A03);
    }
}
