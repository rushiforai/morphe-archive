package com.google.android.libraries.places.internal;

import java.util.Comparator;

/* loaded from: classes3.dex */
final class zzrh implements Comparator {
    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        zzro zzroVarZza = zzro.zza(obj);
        zzro zzroVarZza2 = zzro.zza(obj2);
        if (zzroVarZza != zzroVarZza2) {
            return zzroVarZza.compareTo(zzroVarZza2);
        }
        int iOrdinal = zzroVarZza.ordinal();
        if (iOrdinal == 0) {
            return ((Boolean) obj).compareTo((Boolean) obj2);
        }
        if (iOrdinal == 1) {
            return ((String) obj).compareTo((String) obj2);
        }
        if (iOrdinal == 2) {
            return ((Long) obj).compareTo((Long) obj2);
        }
        if (iOrdinal == 3) {
            return ((Double) obj).compareTo((Double) obj2);
        }
        throw null;
    }
}
