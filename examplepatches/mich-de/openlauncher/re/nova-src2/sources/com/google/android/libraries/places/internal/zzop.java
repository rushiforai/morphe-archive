package com.google.android.libraries.places.internal;

import java.util.Iterator;

/* loaded from: classes3.dex */
final class zzop extends zzob {
    private final transient zzoa zza;
    private final transient zznx zzb;

    public zzop(zzoa zzoaVar, zznx zznxVar) {
        this.zza = zzoaVar;
        this.zzb = zznxVar;
    }

    @Override // com.google.android.libraries.places.internal.zznt, java.util.AbstractCollection, java.util.Collection
    public final boolean contains(Object obj) {
        return this.zza.get(obj) != null;
    }

    @Override // com.google.android.libraries.places.internal.zzob, com.google.android.libraries.places.internal.zznt, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public final /* synthetic */ Iterator iterator() {
        return this.zzb.listIterator(0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.zza.size();
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final int zza(Object[] objArr, int i5) {
        return this.zzb.zza(objArr, i5);
    }

    @Override // com.google.android.libraries.places.internal.zzob, com.google.android.libraries.places.internal.zznt
    public final zznx zzd() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.internal.zzob, com.google.android.libraries.places.internal.zznt
    /* renamed from: zze */
    public final zzox iterator() {
        return this.zzb.listIterator(0);
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final boolean zzf() {
        return true;
    }
}
