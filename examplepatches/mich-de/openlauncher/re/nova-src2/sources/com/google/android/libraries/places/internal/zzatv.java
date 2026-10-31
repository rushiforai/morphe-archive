package com.google.android.libraries.places.internal;

import a2.c;
import androidx.compose.ui.node.LayoutNode;
import b.c0;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
final class zzatv extends zzarw implements RandomAccess, zzatz, zzavo {
    private static final zzatv zza = new zzatv(new int[0], 0, false);
    private int[] zzb;
    private int zzc;

    public zzatv() {
        this(new int[10], 0, true);
    }

    public static zzatv zzf() {
        return zza;
    }

    private final String zzi(int i5) {
        return c0.g(i5, this.zzc, "Index:", ", Size:");
    }

    private final void zzj(int i5) {
        if (i5 < 0 || i5 >= this.zzc) {
            throw new IndexOutOfBoundsException(zzi(i5));
        }
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final /* synthetic */ void add(int i5, Object obj) {
        int i11;
        int iIntValue = ((Integer) obj).intValue();
        zza();
        if (i5 < 0 || i5 > (i11 = this.zzc)) {
            throw new IndexOutOfBoundsException(zzi(i5));
        }
        int i12 = i5 + 1;
        int[] iArr = this.zzb;
        if (i11 < iArr.length) {
            System.arraycopy(iArr, i5, iArr, i12, i11 - i5);
        } else {
            int[] iArr2 = new int[c.A(i11, 3, 2, 1)];
            System.arraycopy(iArr, 0, iArr2, 0, i5);
            System.arraycopy(this.zzb, i5, iArr2, i12, this.zzc - i5);
            this.zzb = iArr2;
        }
        this.zzb[i5] = iIntValue;
        this.zzc++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        zza();
        byte[] bArr = zzaud.zzd;
        collection.getClass();
        if (!(collection instanceof zzatv)) {
            return super.addAll(collection);
        }
        zzatv zzatvVar = (zzatv) collection;
        int i5 = zzatvVar.zzc;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.zzc;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        int[] iArr = this.zzb;
        if (i12 > iArr.length) {
            this.zzb = Arrays.copyOf(iArr, i12);
        }
        System.arraycopy(zzatvVar.zzb, 0, this.zzb, this.zzc, zzatvVar.zzc);
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
        if (!(obj instanceof zzatv)) {
            return super.equals(obj);
        }
        zzatv zzatvVar = (zzatv) obj;
        if (this.zzc != zzatvVar.zzc) {
            return false;
        }
        int[] iArr = zzatvVar.zzb;
        for (int i5 = 0; i5 < this.zzc; i5++) {
            if (this.zzb[i5] != iArr[i5]) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.AbstractList, java.util.List
    public final /* synthetic */ Object get(int i5) {
        zzj(i5);
        return Integer.valueOf(this.zzb[i5]);
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = 1;
        for (int i11 = 0; i11 < this.zzc; i11++) {
            i5 = (i5 * 31) + this.zzb[i11];
        }
        return i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Integer)) {
            return -1;
        }
        int iIntValue = ((Integer) obj).intValue();
        int i5 = this.zzc;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.zzb[i11] == iIntValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object remove(int i5) {
        zza();
        zzj(i5);
        int[] iArr = this.zzb;
        int i11 = iArr[i5];
        if (i5 < this.zzc - 1) {
            System.arraycopy(iArr, i5 + 1, iArr, i5, (r2 - i5) - 1);
        }
        this.zzc--;
        ((AbstractList) this).modCount++;
        return Integer.valueOf(i11);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        zza();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        int[] iArr = this.zzb;
        System.arraycopy(iArr, i11, iArr, i5, this.zzc - i11);
        this.zzc -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object set(int i5, Object obj) {
        int iIntValue = ((Integer) obj).intValue();
        zza();
        zzj(i5);
        int[] iArr = this.zzb;
        int i11 = iArr[i5];
        iArr[i5] = iIntValue;
        return Integer.valueOf(i11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.zzc;
    }

    public final int zze(int i5) {
        zzj(i5);
        return this.zzb[i5];
    }

    @Override // com.google.android.libraries.places.internal.zzauc
    /* renamed from: zzg, reason: merged with bridge method [inline-methods] */
    public final zzatz zzd(int i5) {
        if (i5 >= this.zzc) {
            return new zzatv(Arrays.copyOf(this.zzb, i5), this.zzc, true);
        }
        throw new IllegalArgumentException();
    }

    @Override // com.google.android.libraries.places.internal.zzatz
    public final void zzh(int i5) {
        zza();
        int i11 = this.zzc;
        int[] iArr = this.zzb;
        if (i11 == iArr.length) {
            int[] iArr2 = new int[c.A(i11, 3, 2, 1)];
            System.arraycopy(iArr, 0, iArr2, 0, i11);
            this.zzb = iArr2;
        }
        int[] iArr3 = this.zzb;
        int i12 = this.zzc;
        this.zzc = i12 + 1;
        iArr3[i12] = i5;
    }

    private zzatv(int[] iArr, int i5, boolean z11) {
        super(z11);
        this.zzb = iArr;
        this.zzc = i5;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final /* bridge */ /* synthetic */ boolean add(Object obj) {
        zzh(((Integer) obj).intValue());
        return true;
    }
}
