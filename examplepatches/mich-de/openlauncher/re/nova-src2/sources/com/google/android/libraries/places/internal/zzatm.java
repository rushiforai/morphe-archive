package com.google.android.libraries.places.internal;

import a2.c;
import androidx.compose.ui.node.LayoutNode;
import b.c0;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
final class zzatm extends zzarw implements RandomAccess, zzauc, zzavo {
    private static final zzatm zza = new zzatm(new float[0], 0, false);
    private float[] zzb;
    private int zzc;

    public zzatm() {
        this(new float[10], 0, true);
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
        float fFloatValue = ((Float) obj).floatValue();
        zza();
        if (i5 < 0 || i5 > (i11 = this.zzc)) {
            throw new IndexOutOfBoundsException(zzf(i5));
        }
        int i12 = i5 + 1;
        float[] fArr = this.zzb;
        if (i11 < fArr.length) {
            System.arraycopy(fArr, i5, fArr, i12, i11 - i5);
        } else {
            float[] fArr2 = new float[c.A(i11, 3, 2, 1)];
            System.arraycopy(fArr, 0, fArr2, 0, i5);
            System.arraycopy(this.zzb, i5, fArr2, i12, this.zzc - i5);
            this.zzb = fArr2;
        }
        this.zzb[i5] = fFloatValue;
        this.zzc++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        zza();
        byte[] bArr = zzaud.zzd;
        collection.getClass();
        if (!(collection instanceof zzatm)) {
            return super.addAll(collection);
        }
        zzatm zzatmVar = (zzatm) collection;
        int i5 = zzatmVar.zzc;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.zzc;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        float[] fArr = this.zzb;
        if (i12 > fArr.length) {
            this.zzb = Arrays.copyOf(fArr, i12);
        }
        System.arraycopy(zzatmVar.zzb, 0, this.zzb, this.zzc, zzatmVar.zzc);
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
        if (!(obj instanceof zzatm)) {
            return super.equals(obj);
        }
        zzatm zzatmVar = (zzatm) obj;
        if (this.zzc != zzatmVar.zzc) {
            return false;
        }
        float[] fArr = zzatmVar.zzb;
        for (int i5 = 0; i5 < this.zzc; i5++) {
            if (Float.floatToIntBits(this.zzb[i5]) != Float.floatToIntBits(fArr[i5])) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.AbstractList, java.util.List
    public final /* synthetic */ Object get(int i5) {
        zzg(i5);
        return Float.valueOf(this.zzb[i5]);
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int iFloatToIntBits = 1;
        for (int i5 = 0; i5 < this.zzc; i5++) {
            iFloatToIntBits = (iFloatToIntBits * 31) + Float.floatToIntBits(this.zzb[i5]);
        }
        return iFloatToIntBits;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Float)) {
            return -1;
        }
        float fFloatValue = ((Float) obj).floatValue();
        int i5 = this.zzc;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.zzb[i11] == fFloatValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object remove(int i5) {
        zza();
        zzg(i5);
        float[] fArr = this.zzb;
        float f11 = fArr[i5];
        if (i5 < this.zzc - 1) {
            System.arraycopy(fArr, i5 + 1, fArr, i5, (r2 - i5) - 1);
        }
        this.zzc--;
        ((AbstractList) this).modCount++;
        return Float.valueOf(f11);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        zza();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        float[] fArr = this.zzb;
        System.arraycopy(fArr, i11, fArr, i5, this.zzc - i11);
        this.zzc -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object set(int i5, Object obj) {
        float fFloatValue = ((Float) obj).floatValue();
        zza();
        zzg(i5);
        float[] fArr = this.zzb;
        float f11 = fArr[i5];
        fArr[i5] = fFloatValue;
        return Float.valueOf(f11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.internal.zzauc
    public final /* bridge */ /* synthetic */ zzauc zzd(int i5) {
        if (i5 >= this.zzc) {
            return new zzatm(Arrays.copyOf(this.zzb, i5), this.zzc, true);
        }
        throw new IllegalArgumentException();
    }

    public final void zze(float f11) {
        zza();
        int i5 = this.zzc;
        float[] fArr = this.zzb;
        if (i5 == fArr.length) {
            float[] fArr2 = new float[c.A(i5, 3, 2, 1)];
            System.arraycopy(fArr, 0, fArr2, 0, i5);
            this.zzb = fArr2;
        }
        float[] fArr3 = this.zzb;
        int i11 = this.zzc;
        this.zzc = i11 + 1;
        fArr3[i11] = f11;
    }

    private zzatm(float[] fArr, int i5, boolean z11) {
        super(z11);
        this.zzb = fArr;
        this.zzc = i5;
    }

    @Override // com.google.android.libraries.places.internal.zzarw, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final /* bridge */ /* synthetic */ boolean add(Object obj) {
        zze(((Float) obj).floatValue());
        return true;
    }
}
