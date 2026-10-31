package com.google.android.libraries.places.internal;

import java.util.Iterator;

/* loaded from: classes3.dex */
final class zzos extends zzob {
    static final zzos zza;
    private static final Object[] zzd;
    final transient Object[] zzb;
    final transient Object[] zzc;
    private final transient int zze;
    private final transient int zzf;
    private final transient int zzg;

    static {
        Object[] objArr = new Object[0];
        zzd = objArr;
        zza = new zzos(objArr, 0, objArr, 0, 0);
    }

    public zzos(Object[] objArr, int i5, Object[] objArr2, int i11, int i12) {
        this.zzb = objArr;
        this.zze = i5;
        this.zzc = objArr2;
        this.zzf = i11;
        this.zzg = i12;
    }

    @Override // com.google.android.libraries.places.internal.zznt, java.util.AbstractCollection, java.util.Collection
    public final boolean contains(Object obj) {
        if (obj != null) {
            Object[] objArr = this.zzc;
            if (objArr.length != 0) {
                int iZza = zznq.zza(obj.hashCode());
                while (true) {
                    int i5 = iZza & this.zzf;
                    Object obj2 = objArr[i5];
                    if (obj2 == null) {
                        return false;
                    }
                    if (obj2.equals(obj)) {
                        return true;
                    }
                    iZza = i5 + 1;
                }
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.internal.zzob, java.util.Collection, java.util.Set
    public final int hashCode() {
        return this.zze;
    }

    @Override // com.google.android.libraries.places.internal.zzob, com.google.android.libraries.places.internal.zznt, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public final /* synthetic */ Iterator iterator() {
        return zzd().listIterator(0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.zzg;
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final int zza(Object[] objArr, int i5) {
        System.arraycopy(this.zzb, 0, objArr, i5, this.zzg);
        return i5 + this.zzg;
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final int zzb() {
        return this.zzg;
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final int zzc() {
        return 0;
    }

    @Override // com.google.android.libraries.places.internal.zzob, com.google.android.libraries.places.internal.zznt
    /* renamed from: zze */
    public final zzox iterator() {
        return zzd().listIterator(0);
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final boolean zzf() {
        return false;
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final Object[] zzg() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.internal.zzob
    public final zznx zzi() {
        return zznx.zzi(this.zzb, this.zzg);
    }

    @Override // com.google.android.libraries.places.internal.zzob
    public final boolean zzq() {
        return true;
    }
}
