package com.facebook.ads.androidx.media3.extractor.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.redexgen.X.AbstractC1062Ln;
import com.facebook.ads.redexgen.X.C1419a5;
import com.facebook.ads.redexgen.X.N1;
import com.facebook.ads.redexgen.X.XR;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.Arrays;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public final class TextInformationFrame extends Id3Frame {
    public static byte[] A03;
    public static String[] A04 = {"wNScEC4qAJaZzFb8", "UQxIBz39VFAJ6j3lhkmRZRSBZ07hSJ", "Pk8", "lhg9rTwGXxW51MCuXh5BBtSY", "x5ISPJ", "1YVIvhhIBbjfD0acDSCEOl7eVe4dgicW", "yHu1MJV6LoHV8GiNNlmjmOGMwkFzDIDO", "XXWcFsLZCiPyQQ72jwCsYw2IkeayHk9O"};
    public static final Parcelable.Creator<TextInformationFrame> CREATOR;
    public final String A00;

    @Deprecated
    public final String A01;

    @MetaExoPlayerCustomization
    public final List<String> A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 96);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{-96, -122, -54, -53, -39, -55, -40, -49, -42, -38, -49, -43, -44, -93, -42, -68, 18, -3, 8, 17, 1, 15, -39};
    }

    static {
        A01();
        CREATOR = new C1419a5();
    }

    @MetaExoPlayerCustomization
    public TextInformationFrame(Parcel parcel) {
        this((String) AbstractC1062Ln.A01(parcel.readString()), parcel.readString(), XR.A02((String[]) AbstractC1062Ln.A01(parcel.createStringArray())));
    }

    public /* synthetic */ TextInformationFrame(Parcel parcel, C1419a5 c1419a5) {
        this(parcel);
    }

    @MetaExoPlayerCustomization
    public TextInformationFrame(String str, String str2, List<String> values) {
        super(str);
        AbstractC1062Ln.A07(!values.isEmpty());
        this.A00 = str2;
        this.A02 = XR.A02((String[]) values.toArray(new String[0]));
        this.A01 = this.A02.get(0);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        TextInformationFrame textInformationFrame = (TextInformationFrame) obj;
        if (N1.A1E(super.A00, ((Id3Frame) textInformationFrame).A00) && N1.A1E(this.A00, textInformationFrame.A00)) {
            List<String> list = this.A02;
            List<String> list2 = textInformationFrame.A02;
            if (A04[1].length() != 30) {
                throw new RuntimeException();
            }
            A04[4] = "OPmEWPU2ORI6BeXayKKXvp";
            if (list.equals(list2)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int result = super.A00.hashCode();
        int result2 = ((((17 * 31) + result) * 31) + (this.A00 != null ? this.A00.hashCode() : 0)) * 31;
        int result3 = this.A02.hashCode();
        return result2 + result3;
    }

    @Override // com.facebook.ads.androidx.media3.extractor.metadata.id3.Id3Frame
    public final String toString() {
        return super.A00 + A00(0, 14, 6) + this.A00 + A00(14, 9, 60) + this.A02;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(super.A00);
        parcel.writeString(this.A00);
        parcel.writeStringArray((String[]) this.A02.toArray(new String[0]));
    }
}
