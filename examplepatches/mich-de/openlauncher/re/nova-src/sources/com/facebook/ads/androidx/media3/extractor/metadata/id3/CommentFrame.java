package com.facebook.ads.androidx.media3.extractor.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.redexgen.X.C1412Zy;
import com.facebook.ads.redexgen.X.N1;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class CommentFrame extends Id3Frame {
    public static byte[] A03;
    public static final Parcelable.Creator<CommentFrame> CREATOR;
    public final String A00;
    public final String A01;
    public final String A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 45);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{97, 85, -103, -102, -88, -104, -89, -98, -91, -87, -98, -92, -93, 114, 123, 97, -83, -94, -81, -88, -74, -94, -88, -90, 126, -27, -15, -17, -17};
    }

    static {
        A01();
        CREATOR = new C1412Zy();
    }

    public CommentFrame(Parcel parcel) {
        super(A00(25, 4, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE));
        this.A01 = (String) N1.A0f(parcel.readString());
        this.A00 = (String) N1.A0f(parcel.readString());
        this.A02 = (String) N1.A0f(parcel.readString());
    }

    public CommentFrame(String str, String str2, String str3) {
        super(A00(25, 4, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE));
        this.A01 = str;
        this.A00 = str2;
        this.A02 = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        CommentFrame commentFrame = (CommentFrame) obj;
        if (N1.A1E(this.A00, commentFrame.A00) && N1.A1E(this.A01, commentFrame.A01) && N1.A1E(this.A02, commentFrame.A02)) {
            return true;
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
        return super.A00 + A00(14, 11, 20) + this.A01 + A00(0, 14, 8) + this.A00;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(super.A00);
        parcel.writeString(this.A01);
        parcel.writeString(this.A02);
    }
}
