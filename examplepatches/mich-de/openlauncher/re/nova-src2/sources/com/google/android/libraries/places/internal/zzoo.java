package com.google.android.libraries.places.internal;

import java.util.Iterator;
import java.util.Map;

/* loaded from: classes3.dex */
final class zzoo extends zzob {
    private final transient zzoa zza;
    private final transient Object[] zzb;
    private final transient int zzc;

    public zzoo(zzoa zzoaVar, Object[] objArr, int i5, int i11) {
        this.zza = zzoaVar;
        this.zzb = objArr;
        this.zzc = i11;
    }

    @Override // com.google.android.libraries.places.internal.zznt, java.util.AbstractCollection, java.util.Collection
    public final boolean contains(Object obj) {
        if (obj instanceof Map.Entry) {
            Map.Entry entry = (Map.Entry) obj;
            Object key = entry.getKey();
            Object value = entry.getValue();
            if (value != null && value.equals(this.zza.get(key))) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.internal.zzob, com.google.android.libraries.places.internal.zznt, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public final /* synthetic */ Iterator iterator() {
        return zzd().listIterator(0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final int zza(Object[] objArr, int i5) {
        return zzd().zza(objArr, i5);
    }

    @Override // com.google.android.libraries.places.internal.zzob, com.google.android.libraries.places.internal.zznt
    /* renamed from: zze */
    public final zzox iterator() {
        return zzd().listIterator(0);
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final boolean zzf() {
        return true;
    }

    @Override // com.google.android.libraries.places.internal.zzob
    public final zznx zzi() {
        return new zzon(this);
    }
}
