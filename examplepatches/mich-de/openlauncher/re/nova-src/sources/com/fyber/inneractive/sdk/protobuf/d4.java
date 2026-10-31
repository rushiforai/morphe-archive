package com.fyber.inneractive.sdk.protobuf;

/* loaded from: classes.dex */
public abstract class d4 {

    /* renamed from: a, reason: collision with root package name */
    public static final z3 f30786a;

    static {
        f30786a = (x3.f30957e && x3.f30956d && !d.a()) ? new c4() : new a4();
    }

    public static int a(int i5, int i11) {
        if (i5 > -12 || i11 > -65) {
            return -1;
        }
        return i5 ^ (i11 << 8);
    }

    public static int a(int i5, int i11, int i12) {
        if (i5 > -12 || i11 > -65 || i12 > -65) {
            return -1;
        }
        return (i5 ^ (i11 << 8)) ^ (i12 << 16);
    }

    public static int a(CharSequence charSequence) {
        int length = charSequence.length();
        int i5 = 0;
        int i11 = 0;
        while (i11 < length && charSequence.charAt(i11) < 128) {
            i11++;
        }
        int i12 = length;
        while (true) {
            if (i11 >= length) {
                break;
            }
            char cCharAt = charSequence.charAt(i11);
            if (cCharAt < 2048) {
                i12 += (127 - cCharAt) >>> 31;
                i11++;
            } else {
                int length2 = charSequence.length();
                while (i11 < length2) {
                    char cCharAt2 = charSequence.charAt(i11);
                    if (cCharAt2 < 2048) {
                        i5 += (127 - cCharAt2) >>> 31;
                    } else {
                        i5 += 2;
                        if (55296 <= cCharAt2 && cCharAt2 <= 57343) {
                            if (Character.codePointAt(charSequence, i11) < 65536) {
                                throw new b4(i11, length2);
                            }
                            i11++;
                        }
                    }
                    i11++;
                }
                i12 += i5;
            }
        }
        if (i12 >= length) {
            return i12;
        }
        throw new IllegalArgumentException("UTF-8 length does not fit in int: " + (i12 + 4294967296L));
    }
}
