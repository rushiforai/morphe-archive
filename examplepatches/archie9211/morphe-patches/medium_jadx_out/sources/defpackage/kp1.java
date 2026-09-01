package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kp1 extends fp7 {
    public static final char[] h;
    public static final char[] i = {'T', 'N', '*', 'E'};
    public static final char[] j = {'/', ':', '+', '.'};
    public static final char k;

    static {
        char[] cArr = {'A', 'B', 'C', 'D'};
        h = cArr;
        k = cArr[0];
    }

    @Override // defpackage.fp7
    public final boolean[] j(String str) {
        int i2;
        int length = str.length();
        char c = k;
        if (length < 2) {
            str = c + str + c;
        } else {
            char upperCase = Character.toUpperCase(str.charAt(0));
            char upperCase2 = Character.toUpperCase(str.charAt(str.length() - 1));
            char[] cArr = h;
            boolean zF = jp1.F(cArr, upperCase);
            boolean zF2 = jp1.F(cArr, upperCase2);
            char[] cArr2 = i;
            boolean zF3 = jp1.F(cArr2, upperCase);
            boolean zF4 = jp1.F(cArr2, upperCase2);
            if (zF) {
                if (!zF2) {
                    ay0.e("Invalid start/end guards: ".concat(str));
                    return null;
                }
            } else if (!zF3) {
                if (zF2 || zF4) {
                    ay0.e("Invalid start/end guards: ".concat(str));
                    return null;
                }
                str = c + str + c;
            } else if (!zF4) {
                ay0.e("Invalid start/end guards: ".concat(str));
                return null;
            }
        }
        int i3 = 20;
        for (int i4 = 1; i4 < str.length() - 1; i4++) {
            if (Character.isDigit(str.charAt(i4)) || str.charAt(i4) == '-' || str.charAt(i4) == '$') {
                i3 += 9;
            } else {
                if (!jp1.F(j, str.charAt(i4))) {
                    throw new IllegalArgumentException("Cannot encode : '" + str.charAt(i4) + '\'');
                }
                i3 += 10;
            }
        }
        boolean[] zArr = new boolean[(str.length() - 1) + i3];
        int i5 = 0;
        for (int i6 = 0; i6 < str.length(); i6++) {
            char upperCase3 = Character.toUpperCase(str.charAt(i6));
            if (i6 == 0 || i6 == str.length() - 1) {
                if (upperCase3 == '*') {
                    upperCase3 = 'C';
                } else if (upperCase3 == 'E') {
                    upperCase3 = 'D';
                } else if (upperCase3 == 'N') {
                    upperCase3 = 'B';
                } else if (upperCase3 == 'T') {
                    upperCase3 = 'A';
                }
            }
            int i7 = 0;
            while (true) {
                char[] cArr3 = jp1.e;
                if (i7 >= 20) {
                    i2 = 0;
                    break;
                }
                if (upperCase3 == cArr3[i7]) {
                    i2 = jp1.f[i7];
                    break;
                }
                i7++;
            }
            int i8 = 0;
            int i9 = 0;
            boolean z = true;
            while (i8 < 7) {
                zArr[i5] = z;
                i5++;
                if (((i2 >> (6 - i8)) & 1) == 0 || i9 == 1) {
                    z = !z;
                    i8++;
                    i9 = 0;
                } else {
                    i9++;
                }
            }
            if (i6 < str.length() - 1) {
                zArr[i5] = false;
                i5++;
            }
        }
        return zArr;
    }
}
