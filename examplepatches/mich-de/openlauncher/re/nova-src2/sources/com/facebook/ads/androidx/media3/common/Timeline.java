package com.facebook.ads.androidx.media3.common;

import android.os.Bundle;
import android.os.IBinder;
import android.util.Pair;
import com.facebook.ads.androidx.media3.common.Timeline;
import com.facebook.ads.redexgen.X.AbstractBinderC1016Jr;
import com.facebook.ads.redexgen.X.AbstractC07549l;
import com.facebook.ads.redexgen.X.AbstractC1062Ln;
import com.facebook.ads.redexgen.X.AbstractC1067Ls;
import com.facebook.ads.redexgen.X.C06344e;
import com.facebook.ads.redexgen.X.C9K;
import com.facebook.ads.redexgen.X.InterfaceC1017Js;
import com.facebook.ads.redexgen.X.InterfaceC1018Jt;
import com.facebook.ads.redexgen.X.N1;
import com.facebook.ads.redexgen.X.UK;
import com.facebook.ads.redexgen.X.UM;
import com.google.common.collect.ImmutableList;

/* loaded from: assets/audience_network/classes.dex */
public abstract class Timeline implements InterfaceC1018Jt {
    public static String[] A00 = {"iXz9IdViaxesDvssZDMrU2", "902jBKsSGCUy3GN03syyWTT3P53HwN8i", "cpamzQxdPpEvHFLmNkiAWbWRCL8TRkXJ", "Q95qgWchppvAnnzyy7qtE", "ojHuVzavOvlzwT6yHvUIJXrejcAKIS2c", "owXJpSDSE9XS1nP6QheBZ461E5xkAMaW", "5XYUbYlnz0mvHoIalWBa3KrJNUzF58ks", "KAfJIHYhk4n7AndF2A7YvQ2XejzsQ4OX"};
    public static final Timeline A02 = new Timeline() { // from class: com.facebook.ads.redexgen.X.9L
        @Override // com.facebook.ads.androidx.media3.common.Timeline
        public final int A06() {
            return 0;
        }

        @Override // com.facebook.ads.androidx.media3.common.Timeline
        public final int A07() {
            return 0;
        }

        @Override // com.facebook.ads.androidx.media3.common.Timeline
        public final int A0A(Object obj) {
            return -1;
        }

        @Override // com.facebook.ads.androidx.media3.common.Timeline
        public final UM A0I(int i5, UM um2, boolean z11) {
            throw new IndexOutOfBoundsException();
        }

        @Override // com.facebook.ads.androidx.media3.common.Timeline
        public final UK A0L(int i5, UK uk2, long j11) {
            throw new IndexOutOfBoundsException();
        }

        @Override // com.facebook.ads.androidx.media3.common.Timeline
        public final Object A0M(int i5) {
            throw new IndexOutOfBoundsException();
        }
    };
    public static final String A05 = N1.A0h(0);
    public static final String A03 = N1.A0h(1);
    public static final String A04 = N1.A0h(2);
    public static final InterfaceC1017Js<Timeline> A01 = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.UP
        @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
        public final InterfaceC1018Jt A7F(Bundle bundle) {
            return Timeline.A02(bundle);
        }
    };

    public abstract int A06();

    public abstract int A07();

    public abstract int A0A(Object obj);

    public abstract UM A0I(int i5, UM um2, boolean z11);

    public abstract UK A0L(int i5, UK uk2, long j11);

    public abstract Object A0M(int i5);

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<com.facebook.ads.androidx.media3.common.Timeline$Period> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<com.facebook.ads.androidx.media3.common.Timeline$Window> */
    public static C9K A02(Bundle bundle) {
        final AbstractC07549l abstractC07549lA04 = A04(UK.A0J, AbstractC1067Ls.A00(bundle, A05));
        final AbstractC07549l abstractC07549lA042 = A04(UM.A08, AbstractC1067Ls.A00(bundle, A03));
        final int[] intArray = bundle.getIntArray(A04);
        if (intArray == null) {
            intArray = A05(abstractC07549lA04.size());
        }
        ImmutableList<Window> windows = new Timeline(abstractC07549lA04, abstractC07549lA042, intArray) { // from class: com.facebook.ads.redexgen.X.9K
            public static String[] A04 = {"uBgQio", "BYm52oHJK3K", "aC01MgvsXa2yvH2jZk1eLEUf5g1fQm", "dn7YJpAg", "QHSiiMsdXe3k6n4vo0Wi", "WNSDwkVSK8kZwmOeTNY4kXKP6W06Ao6M", "hbGNqKOTwKI4Q8X2puB7gM5ZpNhmTHBB", "7QF2VbCSr34FyhrEo9OWyWNwtq4W3379"};
            public final AbstractC07549l<UM> A00;
            public final AbstractC07549l<UK> A01;
            public final int[] A02;
            public final int[] A03;

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<com.facebook.ads.androidx.media3.common.Timeline$Period> */
            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<com.facebook.ads.androidx.media3.common.Timeline$Window> */
            /* JADX WARN: Incorrect condition in loop: B:7:0x001b */
            {
                AbstractC1062Ln.A07(abstractC07549lA04.size() == intArray.length);
                this.A01 = abstractC07549lA04;
                this.A00 = abstractC07549lA042;
                this.A02 = intArray;
                this.A03 = new int[intArray.length];
                for (int i5 = 0; i5 < i; i5++) {
                    int[] iArr = this.A03;
                    int i11 = intArray[i5];
                    iArr[i11] = i5;
                }
            }

            @Override // com.facebook.ads.androidx.media3.common.Timeline
            public final int A06() {
                return this.A00.size();
            }

            @Override // com.facebook.ads.androidx.media3.common.Timeline
            public final int A07() {
                return this.A01.size();
            }

            @Override // com.facebook.ads.androidx.media3.common.Timeline
            public final int A08(int i5, int i11, boolean z11) {
                if (i11 == 1) {
                    return i5;
                }
                if (i5 == A0C(z11)) {
                    if (i11 == 2) {
                        return A0B(z11);
                    }
                    return -1;
                }
                if (z11) {
                    return this.A02[this.A03[i5] + 1];
                }
                return i5 + 1;
            }

            @Override // com.facebook.ads.androidx.media3.common.Timeline
            public final int A0A(Object obj) {
                throw new UnsupportedOperationException();
            }

            @Override // com.facebook.ads.androidx.media3.common.Timeline
            public final int A0B(boolean z11) {
                if (!A0N()) {
                    if (z11) {
                        return this.A02[0];
                    }
                    return 0;
                }
                String[] strArr = A04;
                if (strArr[1].length() == strArr[4].length()) {
                    throw new RuntimeException();
                }
                A04[6] = "JpAqLo2lciu93y1MBP3JR416ima75clG";
                return -1;
            }

            @Override // com.facebook.ads.androidx.media3.common.Timeline
            public final int A0C(boolean z11) {
                if (A0N()) {
                    if (A04[3].length() != 21) {
                        A04[3] = "ypl0k4EuIoZsPyyA88VrOXk6";
                        return -1;
                    }
                } else if (z11) {
                    int[] iArr = this.A02;
                    if (A04[3].length() != 21) {
                        A04[6] = "HmcEDHf8AIECQzXJLgFXbL9gu7RTC3MH";
                        return iArr[A07() - 1];
                    }
                } else {
                    int iA07 = A07();
                    if (A04[3].length() == 21) {
                        A04[3] = "H0VdlkE";
                        return iA07 - 1;
                    }
                    String[] strArr = A04;
                    strArr[0] = "7y8oZz";
                    strArr[2] = "TKlFQF19R4AdRia15QYaSHM3DbFakK";
                    return iA07 - 1;
                }
                throw new RuntimeException();
            }

            @Override // com.facebook.ads.androidx.media3.common.Timeline
            public final UM A0I(int i5, UM p11, boolean z11) {
                UM p12 = this.A00.get(i5);
                p11.A0G(p12.A03, p12.A04, p12.A00, p12.A01, p12.A02, p12.A06, p12.A05);
                return p11;
            }

            @Override // com.facebook.ads.androidx.media3.common.Timeline
            public final UK A0L(int i5, UK uk2, long j11) {
                UK uk3 = this.A01.get(i5);
                uk2.A07(uk3.A0C, uk3.A09, uk3.A0A, uk3.A06, uk3.A07, uk3.A04, uk3.A0G, uk3.A0D, uk3.A08, uk3.A02, uk3.A03, uk3.A00, uk3.A01, uk3.A05);
                uk2.A0F = uk3.A0F;
                return uk2;
            }

            @Override // com.facebook.ads.androidx.media3.common.Timeline
            public final Object A0M(int i5) {
                throw new UnsupportedOperationException();
            }
        };
        return windows;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4e != com.google.common.collect.ImmutableList$Builder<T extends com.facebook.ads.redexgen.X.Jt> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Js != com.facebook.ads.androidx.media3.common.Bundleable$Creator<T extends com.facebook.ads.redexgen.X.Jt> */
    public static <T extends InterfaceC1018Jt> AbstractC07549l<T> A04(InterfaceC1017Js<T> interfaceC1017Js, IBinder iBinder) {
        if (iBinder == null) {
            return AbstractC07549l.A03();
        }
        C06344e c06344e = new C06344e();
        AbstractC07549l<Bundle> abstractC07549lA00 = AbstractBinderC1016Jr.A00(iBinder);
        for (int i5 = 0; i5 < abstractC07549lA00.size(); i5++) {
            c06344e.A04(interfaceC1017Js.A7F(abstractC07549lA00.get(i5)));
        }
        return c06344e.A05();
    }

    public static int[] A05(int i5) {
        int[] iArr = new int[i5];
        for (int i11 = 0; i11 < i5; i11++) {
            iArr[i11] = i11;
        }
        return iArr;
    }

    public int A08(int i5, int i11, boolean z11) {
        switch (i11) {
            case 0:
                if (i5 == A0C(z11)) {
                    return -1;
                }
                return i5 + 1;
            case 1:
                return i5;
            case 2:
                if (i5 == A0C(z11)) {
                    return A0B(z11);
                }
                return i5 + 1;
            default:
                throw new IllegalStateException();
        }
    }

    public final int A09(int i5, UM um2, UK uk2, int i11, boolean z11) {
        int i12 = A0H(i5, um2).A00;
        int windowIndex = A0K(i12, uk2).A01;
        if (windowIndex == i5) {
            int nextWindowIndex = A08(i12, i11, z11);
            if (nextWindowIndex == -1) {
                return -1;
            }
            int windowIndex2 = A0K(nextWindowIndex, uk2).A00;
            return windowIndex2;
        }
        int windowIndex3 = i5 + 1;
        return windowIndex3;
    }

    public int A0B(boolean z11) {
        return A0N() ? -1 : 0;
    }

    public int A0C(boolean z11) {
        if (A0N()) {
            return -1;
        }
        return A07() - 1;
    }

    @Deprecated
    public final Pair<Object, Long> A0D(UK uk2, UM um2, int i5, long j11) {
        return A0E(uk2, um2, i5, j11);
    }

    public final Pair<Object, Long> A0E(UK uk2, UM um2, int i5, long j11) {
        return (Pair) AbstractC1062Ln.A01(A0G(uk2, um2, i5, j11, 0L));
    }

    @Deprecated
    public final Pair<Object, Long> A0F(UK uk2, UM um2, int i5, long j11, long j12) {
        return A0G(uk2, um2, i5, j11, j12);
    }

    public final Pair<Object, Long> A0G(UK uk2, UM um2, int i5, long j11, long j12) {
        AbstractC1062Ln.A00(i5, 0, A07());
        A0L(i5, uk2, j12);
        if (j11 == -9223372036854775807L) {
            j11 = uk2.A05();
            if (j11 == -9223372036854775807L) {
                if (A00[0].length() != 22) {
                    throw new RuntimeException();
                }
                A00[3] = "r7iFKwGABjGBgt08xi8xh";
                return null;
            }
        }
        int i11 = uk2.A00;
        A0H(i11, um2);
        while (i11 < uk2.A01 && um2.A02 != j11 && A0H(i11 + 1, um2).A02 <= j11) {
            i11++;
        }
        A0I(i11, um2, true);
        long jMin = j11 - um2.A02;
        if (um2.A01 != -9223372036854775807L) {
            jMin = Math.min(jMin, um2.A01 - 1);
        }
        long jMax = Math.max(0L, jMin);
        Object obj = um2.A04;
        if (A00[0].length() != 22) {
            throw new RuntimeException();
        }
        String[] strArr = A00;
        strArr[2] = "cpwMXKROxgxWbDhlucA1RyCwbmQORN5S";
        strArr[4] = "qnIho8OZsEdG5rtbX5zMjqcNhamTc68f";
        return Pair.create(AbstractC1062Ln.A01(obj), Long.valueOf(jMax));
    }

    public final UM A0H(int i5, UM um2) {
        return A0I(i5, um2, false);
    }

    public UM A0J(Object obj, UM um2) {
        return A0I(A0A(obj), um2, true);
    }

    public final UK A0K(int i5, UK uk2) {
        return A0L(i5, uk2, 0L);
    }

    public final boolean A0N() {
        return A07() == 0;
    }

    public final boolean A0O(int i5, UM um2, UK uk2, int i11, boolean z11) {
        return A09(i5, um2, uk2, i11, z11) == -1;
    }

    public final boolean equals(Object obj) {
        int iA0C;
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Timeline)) {
            return false;
        }
        Timeline timeline = (Timeline) obj;
        if (timeline.A07() != A07() || timeline.A06() != A06()) {
            return false;
        }
        UK uk2 = new UK();
        UM otherPeriod = new UM();
        UK uk3 = new UK();
        UM um2 = new UM();
        for (int i5 = 0; i5 < A07(); i5++) {
            if (!A0K(i5, uk2).equals(timeline.A0K(i5, uk3))) {
                return false;
            }
        }
        for (int i11 = 0; i11 < A06(); i11++) {
            if (!A0I(i11, otherPeriod, true).equals(timeline.A0I(i11, um2, true))) {
                return false;
            }
        }
        int iA0B = A0B(true);
        if (iA0B != timeline.A0B(true) || (iA0C = A0C(true)) != timeline.A0C(true)) {
            return false;
        }
        while (iA0B != iA0C) {
            int iA08 = A08(iA0B, 0, true);
            if (iA08 != timeline.A08(iA0B, 0, true)) {
                return false;
            }
            iA0B = iA08;
        }
        return true;
    }

    public final int hashCode() {
        UK uk2 = new UK();
        UM um2 = new UM();
        int result = 7 * 31;
        int i5 = result + A07();
        for (int i11 = 0; i11 < A07(); i11++) {
            UK window = A0K(i11, uk2);
            i5 = (i5 * 31) + window.hashCode();
        }
        int result2 = i5 * 31;
        int i12 = result2 + A06();
        for (int i13 = 0; i13 < A06(); i13++) {
            i12 = (i12 * 31) + A0I(i13, um2, true).hashCode();
        }
        int iA0B = A0B(true);
        while (iA0B != -1) {
            int windowIndex = i12 * 31;
            i12 = windowIndex + iA0B;
            iA0B = A08(iA0B, 0, true);
        }
        return i12;
    }
}
