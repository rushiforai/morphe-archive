package com.google.android.libraries.places.internal;

import a2.c;
import androidx.compose.ui.node.LayoutNode;
import b.c0;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
final class zzauu extends zzarw implements RandomAccess, zzaub, zzavo {
    private static final zzauu zza = new zzauu(new long[0], 0, false);
    private long[] zzb;
    private int zzc;

    public zzauu() {
        this(new long[10], 0, true);
    }

    public static zzauu zzf() {
        return zza;
    }

    private final String zzh(int i5) {
        return c0.g(i5, this.zzc, "Index:", ", Size:");
    }

    private final void zzi(int i5) {
        if (i5 < 0 || i5 >= this.zzc) {
            throw new IndexOutOfBoundsException(zzh(i5));
        }
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final /* synthetic */ void add(int i5, Object obj) {
        int i11;
        long jLongValue = ((Long) obj).longValue();
        zza();
        if (i5 < 0 || i5 > (i11 = this.zzc)) {
            throw new IndexOutOfBoundsException(zzh(i5));
        }
        int i12 = i5 + 1;
        long[] jArr = this.zzb;
        if (i11 < jArr.length) {
            System.arraycopy(jArr, i5, jArr, i12, i11 - i5);
        } else {
            long[] jArr2 = new long[c.A(i11, 3, 2, 1)];
            System.arraycopy(jArr, 0, jArr2, 0, i5);
            System.arraycopy(this.zzb, i5, jArr2, i12, this.zzc - i5);
            this.zzb = jArr2;
        }
        this.zzb[i5] = jLongValue;
        this.zzc++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        zza();
        byte[] bArr = zzaud.zzd;
        collection.getClass();
        if (!(collection instanceof zzauu)) {
            return super.addAll(collection);
        }
        zzauu zzauuVar = (zzauu) collection;
        int i5 = zzauuVar.zzc;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.zzc;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        long[] jArr = this.zzb;
        if (i12 > jArr.length) {
            this.zzb = Arrays.copyOf(jArr, i12);
        }
        System.arraycopy(zzauuVar.zzb, 0, this.zzb, this.zzc, zzauuVar.zzc);
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
        if (!(obj instanceof zzauu)) {
            return super.equals(obj);
        }
        zzauu zzauuVar = (zzauu) obj;
        if (this.zzc != zzauuVar.zzc) {
            return false;
        }
        long[] jArr = zzauuVar.zzb;
        for (int i5 = 0; i5 < this.zzc; i5++) {
            if (this.zzb[i5] != jArr[i5]) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.AbstractList, java.util.List
    public final /* synthetic */ Object get(int i5) {
        zzi(i5);
        return Long.valueOf(this.zzb[i5]);
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = 1;
        for (int i11 = 0; i11 < this.zzc; i11++) {
            long j11 = this.zzb[i11];
            byte[] bArr = zzaud.zzd;
            i5 = (i5 * 31) + ((int) (j11 ^ (j11 >>> 32)));
        }
        return i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Long)) {
            return -1;
        }
        long jLongValue = ((Long) obj).longValue();
        int i5 = this.zzc;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.zzb[i11] == jLongValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object remove(int i5) {
        zza();
        zzi(i5);
        long[] jArr = this.zzb;
        long j11 = jArr[i5];
        if (i5 < this.zzc - 1) {
            System.arraycopy(jArr, i5 + 1, jArr, i5, (r3 - i5) - 1);
        }
        this.zzc--;
        ((AbstractList) this).modCount++;
        return Long.valueOf(j11);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        zza();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        long[] jArr = this.zzb;
        System.arraycopy(jArr, i11, jArr, i5, this.zzc - i11);
        this.zzc -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object set(int i5, Object obj) {
        long jLongValue = ((Long) obj).longValue();
        zza();
        zzi(i5);
        long[] jArr = this.zzb;
        long j11 = jArr[i5];
        jArr[i5] = jLongValue;
        return Long.valueOf(j11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.internal.zzauc
    public final /* bridge */ /* synthetic */ zzauc zzd(int i5) {
        if (i5 >= this.zzc) {
            return new zzauu(Arrays.copyOf(this.zzb, i5), this.zzc, true);
        }
        throw new IllegalArgumentException();
    }

    public final long zze(int i5) {
        zzi(i5);
        return this.zzb[i5];
    }

    public final void zzg(long j11) {
        zza();
        int i5 = this.zzc;
        long[] jArr = this.zzb;
        if (i5 == jArr.length) {
            long[] jArr2 = new long[c.A(i5, 3, 2, 1)];
            System.arraycopy(jArr, 0, jArr2, 0, i5);
            this.zzb = jArr2;
        }
        long[] jArr3 = this.zzb;
        int i11 = this.zzc;
        this.zzc = i11 + 1;
        jArr3[i11] = j11;
    }

    private zzauu(long[] jArr, int i5, boolean z11) {
        super(z11);
        this.zzb = jArr;
        this.zzc = i5;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final /* bridge */ /* synthetic */ boolean add(Object obj) {
        zzg(((Long) obj).longValue());
        return true;
    }
}
