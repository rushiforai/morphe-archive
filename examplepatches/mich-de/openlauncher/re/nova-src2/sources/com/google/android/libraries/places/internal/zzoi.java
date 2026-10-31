package com.google.android.libraries.places.internal;

import b.c0;

/* loaded from: classes3.dex */
public final class zzoi {
    public static Object zza(Object obj, int i5) {
        if (obj != null) {
            return obj;
        }
        throw new NullPointerException(c0.h(i5, "at index "));
    }

    public static Object[] zzb(Object[] objArr, int i5) {
        for (int i11 = 0; i11 < i5; i11++) {
            zza(objArr[i11], i11);
        }
        return objArr;
    }
}
