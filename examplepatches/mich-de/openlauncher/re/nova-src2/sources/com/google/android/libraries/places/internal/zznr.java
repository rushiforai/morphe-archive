package com.google.android.libraries.places.internal;

import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;

/* loaded from: classes3.dex */
class zznr extends zzns {
    Object[] zza = new Object[4];
    int zzb = 0;
    boolean zzc;

    public zznr(int i5) {
    }

    private final void zze(int i5) {
        Object[] objArr = this.zza;
        int length = objArr.length;
        if (length < i5) {
            this.zza = Arrays.copyOf(objArr, zzns.zzd(length, i5));
            this.zzc = false;
        } else if (this.zzc) {
            this.zza = (Object[]) objArr.clone();
            this.zzc = false;
        }
    }

    public final zznr zza(Object obj) {
        obj.getClass();
        zze(this.zzb + 1);
        Object[] objArr = this.zza;
        int i5 = this.zzb;
        this.zzb = i5 + 1;
        objArr[i5] = obj;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzns
    public /* bridge */ /* synthetic */ zzns zzb(Object obj) {
        throw null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final zzns zzc(Iterable iterable) {
        if (iterable instanceof Collection) {
            zze(iterable.size() + this.zzb);
            if (iterable instanceof zznt) {
                this.zzb = ((zznt) iterable).zza(this.zza, this.zzb);
                return this;
            }
        }
        Iterator it = iterable.iterator();
        while (it.hasNext()) {
            zzb(it.next());
        }
        return this;
    }
}
