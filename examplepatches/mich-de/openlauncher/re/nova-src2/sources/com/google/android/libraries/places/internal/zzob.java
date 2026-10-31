package com.google.android.libraries.places.internal;

import com.amplitude.core.events.Plan;
import java.util.Arrays;
import java.util.Collection;
import java.util.Objects;
import java.util.Set;
import java.util.SortedSet;

/* loaded from: classes3.dex */
public abstract class zzob extends zznt implements Set {
    private transient zznx zza;

    public static int zzh(int i5) {
        int iMax = Math.max(i5, 2);
        if (iMax >= 751619276) {
            zzmt.zzf(iMax < 1073741824, "collection too large");
            return 1073741824;
        }
        int iHighestOneBit = Integer.highestOneBit(iMax - 1);
        do {
            iHighestOneBit += iHighestOneBit;
        } while (iHighestOneBit * 0.7d < iMax);
        return iHighestOneBit;
    }

    public static zzob zzj(Collection collection) {
        if ((collection instanceof zzob) && !(collection instanceof SortedSet)) {
            zzob zzobVar = (zzob) collection;
            if (!zzobVar.zzf()) {
                return zzobVar;
            }
        }
        Object[] array = collection.toArray();
        return zzr(array.length, array);
    }

    public static zzob zzk() {
        return zzos.zza;
    }

    public static zzob zzl(Object obj) {
        return new zzou(obj);
    }

    public static zzob zzm(Object obj, Object obj2) {
        return zzr(2, obj, obj2);
    }

    public static zzob zzn(Object obj, Object obj2, Object obj3, Object obj4) {
        return zzr(4, "http", "https", "mailto", "ftp");
    }

    public static zzob zzo(Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
        return zzr(5, "audio", "img", "input", Plan.AMP_PLAN_SOURCE, "video");
    }

    @SafeVarargs
    public static zzob zzp(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object... objArr) {
        int length = objArr.length;
        int i5 = length + 6;
        Object[] objArr2 = new Object[i5];
        objArr2[0] = obj;
        objArr2[1] = obj2;
        objArr2[2] = obj3;
        objArr2[3] = obj4;
        objArr2[4] = obj5;
        objArr2[5] = obj6;
        System.arraycopy(objArr, 0, objArr2, 6, length);
        return zzr(i5, objArr2);
    }

    private static zzob zzr(int i5, Object... objArr) {
        if (i5 == 0) {
            return zzos.zza;
        }
        if (i5 == 1) {
            Object obj = objArr[0];
            Objects.requireNonNull(obj);
            return new zzou(obj);
        }
        int iZzh = zzh(i5);
        Object[] objArr2 = new Object[iZzh];
        int i11 = iZzh - 1;
        int i12 = 0;
        int i13 = 0;
        for (int i14 = 0; i14 < i5; i14++) {
            Object obj2 = objArr[i14];
            zzoi.zza(obj2, i14);
            int iHashCode = obj2.hashCode();
            int iZza = zznq.zza(iHashCode);
            while (true) {
                int i15 = iZza & i11;
                Object obj3 = objArr2[i15];
                if (obj3 == null) {
                    objArr[i13] = obj2;
                    objArr2[i15] = obj2;
                    i12 += iHashCode;
                    i13++;
                    break;
                }
                if (!obj3.equals(obj2)) {
                    iZza++;
                }
            }
        }
        Arrays.fill(objArr, i13, i5, (Object) null);
        if (i13 == 1) {
            Object obj4 = objArr[0];
            Objects.requireNonNull(obj4);
            return new zzou(obj4);
        }
        if (zzh(i13) < iZzh / 2) {
            return zzr(i13, objArr);
        }
        int length = objArr.length;
        if (i13 < (length >> 1) + (length >> 2)) {
            objArr = Arrays.copyOf(objArr, i13);
        }
        return new zzos(objArr, i12, objArr2, i11, i13);
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if ((obj instanceof zzob) && zzq() && ((zzob) obj).zzq() && hashCode() != obj.hashCode()) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (obj instanceof Set) {
            Set set = (Set) obj;
            try {
                if (size() == set.size()) {
                    return containsAll(set);
                }
            } catch (ClassCastException | NullPointerException unused) {
            }
        }
        return false;
    }

    @Override // java.util.Collection, java.util.Set
    public int hashCode() {
        return zzot.zza(this);
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public zznx zzd() {
        zznx zznxVar = this.zza;
        if (zznxVar != null) {
            return zznxVar;
        }
        zznx zznxVarZzi = zzi();
        this.zza = zznxVarZzi;
        return zznxVarZzi;
    }

    @Override // com.google.android.libraries.places.internal.zznt, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    /* renamed from: zze */
    public abstract zzox iterator();

    public zznx zzi() {
        Object[] array = toArray();
        int i5 = zznx.zzd;
        return zznx.zzi(array, array.length);
    }

    public boolean zzq() {
        return false;
    }
}
