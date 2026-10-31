package com.google.android.libraries.places.internal;

import java.lang.reflect.Array;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class zzbto {
    public static final String[] zza = new String[0];
    public static final Charset zzb = Charset.forName("UTF-8");

    public static List zza(Object[] objArr) {
        return Collections.unmodifiableList(Arrays.asList((Object[]) objArr.clone()));
    }

    public static Object[] zzb(Class cls, Object[] objArr, Object[] objArr2) {
        ArrayList arrayList = new ArrayList();
        for (Object obj : objArr) {
            int length = objArr2.length;
            int i5 = 0;
            while (true) {
                if (i5 < length) {
                    Object obj2 = objArr2[i5];
                    if (obj.equals(obj2)) {
                        arrayList.add(obj2);
                        break;
                    }
                    i5++;
                }
            }
        }
        return arrayList.toArray((Object[]) Array.newInstance((Class<?>) cls, arrayList.size()));
    }
}
