package n90;

import kotlin.Unit;

/* loaded from: classes5.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final char[] f78033a = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    /* JADX WARN: Code restructure failed: missing block: B:176:0x01a7, code lost:
    
        return r3;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final int a(byte[] bArr) {
        byte b11;
        int i5;
        int length = bArr.length;
        int i11 = 0;
        int i12 = 0;
        int i13 = 0;
        while (true) {
            if (i11 >= length) {
                break;
            }
            byte b12 = bArr[i11];
            if (b12 >= 0) {
                int i14 = i13 + 1;
                if (i13 == 64) {
                    break;
                }
                if (b12 != 10 && b12 != 13) {
                    if (b12 >= 0 && b12 < 32) {
                        return -1;
                    }
                    if (127 <= b12 && b12 < 160) {
                        return -1;
                    }
                }
                if (b12 == 65533) {
                    return -1;
                }
                i12 += b12 < 65536 ? 1 : 2;
                i11++;
                while (true) {
                    i13 = i14;
                    if (i11 >= length || (b11 = bArr[i11]) < 0) {
                        break;
                    }
                    i11++;
                    i14 = i13 + 1;
                    if (i13 == 64) {
                        return i12;
                    }
                    if (b11 != 10 && b11 != 13) {
                        if (b11 >= 0 && b11 < 32) {
                            return -1;
                        }
                        if (127 <= b11 && b11 < 160) {
                            return -1;
                        }
                    }
                    if (b11 == 65533) {
                        return -1;
                    }
                    i12 += b11 < 65536 ? 1 : 2;
                }
            } else if ((b12 >> 5) == -2) {
                int i15 = i11 + 1;
                if (length <= i15) {
                    if (i13 == 64) {
                        break;
                    }
                    return -1;
                }
                byte b13 = bArr[i15];
                if ((b13 & 192) != 128) {
                    if (i13 == 64) {
                        break;
                    }
                    return -1;
                }
                int i16 = (b12 << 6) ^ (b13 ^ 3968);
                if (i16 < 128) {
                    if (i13 == 64) {
                        break;
                    }
                    return -1;
                }
                int i17 = i13 + 1;
                if (i13 == 64) {
                    break;
                }
                if (i16 != 10 && i16 != 13) {
                    if (i16 >= 0 && i16 < 32) {
                        return -1;
                    }
                    if (127 <= i16 && i16 < 160) {
                        return -1;
                    }
                }
                if (i16 == 65533) {
                    return -1;
                }
                i12 += i16 < 65536 ? 1 : 2;
                Unit unit = Unit.f71706a;
                i11 += 2;
                i13 = i17;
            } else if ((b12 >> 4) == -2) {
                int i18 = i11 + 2;
                if (length <= i18) {
                    if (i13 == 64) {
                        break;
                    }
                    return -1;
                }
                byte b14 = bArr[i11 + 1];
                if ((b14 & 192) != 128) {
                    if (i13 == 64) {
                        break;
                    }
                    return -1;
                }
                byte b15 = bArr[i18];
                if ((b15 & 192) != 128) {
                    if (i13 == 64) {
                        break;
                    }
                    return -1;
                }
                int i19 = (b12 << 12) ^ ((b15 ^ (-123008)) ^ (b14 << 6));
                if (i19 < 2048) {
                    if (i13 == 64) {
                        break;
                    }
                    return -1;
                }
                if (55296 <= i19 && i19 < 57344) {
                    if (i13 == 64) {
                        break;
                    }
                    return -1;
                }
                i5 = i13 + 1;
                if (i13 == 64) {
                    break;
                }
                if (i19 != 10 && i19 != 13) {
                    if (i19 >= 0 && i19 < 32) {
                        return -1;
                    }
                    if (127 <= i19 && i19 < 160) {
                        return -1;
                    }
                }
                if (i19 == 65533) {
                    return -1;
                }
                i12 += i19 < 65536 ? 1 : 2;
                Unit unit2 = Unit.f71706a;
                i11 += 3;
                i13 = i5;
            } else {
                if ((b12 >> 3) != -2) {
                    if (i13 == 64) {
                        break;
                    }
                    return -1;
                }
                int i21 = i11 + 3;
                if (length <= i21) {
                    if (i13 == 64) {
                        break;
                    }
                    return -1;
                }
                byte b16 = bArr[i11 + 1];
                if ((b16 & 192) != 128) {
                    if (i13 == 64) {
                        break;
                    }
                    return -1;
                }
                byte b17 = bArr[i11 + 2];
                if ((b17 & 192) != 128) {
                    if (i13 == 64) {
                        break;
                    }
                    return -1;
                }
                byte b18 = bArr[i21];
                if ((b18 & 192) != 128) {
                    if (i13 == 64) {
                        break;
                    }
                    return -1;
                }
                int i22 = (b12 << 18) ^ (((b18 ^ 3678080) ^ (b17 << 6)) ^ (b16 << 12));
                if (i22 > 1114111) {
                    if (i13 == 64) {
                        break;
                    }
                    return -1;
                }
                if (55296 <= i22 && i22 < 57344) {
                    if (i13 == 64) {
                        break;
                    }
                    return -1;
                }
                if (i22 < 65536) {
                    if (i13 == 64) {
                        break;
                    }
                    return -1;
                }
                i5 = i13 + 1;
                if (i13 == 64) {
                    break;
                }
                if (i22 != 10 && i22 != 13) {
                    if (i22 >= 0 && i22 < 32) {
                        return -1;
                    }
                    if (127 <= i22 && i22 < 160) {
                        return -1;
                    }
                }
                if (i22 == 65533) {
                    return -1;
                }
                i12 += i22 < 65536 ? 1 : 2;
                Unit unit3 = Unit.f71706a;
                i11 += 4;
                i13 = i5;
            }
        }
    }

    public static final int b(char c11) {
        if ('0' <= c11 && c11 < ':') {
            return c11 - '0';
        }
        if ('a' <= c11 && c11 < 'g') {
            return c11 - 'W';
        }
        if ('A' <= c11 && c11 < 'G') {
            return c11 - '7';
        }
        throw new IllegalArgumentException("Unexpected hex digit: " + c11);
    }

    public static final void c(m90.j jVar, m90.g gVar, int i5) {
        gVar.write(jVar.f76131a, 0, i5);
    }
}
