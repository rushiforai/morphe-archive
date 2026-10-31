package com.facebook.ads.androidx.media3.common;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.redexgen.X.AnonymousClass37;
import com.facebook.ads.redexgen.X.L2;
import com.facebook.ads.redexgen.X.N1;
import com.facebook.ads.redexgen.X.VC;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public final class Metadata implements Parcelable {
    public static byte[] A02;
    public static String[] A03 = {"txW6bhTTUfWnO88BrZFmK", "DA90VrcSzbNuD", "Bw2xU5fE9Wv8MWbQGZOhZSlbHvYEC7ws", b.f42142b, "wv7x1oMBiVi2Soy7GaiCpHORAusJqgIn", "1azfimeoVN20c5i3OLuMVyg121kQUg8Y", "uYbMHz7ZeqFjmWLHf9CZh", "lGq7yaEiVvWauNdwQA2AZmkOvLqpCu8E"};
    public static final Parcelable.Creator<Metadata> CREATOR;
    public final long A00;
    public final Entry[] A01;

    public interface Entry extends Parcelable {
        byte[] AAE();

        VC AAF();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 66);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{-103, -115, -35, -33, -46, -32, -46, -37, -31, -50, -31, -42, -36, -37, -63, -42, -38, -46, -62, -32, -86, -23, -14, -8, -10, -19, -23, -9, -63};
    }

    static {
        A01();
        CREATOR = new L2();
    }

    public Metadata(long j11, Entry... entryArr) {
        this.A00 = j11;
        this.A01 = entryArr;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x000f */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Metadata(Parcel parcel) {
        this.A01 = new Entry[parcel.readInt()];
        for (int i5 = 0; i5 < i; i5++) {
            this.A01[i5] = (Entry) parcel.readParcelable(Entry.class.getClassLoader());
        }
        this.A00 = parcel.readLong();
    }

    public Metadata(List<? extends Entry> entries) {
        this((Entry[]) entries.toArray(new Entry[0]));
    }

    public Metadata(Entry... entryArr) {
        this(-9223372036854775807L, entryArr);
    }

    public final int A02() {
        return this.A01.length;
    }

    public final Entry A03(int i5) {
        return this.A01[i5];
    }

    public final Metadata A04(Metadata metadata) {
        if (metadata == null) {
            return this;
        }
        return A05(metadata.A01);
    }

    public final Metadata A05(Entry... entryArr) {
        if (entryArr.length == 0) {
            return this;
        }
        return new Metadata(this.A00, (Entry[]) N1.A1K(this.A01, entryArr));
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null) {
            Class<?> cls = getClass();
            Class<?> cls2 = obj.getClass();
            if (A03[5].charAt(25) != '1') {
                throw new RuntimeException();
            }
            A03[5] = "RTksvh4Gzdljx18GvdZYnA3RX11NfxpK";
            if (cls == cls2) {
                Metadata metadata = (Metadata) obj;
                return Arrays.equals(this.A01, metadata.A01) && this.A00 == metadata.A00;
            }
        }
        return false;
    }

    public final int hashCode() {
        int result = Arrays.hashCode(this.A01);
        int i5 = result * 31;
        int result2 = AnonymousClass37.A00(this.A00);
        return i5 + result2;
    }

    public final String toString() {
        return A00(21, 8, 66) + Arrays.toString(this.A01) + (this.A00 == -9223372036854775807L ? A00(0, 0, 33) : A00(0, 21, 43) + this.A00);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.A01.length);
        for (Entry entry : this.A01) {
            parcel.writeParcelable(entry, 0);
        }
        parcel.writeLong(this.A00);
    }
}
