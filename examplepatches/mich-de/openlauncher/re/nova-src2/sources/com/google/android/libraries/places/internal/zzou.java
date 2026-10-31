package com.google.android.libraries.places.internal;

import b.c0;
import java.util.Iterator;

/* loaded from: classes3.dex */
final class zzou extends zzob {
    final transient Object zza;

    public zzou(Object obj) {
        obj.getClass();
        this.zza = obj;
    }

    @Override // com.google.android.libraries.places.internal.zznt, java.util.AbstractCollection, java.util.Collection
    public final boolean contains(Object obj) {
        return this.zza.equals(obj);
    }

    @Override // com.google.android.libraries.places.internal.zzob, java.util.Collection, java.util.Set
    public final int hashCode() {
        return this.zza.hashCode();
    }

    @Override // com.google.android.libraries.places.internal.zzob, com.google.android.libraries.places.internal.zznt, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public final /* synthetic */ Iterator iterator() {
        return new zzoc(this.zza);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return 1;
    }

    @Override // java.util.AbstractCollection
    public final String toString() {
        return c0.l("[", this.zza.toString(), "]");
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final int zza(Object[] objArr, int i5) {
        objArr[i5] = this.zza;
        return i5 + 1;
    }

    @Override // com.google.android.libraries.places.internal.zzob, com.google.android.libraries.places.internal.zznt
    public final zznx zzd() {
        return zznx.zzm(this.zza);
    }

    @Override // com.google.android.libraries.places.internal.zzob, com.google.android.libraries.places.internal.zznt
    /* renamed from: zze */
    public final zzox iterator() {
        return new zzoc(this.zza);
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final boolean zzf() {
        return false;
    }
}
