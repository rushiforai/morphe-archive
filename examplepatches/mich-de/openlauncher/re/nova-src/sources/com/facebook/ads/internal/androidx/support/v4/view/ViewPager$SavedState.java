package com.facebook.ads.internal.androidx.support.v4.view;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.redexgen.X.C1891hn;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class ViewPager$SavedState extends AbsSavedState {
    public static byte[] A03;
    public static String[] A04 = {"AuWUrmLwM7GJPOP8rAuSpECd", "zFZ56n4eT6FX9g05wYbCu7I1KdVlhoN5", "3SSlkU9NidmbZe3U4TW9jjT4o2WSslgz", "APX54tRZsJmOx3lXT4kxzRZl5L0Cy1ng", "WyhnJgw7sEVfHQ6PVTSepOeMPj7Mc4Ks", "C9gBfAnfslWjb6MmPGJedCbgsvPnDQHc", "ftNuqlGlWzKSfY1f2k31BPROKX0YPmxK", "PuGcjbCEvSEVXUJBdaZJQ0xYiuJzE14G"};
    public static final Parcelable.Creator<ViewPager$SavedState> CREATOR;
    public int A00;
    public Parcelable A01;
    public ClassLoader A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 31);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        byte[] bArr = {26, 74, 85, 73, 83, 78, 83, 85, 84, 7, 104, 92, 79, 73, 67, 75, 64, 90, 126, 79, 73, 75, 92, 0, 125, 79, 88, 75, 74, 125, 90, 79, 90, 75, 85, 110};
        if (A04[0].length() == 0) {
            throw new RuntimeException();
        }
        String[] strArr = A04;
        strArr[4] = "6MXMF3gfP26OkwGb8wx6s6o6EzMLPjev";
        strArr[6] = "tN9YMGevxJBQbN1CuNoijuB9DRrwOltB";
        A03 = bArr;
    }

    static {
        A01();
        CREATOR = new C1891hn();
    }

    public ViewPager$SavedState(Parcel parcel, ClassLoader classLoader) {
        super(parcel, classLoader);
        classLoader = classLoader == null ? getClass().getClassLoader() : classLoader;
        this.A00 = parcel.readInt();
        this.A01 = parcel.readParcelable(classLoader);
        this.A02 = classLoader;
    }

    public ViewPager$SavedState(Parcelable parcelable) {
        super(parcelable);
    }

    public final String toString() {
        return A00(10, 25, 49) + Integer.toHexString(System.identityHashCode(this)) + A00(0, 10, 37) + this.A00 + A00(35, 1, 12);
    }

    @Override // com.facebook.ads.internal.androidx.support.v4.view.AbsSavedState, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        super.writeToParcel(parcel, i5);
        parcel.writeInt(this.A00);
        parcel.writeParcelable(this.A01, i5);
    }
}
