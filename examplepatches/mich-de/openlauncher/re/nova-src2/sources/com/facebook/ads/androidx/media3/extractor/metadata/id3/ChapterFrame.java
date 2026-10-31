package com.facebook.ads.androidx.media3.extractor.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.redexgen.X.C1410Zw;
import com.facebook.ads.redexgen.X.N1;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class ChapterFrame extends Id3Frame {
    public static byte[] A06;
    public static String[] A07 = {"O8v7hbAlgqy5g86CmEHOaCN1Mzo5s3wF", "JGnQ2Ula0uMSNB5LjbkI16HJ9gF1NLGm", "L", "h0rsWri2qKKCw4wgrGo", "MpCYdBbioeiM9ki8ot1EFjPE8YyVS", "cMWHrHd5y", "A88iZ2PXqdQgWTyON6VxkjWIPV0pgFwu", "UKTxahcD7KMH8UAnDy"};
    public static final Parcelable.Creator<ChapterFrame> CREATOR;
    public final int A00;
    public final int A01;
    public final long A02;
    public final long A03;
    public final String A04;
    public final Id3Frame[] A05;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 19);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A06 = new byte[]{20, 31, 22, 7};
    }

    static {
        A01();
        CREATOR = new C1410Zw();
    }

    public ChapterFrame(Parcel parcel) {
        super(A00(0, 4, 68));
        this.A04 = (String) N1.A0f(parcel.readString());
        this.A01 = parcel.readInt();
        this.A00 = parcel.readInt();
        this.A03 = parcel.readLong();
        this.A02 = parcel.readLong();
        int i5 = parcel.readInt();
        this.A05 = new Id3Frame[i5];
        for (int i11 = 0; i11 < i5; i11++) {
            this.A05[i11] = (Id3Frame) parcel.readParcelable(Id3Frame.class.getClassLoader());
        }
    }

    public ChapterFrame(String str, int i5, int i11, long j11, long j12, Id3Frame[] id3FrameArr) {
        super(A00(0, 4, 68));
        this.A04 = str;
        this.A01 = i5;
        this.A00 = i11;
        this.A03 = j11;
        this.A02 = j12;
        this.A05 = id3FrameArr;
    }

    @Override // com.facebook.ads.androidx.media3.extractor.metadata.id3.Id3Frame, android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        String[] strArr = A07;
        if (strArr[3].length() == strArr[5].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A07;
        strArr2[3] = "7ySVPocPOH4GSSGYIH3";
        strArr2[5] = "OPfOhl1dq";
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        ChapterFrame chapterFrame = (ChapterFrame) obj;
        int i5 = this.A01;
        int i11 = chapterFrame.A01;
        String[] strArr3 = A07;
        if (strArr3[6].charAt(1) != strArr3[0].charAt(1)) {
            throw new RuntimeException();
        }
        A07[4] = "5V0fDszHokAWirM87HL4xfLReJAzT";
        if (i5 == i11 && this.A00 == chapterFrame.A00 && this.A03 == chapterFrame.A03 && this.A02 == chapterFrame.A02 && N1.A1E(this.A04, chapterFrame.A04) && Arrays.equals(this.A05, chapterFrame.A05)) {
            return true;
        }
        return false;
    }

    public final int hashCode() {
        int result = this.A01;
        int i5 = ((((17 * 31) + result) * 31) + this.A00) * 31;
        int result2 = (int) this.A03;
        int result3 = (((i5 + result2) * 31) + ((int) this.A02)) * 31;
        int result4 = this.A04 != null ? this.A04.hashCode() : 0;
        return result3 + result4;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.A04);
        parcel.writeInt(this.A01);
        parcel.writeInt(this.A00);
        parcel.writeLong(this.A03);
        parcel.writeLong(this.A02);
        parcel.writeInt(this.A05.length);
        for (Id3Frame id3Frame : this.A05) {
            parcel.writeParcelable(id3Frame, 0);
        }
    }
}
