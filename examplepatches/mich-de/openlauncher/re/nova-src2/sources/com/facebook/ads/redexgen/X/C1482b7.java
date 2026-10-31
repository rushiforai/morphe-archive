package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.common.Metadata;
import com.facebook.ads.androidx.media3.extractor.metadata.mp4.SlowMotionData;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.b7, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1482b7 {
    public static byte[] A03;
    public static String[] A04 = {"zNK", "vIvWglcnQ7qKFb0Rok0hx", "c1ukHyGfRSnoNQd5OEd6G0pJfqf7lC", "iP7assWOFbLL7DDJmweoic8YvcJmysXt", "uXxcjU8o62g", "FqikrlfUwRV", "1rV7ujrtkRGNIaUMcxQUSxZM0OyLCHMu", "p4"};
    public static final C1319We A05;
    public static final C1319We A06;
    public int A01;
    public final List<C1479b4> A02 = new ArrayList();
    public int A00 = 0;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 103);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A03 = new byte[]{100, 67, 91, 76, 65, 68, 73, 13, 126, 104, 107, 13, 67, 76, 64, 72, 85, 106, 105, 113, 75, 105, 114, 111, 105, 104, 89, 66, 103, 114, 103, 32, 6, 3, 22, 1, 44, 32, 31, 28, 4, 62, 28, 7, 26, 28, 29, 44, 49, 52, 62, 43, 13, 8, 29, 10, 39, 43, 20, 23, 15, 53, 23, 12, 17, 23, 22, 39, 60, 25, 12, 25, 68, 98, 103, 114, 101, 72, 68, 123, 120, 96, 90, 120, 99, 126, 120, 121, 72, 83, 114, 113, 123, 126, 116, 124, 114, 101, 126, 121, 112, 72, 88, 121, 112, 86, 83, 70, 81, 124, 112, 79, 76, 84, 110, 76, 87, 74, 76, 77, 124, 102, 71, 74, 87, 124, 103, 66, 87, 66};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private void A06(Q9 q92, List<Metadata.Entry> list) throws IOException {
        long jA9Q = q92.A9Q();
        int iA90 = (int) ((q92.A90() - q92.A9Q()) - this.A01);
        C1084Mk c1084Mk = new C1084Mk(iA90);
        q92.readFully(c1084Mk.A0l(), 0, iA90);
        for (int i5 = 0; i5 < this.A02.size(); i5++) {
            C1479b4 c1479b4 = this.A02.get(i5);
            c1084Mk.A0f((int) (c1479b4.A02 - jA9Q));
            c1084Mk.A0g(4);
            int iA0E = c1084Mk.A0E();
            if (A04[3].charAt(11) != 'L') {
                throw new RuntimeException();
            }
            A04[2] = "xMc6j4gz3ok9CZcN6alkrEQubRj6HZ";
            int iA00 = A00(c1084Mk.A0W(iA0E));
            int i11 = c1479b4.A01 - (iA0E + 8);
            switch (iA00) {
                case 2192:
                    list.add(A01(c1084Mk, i11));
                    break;
                case 2816:
                case 2817:
                case 2819:
                case 2820:
                    break;
                default:
                    throw new IllegalStateException();
            }
        }
    }

    static {
        A03();
        A06 = C1319We.A02(AbstractJsonLexerKt.COLON);
        A05 = C1319We.A02('*');
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0007  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A00(String str) throws L9 {
        char c11;
        switch (str.hashCode()) {
            case -1711564334:
                if (!str.equals(A02(16, 15, 97))) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 0;
                    break;
                }
            case -1332107749:
                if (str.equals(A02(104, 26, 68))) {
                    c11 = 3;
                    break;
                }
                break;
            case -1251387154:
                if (str.equals(A02(51, 21, 31))) {
                    c11 = 1;
                    break;
                }
                break;
            case -830665521:
                if (str.equals(A02(72, 32, 112))) {
                    c11 = 4;
                    break;
                }
                break;
            case 1760745220:
                if (str.equals(A02(31, 20, 20))) {
                    c11 = 2;
                    break;
                }
                break;
        }
        switch (c11) {
            case 0:
                return 2192;
            case 1:
                return 2816;
            case 2:
                return 2817;
            case 3:
                return 2819;
            case 4:
                return 2820;
            default:
                throw L9.A01(A02(0, 16, 74), null);
        }
    }

    public static SlowMotionData A01(C1084Mk c1084Mk, int i5) throws NumberFormatException, L9 {
        List<SlowMotionData.Segment> segments = new ArrayList<>();
        String dataString = c1084Mk.A0W(i5);
        List<String> listA06 = A05.A06(dataString);
        for (int i11 = 0; i11 < listA06.size(); i11++) {
            List<String> listA062 = A06.A06(listA06.get(i11));
            if (listA062.size() == 3) {
                try {
                    long j11 = Long.parseLong(listA062.get(0));
                    long startTimeMs = Long.parseLong(listA062.get(1));
                    segments.add(new SlowMotionData.Segment(j11, startTimeMs, 1 << (Integer.parseInt(listA062.get(2)) - 1)));
                } catch (NumberFormatException e3) {
                    throw L9.A01(null, e3);
                }
            } else {
                throw L9.A01(null, null);
            }
        }
        return new SlowMotionData(segments);
    }

    private void A04(Q9 q92, ZH zh2) throws IOException {
        C1084Mk c1084Mk = new C1084Mk(8);
        q92.readFully(c1084Mk.A0l(), 0, 8);
        this.A01 = c1084Mk.A0E() + 8;
        if (c1084Mk.A0C() != 1397048916) {
            zh2.A00 = 0L;
        } else {
            zh2.A00 = q92.A9Q() - (this.A01 - 12);
            this.A00 = 2;
        }
    }

    private void A05(Q9 q92, ZH zh2) throws IOException {
        long jA90 = q92.A90();
        int i5 = (this.A01 - 12) - 8;
        C1084Mk c1084Mk = new C1084Mk(i5);
        q92.readFully(c1084Mk.A0l(), 0, i5);
        for (int i11 = 0; i11 < i5 / 12; i11++) {
            c1084Mk.A0g(2);
            int i12 = c1084Mk.A0a();
            switch (i12) {
                case 2192:
                case 2816:
                case 2817:
                case 2819:
                case 2820:
                    long streamLength = this.A01;
                    long j11 = jA90 - streamLength;
                    long streamLength2 = c1084Mk.A0E();
                    int size = c1084Mk.A0E();
                    this.A02.add(new C1479b4(i12, j11 - streamLength2, size));
                    break;
                default:
                    c1084Mk.A0g(8);
                    break;
            }
        }
        if (this.A02.isEmpty()) {
            zh2.A00 = 0L;
            return;
        }
        this.A00 = 3;
        long streamLength3 = this.A02.get(0).A02;
        zh2.A00 = streamLength3;
    }

    public final int A07(Q9 q92, ZH zh2, List<Metadata.Entry> slowMotionMetadataEntries) throws IOException {
        long j11 = 0;
        switch (this.A00) {
            case 0:
                long jA90 = q92.A90();
                if (jA90 != -1 && jA90 >= 8) {
                    j11 = jA90 - 8;
                }
                zh2.A00 = j11;
                this.A00 = 1;
                return 1;
            case 1:
                A04(q92, zh2);
                return 1;
            case 2:
                A05(q92, zh2);
                return 1;
            case 3:
                A06(q92, slowMotionMetadataEntries);
                zh2.A00 = 0L;
                return 1;
            default:
                throw new IllegalStateException();
        }
    }

    public final void A08() {
        this.A02.clear();
        this.A00 = 0;
    }
}
