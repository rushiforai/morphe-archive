package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/* loaded from: assets/audience_network/classes.dex */
public final class XI {
    public static String[] A07 = {"eK1JQiJIN", "vV", "sSfilxyfo", "oT", "N9RSq", "YS8BvvYoS54Hrsx90miFpeGa8wtBNGRO", "t44Dj4oKBKlsCViBWQ4CmoL2A0AbslZ5", "oGM1CKCB6Ar44OqcUMwlLlkp1pOqwa6K"};
    public static final Comparator<XH> A08 = new Comparator() { // from class: com.facebook.ads.redexgen.X.XE
        @Override // java.util.Comparator
        public final int compare(Object obj, Object obj2) {
            return XI.A00((XH) obj, (XH) obj2);
        }
    };
    public static final Comparator<XH> A09 = new Comparator() { // from class: com.facebook.ads.redexgen.X.XF
        @Override // java.util.Comparator
        public final int compare(Object obj, Object obj2) {
            return Float.compare(((XH) obj).A00, ((XH) obj2).A00);
        }
    };
    public int A01;
    public int A02;
    public int A03;
    public final int A04;
    public final XH[] A06 = new XH[5];
    public final ArrayList<XH> A05 = new ArrayList<>();
    public int A00 = -1;

    public XI(int i5) {
        this.A04 = i5;
    }

    public static /* synthetic */ int A00(XH xh, XH xh2) {
        return xh.A01 - xh2.A01;
    }

    private void A02() {
        if (this.A00 != 1) {
            Collections.sort(this.A05, A08);
            this.A00 = 1;
        }
    }

    private void A03() {
        if (this.A00 != 0) {
            Collections.sort(this.A05, A09);
            this.A00 = 0;
        }
    }

    private final void A04(int i5, float f11) {
        XH xh;
        A02();
        if (this.A02 > 0) {
            XH[] xhArr = this.A06;
            int i11 = this.A02 - 1;
            this.A02 = i11;
            xh = xhArr[i11];
        } else {
            xh = new XH();
        }
        int i12 = this.A01;
        int i13 = i12 + 1;
        if (A07[1].length() == 23) {
            throw new RuntimeException();
        }
        String[] strArr = A07;
        strArr[3] = "tx";
        strArr[4] = "Cytbm";
        this.A01 = i13;
        xh.A01 = i12;
        xh.A02 = i5;
        xh.A00 = f11;
        this.A05.add(xh);
        this.A03 += i5;
        while (this.A03 > this.A04) {
            int excessWeight = this.A03 - this.A04;
            XH xh2 = this.A05.get(0);
            if (xh2.A02 <= excessWeight) {
                int i14 = this.A03 - xh2.A02;
                if (A07[1].length() != 23) {
                    A07[1] = "iK6rAqTjljbq1HGtDKPwExRBICI";
                    this.A03 = i14;
                    this.A05.remove(0);
                    if (this.A02 < 5) {
                        XH[] xhArr2 = this.A06;
                        int excessWeight2 = this.A02;
                        this.A02 = excessWeight2 + 1;
                        xhArr2[excessWeight2] = xh2;
                    }
                } else {
                    this.A03 = i14;
                    this.A05.remove(0);
                    if (this.A02 < 5) {
                        XH[] xhArr22 = this.A06;
                        int excessWeight22 = this.A02;
                        this.A02 = excessWeight22 + 1;
                        xhArr22[excessWeight22] = xh2;
                    }
                }
            } else {
                xh2.A02 -= excessWeight;
                this.A03 -= excessWeight;
            }
        }
    }

    public final float A05(float f11) {
        A03();
        float f12 = this.A03 * f11;
        int i5 = 0;
        for (int i11 = 0; i11 < this.A05.size(); i11++) {
            XH xh = this.A05.get(i11);
            i5 += xh.A02;
            float desiredWeight = i5;
            if (desiredWeight >= f12) {
                float f13 = xh.A00;
                String[] strArr = A07;
                String str = strArr[3];
                String str2 = strArr[4];
                int accumulatedWeight = str.length();
                if (accumulatedWeight == str2.length()) {
                    throw new RuntimeException();
                }
                A07[1] = "LM2kE3OEQiAHdQbzclDHHP2b570";
                return f13;
            }
        }
        if (this.A05.isEmpty()) {
            return Float.NaN;
        }
        float desiredWeight2 = this.A05.get(this.A05.size() - 1).A00;
        return desiredWeight2;
    }

    public final void A06() {
        this.A05.clear();
        this.A00 = -1;
        this.A01 = 0;
        this.A03 = 0;
    }

    @MetaExoPlayerCustomization
    public final void A07(int i5, float f11) {
        XH oldestSample;
        if (XL.A03(XQ.A1n)) {
            A04(i5, f11);
            return;
        }
        A02();
        String[] strArr = A07;
        if (strArr[7].charAt(9) != strArr[5].charAt(9)) {
            String[] strArr2 = A07;
            strArr2[0] = "zkIkQE4vw";
            strArr2[2] = "ei2OspDjP";
            if (this.A02 > 0) {
                XH[] xhArr = this.A06;
                int i11 = this.A02 - 1;
                this.A02 = i11;
                oldestSample = xhArr[i11];
            } else {
                oldestSample = new XH();
            }
            int i12 = this.A01;
            this.A01 = i12 + 1;
            oldestSample.A01 = i12;
            oldestSample.A02 = i5;
            oldestSample.A00 = f11;
            this.A05.add(oldestSample);
            this.A03 += i5;
            while (true) {
                int i13 = this.A03;
                int i14 = this.A04;
                String[] strArr3 = A07;
                if (strArr3[7].charAt(9) == strArr3[5].charAt(9)) {
                    break;
                }
                A07[6] = "F6YFYVlBgXERFPtKFV4lv1CICYcfTGVo";
                if (i13 > i14) {
                    ArrayList<XH> arrayList = this.A05;
                    String[] strArr4 = A07;
                    if (strArr4[7].charAt(9) != strArr4[5].charAt(9)) {
                        A07[6] = "hottrnPVG9ifpHTuxC4Tx7ebLUp6xEhD";
                        if (arrayList.isEmpty()) {
                            return;
                        }
                    } else if (arrayList.isEmpty()) {
                        return;
                    }
                    int i15 = this.A03 - this.A04;
                    XH xh = this.A05.get(0);
                    if (xh.A02 <= i15) {
                        int excessWeight = this.A03;
                        this.A03 = excessWeight - xh.A02;
                        this.A05.remove(0);
                        int excessWeight2 = this.A02;
                        if (excessWeight2 < 5) {
                            XH[] xhArr2 = this.A06;
                            int excessWeight3 = this.A02;
                            this.A02 = excessWeight3 + 1;
                            xhArr2[excessWeight3] = xh;
                        }
                    } else {
                        int i16 = xh.A02 - i15;
                        String[] strArr5 = A07;
                        String str = strArr5[3];
                        String str2 = strArr5[4];
                        int excessWeight4 = str.length();
                        if (excessWeight4 != str2.length()) {
                            String[] strArr6 = A07;
                            strArr6[7] = "jmbvMYrVwuWvc1mE37VU2RasZNKbjjSR";
                            strArr6[5] = "cSMwL11sz12qR2gtu26xKPWjKDn4UGBq";
                            xh.A02 = i16;
                            this.A03 -= i15;
                        } else {
                            xh.A02 = i16;
                            this.A03 -= i15;
                        }
                    }
                } else {
                    return;
                }
            }
        }
        throw new RuntimeException();
    }
}
