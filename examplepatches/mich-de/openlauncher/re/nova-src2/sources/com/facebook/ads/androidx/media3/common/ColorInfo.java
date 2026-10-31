package com.facebook.ads.androidx.media3.common;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.androidx.media3.common.ColorInfo;
import com.facebook.ads.redexgen.X.InterfaceC1017Js;
import com.facebook.ads.redexgen.X.InterfaceC1018Jt;
import com.facebook.ads.redexgen.X.KO;
import com.facebook.ads.redexgen.X.KP;
import com.facebook.ads.redexgen.X.N1;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import org.checkerframework.dataflow.qual.Pure;

/* loaded from: assets/audience_network/classes.dex */
public final class ColorInfo implements InterfaceC1018Jt, Parcelable {
    public static byte[] A05;
    public static String[] A06 = {"LF3qlrwHmlqaMCDZexiPj7odj5jzplw2", "2uKC", "zTs3CzDNUqEu8v9iPIAn2Ntd8EUyS5OH", "KWTH", "CXJ4DpF2fEii12q2BB1IcYgOntWlzn47", "GNA8Ip7ULkCAngwkl8oSSpasKS1zENNp", "1F2IL3SoeNmyxlpVtmF30A6VPcuW9", "wxGuyiNvlDM2D2pbOLdXQBN6UF3NT5tw"};
    public static final Parcelable.Creator<ColorInfo> A07;
    public static final InterfaceC1017Js<ColorInfo> A08;
    public static final ColorInfo A09;
    public static final ColorInfo A0A;
    public int A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final byte[] A04;

    public static String A07(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 53);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A08() {
        A05 = new byte[]{27, 95, 83, 102, 112, 22, 20, 22, 20, 66, 84, 54, 48, 49, 54, 32, 67, 68, 77, 5, 41, 42, 41, 52, 15, 40, 32, 41, 110, 79, 124, 101, 101, 41, 123, 104, 103, 110, 108, 17, 55, 59, 59, 55, 118, 100, 120, 100, 98, 102, 109, 106, 79, 75, 79, 82, 67, 66, 6, 84, 71, 72, 65, 67, 12, 41, 46, 37, 33, 50, 9, 30, 8, 122, 9, 23, 10, 14, 31, 122, 107, 109, 106, 23, 82, 85, 51, 49, 57, 53, 33, 81, 80, 1, 58, 48, 49, 50, 61, 58, 49, 48, 116, 55, 59, 56, 59, 38, 116, 38, 53, 58, 51, 49, 17, 42, 32, 33, 34, 45, 42, 33, 32, 100, 39, 43, 40, 43, 54, 100, 55, 52, 37, 39, 33, 44, 23, 29, 28, 31, 16, 23, 28, 29, 89, 26, 22, 21, 22, 11, 89, 13, 11, 24, 23, 10, 31, 28, 11, 26, 33, 60, 42, 59, 111, 44, 32, 35, 32, 61, 111, 61, 46, 33, 40, 42, 97, 90, 71, 81, 64, 20, 87, 91, 88, 91, 70, 20, 71, 68, 85, 87, 81, 20, 47, 50, 36, 53, 97, 34, 46, 45, 46, 51, 97, 53, 51, 32, 47, 50, 39, 36, 51, 62, 31, 10, 15};
    }

