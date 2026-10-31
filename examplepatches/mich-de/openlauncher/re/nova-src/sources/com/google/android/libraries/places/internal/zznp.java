package com.google.android.libraries.places.internal;

import java.io.Serializable;

/* loaded from: classes3.dex */
abstract class zznp implements Comparable, Serializable {
    final Comparable zza;

    public zznp(Comparable comparable) {
        this.zza = comparable;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof zznp) {
            try {
                if (compareTo((zznp) obj) == 0) {
                    return true;
                }
            } catch (ClassCastException unused) {
            }
        }
        return false;
    }

    public abstract int hashCode();

    @Override // java.lang.Comparable
    /* renamed from: zza */
    public int compareTo(zznp zznpVar) {
        if (zznpVar != zznn.zzb) {
            if (zznpVar == zznl.zzb) {
                return -1;
            }
            Comparable comparable = this.zza;
            Comparable comparable2 = zznpVar.zza;
            int i5 = zzok.zzc;
            int iCompareTo = comparable.compareTo(comparable2);
            if (iCompareTo != 0) {
                return iCompareTo;
            }
            boolean z11 = this instanceof zznm;
            if (z11 == (zznpVar instanceof zznm)) {
                return 0;
            }
            if (!z11) {
                return -1;
            }
        }
        return 1;
    }

    public abstract void zzc(StringBuilder sb2);

    public abstract void zzd(StringBuilder sb2);

    public abstract boolean zze(Comparable comparable);
}
