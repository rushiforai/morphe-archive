package com.facebook.ads.androidx.media3.extractor.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.redexgen.X.C1416a2;
import com.facebook.ads.redexgen.X.N1;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class InternalFrame extends Id3Frame {
    public static byte[] A03;
    public static String[] A04 = {"FEFdZAZJLRwRZ9Tnd1FzdQgLItHhxCkV", "2iQPTvL37AovlZI0gNAz0exRfsRK8kRZ", "pcIvPesOxwh16lW8UBjTWmoGq9j", "K0HN", "vFA7MBWtYHYxsPNkzgYH72RJcteArwVB", "w8J54IF3qcH4TMzPnnQ2YcpTMxC7RphN", "Hp1WO5lF0rk8QzEkJHRQlbWFPPCQIIBg", "RAWQ"};
    public static final Parcelable.Creator<InternalFrame> CREATOR;
    public final String A00;
    public final String A01;
    public final String A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 100);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{22, 26, 94, 95, 73, 89, 72, 83, 74, 78, 83, 85, 84, 7, 109, 109, 109, 109, 46, 52, 112, 123, 121, 117, 125, 122, 41};
    }

    static {
        A01();
        CREATOR = new C1416a2();
    }

    public InternalFrame(Parcel parcel) {
        super(A00(14, 4, 36));
        this.A01 = (String) N1.A0f(parcel.readString());
        this.A00 = (String) N1.A0f(parcel.readString());
        this.A02 = (String) N1.A0f(parcel.readString());
    }

    public InternalFrame(String str, String str2, String str3) {
        super(A00(14, 4, 36));
        this.A01 = str;
        this.A00 = str2;
        this.A02 = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null) {
            Class<?> cls = getClass();
            Class<?> cls2 = obj.getClass();
            String[] strArr = A04;
            if (strArr[1].charAt(19) != strArr[0].charAt(19)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A04;
            strArr2[7] = "CSM0";
            strArr2[3] = "ijam";
            if (cls == cls2) {
                InternalFrame internalFrame = (InternalFrame) obj;
                if (N1.A1E(this.A00, internalFrame.A00) && N1.A1E(this.A01, internalFrame.A01) && N1.A1E(this.A02, internalFrame.A02)) {
                    return true;
                }
                return false;
            }
        }
        return false;
    }

    public final int hashCode() {
        int i5 = 17 * 31;
        int result = this.A01 != null ? this.A01.hashCode() : 0;
        return ((((i5 + result) * 31) + (this.A00 != null ? this.A00.hashCode() : 0)) * 31) + (this.A02 != null ? this.A02.hashCode() : 0);
    }

    @Override // com.facebook.ads.androidx.media3.extractor.metadata.id3.Id3Frame
    public final String toString() {
        return super.A00 + A00(18, 9, 112) + this.A01 + A00(0, 14, 94) + this.A00;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(super.A00);
        parcel.writeString(this.A01);
        parcel.writeString(this.A02);
    }
}
