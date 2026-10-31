package com.google.android.libraries.places.internal;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class zzbax {
    private List zza;
    private final zzaye zzb = zzaye.zza;
    private Object[][] zzc = (Object[][]) Array.newInstance((Class<?>) Object.class, 0, 2);

    public final zzbax zza(zzbay zzbayVar, Object obj) {
        int length = 0;
        while (true) {
            Object[][] objArr = this.zzc;
            if (length >= objArr.length) {
                length = -1;
                break;
            }
            if (zzbayVar.equals(objArr[length][0])) {
                break;
            }
            length++;
        }
        if (length == -1) {
            Object[][] objArr2 = this.zzc;
            int length2 = objArr2.length;
            Object[][] objArr3 = (Object[][]) Array.newInstance((Class<?>) Object.class, length2 + 1, 2);
            System.arraycopy(objArr2, 0, objArr3, 0, length2);
            this.zzc = objArr3;
            length = objArr3.length - 1;
        }
        this.zzc[length] = new Object[]{zzbayVar, obj};
        return this;
    }

    public final zzbax zzb(List list) {
        zzmt.zzf(!list.isEmpty(), "addrs is empty");
        this.zza = Collections.unmodifiableList(new ArrayList(list));
        return this;
    }

    public final zzbba zzc() {
        return new zzbba(this.zza, this.zzb, this.zzc, null);
    }
}
