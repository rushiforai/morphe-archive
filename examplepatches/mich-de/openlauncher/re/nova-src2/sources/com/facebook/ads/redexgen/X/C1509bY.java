package com.facebook.ads.redexgen.X;

import android.text.Layout;
import android.text.SpannableString;
import android.text.SpannableStringBuilder;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.text.style.UnderlineSpan;
import java.util.ArrayList;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.bY, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1509bY {
    public static String[] A08 = {"9L1w1wV8uajUNZnJ4CsOiYfBiqoiZfeA", "bzRqQYl6PZHe7cfIHZtstW", "iY6zgtiE4PSYe0KB82pLH9ipKgaa2WMA", "EFWNwk268AsnZ5dtWGIGOBNrPqtnFZY6", "TcLUNR3L8Jh6JezAs", "nVl3z02gaD8dKggnIOCH8XoSTId1zgut", "g04dyTW3dZEIDdz5", "CGmG3KdGn75Yn1mGp9OkuGqxGyDJVKW2"};
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public int A04;
    public final List<C1508bX> A06 = new ArrayList();
    public final List<SpannableString> A07 = new ArrayList();
    public final StringBuilder A05 = new StringBuilder();

    public C1509bY(int i5, int i11) {
        A0C(i5);
        this.A01 = i11;
    }

    /* JADX WARN: Removed duplicated region for block: B:52:0x00f4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private SpannableString A04() {
        int i5;
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder(this.A05);
        int length = spannableStringBuilder.length();
        int color = -1;
        int colorStartPosition = -1;
        int italicStartPosition = 0;
        int underlineStartPosition = -1;
        boolean z11 = false;
        int i11 = -1;
        for (int nextPosition = 0; nextPosition < this.A06.size(); nextPosition++) {
            C1508bX c1508bX = this.A06.get(nextPosition);
            boolean z12 = c1508bX.A02;
            int i12 = c1508bX.A01;
            if (i12 != 8) {
                if (A08[4].length() == 17) {
                    A08[5] = "1HQDujgXs2rhggsqxpROWa3BmQDKwZWY";
                    z11 = i12 == 7;
                    if (A08[3].charAt(11) != 'A') {
                        String[] strArr = A08;
                        strArr[6] = "iZLhIZWcPoahXagK";
                        strArr[1] = "cZIJ5G220c5SYRAi6VHfsR";
                        if (i12 != 7) {
                            i11 = AnonymousClass48.A0Q[i12];
                        }
                    }
                }
                throw new RuntimeException();
            }
            int i13 = c1508bX.A00;
            if (nextPosition + 1 < this.A06.size()) {
                i5 = this.A06.get(nextPosition + 1).A00;
            } else {
                i5 = length;
            }
            if (i13 != i5) {
                if (color != -1 && !z12) {
                    A06(spannableStringBuilder, color, i13);
                    color = -1;
                } else if (A08[3].charAt(11) != 'A') {
                    String[] strArr2 = A08;
                    strArr2[6] = "tJjIxZh52Hon8r4F";
                    strArr2[1] = "ND4XgMSJMSSQlPzUtCMwPe";
                    if (color == -1 && z12) {
                        color = i13;
                    }
                } else {
                    throw new RuntimeException();
                }
                if (colorStartPosition != -1 && !z11) {
                    A05(spannableStringBuilder, colorStartPosition, i13);
                    colorStartPosition = -1;
                } else if (colorStartPosition == -1 && z11) {
                    colorStartPosition = i13;
                }
                if (i11 != underlineStartPosition) {
                    A07(spannableStringBuilder, italicStartPosition, i13, underlineStartPosition);
                    underlineStartPosition = i11;
                    italicStartPosition = i13;
                }
            }
        }
        if (A08[0].charAt(6) != 'V') {
            A08[5] = "uyNco8zRFQWxcg6vklYZpTh4k0kuVlEV";
            if (color != -1) {
                if (color != length) {
                    A06(spannableStringBuilder, color, length);
                }
            }
        } else {
            A08[5] = "ALGmKM0I29d69g2LjYJnhb5NsKmkABjL";
            if (color != -1) {
            }
        }
        if (colorStartPosition != -1 && colorStartPosition != length) {
            A05(spannableStringBuilder, colorStartPosition, length);
        }
        if (italicStartPosition != length) {
            A07(spannableStringBuilder, italicStartPosition, length, underlineStartPosition);
        }
        return new SpannableString(spannableStringBuilder);
    }

    public static void A05(SpannableStringBuilder spannableStringBuilder, int i5, int i11) {
        spannableStringBuilder.setSpan(new StyleSpan(2), i5, i11, 33);
    }

    public static void A06(SpannableStringBuilder spannableStringBuilder, int i5, int i11) {
        spannableStringBuilder.setSpan(new UnderlineSpan(), i5, i11, 33);
    }

    public static void A07(SpannableStringBuilder spannableStringBuilder, int i5, int i11, int i12) {
        if (i12 == -1) {
            return;
        }
        spannableStringBuilder.setSpan(new ForegroundColorSpan(i12), i5, i11, 33);
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0013 */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00d2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final C1251Th A08(int i5) {
        float f11;
        int maxTextLength;
        int i11 = this.A02 + this.A04;
        int i12 = 32 - i11;
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        for (int maxTextLength2 = 0; maxTextLength2 < startPadding; maxTextLength2++) {
            spannableStringBuilder.append(N1.A0e(this.A07.get(maxTextLength2), i12));
            spannableStringBuilder.append('\n');
        }
        spannableStringBuilder.append(N1.A0e(A04(), i12));
        int startPadding = spannableStringBuilder.length();
        if (startPadding == 0) {
            return null;
        }
        int startPadding2 = spannableStringBuilder.length();
        int i13 = (32 - i11) - startPadding2;
        int startEndPaddingDelta = i11 - i13;
        if (i5 == Integer.MIN_VALUE) {
            int startPadding3 = this.A00;
            if (startPadding3 == 2) {
                int maxTextLength3 = Math.abs(startEndPaddingDelta);
                if (maxTextLength3 < 3 || i13 < 0) {
                    i5 = 1;
                } else {
                    int startPadding4 = this.A00;
                    if (startPadding4 == 2 && startEndPaddingDelta > 0) {
                        i5 = 2;
                    } else {
                        i5 = 0;
                    }
                }
            }
        }
        switch (i5) {
            case 1:
                f11 = 0.5f;
                break;
            case 2:
                int startPadding5 = 32 - i13;
                float f12 = 0.8f * (startPadding5 / 32.0f);
                String[] strArr = A08;
                String str = strArr[2];
                String str2 = strArr[7];
                int maxTextLength4 = str.charAt(11);
                int startPadding6 = str2.charAt(11);
                if (maxTextLength4 != startPadding6) {
                    throw new RuntimeException();
                }
                A08[0] = "5EQwUuVt08LvSMecayfpTwcmlaUcj8gt";
                f11 = f12 + 0.1f;
                break;
            default:
                f11 = (0.8f * (i11 / 32.0f)) + 0.1f;
                break;
        }
        int maxTextLength5 = this.A03;
        if (maxTextLength5 > 7) {
            int startPadding7 = this.A03;
            maxTextLength = (startPadding7 - 15) - 2;
        } else {
            int startPadding8 = this.A00;
            if (startPadding8 == 1) {
                int maxTextLength6 = this.A03;
                int startPadding9 = this.A01;
                maxTextLength = maxTextLength6 - (startPadding9 - 1);
            } else {
                maxTextLength = this.A03;
            }
        }
        return new C1052Ld().A0G(spannableStringBuilder).A0F(Layout.Alignment.ALIGN_NORMAL).A07(maxTextLength, 1).A04(f11).A0A(i5).A0H();
    }

    public final void A09() {
        int length = this.A05.length();
        if (length > 0) {
            int length2 = length - 1;
            this.A05.delete(length2, length);
            int length3 = this.A06.size();
            for (int i5 = length3 - 1; i5 >= 0; i5--) {
                C1508bX c1508bX = this.A06.get(i5);
                int length4 = c1508bX.A00;
                if (length4 == length) {
                    int length5 = c1508bX.A00;
                    c1508bX.A00 = length5 - 1;
                } else {
                    return;
                }
            }
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0022 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A0A() {
        this.A07.add(A04());
        this.A05.setLength(0);
        this.A06.clear();
        int iMin = Math.min(this.A01, this.A03);
        while (numRows >= iMin) {
            List<SpannableString> list = this.A07;
            if (A08[4].length() != 17) {
                throw new RuntimeException();
            }
            String[] strArr = A08;
            strArr[2] = "wHJCFsjRLmJYmOGCiYb2btDMgDXd1Srk";
            strArr[7] = "2mSpReiYVVDYMy0V4w8ODhLzaW3OOfiX";
            list.remove(0);
        }
    }

    public final void A0B(char c11) {
        if (this.A05.length() < 32) {
            this.A05.append(c11);
        }
    }

    public final void A0C(int i5) {
        this.A00 = i5;
        this.A06.clear();
        this.A07.clear();
        this.A05.setLength(0);
        this.A03 = 15;
        this.A02 = 0;
        this.A04 = 0;
    }

    public final void A0D(int i5) {
        this.A00 = i5;
    }

    public final void A0E(int i5) {
        this.A01 = i5;
    }

    public final void A0F(int i5, boolean z11) {
        this.A06.add(new C1508bX(i5, z11, this.A05.length()));
    }

    public final boolean A0G() {
        if (this.A06.isEmpty() && this.A07.isEmpty()) {
            StringBuilder sb2 = this.A05;
            String[] strArr = A08;
            if (strArr[2].charAt(11) != strArr[7].charAt(11)) {
                throw new RuntimeException();
            }
            A08[5] = "ZUB0lQjssyACEg1ILMogw129NIO2tx51";
            if (sb2.length() == 0) {
                return true;
            }
        }
        return false;
    }
}
