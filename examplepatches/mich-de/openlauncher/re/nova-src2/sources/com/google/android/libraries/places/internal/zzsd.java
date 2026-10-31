package com.google.android.libraries.places.internal;

import b.c0;
import java.math.RoundingMode;
import java.util.Arrays;

/* loaded from: classes3.dex */
final class zzsd {
    final int zza;
    final int zzb;
    final int zzc;
    final int zzd;
    private final String zze;
    private final char[] zzf;
    private final byte[] zzg;
    private final boolean[] zzh;
    private final boolean zzi;

    /* JADX WARN: Illegal instructions before constructor call */
    public zzsd(String str, char[] cArr) {
        byte[] bArr = new byte[128];
        Arrays.fill(bArr, (byte) -1);
        for (int i5 = 0; i5 < cArr.length; i5++) {
            char c11 = cArr[i5];
            boolean z11 = true;
            zzmt.zzg(c11 < 128, "Non-ASCII character: %s", c11);
            if (bArr[c11] != -1) {
                z11 = false;
            }
            zzmt.zzg(z11, "Duplicate character: %s", c11);
            bArr[c11] = (byte) i5;
        }
        this(str, cArr, bArr, false);
    }

    public final boolean equals(Object obj) {
        return (obj instanceof zzsd) && Arrays.equals(this.zzf, ((zzsd) obj).zzf);
    }

    public final int hashCode() {
        return Arrays.hashCode(this.zzf) + 1237;
    }

    public final String toString() {
        return this.zze;
    }

    public final char zza(int i5) {
        return this.zzf[i5];
    }

    public final int zzb(char c11) throws zzsg {
        if (c11 > 127) {
            throw new zzsg("Unrecognized character: 0x".concat(String.valueOf(Integer.toHexString(c11))));
        }
        byte b11 = this.zzg[c11];
        if (b11 != -1) {
            return b11;
        }
        if (c11 <= ' ' || c11 == 127) {
            throw new zzsg("Unrecognized character: 0x".concat(String.valueOf(Integer.toHexString(c11))));
        }
        throw new zzsg("Unrecognized character: " + c11);
    }

    public final boolean zzc(int i5) {
        return this.zzh[i5 % this.zzc];
    }

    public final boolean zzd(char c11) {
        return this.zzg[61] != -1;
    }

    private zzsd(String str, char[] cArr, byte[] bArr, boolean z11) {
        this.zze = str;
        cArr.getClass();
        this.zzf = cArr;
        try {
            int length = cArr.length;
            int iZzb = zzajl.zzb(length, RoundingMode.UNNECESSARY);
            this.zzb = iZzb;
            int iNumberOfTrailingZeros = Integer.numberOfTrailingZeros(iZzb);
            int i5 = 1 << (3 - iNumberOfTrailingZeros);
            this.zzc = i5;
            this.zzd = iZzb >> iNumberOfTrailingZeros;
            this.zza = length - 1;
            this.zzg = bArr;
            boolean[] zArr = new boolean[i5];
            for (int i11 = 0; i11 < this.zzd; i11++) {
                zArr[zzajl.zza(i11 * 8, this.zzb, RoundingMode.CEILING)] = true;
            }
            this.zzh = zArr;
            this.zzi = false;
        } catch (ArithmeticException e3) {
            throw new IllegalArgumentException(c0.h(cArr.length, "Illegal alphabet length "), e3);
        }
    }
}
