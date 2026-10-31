package com.facebook.ads.androidx.media3.common;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.redexgen.X.LU;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class StreamKey implements Comparable<StreamKey>, Parcelable {
    public static byte[] A04;
    public static final Parcelable.Creator<StreamKey> CREATOR;
    public final int A00;
    public final int A01;
    public final int A02;

    @Deprecated
    public final int A03;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 78);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A04 = new byte[]{-117};
    }

    static {
        A02();
        CREATOR = new LU();
    }

    public StreamKey(int i5, int i11, int i12) {
        this.A01 = i5;
        this.A00 = i11;
        this.A02 = i12;
        this.A03 = i12;
    }

    public StreamKey(Parcel parcel) {
        this.A01 = parcel.readInt();
        this.A00 = parcel.readInt();
        this.A02 = parcel.readInt();
        this.A03 = this.A02;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // java.lang.Comparable
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final int compareTo(StreamKey streamKey) {
        int i5 = this.A01 - streamKey.A01;
        if (i5 == 0) {
            int i11 = this.A00;
            int result = streamKey.A00;
            int i12 = i11 - result;
            if (i12 == 0) {
                int i13 = this.A02;
                int result2 = streamKey.A02;
                return i13 - result2;
            }
            return i12;
        }
        return i5;
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
        StreamKey streamKey = (StreamKey) obj;
        return this.A01 == streamKey.A01 && this.A00 == streamKey.A00 && this.A02 == streamKey.A02;
    }

    public final int hashCode() {
        int result = this.A01;
        int i5 = result * 31;
        int result2 = this.A00;
        return ((i5 + result2) * 31) + this.A02;
    }

    public final String toString() {
        StringBuilder sbAppend = new StringBuilder().append(this.A01);
        String strA01 = A01(0, 1, 15);
        return sbAppend.append(strA01).append(this.A00).append(strA01).append(this.A02).toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.A01);
        parcel.writeInt(this.A00);
        parcel.writeInt(this.A02);
    }
}
