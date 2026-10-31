package com.facebook.ads.androidx.media3.extractor.metadata.emsg;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.androidx.media3.common.Metadata;
import com.facebook.ads.redexgen.X.C1029Ke;
import com.facebook.ads.redexgen.X.C1399Zl;
import com.facebook.ads.redexgen.X.N1;
import com.facebook.ads.redexgen.X.VC;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class EventMessage implements Metadata.Entry {
    public static byte[] A06;
    public static String[] A07 = {"6rghh63x9BsYHCvlUifZzHDjJXWwGgNX", "A3Acvw5DT5dFcBIoDBC0ZN8fHwcs2g", "g", "D", "sNHbQbtKTZ7RwSsMgOajnJhXkLoZoliL", "8pMXNTeZG0lsloNtly", "cetMnY6s5u", "HqVYgjQTcrdad8ZHEMcqG7WsZ37zSWio"};
    public static final VC A08;
    public static final VC A09;
    public static final Parcelable.Creator<EventMessage> CREATOR;
    public int A00;
    public final long A01;
    public final long A02;
    public final String A03;
    public final String A04;
    public final byte[] A05;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 51);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A06 = new byte[]{116, 104, -84, -67, -70, -87, -68, -79, -73, -74, -107, -69, -123, -123, 121, -62, -67, -106, 99, 87, -83, -104, -93, -84, -100, 116, -66, -58, -52, -64, -77, -103, -20, -36, -31, -34, -26, -34, -74, -107, -92, -92, -96, -99, -105, -107, -88, -99, -93, -94, 99, -99, -104, 103, -104, -89, -89, -93, -96, -102, -104, -85, -96, -90, -91, 102, -81, 100, -86, -102, -85, -100, 106, 108, -61, -49, -49, -53, -50, -107, -118, -118, -68, -54, -56, -64, -65, -60, -68, -119, -54, -51, -62, -118, -64, -56, -50, -62, -118, -92, -97, -114, -99, -87, -87, -91, -88, 111, 100, 100, -103, -102, -85, -102, -95, -92, -91, -102, -89, 99, -106, -91, -91, -95, -102, 99, -104, -92, -94, 100, -88, -87, -89, -102, -106, -94, -98, -93, -100, 100, -102, -94, -88, -100, 98, -98, -103, 104, 30, 27, 23, -29, 28, 12, 29, 14, -29, 28, 12, 29, 14, -36, -34, -29, -37, -39, -38, -35, -29, 11, 18, 23};
    }

    static {
        A01();
        A08 = new C1029Ke().A11(A00(39, 15, 1)).A14();
        A09 = new C1029Ke().A11(A00(54, 20, 4)).A14();
        CREATOR = new C1399Zl();
    }

    public EventMessage(Parcel parcel) {
        this.A03 = (String) N1.A0f(parcel.readString());
        this.A04 = (String) N1.A0f(parcel.readString());
        this.A01 = parcel.readLong();
        this.A02 = parcel.readLong();
        this.A05 = (byte[]) N1.A0f(parcel.createByteArray());
    }

    public EventMessage(String str, String str2, long j11, long j12, byte[] bArr) {
        this.A03 = str;
        this.A04 = str2;
        this.A01 = j11;
        this.A02 = j12;
        this.A05 = bArr;
    }

    @Override // com.facebook.ads.androidx.media3.common.Metadata.Entry
    public final byte[] AAE() {
        if (AAF() != null) {
            return this.A05;
        }
        return null;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:20:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0009  */
    /* JADX WARN: Removed duplicated region for block: B:6:0x000d A[RETURN] */
    @Override // com.facebook.ads.androidx.media3.common.Metadata.Entry
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final VC AAF() {
        char c11;
        String str = this.A03;
        switch (str.hashCode()) {
            case -1468477611:
                String[] strArr = A07;
                if (strArr[7].charAt(30) != strArr[4].charAt(30)) {
                    c11 = str.equals(A00(148, 24, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE)) ? (char) 2 : (char) 65535;
                } else {
                    A07[0] = "DsjgDjWiKlUGwWEYGsFY9OFngWok7FQT";
                    if (str.equals(A00(148, 24, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE))) {
                    }
                }
                switch (c11) {
                    case 0:
                    case 1:
                        return A08;
                    case 2:
                        return A09;
                    default:
                        return null;
                }
            case -795945609:
                if (A07[0].charAt(5) == 's') {
                    throw new RuntimeException();
                }
                A07[6] = "ZMa8hlbdw5";
                if (str.equals(A00(74, 28, 40))) {
                    c11 = 0;
                }
                switch (c11) {
                }
            case 1303648457:
                if (str.equals(A00(102, 46, 2))) {
                    c11 = 1;
                }
                switch (c11) {
                }
        }
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
        EventMessage eventMessage = (EventMessage) obj;
        long j11 = this.A01;
        long j12 = eventMessage.A01;
        if (A07[0].charAt(5) == 's') {
            throw new RuntimeException();
        }
        A07[5] = "aARxli5s";
        if (j11 == j12 && this.A02 == eventMessage.A02 && N1.A1E(this.A03, eventMessage.A03) && N1.A1E(this.A04, eventMessage.A04) && Arrays.equals(this.A05, eventMessage.A05)) {
            return true;
        }
        return false;
    }

    public final int hashCode() {
        if (this.A00 == 0) {
            String[] strArr = A07;
            if (strArr[7].charAt(30) != strArr[4].charAt(30)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A07;
            strArr2[7] = "jcxP5CMtnax37K9i7DR8QD7rWf4ctBit";
            strArr2[4] = "MILL79REnQnNPq3Yw4mhMHVt7D8058iQ";
            int i5 = 17 * 31;
            int result = this.A03 != null ? this.A03.hashCode() : 0;
            int iHashCode = (((i5 + result) * 31) + (this.A04 != null ? this.A04.hashCode() : 0)) * 31;
            int result2 = (int) (this.A01 ^ (this.A01 >>> 32));
            int result3 = (((iHashCode + result2) * 31) + ((int) (this.A02 ^ (this.A02 >>> 32)))) * 31;
            int result4 = Arrays.hashCode(this.A05);
            this.A00 = result3 + result4;
        }
        return this.A00;
    }

    public final String toString() {
        return A00(26, 13, 70) + this.A03 + A00(13, 5, 38) + this.A02 + A00(0, 13, 21) + this.A01 + A00(18, 8, 4) + this.A04;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.A03);
        parcel.writeString(this.A04);
        parcel.writeLong(this.A01);
        parcel.writeLong(this.A02);
        parcel.writeByteArray(this.A05);
    }
}
