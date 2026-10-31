package com.facebook.ads.redexgen.X;

import javax.annotation.CheckForNull;

/* loaded from: assets/audience_network/classes.dex */
public abstract class A3 extends XD<String> {
    public static String[] A05 = {"2xW3kd", "ItxLKCV0qT0JgVEhPjz9I0UOKkeNO6MC", "reZhQuzuKxFTxjjIoF3F5uff5mDBgPTu", "iHaWKUzPsyFHihAiZvevOhQteLn4AZBQ", "kBMKziHFvZIHqNb3mqBnk8oLLuCTGe87", "qxtoa2UG", "B8454eguXHwuAIxBTnZZVRLW8YwR1MnO", "PjaXngqAvgHh46C2Zn5dhpjL0FZhguKL"};
    public int A00;
    public int A01 = 0;
    public final A7 A02;
    public final CharSequence A03;
    public final boolean A04;

    public abstract int A04(int separatorPosition);

    public abstract int A05(int start);

    public A3(C1319We splitter, CharSequence toSplit) {
        this.A02 = splitter.A01;
        this.A04 = splitter.A03;
        this.A00 = splitter.A00;
        this.A03 = toSplit;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Incorrect condition in loop: B:4:0x0005 */
    @Override // com.facebook.ads.redexgen.X.XD
    @CheckForNull
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String A03() {
        int i5 = this.A01;
        while (nextStart != -1) {
            int nextStart = this.A01;
            int separatorPosition = A05(nextStart);
            int start = A05[7].charAt(11);
            if (start == 110) {
                throw new RuntimeException();
            }
            String[] strArr = A05;
            strArr[0] = "xQIWDz";
            strArr[5] = "P0OjvAdK";
            if (separatorPosition == -1) {
                separatorPosition = this.A03.length();
                this.A01 = -1;
            } else {
                int nextStart2 = A04(separatorPosition);
                this.A01 = nextStart2;
            }
            int nextStart3 = this.A01;
            if (nextStart3 == i5) {
                int nextStart4 = this.A01;
                this.A01 = nextStart4 + 1;
                int start2 = this.A01;
                int nextStart5 = this.A03.length();
                if (start2 > nextStart5) {
                    this.A01 = -1;
                }
            } else {
                while (i5 < separatorPosition) {
                    boolean zA09 = this.A02.A09(this.A03.charAt(i5));
                    int start3 = A05[6].charAt(18);
                    if (start3 == 90) {
                        A05[6] = "wRjUoCepA1IDSUo1hQZMmXs1s8PJmBMO";
                        if (!zA09) {
                            break;
                        }
                        i5++;
                    } else {
                        if (!zA09) {
                            break;
                        }
                        i5++;
                    }
                }
                while (separatorPosition > i5) {
                    A7 a72 = this.A02;
                    int start4 = A05[7].charAt(11);
                    if (start4 == 110) {
                        int nextStart6 = separatorPosition - 1;
                        if (!a72.A09(this.A03.charAt(nextStart6))) {
                            break;
                        }
                        separatorPosition--;
                    } else {
                        String[] strArr2 = A05;
                        strArr2[0] = "ZEPEAe";
                        strArr2[5] = "XllPSEBY";
                        int nextStart7 = separatorPosition - 1;
                        if (!a72.A09(this.A03.charAt(nextStart7))) {
                            break;
                        }
                        separatorPosition--;
                    }
                }
                if (this.A04 && i5 == separatorPosition) {
                    i5 = this.A01;
                } else {
                    int nextStart8 = this.A00;
                    if (nextStart8 == 1) {
                        separatorPosition = this.A03.length();
                        this.A01 = -1;
                        while (separatorPosition > i5) {
                            int nextStart9 = separatorPosition - 1;
                            if (!this.A02.A09(this.A03.charAt(nextStart9))) {
                                break;
                            }
                            separatorPosition--;
                        }
                    } else {
                        int nextStart10 = this.A00;
                        this.A00 = nextStart10 - 1;
                    }
                    return this.A03.subSequence(i5, separatorPosition).toString();
                }
            }
        }
        return A02();
    }
}
