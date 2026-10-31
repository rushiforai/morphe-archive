package com.facebook.ads.androidx.media3.extractor.metadata.icy;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.androidx.media3.common.Metadata;
import com.facebook.ads.redexgen.X.AbstractC1062Ln;
import com.facebook.ads.redexgen.X.C1406Zs;
import com.facebook.ads.redexgen.X.L3;
import com.facebook.ads.redexgen.X.VC;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class IcyInfo implements Metadata.Entry {
    public static byte[] A03;
    public static String[] A04 = {"6a6rSOmOXyw4ywy1xBDXRK2P6sXHm2or", "G4NXaIpULYR1HjwIkzABY7subC82hnqV", "fXs5LAfEXlHLDy9dV1MDI", "SoAX0IHY7gWy9DrDyNZjN1hSf2KBtLWp", "QbBPQQYNDAtr2zpIWOHQFwlzIiZv", "2QBKKCt8l7EOsD3Pqlj0kWoOKBfJBlck", "5RwrAJLesOmOZZ9w96TNwnKt86fh334k", "AQO2jHwYMNWswfEV1za0C1FbQzbCwKf7"};
    public static final Parcelable.Creator<IcyInfo> CREATOR;
    public final String A00;
    public final String A01;
    public final byte[] A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 115);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{-36, -42, -20, -51, -77, 7, -4, 7, -1, -8, -48, -75, -72, 6, -75, -65, -77, 8, 5, -1, -48, -75, -72, 6, -75, -65, -77, 5, -12, 10, -32, -8, 7, -12, -9, -12, 7, -12, -63, -1, -8, 1, -6, 7, -5, -48, -75, -72, 6, -75};
    }

    @Override // com.facebook.ads.androidx.media3.common.Metadata.Entry
    public final /* synthetic */ byte[] AAE() {
        return L3.A01(this);
    }

    @Override // com.facebook.ads.androidx.media3.common.Metadata.Entry
    public final /* synthetic */ VC AAF() {
        return L3.A00(this);
    }

    static {
        A01();
        CREATOR = new C1406Zs();
    }

    public IcyInfo(Parcel parcel) {
        this.A02 = (byte[]) AbstractC1062Ln.A01(parcel.createByteArray());
        this.A00 = parcel.readString();
        this.A01 = parcel.readString();
    }

    public IcyInfo(byte[] bArr, String str, String str2) {
        this.A02 = bArr;
        this.A00 = str;
        this.A01 = str2;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && getClass() == obj.getClass()) {
            return Arrays.equals(this.A02, ((IcyInfo) obj).A02);
        }
        String[] strArr = A04;
        if (strArr[6].charAt(31) != strArr[5].charAt(31)) {
            throw new RuntimeException();
        }
        A04[2] = "HIgg2ExP";
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(this.A02);
    }

    public final String toString() {
        return String.format(A00(0, 50, 32), this.A00, this.A01, Integer.valueOf(this.A02.length));
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeByteArray(this.A02);
        parcel.writeString(this.A00);
        parcel.writeString(this.A01);
    }
}
