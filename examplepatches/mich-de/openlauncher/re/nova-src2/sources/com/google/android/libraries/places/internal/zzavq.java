package com.google.android.libraries.places.internal;

import a2.c;
import b.c0;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
final class zzavq extends zzarw implements RandomAccess {
    private static final zzavq zza = new zzavq(new Object[0], 0, false);
    private Object[] zzb;
    private int zzc;

    public zzavq() {
        this(new Object[10], 0, true);
    }

    public static zzavq zze() {
        return zza;
    }

    private final String zzf(int i5) {
        return c0.g(i5, this.zzc, "Index:", ", Size:");
    }

    private final void zzg(int i5) {
        if (i5 < 0 || i5 >= this.zzc) {
            throw new IndexOutOfBoundsException(zzf(i5));
        }
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        zza();
        if (i5 < 0 || i5 > (i11 = this.zzc)) {
            throw new IndexOutOfBoundsException(zzf(i5));
        }
        int i12 = i5 + 1;
        Object[] objArr = this.zzb;
        if (i11 < objArr.length) {
            System.arraycopy(objArr, i5, objArr, i12, i11 - i5);
        } else {
            Object[] objArr2 = new Object[c.A(i11, 3, 2, 1)];
            System.arraycopy(objArr, 0, objArr2, 0, i5);
            System.arraycopy(this.zzb, i5, objArr2, i12, this.zzc - i5);
            this.zzb = objArr2;
        }
        this.zzb[i5] = obj;
        this.zzc++;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        zzg(i5);
        return this.zzb[i5];
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        zza();
        zzg(i5);
        Object[] objArr = this.zzb;
        Object obj = objArr[i5];
        if (i5 < this.zzc - 1) {
            System.arraycopy(objArr, i5 + 1, objArr, i5, (r2 - i5) - 1);
        }
        this.zzc--;
        ((AbstractList) this).modCount++;
        return obj;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        zza();
        zzg(i5);
        Object[] objArr = this.zzb;
        Object obj2 = objArr[i5];
        objArr[i5] = obj;
        ((AbstractList) this).modCount++;
        return obj2;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.internal.zzauc
    public final /* bridge */ /* synthetic */ zzauc zzd(int i5) {
        if (i5 >= this.zzc) {
            return new zzavq(Arrays.copyOf(this.zzb, i5), this.zzc, true);
        }
        throw new IllegalArgumentException();
    }

    private zzavq(Object[] objArr, int i5, boolean z11) {
        super(z11);
        this.zzb = objArr;
        this.zzc = i5;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        zza();
        int i5 = this.zzc;
        Object[] objArr = this.zzb;
        if (i5 == objArr.length) {
            this.zzb = Arrays.copyOf(objArr, ((i5 * 3) / 2) + 1);
        }
        Object[] objArr2 = this.zzb;
        int i11 = this.zzc;
        this.zzc = i11 + 1;
        objArr2[i11] = obj;
        ((AbstractList) this).modCount++;
        return true;
    }
}