    static {
        A08();
        A09 = new ColorInfo(1, 2, 3, null);
        A0A = new KP().A01(1).A00(1).A02(2).A03();
        A07 = new KO();
        A08 = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.VH
            @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
            public final InterfaceC1018Jt A7F(Bundle bundle) {
                return ColorInfo.A02(bundle);
            }
        };
    }

    public ColorInfo(int i5, int i11, int i12, byte[] bArr) {
        this.A02 = i5;
        this.A01 = i11;
        this.A03 = i12;
        this.A04 = bArr;
    }

    public ColorInfo(Parcel parcel) {
        this.A02 = parcel.readInt();
        this.A01 = parcel.readInt();
        this.A03 = parcel.readInt();
        boolean hasHdrStaticInfo = N1.A1C(parcel);
        this.A04 = hasHdrStaticInfo ? parcel.createByteArray() : null;
    }

    @Pure
    public static int A00(int i5) {
        switch (i5) {
            case 1:
                return 1;
            case 2:
            case 3:
            case 8:
            default:
                return -1;
            case 4:
            case 5:
            case 6:
            case 7:
                return 2;
            case 9:
                return 6;
        }
    }

    @Pure
    public static int A01(int i5) {
        switch (i5) {
            case 1:
            case 6:
            case 7:
                return 3;
            case 4:
                return 10;
            case 13:
                return 2;
            case 16:
                return 6;
            case 18:
                return 7;
            default:
                return -1;
        }
    }

    public static /* synthetic */ ColorInfo A02(Bundle bundle) {
        return new ColorInfo(bundle.getInt(A06(0), -1), bundle.getInt(A06(1), -1), bundle.getInt(A06(2), -1), bundle.getByteArray(A06(3)));
    }

    public static String A03(int i5) {
        switch (i5) {
            case -1:
                return A07(159, 17, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE);
            case 0:
            default:
                return A07(93, 21, 97);
            case 1:
                return A07(29, 10, 60);
            case 2:
                String[] strArr = A06;
                if (strArr[5].charAt(13) == strArr[2].charAt(13)) {
                    throw new RuntimeException();
                }
                A06[7] = "7f9Tc3OFirgY2iR2l5WZAaNDLAMOT4ey";
                return A07(51, 13, 19);
        }
    }

    public static String A04(int i5) {
        switch (i5) {
            case -1:
                return A07(176, 17, 1);
            case 0:
            case 3:
            case 4:
            case 5:
            default:
                return A07(114, 21, 113);
            case 1:
                return A07(14, 5, 65);
            case 2:
                return A07(9, 5, 53);
            case 6:
                return A07(3, 6, 17);
        }
    }

    public static String A05(int i5) {
        switch (i5) {
            case -1:
                return A07(193, 20, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
            case 0:
            case 4:
            case 5:
            case 8:
            case 9:
            default:
                return A07(Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE, 24, 76);
            case 1:
                return A07(64, 6, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE);
            case 2:
                return A07(Sdk.SDKError.Reason.INVALID_ADUNIT_BID_PAYLOAD_VALUE, 4, 120);
            case 3:
                return A07(70, 14, 111);
            case 6:
                return A07(84, 9, 52);
            case 7:
                return A07(48, 3, 31);
            case 10:
                return A07(39, 9, 99);
        }
    }

    public static String A06(int i5) {
        return Integer.toString(i5, 36);
    }

    public static boolean A09(ColorInfo colorInfo) {
        return colorInfo != null && (colorInfo.A03 == 7 || colorInfo.A03 == 6);
    }

    public final KP A0A() {
        return new KP(this, null);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        ColorInfo colorInfo = (ColorInfo) obj;
        if (this.A02 == colorInfo.A02 && this.A01 == colorInfo.A01 && this.A03 == colorInfo.A03 && Arrays.equals(this.A04, colorInfo.A04)) {
            return true;
        }
        return false;
    }

    public final int hashCode() {
        if (this.A00 == 0) {
            int result = this.A02;
            int result2 = ((((17 * 31) + result) * 31) + this.A01) * 31;
            int result3 = this.A03;
            this.A00 = ((result2 + result3) * 31) + Arrays.hashCode(this.A04);
        }
        int result4 = this.A00;
        return result4;
    }

    public final String toString() {
        StringBuilder sbAppend = new StringBuilder().append(A07(19, 10, 115)).append(A04(this.A02));
        String strA07 = A07(1, 2, 70);
        return sbAppend.append(strA07).append(A03(this.A01)).append(strA07).append(A05(this.A03)).append(strA07).append(this.A04 != null).append(A07(0, 1, 7)).toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.A02);
        parcel.writeInt(this.A01);
        parcel.writeInt(this.A03);
        N1.A0w(parcel, this.A04 != null);
        if (this.A04 != null) {
            parcel.writeByteArray(this.A04);
        }
    }
}
