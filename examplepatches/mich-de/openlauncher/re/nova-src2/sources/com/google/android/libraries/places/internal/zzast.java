package com.google.android.libraries.places.internal;

import java.io.IOException;

/* loaded from: classes3.dex */
final class zzast extends zzasx {
    private final byte[] zza;
    private final int zzb;
    private int zzc;

    public zzast(byte[] bArr, int i5, int i11) {
        super(null);
        if (bArr == null) {
            throw new NullPointerException("buffer");
        }
        int i12 = i5 + i11;
        int length = bArr.length;
        if ((i5 | i11 | (length - i12)) < 0) {
            throw new IllegalArgumentException(String.format("Array range is invalid. Buffer.length=%d, offset=%d, length=%d", Integer.valueOf(length), Integer.valueOf(i5), Integer.valueOf(i11)));
        }
        this.zza = bArr;
        this.zzc = i5;
        this.zzb = i12;
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzJ() {
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzK(byte b11) throws IOException {
        try {
            byte[] bArr = this.zza;
            int i5 = this.zzc;
            this.zzc = i5 + 1;
            bArr[i5] = b11;
        } catch (IndexOutOfBoundsException e3) {
            throw new zzasu(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.zzc), Integer.valueOf(this.zzb), 1), e3);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzL(int i5, boolean z11) throws IOException {
        zzu(i5 << 3);
        zzK(z11 ? (byte) 1 : (byte) 0);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzM(int i5, zzask zzaskVar) throws IOException {
        zzu((i5 << 3) | 2);
        zzu(zzaskVar.zzd());
        zzaskVar.zzh(this);
    }

    @Override // com.google.android.libraries.places.internal.zzasx, com.google.android.libraries.places.internal.zzarz
    public final void zza(byte[] bArr, int i5, int i11) throws IOException {
        zze(bArr, 0, i11);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final int zzb() {
        return this.zzb - this.zzc;
    }

    public final void zze(byte[] bArr, int i5, int i11) throws IOException {
        try {
            System.arraycopy(bArr, 0, this.zza, this.zzc, i11);
            this.zzc += i11;
        } catch (IndexOutOfBoundsException e3) {
            throw new zzasu(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.zzc), Integer.valueOf(this.zzb), Integer.valueOf(i11)), e3);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzh(int i5, int i11) throws IOException {
        zzu((i5 << 3) | 5);
        zzi(i11);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzi(int i5) throws IOException {
        try {
            byte[] bArr = this.zza;
            int i11 = this.zzc;
            int i12 = i11 + 1;
            this.zzc = i12;
            bArr[i11] = (byte) (i5 & 255);
            int i13 = i11 + 2;
            this.zzc = i13;
            bArr[i12] = (byte) ((i5 >> 8) & 255);
            int i14 = i11 + 3;
            this.zzc = i14;
            bArr[i13] = (byte) ((i5 >> 16) & 255);
            this.zzc = i11 + 4;
            bArr[i14] = (byte) ((i5 >> 24) & 255);
        } catch (IndexOutOfBoundsException e3) {
            throw new zzasu(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.zzc), Integer.valueOf(this.zzb), 1), e3);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzj(int i5, long j11) throws IOException {
        zzu((i5 << 3) | 1);
        zzk(j11);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzk(long j11) throws IOException {
        try {
            byte[] bArr = this.zza;
            int i5 = this.zzc;
            int i11 = i5 + 1;
            this.zzc = i11;
            bArr[i5] = (byte) (((int) j11) & 255);
            int i12 = i5 + 2;
            this.zzc = i12;
            bArr[i11] = (byte) (((int) (j11 >> 8)) & 255);
            int i13 = i5 + 3;
            this.zzc = i13;
            bArr[i12] = (byte) (((int) (j11 >> 16)) & 255);
            int i14 = i5 + 4;
            this.zzc = i14;
            bArr[i13] = (byte) (((int) (j11 >> 24)) & 255);
            int i15 = i5 + 5;
            this.zzc = i15;
            bArr[i14] = (byte) (((int) (j11 >> 32)) & 255);
            int i16 = i5 + 6;
            this.zzc = i16;
            bArr[i15] = (byte) (((int) (j11 >> 40)) & 255);
            int i17 = i5 + 7;
            this.zzc = i17;
            bArr[i16] = (byte) (((int) (j11 >> 48)) & 255);
            this.zzc = i5 + 8;
            bArr[i17] = (byte) (((int) (j11 >> 56)) & 255);
        } catch (IndexOutOfBoundsException e3) {
            throw new zzasu(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.zzc), Integer.valueOf(this.zzb), 1), e3);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzl(int i5, int i11) throws IOException {
        zzu(i5 << 3);
        zzm(i11);
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
        zzr(str);
    }

    public final void zzr(String str) throws IOException {
        int i5 = this.zzc;
        try {
            int iZzB = zzasx.zzB(str.length() * 3);
            int iZzB2 = zzasx.zzB(str.length());
            if (iZzB2 != iZzB) {
                zzu(zzaxc.zzc(str));
                byte[] bArr = this.zza;
                int i11 = this.zzc;
                this.zzc = zzaxc.zzb(str, bArr, i11, this.zzb - i11);
                return;
            }
            int i12 = i5 + iZzB2;
            this.zzc = i12;
            int iZzb = zzaxc.zzb(str, this.zza, i12, this.zzb - i12);
            this.zzc = i5;
            zzu((iZzb - i5) - iZzB2);
            this.zzc = iZzb;
        } catch (zzaxb e3) {
            this.zzc = i5;
            zzF(str, e3);
        } catch (IndexOutOfBoundsException e11) {
            throw new zzasu(e11);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzs(int i5, int i11) throws IOException {
        zzu((i5 << 3) | i11);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzt(int i5, int i11) throws IOException {
        zzu(i5 << 3);
        zzu(i11);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzu(int i5) throws IOException {
        while ((i5 & (-128)) != 0) {
            try {
                byte[] bArr = this.zza;
                int i11 = this.zzc;
                this.zzc = i11 + 1;
                bArr[i11] = (byte) ((i5 | 128) & 255);
                i5 >>>= 7;
            } catch (IndexOutOfBoundsException e3) {
                throw new zzasu(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.zzc), Integer.valueOf(this.zzb), 1), e3);
            }
        }
        byte[] bArr2 = this.zza;
        int i12 = this.zzc;
        this.zzc = i12 + 1;
        bArr2[i12] = (byte) i5;
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzv(int i5, long j11) throws IOException {
        zzu(i5 << 3);
        zzw(j11);
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final void zzw(long j11) throws IOException {
        if (!zzasx.zzb || this.zzb - this.zzc < 10) {
            while ((j11 & (-128)) != 0) {
                try {
                    byte[] bArr = this.zza;
                    int i5 = this.zzc;
                    this.zzc = i5 + 1;
                    bArr[i5] = (byte) ((((int) j11) | 128) & 255);
                    j11 >>>= 7;
                } catch (IndexOutOfBoundsException e3) {
                    throw new zzasu(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.zzc), Integer.valueOf(this.zzb), 1), e3);
                }
            }
            byte[] bArr2 = this.zza;
            int i11 = this.zzc;
            this.zzc = i11 + 1;
            bArr2[i11] = (byte) j11;
            return;
        }
        while (true) {
            int i12 = (int) j11;
            if ((j11 & (-128)) == 0) {
                byte[] bArr3 = this.zza;
                int i13 = this.zzc;
                this.zzc = i13 + 1;
                zzawx.zzn(bArr3, i13, (byte) i12);
                return;
            }
            byte[] bArr4 = this.zza;
            int i14 = this.zzc;
            this.zzc = i14 + 1;
            zzawx.zzn(bArr4, i14, (byte) ((i12 | 128) & 255));
            j11 >>>= 7;
        }
    }
}
