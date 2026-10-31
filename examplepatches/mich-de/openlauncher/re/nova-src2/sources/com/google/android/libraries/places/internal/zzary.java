package com.google.android.libraries.places.internal;

import a2.c;
import androidx.compose.ui.node.LayoutNode;
import b.c0;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
final class zzary extends zzarw implements RandomAccess, zzauc, zzavo {
    private static final zzary zza = new zzary(new boolean[0], 0, false);
    private boolean[] zzb;
    private int zzc;

    public zzary() {
        this(new boolean[10], 0, true);
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
    public final /* synthetic */ void add(int i5, Object obj) {
        int i11;
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        zza();
        if (i5 < 0 || i5 > (i11 = this.zzc)) {
            throw new IndexOutOfBoundsException(zzf(i5));
        }
        int i12 = i5 + 1;
        boolean[] zArr = this.zzb;
        if (i11 < zArr.length) {
            System.arraycopy(zArr, i5, zArr, i12, i11 - i5);
        } else {
            boolean[] zArr2 = new boolean[c.A(i11, 3, 2, 1)];
            System.arraycopy(zArr, 0, zArr2, 0, i5);
            System.arraycopy(this.zzb, i5, zArr2, i12, this.zzc - i5);
            this.zzb = zArr2;
        }
        this.zzb[i5] = zBooleanValue;
        this.zzc++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        zza();
        byte[] bArr = zzaud.zzd;
        collection.getClass();
        if (!(collection instanceof zzary)) {
            return super.addAll(collection);
        }
        zzary zzaryVar = (zzary) collection;
        int i5 = zzaryVar.zzc;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.zzc;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        boolean[] zArr = this.zzb;
        if (i12 > zArr.length) {
            this.zzb = Arrays.copyOf(zArr, i12);
        }
        System.arraycopy(zzaryVar.zzb, 0, this.zzb, this.zzc, zzaryVar.zzc);
        this.zzc = i12;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zzary)) {
            return super.equals(obj);
        }
        zzary zzaryVar = (zzary) obj;
        if (this.zzc != zzaryVar.zzc) {
            return false;
        }
        boolean[] zArr = zzaryVar.zzb;
        for (int i5 = 0; i5 < this.zzc; i5++) {
            if (this.zzb[i5] != zArr[i5]) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.AbstractList, java.util.List
    public final /* synthetic */ Object get(int i5) {
        zzg(i5);
        return Boolean.valueOf(this.zzb[i5]);
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int iZza = 1;
        for (int i5 = 0; i5 < this.zzc; i5++) {
            iZza = (iZza * 31) + zzaud.zza(this.zzb[i5]);
        }
        return iZza;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Boolean)) {
            return -1;
        }
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        int i5 = this.zzc;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.zzb[i11] == zBooleanValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object remove(int i5) {
        zza();
        zzg(i5);
        boolean[] zArr = this.zzb;
        boolean z11 = zArr[i5];
        if (i5 < this.zzc - 1) {
            System.arraycopy(zArr, i5 + 1, zArr, i5, (r2 - i5) - 1);
        }
        this.zzc--;
        ((AbstractList) this).modCount++;
        return Boolean.valueOf(z11);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        zza();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        boolean[] zArr = this.zzb;
        System.arraycopy(zArr, i11, zArr, i5, this.zzc - i11);
        this.zzc -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object set(int i5, Object obj) {
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        zza();
        zzg(i5);
        boolean[] zArr = this.zzb;
        boolean z11 = zArr[i5];
        zArr[i5] = zBooleanValue;
        return Boolean.valueOf(z11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.internal.zzauc
    public final /* bridge */ /* synthetic */ zzauc zzd(int i5) {
        if (i5 >= this.zzc) {
            return new zzary(Arrays.copyOf(this.zzb, i5), this.zzc, true);
        }
        throw new IllegalArgumentException();
    }

    public final void zze(boolean z11) {
        zza();
        int i5 = this.zzc;
        boolean[] zArr = this.zzb;
        if (i5 == zArr.length) {
            boolean[] zArr2 = new boolean[c.A(i5, 3, 2, 1)];
            System.arraycopy(zArr, 0, zArr2, 0, i5);
            this.zzb = zArr2;
        }
        boolean[] zArr3 = this.zzb;
        int i11 = this.zzc;
        this.zzc = i11 + 1;
        zArr3[i11] = z11;
    }

    private zzary(boolean[] zArr, int i5, boolean z11) {
        super(z11);
        this.zzb = zArr;
        this.zzc = i5;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final /* bridge */ /* synthetic */ boolean add(Object obj) {
        zze(((Boolean) obj).booleanValue());
        return true;
    }
}
