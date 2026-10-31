package r10;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h1 extends m1 {
    @Override // r10.m1
    public final boolean i(String str) {
        boolean zA;
        char cF1;
        if (r70.j.I0(str, "612", false) || r70.j.I0(str, "748", false)) {
            return m1.a(1, 3, "92".concat(str));
        }
        if (str.length() < 15) {
            zA = false;
        } else {
            String strSubstring = str.substring(str.length() - 15, str.length());
            Intrinsics.f(strSubstring, "substring(...)");
            zA = m1.a(3, 1, strSubstring);
        }
        if (!zA) {
            try {
                cF1 = r70.l.F1(str);
            } catch (NumberFormatException unused) {
            }
            if ('0' > cF1 || cF1 >= ':') {
                throw new NumberFormatException("'" + cF1 + "' is not 0-9");
            }
            int i5 = cF1 - '0';
            String strSubstring2 = str.substring(0, 11);
            Intrinsics.f(strSubstring2, "substring(...)");
            String string = new StringBuilder((CharSequence) strSubstring2).reverse().toString();
            int i11 = 0;
            int i12 = 0;
            int i13 = 0;
            while (i11 < string.length()) {
                char cCharAt = string.charAt(i11);
                int i14 = i13 + 1;
                if ('0' > cCharAt || cCharAt >= ':') {
                    throw new NumberFormatException("'" + cCharAt + "' is not 0-9");
                }
                int[] iArr = m1.f85176f;
                i12 += (cCharAt - '0') * iArr[i13 % iArr.length];
                i11++;
                i13 = i14;
            }
            boolean z11 = (i12 % 11) % 10 == i5;
            if (!z11) {
                return false;
            }
        }
        return true;
    }
}
