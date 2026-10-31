package com.facebook.ads.redexgen.X;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.concurrent.TimeUnit;

/* renamed from: com.facebook.ads.redexgen.X.iX, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class RunnableC1937iX implements Runnable {
    public static Comparator<C1936iW> A04;
    public static byte[] A05;
    public static String[] A06 = {"C", "g", "thIgEQWd9nx", "UJ", "nKFIv9xSQBz", "WKzZJ6F0j2u08DpGCnjDR9E", "2Nt4JwZoKXCf4OpJNcF1oxTto7W5gJbD", "RW"};
    public static final ThreadLocal<RunnableC1937iX> A07;
    public long A00;
    public long A01;
    public ArrayList<C7O> A02 = new ArrayList<>();
    public ArrayList<C1936iW> A03 = new ArrayList<>();

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 8);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A05 = new byte[]{97, 101, 47, 93, 116, -126, -125, 116, 115, 47, 95, -127, 116, 117, 116, -125, 114, 119, 92, 96, 42, 90, 124, 111, 112, 111, 126, 109, 114};
    }

    static {
        A03();
        A07 = new ThreadLocal<>();
        A04 = new C1935iV();
    }

    private AbstractC1978jE A00(C7O c7o, int i5, long j11) {
        if (A08(c7o, i5)) {
            return null;
        }
        C1968j4 c1968j4 = c7o.A0r;
        try {
            c7o.A1O();
            AbstractC1978jE abstractC1978jEA0J = c1968j4.A0J(i5, false, j11);
            if (abstractC1978jEA0J != null) {
                if (abstractC1978jEA0J.A0l() && !abstractC1978jEA0J.A0m()) {
                    c1968j4.A0Y(abstractC1978jEA0J.A0H);
                } else {
                    c1968j4.A0e(abstractC1978jEA0J, false);
                }
            }
            return abstractC1978jEA0J;
        } finally {
            c7o.A1v(false);
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:20:0x0078 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A02() {
        C1936iW c1936iW;
        int i5 = this.A02.size();
        int i11 = 0;
        for (int i12 = 0; i12 < i5; i12++) {
            C7O c7o = this.A02.get(i12);
            int viewCount = c7o.getWindowVisibility();
            if (viewCount == 0) {
                c7o.A02.A04(c7o, false);
                int viewCount2 = c7o.A02.A00;
                i11 += viewCount2;
            }
        }
        this.A03.ensureCapacity(i11);
        int i13 = 0;
        String[] strArr = A06;
        String str = strArr[3];
        String str2 = strArr[7];
        int totalTaskCount = str.length();
        int viewCount3 = str2.length();
        if (totalTaskCount != viewCount3) {
            throw new RuntimeException();
        }
        String[] strArr2 = A06;
        strArr2[3] = "OH";
        strArr2[7] = "7S";
        for (int i14 = 0; i14 < i5; i14++) {
            C7O c7o2 = this.A02.get(i14);
            int viewCount4 = c7o2.getWindowVisibility();
            if (viewCount4 == 0) {
                JA ja2 = c7o2.A02;
                int viewCount5 = ja2.A01;
                int iAbs = Math.abs(viewCount5);
                int viewCount6 = ja2.A02;
                int iAbs2 = iAbs + Math.abs(viewCount6);
                for (int i15 = 0; i15 < viewCount * 2; i15 += 2) {
                    int viewCount7 = this.A03.size();
                    if (i13 >= viewCount7) {
                        c1936iW = new C1936iW();
                        this.A03.add(c1936iW);
                    } else {
                        c1936iW = this.A03.get(i13);
                    }
                    int totalTaskCount2 = i15 + 1;
                    int totalTaskIndex = ja2.A03[totalTaskCount2];
                    c1936iW.A04 = totalTaskIndex <= iAbs2;
                    c1936iW.A02 = iAbs2;
                    c1936iW.A00 = totalTaskIndex;
                    c1936iW.A03 = c7o2;
                    int totalTaskCount3 = ja2.A03[i15];
                    c1936iW.A01 = totalTaskCount3;
                    i13++;
                }
            }
        }
        Collections.sort(this.A03, A04);
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0007 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A04(long j11) {
        for (int i5 = 0; i5 < i; i5++) {
            C1936iW task = this.A03.get(i5);
            if (task.A03 == null) {
                return;
            }
            A06(task, j11);
            task.A00();
        }
    }

    private final void A05(long j11) {
        A02();
        A04(j11);
    }

    private void A06(C1936iW c1936iW, long j11) {
        AbstractC1978jE abstractC1978jEA00 = A00(c1936iW.A03, c1936iW.A01, c1936iW.A04 ? Long.MAX_VALUE : j11);
        if (abstractC1978jEA00 != null && abstractC1978jEA00.A09 != null && abstractC1978jEA00.A0l() && !abstractC1978jEA00.A0m()) {
            A07(abstractC1978jEA00.A09.get(), j11);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0030 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:31:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A07(C7O c7o, long j11) {
        JA ja2;
        if (c7o == null) {
            return;
        }
        if (c7o.A0C) {
            C1924iK c1924iK = c7o.A01;
            if (A06[5].length() != 17) {
                A06[6] = "t2x0aSlbBonOFe0N5m1ttILNz4IaYpUW";
                if (c1924iK.A06() != 0) {
                    c7o.A1R();
                }
                ja2 = c7o.A02;
                ja2.A04(c7o, true);
                if (ja2.A00 == 0) {
                    try {
                        AbstractC1842gy.A01(A01(0, 18, 7));
                        c7o.A0s.A05(c7o.A04);
                        int i5 = 0;
                        while (true) {
                            int i11 = ja2.A00 * 2;
                            int i12 = A06[6].charAt(8);
                            if (i12 == 73) {
                                break;
                            }
                            String[] strArr = A06;
                            strArr[3] = "nG";
                            strArr[7] = "TD";
                            if (i5 < i11) {
                                A00(c7o, ja2.A03[i5], j11);
                                i5 += 2;
                            } else {
                                return;
                            }
                        }
                    } finally {
                        AbstractC1842gy.A00();
                    }
                } else {
                    return;
                }
            }
        } else {
            ja2 = c7o.A02;
            ja2.A04(c7o, true);
            if (ja2.A00 == 0) {
            }
        }
        throw new RuntimeException();
    }

    public static boolean A08(C7O c7o, int i5) {
        int iA06 = c7o.A01.A06();
        for (int i11 = 0; i11 < iA06; i11++) {
            AbstractC1978jE abstractC1978jEA0F = C7O.A0F(c7o.A01.A0A(i11));
            int childCount = abstractC1978jEA0F.A03;
            if (childCount == i5 && !abstractC1978jEA0F.A0m()) {
                return true;
            }
        }
        return false;
    }

    public final void A09(C7O c7o) {
        this.A02.add(c7o);
    }

    public final void A0A(C7O c7o) {
        this.A02.remove(c7o);
    }

    public final void A0B(C7O c7o, int i5, int i11) {
        if (c7o.isAttachedToWindow() && this.A01 == 0) {
            this.A01 = c7o.getNanoTime();
            c7o.post(this);
        }
        c7o.A02.A03(i5, i11);
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            AbstractC1842gy.A01(A01(18, 11, 2));
            if (this.A02.isEmpty()) {
                return;
            }
            int size = this.A02.size();
            long jMax = 0;
            for (int i5 = 0; i5 < size; i5++) {
                C7O c7o = this.A02.get(i5);
                if (c7o.getWindowVisibility() == 0) {
                    jMax = Math.max(c7o.getDrawingTime(), jMax);
                }
            }
            if (jMax == 0) {
                this.A01 = 0L;
                if (A06[5].length() == 17) {
                    throw new RuntimeException();
                }
                A06[5] = "H4nD1dOrFb1";
                AbstractC1842gy.A00();
                return;
            }
            A05(TimeUnit.MILLISECONDS.toNanos(jMax) + this.A00);
        } finally {
            this.A01 = 0L;
            AbstractC1842gy.A00();
        }
    }
}
