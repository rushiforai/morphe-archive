package com.google.android.libraries.places.internal;

import b.c0;
import java.io.IOException;

/* loaded from: classes3.dex */
final class zzsf extends zzsh {
    private zzsf(zzsd zzsdVar, Character ch) {
        super(zzsdVar, ch);
        zzmt.zze(zzsdVar.zzf.length == 64);
    }

    @Override // com.google.android.libraries.places.internal.zzsh, com.google.android.libraries.places.internal.zzsi
    public final int zza(byte[] bArr, CharSequence charSequence) throws zzsg {
        CharSequence charSequenceZzg = zzg(charSequence);
        if (!this.zzb.zzc(charSequenceZzg.length())) {
            throw new zzsg(c0.h(charSequenceZzg.length(), "Invalid input length "));
        }
        int i5 = 0;
        int i11 = 0;
        while (i5 < charSequenceZzg.length()) {
            int i12 = i11 + 1;
            int iZzb = (this.zzb.zzb(charSequenceZzg.charAt(i5)) << 18) | (this.zzb.zzb(charSequenceZzg.charAt(i5 + 1)) << 12);
            bArr[i11] = (byte) (iZzb >>> 16);
            int i13 = i5 + 2;
            if (i13 < charSequenceZzg.length()) {
                int i14 = i5 + 3;
                int iZzb2 = iZzb | (this.zzb.zzb(charSequenceZzg.charAt(i13)) << 6);
                int i15 = i11 + 2;
                bArr[i12] = (byte) ((iZzb2 >>> 8) & 255);
                if (i14 < charSequenceZzg.length()) {
                    i5 += 4;
                    i11 += 3;
                    bArr[i15] = (byte) ((iZzb2 | this.zzb.zzb(charSequenceZzg.charAt(i14))) & 255);
                } else {
                    i11 = i15;
                    i5 = i14;
                }
            } else {
                i5 = i13;
                i11 = i12;
            }
        }
        return i11;
    }

    @Override // com.google.android.libraries.places.internal.zzsh
    public final zzsi zzb(zzsd zzsdVar, Character ch) {
        return new zzsf(zzsdVar, null);
    }

    @Override // com.google.android.libraries.places.internal.zzsh, com.google.android.libraries.places.internal.zzsi
    public final void zzc(Appendable appendable, byte[] bArr, int i5, int i11) throws IOException {
        int i12 = 0;
        zzmt.zzn(0, i11, bArr.length);
        for (int i13 = i11; i13 >= 3; i13 -= 3) {
            int i14 = bArr[i12] & 255;
            int i15 = ((bArr[i12 + 1] & 255) << 8) | (i14 << 16) | (bArr[i12 + 2] & 255);
            appendable.append(this.zzb.zza(i15 >>> 18));
            appendable.append(this.zzb.zza((i15 >>> 12) & 63));
            appendable.append(this.zzb.zza((i15 >>> 6) & 63));
            appendable.append(this.zzb.zza(i15 & 63));
            i12 += 3;
        }
        if (i12 < i11) {
            zzh(appendable, bArr, i12, i11 - i12);
        }
    }

    public zzsf(String str, String str2, Character ch) {
        this(new zzsd(str, str2.toCharArray()), ch);
    }
}
