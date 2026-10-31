package com.facebook.ads.redexgen.X;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.annotation.Nullable;

/* loaded from: assets/audience_network/classes.dex */
public final class JB implements InterfaceC1943ie {
    public static byte[] A08;
    public static String[] A09 = {"X1JWoRd1RTsi5LXg3YfkE890Z0SkAp6s", "8cHG76lMVFwKxBGRg2kgut24eHhxfbd", "G9TzZa55JFGh4eGgvGtqHGY1m3qrW6LM", "T7A4lgHZzGr7V1uQcw7LfDSO4lerGRH7", "wT7nveBXif1G6UL4LkiEJi9kfhK", "XR1Jqmc9zxsTs7lfyBsyi3NvUHLKhP3K", "pVA6ZWYUVwE4UScIoRBBosOqE3FsfWwK", "nWmw"};
    public int A00;
    public InterfaceC1851h7<C1921iH> A01;
    public final InterfaceC1920iG A02;
    public final Cif A03;

    @Nullable
    public final Runnable A04;
    public final ArrayList<C1921iH> A05;
    public final ArrayList<C1921iH> A06;
    public final boolean A07;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A08, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 66);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A08 = new byte[]{-100, -75, -78, -75, -74, -66, -75, 103, -68, -73, -85, -88, -69, -84, 103, -74, -73, 103, -69, -64, -73, -84, 103, -83, -74, -71, 103, -44, -45, -47, -34, -123, -41, -54, -46, -44, -37, -54, -123, -58, -45, -55, -123, -38, -43, -55, -58, -39, -54, -123, -44, -43, -40, -123, -56, -58, -45, -123, -57, -54, -123, -55, -50, -40, -43, -58, -39, -56, -51, -54, -55, -123, -50, -45, -123, -53, -50, -41, -40, -39, -123, -43, -58, -40, -40, -24, -23, -103, -20, -31, -24, -18, -27, -35, -103, -37, -34, -103, -21, -34, -26, -24, -17, -34, -103, -24, -21, -103, -18, -23, -35, -38, -19, -34, -89, 30, 19, 26, 32, 23, 15, -53, 25, 26, 31, -53, 15, 20, 30, 27, 12, 31, 14, 19, -53, 12, 15, 15, -53, 26, 29, -53, 24, 26, 33, 16, -53, 17, 26, 29, -53, 27, 29, 16, -53, 23, 12, 36, 26, 32, 31};
    }

    static {
        A03();
    }

    public JB(InterfaceC1920iG interfaceC1920iG) {
        this(interfaceC1920iG, false);
    }

    public JB(InterfaceC1920iG interfaceC1920iG, boolean z11) {
        this.A01 = new JP(30);
        this.A05 = new ArrayList<>();
        this.A06 = new ArrayList<>();
        this.A00 = 0;
        this.A02 = interfaceC1920iG;
        this.A07 = z11;
        this.A03 = new Cif(this);
    }

    /* JADX WARN: Removed duplicated region for block: B:56:0x00d1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private int A00(int i5, int i11) {
        int i12;
        int count;
        int count2 = this.A06.size();
        for (int i13 = count2 - 1; i13 >= 0; i13--) {
            C1921iH c1921iH = this.A06.get(i13);
            int count3 = c1921iH.A00;
            if (count3 == 8) {
                int i14 = c1921iH.A02;
                int count4 = c1921iH.A01;
                if (i14 < count4) {
                    i12 = c1921iH.A02;
                    count = c1921iH.A01;
                } else {
                    i12 = c1921iH.A01;
                    count = c1921iH.A02;
                }
                if (i5 >= i12 && i5 <= count) {
                    int count5 = c1921iH.A02;
                    if (i12 == count5) {
                        if (i11 == 1) {
                            int count6 = c1921iH.A01;
                            c1921iH.A01 = count6 + 1;
                        } else if (i11 == 2) {
                            int count7 = c1921iH.A01;
                            c1921iH.A01 = count7 - 1;
                        }
                        i5++;
                    } else {
                        if (i11 == 1) {
                            int count8 = c1921iH.A02;
                            c1921iH.A02 = count8 + 1;
                        } else if (i11 == 2) {
                            int count9 = c1921iH.A02;
                            c1921iH.A02 = count9 - 1;
                        }
                        i5--;
                    }
                } else {
                    int count10 = c1921iH.A02;
                    if (i5 < count10) {
                        if (i11 == 1) {
                            int count11 = c1921iH.A02;
                            c1921iH.A02 = count11 + 1;
                            int count12 = c1921iH.A01;
                            c1921iH.A01 = count12 + 1;
                        } else if (i11 == 2) {
                            int count13 = c1921iH.A02;
                            c1921iH.A02 = count13 - 1;
                            int count14 = c1921iH.A01;
                            c1921iH.A01 = count14 - 1;
                        }
                    }
                }
            } else {
                int count15 = c1921iH.A02;
                if (count15 <= i5) {
                    int count16 = c1921iH.A00;
                    if (count16 == 1) {
                        int i15 = c1921iH.A01;
                        int i16 = A09[7].length();
                        if (i16 != 4) {
                            throw new RuntimeException();
                        }
                        A09[7] = "N0sU";
                        i5 -= i15;
                    } else {
                        int count17 = c1921iH.A00;
                        if (count17 == 2) {
                            int count18 = c1921iH.A01;
                            i5 += count18;
                        }
                    }
                } else if (i11 == 1) {
                    int count19 = c1921iH.A02;
                    c1921iH.A02 = count19 + 1;
                } else if (i11 == 2) {
                    int count20 = c1921iH.A02;
                    c1921iH.A02 = count20 - 1;
                }
            }
        }
        for (int size = this.A06.size() - 1; size >= 0; size--) {
            C1921iH c1921iH2 = this.A06.get(size);
            int count21 = c1921iH2.A00;
            if (count21 == 8) {
                int i17 = c1921iH2.A01;
                int count22 = c1921iH2.A02;
                if (i17 != count22) {
                    int count23 = c1921iH2.A01;
                    if (count23 < 0) {
                        this.A06.remove(size);
                        AIj(c1921iH2);
                    }
                }
            } else {
                int count24 = c1921iH2.A01;
                if (count24 <= 0) {
                    this.A06.remove(size);
                    AIj(c1921iH2);
                }
            }
        }
        return i5;
    }

    private final int A01(int i5, int i11) {
        int size = this.A06.size();
        while (i11 < size) {
            C1921iH c1921iH = this.A06.get(i11);
            int i12 = c1921iH.A00;
            if (i12 == 8) {
                int count = c1921iH.A02;
                if (count == i5) {
                    i5 = c1921iH.A01;
                } else {
                    int count2 = c1921iH.A02;
                    if (count2 < i5) {
                        i5--;
                    }
                    int count3 = c1921iH.A01;
                    if (count3 <= i5) {
                        i5++;
                    }
                }
            } else {
                int count4 = c1921iH.A02;
                if (count4 <= i5) {
                    int i13 = c1921iH.A00;
                    if (i13 == 2) {
                        int i14 = c1921iH.A02;
                        int count5 = c1921iH.A01;
                        if (i5 < i14 + count5) {
                            return -1;
                        }
                        int count6 = c1921iH.A01;
                        i5 -= count6;
                    } else {
                        int i15 = c1921iH.A00;
                        String[] strArr = A09;
                        String str = strArr[6];
                        String str2 = strArr[5];
                        int i16 = str.charAt(31);
                        int count7 = str2.charAt(31);
                        if (i16 != count7) {
                            throw new RuntimeException();
                        }
                        A09[1] = "6d2Cvy1MfGwOem3AHh21iiz4RwVuOhP";
                        if (i15 == 1) {
                            int count8 = c1921iH.A01;
                            i5 += count8;
                        }
                    }
                } else {
                    continue;
                }
            }
            i11++;
        }
        return i5;
    }

    private void A04(C1921iH c1921iH) {
        A09(c1921iH);
    }

    private void A05(C1921iH c1921iH) {
        A09(c1921iH);
    }

    private void A06(C1921iH c1921iH) {
        int i5 = c1921iH.A02;
        int i11 = 0;
        int i12 = c1921iH.A02;
        int tmpStart = c1921iH.A01;
        int i13 = i12 + tmpStart;
        char c11 = 65535;
        int i14 = c1921iH.A02;
        while (i14 < i13) {
            int tmpEnd = 0;
            if (this.A02.A79(i14) != null || A0C(i14)) {
                if (c11 == 0) {
                    A08(ADb(2, i5, i11, null));
                    tmpEnd = 1;
                }
                c11 = 1;
            } else {
                if (c11 == 1) {
                    A09(ADb(2, i5, i11, null));
                    tmpEnd = 1;
                }
                c11 = 0;
            }
            if (tmpEnd != 0) {
                i14 -= i11;
                i13 -= i11;
                i11 = 1;
            } else {
                i11++;
            }
            i14++;
        }
        int tmpStart2 = c1921iH.A01;
        if (i11 != tmpStart2) {
            AIj(c1921iH);
            c1921iH = ADb(2, i5, i11, null);
        }
        if (c11 == 0) {
            A08(c1921iH);
        } else {
            A09(c1921iH);
        }
    }

    private void A07(C1921iH c1921iH) {
        int i5 = c1921iH.A02;
        int i11 = 0;
        int i12 = c1921iH.A02;
        int tmpStart = c1921iH.A01;
        int i13 = i12 + tmpStart;
        char c11 = 65535;
        int position = c1921iH.A02;
        while (true) {
            String[] strArr = A09;
            String str = strArr[6];
            String str2 = strArr[5];
            int tmpCount = str.charAt(31);
            int tmpStart2 = str2.charAt(31);
            if (tmpCount != tmpStart2) {
                throw new RuntimeException();
            }
            A09[0] = "QVMb2fRXyzWHiAZPpRD1aZXDVthvAAWC";
            if (position < i13) {
                if (this.A02.A79(position) != null || A0C(position)) {
                    if (c11 == 0) {
                        A08(ADb(4, i5, i11, c1921iH.A03));
                        i11 = 0;
                        i5 = position;
                    }
                    c11 = 1;
                } else {
                    if (c11 == 1) {
                        A09(ADb(4, i5, i11, c1921iH.A03));
                        i11 = 0;
                        i5 = position;
                    }
                    c11 = 0;
                }
                i11++;
                position++;
            } else {
                int tmpStart3 = c1921iH.A01;
                if (i11 != tmpStart3) {
                    Object obj = c1921iH.A03;
                    AIj(c1921iH);
                    c1921iH = ADb(4, i5, i11, obj);
                }
                if (c11 == 0) {
                    A08(c1921iH);
                    return;
                } else {
                    A09(c1921iH);
                    return;
                }
            }
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:16:0x0056 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A08(C1921iH c1921iH) {
        int i5;
        if (c1921iH.A00 != 1) {
            int i11 = c1921iH.A00;
            if (A09[4].length() == 28) {
                throw new RuntimeException();
            }
            A09[7] = "fuh7";
            if (i11 != 8) {
                int offsetPositionForPartial = A00(c1921iH.A02, c1921iH.A00);
                int tmpCnt = 1;
                int positionMultiplier = c1921iH.A02;
                int tmpStart = c1921iH.A00;
                switch (tmpStart) {
                    case 2:
                        i5 = 0;
                        break;
                    case 3:
                    default:
                        throw new IllegalArgumentException(A02(85, 30, 55) + c1921iH);
                    case 4:
                        i5 = 1;
                        break;
                }
                for (int p11 = 1; p11 < tmpStart; p11++) {
                    int tmpStart2 = i5 * p11;
                    int i12 = c1921iH.A02 + tmpStart2;
                    int tmpStart3 = c1921iH.A00;
                    int iA00 = A00(i12, tmpStart3);
                    int pos = 0;
                    int tmpStart4 = c1921iH.A00;
                    switch (tmpStart4) {
                        case 2:
                            pos = iA00 == offsetPositionForPartial ? 1 : 0;
                            break;
                        case 4:
                            int tmpStart5 = offsetPositionForPartial + 1;
                            pos = iA00 == tmpStart5 ? 1 : 0;
                            break;
                    }
                    if (pos != 0) {
                        tmpCnt++;
                    } else {
                        C1921iH c1921iHADb = ADb(c1921iH.A00, offsetPositionForPartial, tmpCnt, c1921iH.A03);
                        A0A(c1921iHADb, positionMultiplier);
                        AIj(c1921iHADb);
                        if (c1921iH.A00 == 4) {
                            positionMultiplier += tmpCnt;
                        }
                        offsetPositionForPartial = iA00;
                        String[] strArr = A09;
                        String str = strArr[3];
                        String str2 = strArr[2];
                        int iCharAt = str.charAt(27);
                        int tmpStart6 = str2.charAt(27);
                        if (iCharAt != tmpStart6) {
                            tmpCnt = 1;
                        } else {
                            A09[1] = "yo86shE8ew7ry1OmrvVtBHjQ2wHk5Ec";
                            tmpCnt = 1;
                        }
                    }
                }
                Object payload = c1921iH.A03;
                AIj(c1921iH);
                if (tmpCnt > 0) {
                    int tmpStart7 = c1921iH.A00;
                    C1921iH c1921iHADb2 = ADb(tmpStart7, offsetPositionForPartial, tmpCnt, payload);
                    if (A09[7].length() != 4) {
                        throw new RuntimeException();
                    }
                    A09[4] = "6SUXoeHtz7oI0Lc";
                    A0A(c1921iHADb2, positionMultiplier);
                    AIj(c1921iHADb2);
                    return;
                }
                return;
            }
        }
        throw new IllegalArgumentException(A02(115, 46, 105));
    }

    private void A09(C1921iH c1921iH) {
        this.A06.add(c1921iH);
        switch (c1921iH.A00) {
            case 1:
                this.A02.ADc(c1921iH.A02, c1921iH.A01);
                return;
            case 2:
                this.A02.ADf(c1921iH.A02, c1921iH.A01);
                return;
            case 3:
            case 5:
            case 6:
            case 7:
            default:
                throw new IllegalArgumentException(A02(0, 27, 5) + c1921iH);
            case 4:
                this.A02.ADE(c1921iH.A02, c1921iH.A01, c1921iH.A03);
                return;
            case 8:
                this.A02.ADd(c1921iH.A02, c1921iH.A01);
                return;
        }
    }

    private final void A0A(C1921iH c1921iH, int i5) {
        this.A02.AEg(c1921iH);
        switch (c1921iH.A00) {
            case 2:
                this.A02.ADe(i5, c1921iH.A01);
                return;
            case 3:
            default:
                throw new IllegalArgumentException(A02(27, 58, 35));
            case 4:
                this.A02.ADE(i5, c1921iH.A01, c1921iH.A03);
                return;
        }
    }

    private final void A0B(List<C1921iH> list) {
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            AIj(list.get(i5));
        }
        list.clear();
    }

    private boolean A0C(int i5) {
        int size = this.A06.size();
        for (int pos = 0; pos < size; pos++) {
            C1921iH c1921iH = this.A06.get(pos);
            int i11 = c1921iH.A00;
            if (i11 == 8) {
                int i12 = c1921iH.A01;
                int count = pos + 1;
                if (A01(i12, count) == i5) {
                    return true;
                }
            } else {
                int i13 = c1921iH.A00;
                int i14 = A09[4].length();
                if (i14 == 28) {
                    throw new RuntimeException();
                }
                A09[7] = "h3FT";
                if (i13 == 1) {
                    int i15 = c1921iH.A02;
                    int count2 = c1921iH.A01;
                    int i16 = i15 + count2;
                    for (int i17 = c1921iH.A02; i17 < i16; i17++) {
                        int count3 = pos + 1;
                        if (A01(i17, count3) == i5) {
                            return true;
                        }
                    }
                } else {
                    continue;
                }
            }
        }
        return false;
    }

    public final int A0D(int i5) {
        return A01(i5, 0);
    }

    public final int A0E(int i5) {
        int size = this.A05.size();
        for (int i11 = 0; i11 < size; i11++) {
            C1921iH op2 = this.A05.get(i11);
            int size2 = op2.A00;
            switch (size2) {
                case 1:
                    int size3 = op2.A02;
                    if (size3 <= i5) {
                        int size4 = op2.A01;
                        i5 += size4;
                        break;
                    } else {
                        break;
                    }
                case 2:
                    int size5 = op2.A02;
                    if (size5 <= i5) {
                        int i12 = op2.A02;
                        int size6 = op2.A01;
                        if (i12 + size6 > i5) {
                            return -1;
                        }
                        int size7 = op2.A01;
                        i5 -= size7;
                        break;
                    } else {
                        continue;
                    }
                case 8:
                    int size8 = op2.A02;
                    if (size8 == i5) {
                        i5 = op2.A01;
                        break;
                    } else {
                        int size9 = op2.A02;
                        if (size9 < i5) {
                            i5--;
                        }
                        int size10 = op2.A01;
                        if (size10 <= i5) {
                            i5++;
                            break;
                        } else {
                            break;
                        }
                    }
            }
        }
        return i5;
    }

    public final void A0F() {
        int size = this.A06.size();
        for (int i5 = 0; i5 < size; i5++) {
            this.A02.AEi(this.A06.get(i5));
        }
        A0B(this.A06);
        this.A00 = 0;
    }

    public final void A0G() {
        A0F();
        int size = this.A05.size();
        for (int i5 = 0; i5 < size; i5++) {
            C1921iH c1921iH = this.A05.get(i5);
            int count = c1921iH.A00;
            switch (count) {
                case 1:
                    this.A02.AEi(c1921iH);
                    InterfaceC1920iG interfaceC1920iG = this.A02;
                    int i11 = c1921iH.A02;
                    int count2 = c1921iH.A01;
                    interfaceC1920iG.ADc(i11, count2);
                    break;
                case 2:
                    this.A02.AEi(c1921iH);
                    InterfaceC1920iG interfaceC1920iG2 = this.A02;
                    int i12 = c1921iH.A02;
                    int count3 = c1921iH.A01;
                    interfaceC1920iG2.ADe(i12, count3);
                    break;
                case 4:
                    this.A02.AEi(c1921iH);
                    InterfaceC1920iG interfaceC1920iG3 = this.A02;
                    int i13 = c1921iH.A02;
                    int i14 = c1921iH.A01;
                    interfaceC1920iG3.ADE(i13, i14, c1921iH.A03);
                    break;
                case 8:
                    this.A02.AEi(c1921iH);
                    InterfaceC1920iG interfaceC1920iG4 = this.A02;
                    int i15 = c1921iH.A02;
                    int count4 = c1921iH.A01;
                    interfaceC1920iG4.ADd(i15, count4);
                    break;
            }
            if (this.A04 != null) {
                this.A04.run();
            }
        }
        A0B(this.A05);
        this.A00 = 0;
        if (A09[0].charAt(28) != 'A') {
            throw new RuntimeException();
        }
        A09[1] = "6Qpi3zwbHCTXm3nhA4JhLro11ECL3LU";
    }

    public final void A0H() {
        this.A03.A05(this.A05);
        int size = this.A05.size();
        for (int i5 = 0; i5 < size; i5++) {
            C1921iH c1921iH = this.A05.get(i5);
            int i11 = c1921iH.A00;
            String[] strArr = A09;
            String str = strArr[6];
            String str2 = strArr[5];
            int i12 = str.charAt(31);
            int count = str2.charAt(31);
            if (i12 != count) {
                throw new RuntimeException();
            }
            A09[1] = "1BDdKJQJlsgxETOK14Gjs1hC7fjbuKK";
            switch (i11) {
                case 1:
                    A04(c1921iH);
                    break;
                case 2:
                    A06(c1921iH);
                    break;
                case 4:
                    A07(c1921iH);
                    break;
                case 8:
                    A05(c1921iH);
                    break;
            }
            if (this.A04 != null) {
                this.A04.run();
            }
        }
        this.A05.clear();
    }

    public final void A0I() {
        A0B(this.A05);
        A0B(this.A06);
        this.A00 = 0;
    }

    public final boolean A0J() {
        return this.A05.size() > 0;
    }

    public final boolean A0K() {
        return (this.A06.isEmpty() || this.A05.isEmpty()) ? false : true;
    }

    public final boolean A0L(int i5) {
        return (this.A00 & i5) != 0;
    }

    public final boolean A0M(@Nullable int i5, int i11, Object obj) {
        if (i11 < 1) {
            return false;
        }
        this.A05.add(ADb(4, i5, i11, obj));
        this.A00 |= 4;
        return this.A05.size() == 1;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1943ie
    public final C1921iH ADb(@Nullable int i5, int i11, int i12, Object obj) {
        C1921iH op2 = this.A01.A3X();
        if (op2 == null) {
            return new C1921iH(i5, i11, i12, obj);
        }
        op2.A00 = i5;
        op2.A02 = i11;
        op2.A01 = i12;
        op2.A03 = obj;
        return op2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1943ie
    public final void AIj(C1921iH c1921iH) {
        if (!this.A07) {
            c1921iH.A03 = null;
            this.A01.AIt(c1921iH);
        }
    }
}
