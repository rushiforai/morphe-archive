package com.google.android.libraries.places.internal;

import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
final class zzrl implements Iterator {
    final /* synthetic */ zzrm zza;
    private int zzb = 0;

    public zzrl(zzrm zzrmVar) {
        this.zza = zzrmVar;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        int i5 = this.zzb;
        zzrm zzrmVar = this.zza;
        return i5 < zzrmVar.zza() - zzrmVar.zzb();
    }

    @Override // java.util.Iterator
    public final Object next() {
        int i5 = this.zzb;
        zzrm zzrmVar = this.zza;
        if (i5 >= zzrmVar.zza() - zzrmVar.zzb()) {
            throw new NoSuchElementException();
        }
        zzrm zzrmVar2 = this.zza;
        Object obj = zzrmVar2.zzb.zzb[zzrmVar2.zzb() + i5];
        this.zzb = i5 + 1;
        return obj;
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException();
    }
}
