package com.facebook.ads.androidx.media3.extractor.metadata.mp4;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.androidx.media3.common.Metadata;
import com.facebook.ads.redexgen.X.C1427aE;
import com.facebook.ads.redexgen.X.C1A;
import com.facebook.ads.redexgen.X.L3;
import com.facebook.ads.redexgen.X.VC;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class SmtaMetadataEntry implements Metadata.Entry {
    public static byte[] A02;
    public static String[] A03 = {"SzuhOgFsiCaRkUuGKktwTNtTDv", "rW70MU3fa2BPscOQeuWwpwlJ99UBK2rG", "J97HKmmLUGyBL9RmlRd0QZP27kKayuPA", "6qAJche5EZr0GDtBPVQHOIx0ErgXW92W", "VzkDnOJf7Xp424H6wlcAjtLHxcnXV1G5", "0HaeXAsqWuGRiJw427JvU7", "88BKVaaGAurNttZdaA", "mbltfkWJx4r4wMgOg7hCYZd0imnRQqGT"};
    public static final Parcelable.Creator<SmtaMetadataEntry> CREATOR;
    public final float A00;
    public final int A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 58);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{-60, -72, 11, 14, -5, -20, -3, 5, 8, 7, 10, -7, 4, -28, -7, 17, -3, 10, -37, 7, 13, 6, 12, -43, -79, -85, -78, -97, 120, 94, -95, -97, -82, -78, -77, -80, -93, -124, -80, -97, -85, -93, -112, -97, -78, -93, 123};
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
        CREATOR = new C1427aE();
    }

    public SmtaMetadataEntry(float f11, int i5) {
        this.A00 = f11;
        this.A01 = i5;
    }

    public SmtaMetadataEntry(Parcel parcel) {
        this.A00 = parcel.readFloat();
        this.A01 = parcel.readInt();
    }

    public /* synthetic */ SmtaMetadataEntry(Parcel parcel, C1427aE c1427aE) {
        this(parcel);
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
        SmtaMetadataEntry smtaMetadataEntry = (SmtaMetadataEntry) obj;
        if (A03[4].charAt(22) != 'L') {
            throw new RuntimeException();
        }
        A03[6] = "hl2aXI9Koz6I";
        return this.A00 == smtaMetadataEntry.A00 && this.A01 == smtaMetadataEntry.A01;
    }

    public final int hashCode() {
        int result = C1A.A00(this.A00);
        return (((17 * 31) + result) * 31) + this.A01;
    }

    public final String toString() {
        return A00(24, 23, 4) + this.A00 + A00(0, 24, 94) + this.A01;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeFloat(this.A00);
        parcel.writeInt(this.A01);
    }
}
