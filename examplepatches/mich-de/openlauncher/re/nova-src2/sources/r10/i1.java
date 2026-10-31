package r10;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i1 extends m1 {
    @Override // r10.m1
    public final boolean i(String str) {
        char cD1 = r70.l.D1(r70.l.H1(3, str));
        if ('0' > cD1 || cD1 >= ':') {
            throw new NumberFormatException("'" + cD1 + "' is not 0-9");
        }
        int i5 = cD1 - '0';
        String strSubstring = str.substring(2, 10);
        Intrinsics.f(strSubstring, "substring(...)");
        int i11 = 0;
        int i12 = 0;
        int i13 = 0;
        while (i11 < strSubstring.length()) {
            char cCharAt = strSubstring.charAt(i11);
            int i14 = i13 + 1;
            if ('0' > cCharAt || cCharAt >= ':') {
                throw new NumberFormatException("'" + cCharAt + "' is not 0-9");
            }
            i12 += (cCharAt - '0') * m1.f85177g[i13];
            i11++;
            i13 = i14;
        }
        int i15 = 11 - (i12 % 11);
        if (i15 == 10) {
            i15 = 0;
        } else if (i15 == 11) {
            i15 = 5;
        }
        return i15 == i5;
    }
}
