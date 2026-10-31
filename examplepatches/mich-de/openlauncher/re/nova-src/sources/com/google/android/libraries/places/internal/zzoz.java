package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public class zzoz extends zzpb {
    private final char[][] zza;
    private final int zzb;
    private final char zzc;

    public zzoz(zzpa zzpaVar, char c11, char c12) {
        char[][] cArrZzb = zzpaVar.zzb();
        this.zza = cArrZzb;
        this.zzb = cArrZzb.length;
        this.zzc = (char) 65535;
    }

    @Override // com.google.android.libraries.places.internal.zzpb, com.google.android.libraries.places.internal.zzpd
    public final String zza(String str) {
        str.getClass();
        for (int i5 = 0; i5 < str.length(); i5++) {
            char cCharAt = str.charAt(i5);
            if ((cCharAt < this.zzb && this.zza[cCharAt] != null) || cCharAt > this.zzc) {
                return zzc(str, i5);
            }
        }
        return str;
    }

    @Override // com.google.android.libraries.places.internal.zzpb
    public final char[] zzb(char c11) {
        char[] cArr;
        if (c11 >= this.zzb || (cArr = this.zza[c11]) == null) {
            return null;
        }
        return cArr;
    }
}
