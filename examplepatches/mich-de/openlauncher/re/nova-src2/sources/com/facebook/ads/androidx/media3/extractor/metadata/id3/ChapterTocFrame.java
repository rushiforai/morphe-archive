package com.facebook.ads.androidx.media3.extractor.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.redexgen.X.C1411Zx;
import com.facebook.ads.redexgen.X.N1;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class ChapterTocFrame extends Id3Frame {
    public static byte[] A05;
    public static String[] A06 = {"l9so0EywYsAgJ7U6iEoN5cTm", "PoksZW504McDYS3dWP7J0Zaam7hrGGOe", "DVn0EfVMvxQVsUeXZ2APYEzzgDwMGiXR", "FVPWhp1Vr8L", "DJrQVL49kHYJd56nldqc9hqeztu2fbob", "BaxFqp7q7dwfva2zeTfjYByc26c", "MhBKOojE4hs1hmJH8d9CJjmIfE4PM0aK", "pRpLuOxJ3OttfcqchwNBTNaRCFG"};
    public static final Parcelable.Creator<ChapterTocFrame> CREATOR;
    public final String A00;
    public final boolean A01;
    public final boolean A02;
    public final String[] A03;
    public final Id3Frame[] A04;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 32);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A05 = new byte[]{-64, -47, -52, -64};
    }

    static {
        A01();
        CREATOR = new C1411Zx();
    }

    public ChapterTocFrame(Parcel parcel) {
        super(A00(0, 4, 93));
        this.A00 = (String) N1.A0f(parcel.readString());
        this.A02 = parcel.readByte() != 0;
        this.A01 = parcel.readByte() != 0;
        this.A03 = (String[]) N1.A0f(parcel.createStringArray());
        int i5 = parcel.readInt();
        this.A04 = new Id3Frame[i5];
        for (int i11 = 0; i11 < i5; i11++) {
            this.A04[i11] = (Id3Frame) parcel.readParcelable(Id3Frame.class.getClassLoader());
        }
    }

    public ChapterTocFrame(String str, boolean z11, boolean z12, String[] strArr, Id3Frame[] id3FrameArr) {
        super(A00(0, 4, 93));
        this.A00 = str;
        this.A02 = z11;
        this.A01 = z12;
        this.A03 = strArr;
        this.A04 = id3FrameArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        ChapterTocFrame chapterTocFrame = (ChapterTocFrame) obj;
        if (this.A02 == chapterTocFrame.A02) {
            boolean z11 = this.A01;
            if (A06[2].charAt(2) == 'V') {
                throw new RuntimeException();
            }
            A06[1] = "kPVGDtBHWB0BOlp10FwVt1U0kFkiEzWl";
            if (z11 == chapterTocFrame.A01 && N1.A1E(this.A00, chapterTocFrame.A00) && Arrays.equals(this.A03, chapterTocFrame.A03) && Arrays.equals(this.A04, chapterTocFrame.A04)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return (((((17 * 31) + (this.A02 ? 1 : 0)) * 31) + (this.A01 ? 1 : 0)) * 31) + (this.A00 != null ? this.A00.hashCode() : 0);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.A00);
        parcel.writeByte(this.A02 ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.A01 ? (byte) 1 : (byte) 0);
        parcel.writeStringArray(this.A03);
        parcel.writeInt(this.A04.length);
        for (Id3Frame id3Frame : this.A04) {
            parcel.writeParcelable(id3Frame, 0);
        }
    }
}
