package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzlu {
    public static String zza(String str) {
        int length = str.length();
        int i5 = 0;
        while (i5 < length) {
            if (zzb(str.charAt(i5))) {
                char[] charArray = str.toCharArray();
                while (i5 < length) {
                    char c11 = charArray[i5];
                    if (zzb(c11)) {
                        charArray[i5] = (char) (c11 ^ ' ');
                    }
                    i5++;
                }
                return String.valueOf(charArray);
            }
            i5++;
        }
        return str;
    }

    public static boolean zzb(char c11) {
        return c11 >= 'A' && c11 <= 'Z';
    }
}
