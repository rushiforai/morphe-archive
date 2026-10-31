package com.bytedance.sdk.openadsdk.tn;

/* loaded from: classes2.dex */
final class ea {
    public static int dj(sya syaVar) {
        byte[][] bArrSya = syaVar.sya();
        int iZb = syaVar.zb();
        int iYcx = syaVar.ycx();
        int i5 = 0;
        for (int i11 = 0; i11 < iYcx; i11++) {
            byte[] bArr = bArrSya[i11];
            for (int i12 = 0; i12 < iZb; i12++) {
                if (bArr[i12] == 1) {
                    i5++;
                }
            }
        }
        int iZb2 = syaVar.zb() * syaVar.ycx();
        return ((Math.abs((i5 * 2) - iZb2) * 10) / iZb2) * 10;
    }

    public static int sya(sya syaVar) {
        byte[][] bArrSya = syaVar.sya();
        int iZb = syaVar.zb();
        int iYcx = syaVar.ycx();
        int i5 = 0;
        for (int i11 = 0; i11 < iYcx; i11++) {
            for (int i12 = 0; i12 < iZb; i12++) {
                byte[] bArr = bArrSya[i11];
                int i13 = i12 + 6;
                if (i13 < iZb && bArr[i12] == 1 && bArr[i12 + 1] == 0 && bArr[i12 + 2] == 1 && bArr[i12 + 3] == 1 && bArr[i12 + 4] == 1 && bArr[i12 + 5] == 0 && bArr[i13] == 1 && (ycx(bArr, i12 - 4, i12) || ycx(bArr, i12 + 7, i12 + 11))) {
                    i5++;
                }
                int i14 = i11 + 6;
                if (i14 < iYcx && bArrSya[i11][i12] == 1 && bArrSya[i11 + 1][i12] == 0 && bArrSya[i11 + 2][i12] == 1 && bArrSya[i11 + 3][i12] == 1 && bArrSya[i11 + 4][i12] == 1 && bArrSya[i11 + 5][i12] == 0 && bArrSya[i14][i12] == 1 && (ycx(bArrSya, i12, i11 - 4, i11) || ycx(bArrSya, i12, i11 + 7, i11 + 11))) {
                    i5++;
                }
            }
        }
        return i5 * 40;
    }

    public static int ycx(sya syaVar) {
        return ycx(syaVar, true) + ycx(syaVar, false);
    }

    public static int zb(sya syaVar) {
        byte[][] bArrSya = syaVar.sya();
        int iZb = syaVar.zb();
        int iYcx = syaVar.ycx();
        int i5 = 0;
        for (int i11 = 0; i11 < iYcx - 1; i11++) {
            byte[] bArr = bArrSya[i11];
            int i12 = 0;
            while (i12 < iZb - 1) {
                byte b11 = bArr[i12];
                int i13 = i12 + 1;
                if (b11 == bArr[i13]) {
                    byte[] bArr2 = bArrSya[i11 + 1];
                    if (b11 == bArr2[i12] && b11 == bArr2[i13]) {
                        i5++;
                    }
                }
                i12 = i13;
            }
        }
        return i5 * 3;
    }

    private static boolean ycx(byte[] bArr, int i5, int i11) {
        if (i5 < 0 || bArr.length < i11) {
            return false;
        }
        while (i5 < i11) {
            if (bArr[i5] == 1) {
                return false;
            }
            i5++;
        }
        return true;
    }

    private static boolean ycx(byte[][] bArr, int i5, int i11, int i12) {
        if (i11 < 0 || bArr.length < i12) {
            return false;
        }
        while (i11 < i12) {
            if (bArr[i11][i5] == 1) {
                return false;
            }
            i11++;
        }
        return true;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0041 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0042 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean ycx(int i5, int i11, int i12) {
        int i13;
        switch (i5) {
            case 0:
                i12 += i11;
                i13 = i12 & 1;
                return i13 != 0;
            case 1:
                i13 = i12 & 1;
                if (i13 != 0) {
                }
                break;
            case 2:
                i13 = i11 % 3;
                if (i13 != 0) {
                }
                break;
            case 3:
                i13 = (i12 + i11) % 3;
                if (i13 != 0) {
                }
                break;
            case 4:
                i13 = ((i11 / 3) + (i12 / 2)) & 1;
                if (i13 != 0) {
                }
                break;
            case 5:
                int i14 = i12 * i11;
                i13 = (i14 & 1) + (i14 % 3);
                if (i13 != 0) {
                }
                break;
            case 6:
                int i15 = i12 * i11;
                i12 = (i15 % 3) + (i15 & 1);
                i13 = i12 & 1;
                if (i13 != 0) {
                }
                break;
            case 7:
                i13 = (((i12 * i11) % 3) + ((i12 + i11) & 1)) & 1;
                if (i13 != 0) {
                }
                break;
            default:
                throw new IllegalArgumentException("Invalid mask pattern: ".concat(String.valueOf(i5)));
        }
    }

    private static int ycx(sya syaVar, boolean z11) {
        int iYcx = z11 ? syaVar.ycx() : syaVar.zb();
        int iZb = z11 ? syaVar.zb() : syaVar.ycx();
        byte[][] bArrSya = syaVar.sya();
        int i5 = 0;
        for (int i11 = 0; i11 < iYcx; i11++) {
            byte b11 = -1;
            int i12 = 0;
            for (int i13 = 0; i13 < iZb; i13++) {
                byte b12 = z11 ? bArrSya[i11][i13] : bArrSya[i13][i11];
                if (b12 == b11) {
                    i12++;
                } else {
                    if (i12 >= 5) {
                        i5 += i12 - 2;
                    }
                    i12 = 1;
                    b11 = b12;
                }
            }
            if (i12 >= 5) {
                i5 = (i12 - 2) + i5;
            }
        }
        return i5;
    }
}
