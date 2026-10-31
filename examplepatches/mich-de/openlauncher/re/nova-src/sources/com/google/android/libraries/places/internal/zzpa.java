package com.google.android.libraries.places.internal;

import java.lang.reflect.Array;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes3.dex */
public final class zzpa {
    private static final char[][] zza = (char[][]) Array.newInstance((Class<?>) Character.TYPE, 0, 0);
    private final char[][] zzb;

    private zzpa(char[][] cArr) {
        this.zzb = cArr;
    }

    public static zzpa zza(Map map) {
        char[][] cArr;
        if (map.isEmpty()) {
            cArr = zza;
        } else {
            char[][] cArr2 = new char[((Character) Collections.max(map.keySet())).charValue() + 1][];
            for (Character ch : map.keySet()) {
                cArr2[ch.charValue()] = ((String) map.get(ch)).toCharArray();
            }
            cArr = cArr2;
        }
        return new zzpa(cArr);
    }

    public final char[][] zzb() {
        return this.zzb;
    }
}
