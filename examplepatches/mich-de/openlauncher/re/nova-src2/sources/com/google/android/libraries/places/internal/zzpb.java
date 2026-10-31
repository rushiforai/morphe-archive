package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public abstract class zzpb extends zzpd {
    private static char[] zzd(char[] cArr, int i5, int i11) {
        if (i11 < 0) {
            throw new AssertionError("Cannot increase internal buffer any further");
        }
        char[] cArr2 = new char[i11];
        if (i5 > 0) {
            System.arraycopy(cArr, 0, cArr2, 0, i5);
        }
        return cArr2;
    }

    @Override // com.google.android.libraries.places.internal.zzpd
    public String zza(String str) {
        throw null;
    }

    public abstract char[] zzb(char c11);

    public final String zzc(String str, int i5) {
        int length;
        char[] cArrZza = zzpk.zza();
        int length2 = cArrZza.length;
        int i11 = 0;
        int i12 = 0;
        while (true) {
            length = str.length();
            if (i5 >= length) {
                break;
            }
            int i13 = i5 + 1;
            char[] cArrZzb = zzb(str.charAt(i5));
            if (cArrZzb != null) {
                int i14 = i5 - i11;
                int i15 = i12 + i14;
                int length3 = cArrZzb.length;
                int i16 = i15 + length3;
                if (length2 < i16) {
                    int i17 = length - i5;
                    length2 = i17 + i17 + i16;
                    cArrZza = zzd(cArrZza, i12, length2);
                }
                if (i14 > 0) {
                    str.getChars(i11, i5, cArrZza, i12);
                    i12 = i15;
                }
                if (length3 > 0) {
                    System.arraycopy(cArrZzb, 0, cArrZza, i12, length3);
                    i12 += length3;
                }
                i11 = i13;
            }
            i5 = i13;
        }
        int i18 = length - i11;
        if (i18 > 0) {
            int i19 = i18 + i12;
            if (length2 < i19) {
                cArrZza = zzd(cArrZza, i12, i19);
            }
            str.getChars(i11, length, cArrZza, i12);
            i12 = i19;
        }
        return new String(cArrZza, 0, i12);
    }
}
