package com.google.android.libraries.places.internal;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes3.dex */
final class zzasv extends zzass {
    private final OutputStream zzg;

    public zzasv(OutputStream outputStream, int i5) {
        super(i5);
        if (outputStream == null) {
            throw new NullPointerException("out");
        }
        this.zzg = outputStream;
    }

    private final void zzH() throws IOException {
        this.zzg.write(this.zza, 0, this.zzc);
        this.zzc = 0;
    }

    private final void zzI(int i5) throws IOException {
        if (this.zzb - this.zzc < i5) {
            zzH();
        }
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzJ() throws IOException {
        if (this.zzc > 0) {
            zzH();
        }
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzK(byte b11) throws IOException {
        if (this.zzc == this.zzb) {
            zzH();
        }
        zzc(b11);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzL(int i5, boolean z11) throws IOException {
        zzI(11);
        zzf(i5 << 3);
        zzc(z11 ? (byte) 1 : (byte) 0);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzM(int i5, zzask zzaskVar) throws IOException {
        zzu((i5 << 3) | 2);
        zzu(zzaskVar.zzd());
        zzaskVar.zzh(this);
    }

    @Override // com.google.android.libraries.places.internal.zzasx, com.google.android.libraries.places.internal.zzarz
    public final void zza(byte[] bArr, int i5, int i11) throws IOException {
        zzr(bArr, 0, i11);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzh(int i5, int i11) throws IOException {
        zzI(14);
        zzf((i5 << 3) | 5);
        zzd(i11);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzi(int i5) throws IOException {
        zzI(4);
        zzd(i5);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzj(int i5, long j11) throws IOException {
        zzI(18);
        zzf((i5 << 3) | 1);
        zze(j11);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzk(long j11) throws IOException {
        zzI(8);
        zze(j11);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzl(int i5, int i11) throws IOException {
        zzI(20);
        zzf(i5 << 3);
        if (i11 >= 0) {
            zzf(i11);
        } else {
            zzg(i11);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzm(int i5) throws IOException {
        if (i5 >= 0) {
            zzu(i5);
        } else {
            zzw(i5);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzn(int i5, zzavf zzavfVar, zzavt zzavtVar) throws IOException {
        zzu((i5 << 3) | 2);
        zzu(((zzart) zzavfVar).zzak(zzavtVar));
        zzavtVar.zzj(zzavfVar, this.zze);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzo(int i5, zzavf zzavfVar) throws IOException {
        zzu(11);
        zzt(2, i5);
        zzu(26);
        zzu(zzavfVar.zzaq());
        zzavfVar.zzaK(this);
        zzu(12);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzp(int i5, zzask zzaskVar) throws IOException {
        zzu(11);
        zzt(2, i5);
        zzM(3, zzaskVar);
        zzu(12);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzq(int i5, String str) throws IOException {
        zzu((i5 << 3) | 2);
        zzx(str);
    }

    public final void zzr(byte[] bArr, int i5, int i11) throws IOException {
        int i12 = this.zzb;
        int i13 = this.zzc;
        int i14 = i12 - i13;
        if (i14 >= i11) {
            System.arraycopy(bArr, 0, this.zza, i13, i11);
            this.zzc += i11;
            this.zzd += i11;
            return;
        }
        System.arraycopy(bArr, 0, this.zza, i13, i14);
        this.zzc = this.zzb;
        this.zzd += i14;
        zzH();
        int i15 = i11 - i14;
        if (i15 <= this.zzb) {
            System.arraycopy(bArr, i14, this.zza, 0, i15);
            this.zzc = i15;
        } else {
            this.zzg.write(bArr, i14, i15);
        }
        this.zzd += i15;
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzs(int i5, int i11) throws IOException {
        zzu((i5 << 3) | i11);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzt(int i5, int i11) throws IOException {
        zzI(20);
        zzf(i5 << 3);
        zzf(i11);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzu(int i5) throws IOException {
        zzI(5);
        zzf(i5);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzv(int i5, long j11) throws IOException {
        zzI(20);
        zzf(i5 << 3);
        zzg(j11);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzw(long j11) throws IOException {
        zzI(10);
        zzg(j11);
    }

    public final void zzx(String str) throws IOException {
        int iZzc;
        try {
            int length = str.length() * 3;
            int iZzB = zzasx.zzB(length);
            int i5 = iZzB + length;
            int i11 = this.zzb;
            if (i5 > i11) {
                byte[] bArr = new byte[length];
                int iZzb = zzaxc.zzb(str, bArr, 0, length);
                zzu(iZzb);
                zzr(bArr, 0, iZzb);
                return;
            }
            if (i5 > i11 - this.zzc) {
                zzH();
            }
            int iZzB2 = zzasx.zzB(str.length());
            int i12 = this.zzc;
            try {
                if (iZzB2 == iZzB) {
                    int i13 = i12 + iZzB2;
                    this.zzc = i13;
                    int iZzb2 = zzaxc.zzb(str, this.zza, i13, this.zzb - i13);
                    this.zzc = i12;
                    iZzc = (iZzb2 - i12) - iZzB2;
                    zzf(iZzc);
                    this.zzc = iZzb2;
                } else {
                    iZzc = zzaxc.zzc(str);
                    zzf(iZzc);
                    this.zzc = zzaxc.zzb(str, this.zza, this.zzc, iZzc);
                }
                this.zzd += iZzc;
            } catch (zzaxb e3) {
                this.zzd -= this.zzc - i12;
                this.zzc = i12;
                throw e3;
            } catch (ArrayIndexOutOfBoundsException e11) {
                throw new zzasu(e11);
            }
        } catch (zzaxb e12) {
            zzF(str, e12);
        }
    }
}
