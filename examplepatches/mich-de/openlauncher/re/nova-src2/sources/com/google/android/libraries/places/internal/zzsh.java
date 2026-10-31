package com.google.android.libraries.places.internal;

import b.c0;
import java.io.IOException;
import java.math.RoundingMode;
import java.util.Objects;

/* loaded from: classes3.dex */
class zzsh extends zzsi {
    final zzsd zzb;
    final Character zzc;

    public zzsh(zzsd zzsdVar, Character ch) {
        this.zzb = zzsdVar;
        boolean z11 = true;
        if (ch != null && zzsdVar.zzd('=')) {
            z11 = false;
        }
        zzmt.zzj(z11, "Padding character %s was already in alphabet", ch);
        this.zzc = ch;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof zzsh) {
            zzsh zzshVar = (zzsh) obj;
            if (this.zzb.equals(zzshVar.zzb) && Objects.equals(this.zzc, zzshVar.zzc)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        Character ch = this.zzc;
        return Objects.hashCode(ch) ^ this.zzb.hashCode();
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BaseEncoding.");
        sb2.append(this.zzb);
        if (8 % this.zzb.zzb != 0) {
            if (this.zzc == null) {
                sb2.append(".omitPadding()");
            } else {
                sb2.append(".withPadChar('");
                sb2.append(this.zzc);
                sb2.append("')");
            }
        }
        return sb2.toString();
    }

    @Override // com.google.android.libraries.places.internal.zzsi
    public int zza(byte[] bArr, CharSequence charSequence) throws zzsg {
        zzsd zzsdVar;
        CharSequence charSequenceZzg = zzg(charSequence);
        if (!this.zzb.zzc(charSequenceZzg.length())) {
            throw new zzsg(c0.h(charSequenceZzg.length(), "Invalid input length "));
        }
        int i5 = 0;
        int i11 = 0;
        while (i5 < charSequenceZzg.length()) {
            long jZzb = 0;
            int i12 = 0;
            int i13 = 0;
            while (true) {
                zzsdVar = this.zzb;
                if (i12 >= zzsdVar.zzc) {
                    break;
                }
                jZzb <<= zzsdVar.zzb;
                if (i5 + i12 < charSequenceZzg.length()) {
                    jZzb |= this.zzb.zzb(charSequenceZzg.charAt(i13 + i5));
                    i13++;
                }
                i12++;
            }
            int i14 = zzsdVar.zzd;
            int i15 = i13 * zzsdVar.zzb;
            int i16 = (i14 - 1) * 8;
            while (i16 >= (i14 * 8) - i15) {
                bArr[i11] = (byte) ((jZzb >>> i16) & 255);
                i16 -= 8;
                i11++;
            }
            i5 += this.zzb.zzc;
        }
        return i11;
    }

    public zzsi zzb(zzsd zzsdVar, Character ch) {
        return new zzsh(zzsdVar, null);
    }

    @Override // com.google.android.libraries.places.internal.zzsi
    public void zzc(Appendable appendable, byte[] bArr, int i5, int i11) throws IOException {
        int i12 = 0;
        zzmt.zzn(0, i11, bArr.length);
        while (i12 < i11) {
            zzh(appendable, bArr, i12, Math.min(this.zzb.zzd, i11 - i12));
            i12 += this.zzb.zzd;
        }
    }

    @Override // com.google.android.libraries.places.internal.zzsi
    public final int zzd(int i5) {
        return (int) (((this.zzb.zzb * i5) + 7) / 8);
    }

    @Override // com.google.android.libraries.places.internal.zzsi
    public final int zze(int i5) {
        zzsd zzsdVar = this.zzb;
        return zzsdVar.zzc * zzajl.zza(i5, zzsdVar.zzd, RoundingMode.CEILING);
    }

    @Override // com.google.android.libraries.places.internal.zzsi
    public final zzsi zzf() {
        return this.zzc == null ? this : zzb(this.zzb, null);
    }

    @Override // com.google.android.libraries.places.internal.zzsi
    public final CharSequence zzg(CharSequence charSequence) {
        charSequence.getClass();
        if (this.zzc == null) {
            return charSequence;
        }
        int length = charSequence.length();
        do {
            length--;
            if (length < 0) {
                break;
            }
        } while (charSequence.charAt(length) == '=');
        return charSequence.subSequence(0, length + 1);
    }

    public final void zzh(Appendable appendable, byte[] bArr, int i5, int i11) throws IOException {
        zzmt.zzn(i5, i5 + i11, bArr.length);
        int i12 = 0;
        zzmt.zze(i11 <= this.zzb.zzd);
        long j11 = 0;
        for (int i13 = 0; i13 < i11; i13++) {
            j11 = (j11 | (bArr[i5 + i13] & 255)) << 8;
        }
        int i14 = (i11 + 1) * 8;
        zzsd zzsdVar = this.zzb;
        while (i12 < i11 * 8) {
            long j12 = j11 >>> ((i14 - zzsdVar.zzb) - i12);
            zzsd zzsdVar2 = this.zzb;
            appendable.append(zzsdVar2.zza(((int) j12) & zzsdVar2.zza));
            i12 += this.zzb.zzb;
        }
        if (this.zzc != null) {
            while (i12 < this.zzb.zzd * 8) {
                this.zzc.getClass();
                appendable.append('=');
                i12 += this.zzb.zzb;
            }
        }
    }

    public zzsh(String str, String str2, Character ch) {
        this(new zzsd(str, str2.toCharArray()), ch);
    }
}
