package com.google.android.libraries.places.internal;

import java.util.Comparator;

/* loaded from: classes3.dex */
final class zzasb implements Comparator {
    @Override // java.util.Comparator
    public final /* synthetic */ int compare(Object obj, Object obj2) {
        zzask zzaskVar = (zzask) obj;
        zzask zzaskVar2 = (zzask) obj2;
        zzasa zzasaVar = new zzasa(zzaskVar);
        zzasa zzasaVar2 = new zzasa(zzaskVar2);
        while (zzasaVar.hasNext() && zzasaVar2.hasNext()) {
            int iCompareTo = Integer.valueOf(zzasaVar.zza() & 255).compareTo(Integer.valueOf(zzasaVar2.zza() & 255));
            if (iCompareTo != 0) {
                return iCompareTo;
            }
        }
        return Integer.valueOf(zzaskVar.zzd()).compareTo(Integer.valueOf(zzaskVar2.zzd()));
    }
}
