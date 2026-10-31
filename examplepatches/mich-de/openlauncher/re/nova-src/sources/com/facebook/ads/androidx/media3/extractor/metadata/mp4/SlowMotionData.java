package com.facebook.ads.androidx.media3.extractor.metadata.mp4;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.androidx.media3.common.Metadata;
import com.facebook.ads.androidx.media3.extractor.metadata.mp4.SlowMotionData;
import com.facebook.ads.redexgen.X.A6;
import com.facebook.ads.redexgen.X.AbstractC1062Ln;
import com.facebook.ads.redexgen.X.C1424aA;
import com.facebook.ads.redexgen.X.C1426aC;
import com.facebook.ads.redexgen.X.L3;
import com.facebook.ads.redexgen.X.N1;
import com.facebook.ads.redexgen.X.VC;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public final class SlowMotionData implements Metadata.Entry {
    public static byte[] A01;
    public static String[] A02 = {"4Hx7OvDSSY6Qn1Dlb29M9", "IjalnB", "VfpXP03MgioH1ypmjAoNGAx3WvRNgJFY", "x0bd", "ZPU15yp6", "jkdOWxrankEP9khq", "gTJFwo", "xvbGWmtrtKgtEhgKRff6QL0k8Z6vwV14"};
    public static final Parcelable.Creator<SlowMotionData> CREATOR;
    public final List<Segment> A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A02[4].length() != 8) {
                throw new RuntimeException();
            }
            A02[5] = "KLycsjpkvsjMD5X8";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 111);
            i13++;
        }
    }

    public static void A01() {
        A01 = new byte[]{47, 72, 75, 83, 41, 75, 80, 69, 75, 74, 22, -4, 79, 65, 67, 73, 65, 74, 80, 79, 25};
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
        CREATOR = new C1424aA();
    }

    public static final class Segment implements Parcelable {
        public static byte[] A03;
        public static final Comparator<Segment> A04;
        public static final Parcelable.Creator<Segment> CREATOR;
        public final int A00;
        public final long A01;
        public final long A02;

        public static String A01(int i5, int i11, int i12) {
            byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
            for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 20);
            }
            return new String(bArrCopyOfRange);
        }

        public static void A02() {
            A03 = new byte[]{11, 61, 63, 53, 61, 54, 44, 98, 120, 43, 44, 57, 42, 44, 12, 49, 53, 61, 21, 43, 101, 125, 60, 116, 120, 61, 54, 60, 12, 49, 53, 61, 21, 43, 101, 125, 60, 116, 120, 43, 40, 61, 61, 60, 28, 49, 46, 49, 43, 55, 42, 101, 125, 60};
        }

        static {
            A02();
            A04 = new Comparator() { // from class: com.facebook.ads.redexgen.X.aB
                @Override // java.util.Comparator
                public final int compare(Object obj, Object obj2) {
                    SlowMotionData.Segment segment = (SlowMotionData.Segment) obj;
                    SlowMotionData.Segment segment2 = (SlowMotionData.Segment) obj2;
                    return AbstractC1314Vy.A01().A07(segment.A02, segment2.A02).A07(segment.A01, segment2.A01).A06(segment.A00, segment2.A00).A05();
                }
            };
            CREATOR = new C1426aC();
        }

        public Segment(long j11, long j12, int i5) {
            AbstractC1062Ln.A07(j11 < j12);
            this.A02 = j11;
            this.A01 = j12;
            this.A00 = i5;
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
            Segment segment = (Segment) obj;
            return this.A02 == segment.A02 && this.A01 == segment.A01 && this.A00 == segment.A00;
        }

        public final int hashCode() {
            return A6.A00(Long.valueOf(this.A02), Long.valueOf(this.A01), Integer.valueOf(this.A00));
        }

        public final String toString() {
            return N1.A0n(A01(0, 54, 76), Long.valueOf(this.A02), Long.valueOf(this.A01), Integer.valueOf(this.A00));
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            parcel.writeLong(this.A02);
            parcel.writeLong(this.A01);
            parcel.writeInt(this.A00);
        }
    }

    public SlowMotionData(List<Segment> segments) {
        this.A00 = segments;
        AbstractC1062Ln.A07(!A02(segments));
    }

    /* JADX WARN: Incorrect condition in loop: B:7:0x0015 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean A02(List<Segment> segments) {
        if (segments.isEmpty()) {
            return false;
        }
        long j11 = segments.get(0).A01;
        for (int i5 = 1; i5 < i; i5++) {
            if (segments.get(i5).A02 < j11) {
                if (A02[4].length() != 8) {
                    throw new RuntimeException();
                }
                A02[5] = "ZRcff976jmehsSMZ";
                return true;
            }
            j11 = segments.get(i5).A01;
        }
        return false;
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
        return this.A00.equals(((SlowMotionData) obj).A00);
    }

    public final int hashCode() {
        return this.A00.hashCode();
    }

    public final String toString() {
        return A00(0, 21, 109) + this.A00;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeList(this.A00);
    }
}
