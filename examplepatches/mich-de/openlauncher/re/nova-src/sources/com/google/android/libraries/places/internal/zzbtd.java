package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzbtd {
    private final String[] zza;

    public /* synthetic */ zzbtd(zzbtb zzbtbVar, zzbtc zzbtcVar) {
        this.zza = (String[]) zzbtbVar.zza.toArray(new String[zzbtbVar.zza.size()]);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        int iZza = zza();
        for (int i5 = 0; i5 < iZza; i5++) {
            sb2.append(zzb(i5));
            sb2.append(": ");
            sb2.append(zzc(i5));
            sb2.append("\n");
        }
        return sb2.toString();
    }

    public final int zza() {
        return this.zza.length >> 1;
    }

    public final String zzb(int i5) {
        int i11 = i5 + i5;
        if (i11 < 0) {
            return null;
        }
        String[] strArr = this.zza;
        if (i11 >= strArr.length) {
            return null;
        }
        return strArr[i11];
    }

    public final String zzc(int i5) {
        int i11 = i5 + i5 + 1;
        if (i11 < 0) {
            return null;
        }
        String[] strArr = this.zza;
        if (i11 >= strArr.length) {
            return null;
        }
        return strArr[i11];
    }
}
