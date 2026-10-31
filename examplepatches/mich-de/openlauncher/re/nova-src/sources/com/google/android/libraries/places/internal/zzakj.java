package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzakj {
    /* JADX WARN: Removed duplicated region for block: B:14:0x0022  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0064  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static String zza(String str, int i5) {
        int length;
        int length2 = str.length();
        int iCharCount = 0;
        int i11 = 0;
        while (i11 != length2) {
            int i12 = i11 + 1;
            char cCharAt = str.charAt(i11);
            if (cCharAt <= '~') {
                if (cCharAt < ' ') {
                    if (cCharAt >= 55296) {
                        if (cCharAt <= 57343) {
                            int iCodePointAt = Character.codePointAt(str, i11);
                            if (iCodePointAt >= 65536 && (iCodePointAt & 65534) != 65534) {
                                i11 += 2;
                            }
                        } else if (cCharAt >= 64976 && (cCharAt <= 65007 || cCharAt >= 65534)) {
                        }
                        length = str.length();
                        StringBuilder sb2 = new StringBuilder(length);
                        while (iCharCount < length) {
                        }
                        return sb2.toString();
                    }
                    if (cCharAt != '\n' && cCharAt != '\r' && cCharAt != '\t' && cCharAt != '\f') {
                        length = str.length();
                        StringBuilder sb22 = new StringBuilder(length);
                        while (iCharCount < length) {
                            char cCharAt2 = str.charAt(iCharCount);
                            if (zzb(cCharAt2)) {
                                sb22.append(cCharAt2);
                                iCharCount++;
                            } else {
                                int iCodePointAt2 = Character.codePointAt(str, iCharCount);
                                sb22.appendCodePoint(true != zzb(iCodePointAt2) ? 65533 : iCodePointAt2);
                                iCharCount += Character.charCount(iCodePointAt2);
                            }
                        }
                        return sb22.toString();
                    }
                }
                i11 = i12;
            } else {
                if (cCharAt >= 55296 || cCharAt < 160) {
                }
                i11 = i12;
            }
        }
        return str;
    }

    public static boolean zzb(int i5) {
        return i5 <= 126 ? i5 >= 32 || i5 == 10 || i5 == 13 || i5 == 9 || i5 == 12 : i5 < 55296 ? i5 >= 160 : i5 < 64976 ? i5 > 57343 : i5 > 65007 && (i5 & 65534) != 65534 && i5 <= 1114111;
    }
}
