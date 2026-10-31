package com.google.android.libraries.places.internal;

import b.c0;

/* loaded from: classes3.dex */
final class zznj {
    public static void zza(Object obj, Object obj2) {
        if (obj == null) {
            throw new NullPointerException("null key in entry: null=".concat(String.valueOf(obj2)));
        }
        if (obj2 == null) {
            throw new NullPointerException(c0.l("null value in entry: ", obj.toString(), "=null"));
        }
    }
}
