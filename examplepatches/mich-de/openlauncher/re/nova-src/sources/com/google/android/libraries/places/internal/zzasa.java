package com.google.android.libraries.places.internal;

import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
final class zzasa extends zzasc {
    final /* synthetic */ zzask zza;
    private int zzb = 0;
    private final int zzc;

    public zzasa(zzask zzaskVar) {
        this.zza = zzaskVar;
        this.zzc = zzaskVar.zzd();
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.zzb < this.zzc;
    }

    @Override // com.google.android.libraries.places.internal.zzase
    public final byte zza() {
        int i5 = this.zzb;
        if (i5 >= this.zzc) {
            throw new NoSuchElementException();
        }
        this.zzb = i5 + 1;
        return this.zza.zzb(i5);
    }
}
