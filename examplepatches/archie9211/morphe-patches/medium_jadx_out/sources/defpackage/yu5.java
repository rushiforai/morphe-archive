package defpackage;

import java.util.EnumMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yu5 extends fp7 {
    public static final int[] i = {1, 1, 1, 1};
    public static final int[] j = {3, 1, 1};
    public static final int[][] k = {new int[]{1, 1, 3, 3, 1}, new int[]{3, 1, 1, 1, 3}, new int[]{1, 3, 1, 1, 3}, new int[]{3, 3, 1, 1, 1}, new int[]{1, 1, 3, 1, 3}, new int[]{3, 1, 3, 1, 1}, new int[]{1, 3, 3, 1, 1}, new int[]{1, 1, 1, 3, 3}, new int[]{3, 1, 1, 3, 1}, new int[]{1, 3, 1, 3, 1}};
    public final /* synthetic */ int h;

    public /* synthetic */ yu5(int i2) {
        this.h = i2;
    }

    public static void v(boolean[] zArr, int i2, int[] iArr) {
        int length = iArr.length;
        int i3 = 0;
        while (i3 < length) {
            int i4 = i2 + 1;
            zArr[i2] = iArr[i3] != 0;
            i3++;
            i2 = i4;
        }
    }

    public static int w(int i2, String str) {
        int iIndexOf = 0;
        int i3 = 1;
        for (int length = str.length() - 1; length >= 0; length--) {
            iIndexOf += "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%abcd*".indexOf(str.charAt(length)) * i3;
            i3++;
            if (i3 > i2) {
                i3 = 1;
            }
        }
        return iIndexOf % 47;
    }

    public static lp1 x(CharSequence charSequence, int i2) {
        int length = charSequence.length();
        if (i2 >= length) {
            return lp1.UNCODABLE;
        }
        char cCharAt = charSequence.charAt(i2);
        if (cCharAt == 241) {
            return lp1.FNC_1;
        }
        if (cCharAt < '0' || cCharAt > '9') {
            return lp1.UNCODABLE;
        }
        int i3 = i2 + 1;
        if (i3 >= length) {
            return lp1.ONE_DIGIT;
        }
        char cCharAt2 = charSequence.charAt(i3);
        return (cCharAt2 < '0' || cCharAt2 > '9') ? lp1.ONE_DIGIT : lp1.TWO_DIGITS;
    }

    public static void y(int i2, int[] iArr) {
        for (int i3 = 0; i3 < 9; i3++) {
            int i4 = 1;
            if (((1 << (8 - i3)) & i2) != 0) {
                i4 = 2;
            }
            iArr[i3] = i4;
        }
    }

    public static void z(int i2, int[] iArr) {
        for (int i3 = 0; i3 < 9; i3++) {
            int i4 = 1;
            if (((1 << (8 - i3)) & i2) == 0) {
                i4 = 0;
            }
            iArr[i3] = i4;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:113:0x026d, code lost:
    
        if (r11 < '`') goto L117;
     */
    /* JADX WARN: Removed duplicated region for block: B:115:0x0270  */
    /* JADX WARN: Removed duplicated region for block: B:134:0x02a8  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x017b  */
    @Override // defpackage.fp7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean[] j(java.lang.String r20) {
        /*
            Method dump skipped, instruction units count: 1032
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yu5.j(java.lang.String):boolean[]");
    }

    @Override // defpackage.fp7, defpackage.k9f
    public final sr0 l(String str, xm0 xm0Var, EnumMap enumMap) {
        switch (this.h) {
            case 0:
                if (xm0Var != xm0.ITF) {
                    ay0.e("Can only encode ITF, but got ".concat(String.valueOf(xm0Var)));
                }
                break;
            case 1:
                if (xm0Var != xm0.CODE_128) {
                    ay0.e("Can only encode CODE_128, but got ".concat(String.valueOf(xm0Var)));
                }
                break;
            case 2:
                if (xm0Var != xm0.CODE_39) {
                    ay0.e("Can only encode CODE_39, but got ".concat(String.valueOf(xm0Var)));
                }
                break;
            default:
                if (xm0Var != xm0.CODE_93) {
                    ay0.e("Can only encode CODE_93, but got ".concat(String.valueOf(xm0Var)));
                }
                break;
        }
        return null;
    }
}
