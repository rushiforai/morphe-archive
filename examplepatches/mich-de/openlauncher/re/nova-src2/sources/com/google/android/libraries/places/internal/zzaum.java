package com.google.android.libraries.places.internal;

import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public final class zzaum extends zzarw implements RandomAccess, zzaun {

    @Deprecated
    public static final zzaun zza;
    private static final zzaum zzb;
    private final List zzc;

    static {
        zzaum zzaumVar = new zzaum(false);
        zzb = zzaumVar;
        zza = zzaumVar;
    }

    public zzaum() {
        this(10);
    }

    private static String zzj(Object obj) {
        return obj instanceof String ? (String) obj : obj instanceof zzask ? ((zzask) obj).zzm(zzaud.zzb) : zzaud.zzd((byte[]) obj);
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ void add(int i5, Object obj) {
        zza();
        this.zzc.add(i5, (String) obj);
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final boolean addAll(int i5, Collection collection) {
        zza();
        if (collection instanceof zzaun) {
            collection = ((zzaun) collection).zzh();
        }
        boolean zAddAll = this.zzc.addAll(i5, collection);
        ((AbstractList) this).modCount++;
        return zAddAll;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final void clear() {
        zza();
        this.zzc.clear();
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object remove(int i5) {
        zza();
        Object objRemove = this.zzc.remove(i5);
        ((AbstractList) this).modCount++;
        return zzj(objRemove);
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object set(int i5, Object obj) {
        zza();
        return zzj(this.zzc.set(i5, (String) obj));
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.zzc.size();
    }

    @Override // com.google.android.libraries.places.internal.zzauc
    public final /* bridge */ /* synthetic */ zzauc zzd(int i5) {
        if (i5 < size()) {
            throw new IllegalArgumentException();
        }
        ArrayList arrayList = new ArrayList(i5);
        arrayList.addAll(this.zzc);
        return new zzaum(arrayList);
    }

    @Override // com.google.android.libraries.places.internal.zzaun
    public final zzaun zze() {
        return zzc() ? new zzaws(this) : this;
    }

    @Override // com.google.android.libraries.places.internal.zzaun
    public final Object zzf(int i5) {
        return this.zzc.get(i5);
    }

    @Override // java.util.AbstractList, java.util.List
    /* renamed from: zzg, reason: merged with bridge method [inline-methods] */
    public final String get(int i5) {
        Object obj = this.zzc.get(i5);
        if (obj instanceof String) {
            return (String) obj;
        }
        if (obj instanceof zzask) {
            zzask zzaskVar = (zzask) obj;
            String strZzm = zzaskVar.zzm(zzaud.zzb);
            if (zzaskVar.zzi()) {
                this.zzc.set(i5, strZzm);
            }
            return strZzm;
        }
        byte[] bArr = (byte[]) obj;
        String strZzd = zzaud.zzd(bArr);
        if (zzaxc.zze(bArr)) {
            this.zzc.set(i5, strZzd);
        }
        return strZzd;
    }

    @Override // com.google.android.libraries.places.internal.zzaun
    public final List zzh() {
        return Collections.unmodifiableList(this.zzc);
    }

    @Override // com.google.android.libraries.places.internal.zzaun
    public final void zzi(zzask zzaskVar) {
        zza();
        this.zzc.add(zzaskVar);
        ((AbstractList) this).modCount++;
    }

    public zzaum(int i5) {
        ArrayList arrayList = new ArrayList(i5);
        super(true);
        this.zzc = arrayList;
    }

    private zzaum(ArrayList arrayList) {
        super(true);
        this.zzc = arrayList;
    }

    private zzaum(boolean z11) {
        super(false);
        this.zzc = Collections.EMPTY_LIST;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        return addAll(size(), collection);
    }
}
