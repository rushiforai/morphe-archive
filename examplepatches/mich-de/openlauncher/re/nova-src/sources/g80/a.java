package g80;

import b.c0;
import kotlin.Unit;
import r70.j;

/* loaded from: classes5.dex */
public abstract class a {
    public static final String a(int i5, int i11, byte[] bArr) {
        int i12;
        int i13;
        int i14;
        int i15;
        int i16;
        int i17 = i5;
        if (i17 < 0 || i11 > bArr.length || i17 > i11) {
            StringBuilder sb2 = new StringBuilder("size=");
            c0.A(sb2, bArr.length, " beginIndex=", i17, " endIndex=");
            sb2.append(i11);
            throw new IndexOutOfBoundsException(sb2.toString());
        }
        char[] cArr = new char[i11 - i17];
        int i18 = 0;
        while (i17 < i11) {
            byte b11 = bArr[i17];
            if (b11 >= 0) {
                i12 = i18 + 1;
                cArr[i18] = (char) b11;
                i17++;
                while (i17 < i11) {
                    byte b12 = bArr[i17];
                    if (b12 < 0) {
                        break;
                    }
                    i17++;
                    cArr[i12] = (char) b12;
                    i12++;
                }
                Unit unit = Unit.f71706a;
            } else {
                if ((b11 >> 5) == -2) {
                    int i19 = i17 + 1;
                    if (i11 <= i19) {
                        i12 = i18 + 1;
                        cArr[i18] = (char) 65533;
                    } else {
                        byte b13 = bArr[i19];
                        if ((b13 & 192) == 128) {
                            int i21 = (b11 << 6) ^ (b13 ^ 3968);
                            if (i21 < 128) {
                                i12 = i18 + 1;
                                cArr[i18] = (char) 65533;
                            } else {
                                i12 = i18 + 1;
                                cArr[i18] = (char) i21;
                            }
                            Unit unit2 = Unit.f71706a;
                        } else {
                            i12 = i18 + 1;
                            cArr[i18] = (char) 65533;
                        }
                    }
                    Unit unit3 = Unit.f71706a;
                } else if ((b11 >> 4) == -2) {
                    int i22 = i17 + 2;
                    if (i11 <= i22) {
                        i12 = i18 + 1;
                        cArr[i18] = (char) 65533;
                        Unit unit4 = Unit.f71706a;
                        int i23 = i17 + 1;
                        i13 = (i11 <= i23 || (bArr[i23] & 192) != 128) ? 1 : 2;
                    } else {
                        byte b14 = bArr[i17 + 1];
                        if ((b14 & 192) == 128) {
                            byte b15 = bArr[i22];
                            if ((b15 & 192) == 128) {
                                int i24 = (b11 << 12) ^ ((b15 ^ (-123008)) ^ (b14 << 6));
                                if (i24 < 2048) {
                                    i12 = i18 + 1;
                                    cArr[i18] = (char) 65533;
                                } else if (55296 > i24 || i24 >= 57344) {
                                    i12 = i18 + 1;
                                    cArr[i18] = (char) i24;
                                } else {
                                    i12 = i18 + 1;
                                    cArr[i18] = (char) 65533;
                                }
                                Unit unit5 = Unit.f71706a;
                                i13 = 3;
                            } else {
                                i12 = i18 + 1;
                                cArr[i18] = (char) 65533;
                                Unit unit6 = Unit.f71706a;
                            }
                        } else {
                            i12 = i18 + 1;
                            cArr[i18] = (char) 65533;
                            Unit unit7 = Unit.f71706a;
                        }
                    }
                } else {
                    if ((b11 >> 3) == -2) {
                        int i25 = i17 + 3;
                        if (i11 <= i25) {
                            i14 = i18 + 1;
                            cArr[i18] = 65533;
                            Unit unit8 = Unit.f71706a;
                            int i26 = i17 + 1;
                            if (i11 > i26 && (bArr[i26] & 192) == 128) {
                                int i27 = i17 + 2;
                                i16 = (i11 <= i27 || (bArr[i27] & 192) != 128) ? 2 : 3;
                            }
                            i16 = 1;
                        } else {
                            byte b16 = bArr[i17 + 1];
                            if ((b16 & 192) == 128) {
                                byte b17 = bArr[i17 + 2];
                                if ((b17 & 192) == 128) {
                                    byte b18 = bArr[i25];
                                    if ((b18 & 192) == 128) {
                                        int i28 = (b11 << 18) ^ (((b18 ^ 3678080) ^ (b17 << 6)) ^ (b16 << 12));
                                        if (i28 > 1114111) {
                                            i14 = i18 + 1;
                                            cArr[i18] = 65533;
                                        } else if ((55296 > i28 || i28 >= 57344) && i28 >= 65536) {
                                            if (i28 != 65533) {
                                                cArr[i18] = (char) ((i28 >>> 10) + 55232);
                                                i15 = i18 + 2;
                                                cArr[i18 + 1] = (char) ((i28 & 1023) + 56320);
                                            } else {
                                                cArr[i18] = 65533;
                                                i15 = i18 + 1;
                                            }
                                            Unit unit9 = Unit.f71706a;
                                            i14 = i15;
                                            i16 = 4;
                                        } else {
                                            i14 = i18 + 1;
                                            cArr[i18] = 65533;
                                        }
                                        Unit unit10 = Unit.f71706a;
                                        i16 = 4;
                                    } else {
                                        i14 = i18 + 1;
                                        cArr[i18] = 65533;
                                        Unit unit11 = Unit.f71706a;
                                    }
                                } else {
                                    i14 = i18 + 1;
                                    cArr[i18] = 65533;
                                    Unit unit12 = Unit.f71706a;
                                }
                            } else {
                                i14 = i18 + 1;
                                cArr[i18] = 65533;
                                Unit unit13 = Unit.f71706a;
                                i16 = 1;
                            }
                        }
                        i17 += i16;
                    } else {
                        i14 = i18 + 1;
                        cArr[i18] = 65533;
                        i17++;
                    }
                    i18 = i14;
                }
                i17 += i13;
            }
            i18 = i12;
        }
        return j.w0(cArr, 0, i18);
    }
}
