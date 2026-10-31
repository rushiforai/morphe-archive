package com.google.android.libraries.places.internal;

import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes3.dex */
public final class zznz {
    Object[] zza;
    int zzb;
    zzny zzc;

    public zznz() {
        this(4);
    }

    private final void zzd(int i5) {
        Object[] objArr = this.zza;
        int length = objArr.length;
        int i11 = i5 + i5;
        if (i11 > length) {
            this.zza = Arrays.copyOf(objArr, zzns.zzd(length, i11));
        }
    }

    public final zznz zza(Object obj, Object obj2) {
        zzd(this.zzb + 1);
        zznj.zza(obj, obj2);
        Object[] objArr = this.zza;
        int i5 = this.zzb;
        int i11 = i5 + i5;
        objArr[i11] = obj;
        objArr[i11 + 1] = obj2;
        this.zzb = i5 + 1;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final zznz zzb(Iterable iterable) {
        if (iterable instanceof Collection) {
            zzd(iterable.size() + this.zzb);
        }
        Iterator it = iterable.iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            zza(entry.getKey(), entry.getValue());
        }
        return this;
    }

    public final zzoa zzc() {
        zzny zznyVar = this.zzc;
        if (zznyVar != null) {
            throw zznyVar.zza();
        }
        zzor zzorVarZzh = zzor.zzh(this.zzb, this.zza, this);
        zzny zznyVar2 = this.zzc;
        if (zznyVar2 == null) {
            return zzorVarZzh;
        }
        throw zznyVar2.zza();
    }

    public zznz(int i5) {
        this.zza = new Object[i5 + i5];
        this.zzb = 0;
    }
}
