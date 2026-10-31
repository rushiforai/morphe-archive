package com.google.android.libraries.places.internal;

import a2.c;
import androidx.compose.ui.node.LayoutNode;
import b.c0;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
final class zzasz extends zzarw implements RandomAccess, zzauc, zzavo {
    private static final zzasz zza = new zzasz(new double[0], 0, false);
    private double[] zzb;
    private int zzc;

    public zzasz() {
        this(new double[10], 0, true);
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
        double dDoubleValue = ((Double) obj).doubleValue();
        zza();
        if (i5 < 0 || i5 > (i11 = this.zzc)) {
            throw new IndexOutOfBoundsException(zzf(i5));
        }
        int i12 = i5 + 1;
        double[] dArr = this.zzb;
        if (i11 < dArr.length) {
            System.arraycopy(dArr, i5, dArr, i12, i11 - i5);
        } else {
            double[] dArr2 = new double[c.A(i11, 3, 2, 1)];
            System.arraycopy(dArr, 0, dArr2, 0, i5);
            System.arraycopy(this.zzb, i5, dArr2, i12, this.zzc - i5);
            this.zzb = dArr2;
        }
        this.zzb[i5] = dDoubleValue;
        this.zzc++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        zza();
        byte[] bArr = zzaud.zzd;
        collection.getClass();
        if (!(collection instanceof zzasz)) {
            return super.addAll(collection);
        }
        zzasz zzaszVar = (zzasz) collection;
        int i5 = zzaszVar.zzc;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.zzc;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        double[] dArr = this.zzb;
        if (i12 > dArr.length) {
            this.zzb = Arrays.copyOf(dArr, i12);
        }
        System.arraycopy(zzaszVar.zzb, 0, this.zzb, this.zzc, zzaszVar.zzc);
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
        if (!(obj instanceof zzasz)) {
            return super.equals(obj);
        }
        zzasz zzaszVar = (zzasz) obj;
        if (this.zzc != zzaszVar.zzc) {
            return false;
        }
        double[] dArr = zzaszVar.zzb;
        for (int i5 = 0; i5 < this.zzc; i5++) {
            if (Double.doubleToLongBits(this.zzb[i5]) != Double.doubleToLongBits(dArr[i5])) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.AbstractList, java.util.List
    public final /* synthetic */ Object get(int i5) {
        zzg(i5);
        return Double.valueOf(this.zzb[i5]);
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = 1;
        for (int i11 = 0; i11 < this.zzc; i11++) {
            long jDoubleToLongBits = Double.doubleToLongBits(this.zzb[i11]);
            byte[] bArr = zzaud.zzd;
            i5 = (i5 * 31) + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
        }
        return i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Double)) {
            return -1;
        }
        double dDoubleValue = ((Double) obj).doubleValue();
        int i5 = this.zzc;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.zzb[i11] == dDoubleValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object remove(int i5) {
        zza();
        zzg(i5);
        double[] dArr = this.zzb;
        double d5 = dArr[i5];
        if (i5 < this.zzc - 1) {
            System.arraycopy(dArr, i5 + 1, dArr, i5, (r3 - i5) - 1);
        }
        this.zzc--;
        ((AbstractList) this).modCount++;
        return Double.valueOf(d5);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        zza();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        double[] dArr = this.zzb;
        System.arraycopy(dArr, i11, dArr, i5, this.zzc - i11);
        this.zzc -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object set(int i5, Object obj) {
        double dDoubleValue = ((Double) obj).doubleValue();
        zza();
        zzg(i5);
        double[] dArr = this.zzb;
        double d5 = dArr[i5];
        dArr[i5] = dDoubleValue;
        return Double.valueOf(d5);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.internal.zzauc
    public final /* bridge */ /* synthetic */ zzauc zzd(int i5) {
        if (i5 >= this.zzc) {
            return new zzasz(Arrays.copyOf(this.zzb, i5), this.zzc, true);
        }
        throw new IllegalArgumentException();
    }

    public final void zze(double d5) {
        zza();
        int i5 = this.zzc;
        double[] dArr = this.zzb;
        if (i5 == dArr.length) {
            double[] dArr2 = new double[c.A(i5, 3, 2, 1)];
            System.arraycopy(dArr, 0, dArr2, 0, i5);
            this.zzb = dArr2;
        }
        double[] dArr3 = this.zzb;
        int i11 = this.zzc;
        this.zzc = i11 + 1;
        dArr3[i11] = d5;
    }

    private zzasz(double[] dArr, int i5, boolean z11) {
        super(z11);
        this.zzb = dArr;
        this.zzc = i5;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final /* bridge */ /* synthetic */ boolean add(Object obj) {
        zze(((Double) obj).doubleValue());
        return true;
    }
}
