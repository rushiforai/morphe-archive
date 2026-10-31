package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
abstract class zzass extends zzasx {
    final byte[] zza;
    final int zzb;
    int zzc;
    int zzd;

    public zzass(int i5) {
        super(null);
        if (i5 < 0) {
            throw new IllegalArgumentException("bufferSize must be >= 0");
        }
        byte[] bArr = new byte[Math.max(i5, 20)];
        this.zza = bArr;
        this.zzb = bArr.length;
    }

    @Override // com.google.android.libraries.places.internal.zzasx
    public final int zzb() {
        throw new UnsupportedOperationException("spaceLeft() can only be called on CodedOutputStreams that are writing to a flat array or ByteBuffer.");
    }

    public final void zzc(byte b11) {
        int i5 = this.zzc;
        this.zzc = i5 + 1;
        this.zza[i5] = b11;
        this.zzd++;
    }

    public final void zzd(int i5) {
        int i11 = this.zzc;
        int i12 = i11 + 1;
        this.zzc = i12;
        byte[] bArr = this.zza;
        bArr[i11] = (byte) (i5 & 255);
        int i13 = i11 + 2;
        this.zzc = i13;
        bArr[i12] = (byte) ((i5 >> 8) & 255);
        int i14 = i11 + 3;
        this.zzc = i14;
        bArr[i13] = (byte) ((i5 >> 16) & 255);
        this.zzc = i11 + 4;
        bArr[i14] = (byte) ((i5 >> 24) & 255);
        this.zzd += 4;
    }

    public final void zze(long j11) {
        int i5 = this.zzc;
        int i11 = i5 + 1;
        this.zzc = i11;
        byte[] bArr = this.zza;
        bArr[i5] = (byte) (j11 & 255);
        int i12 = i5 + 2;
        this.zzc = i12;
        bArr[i11] = (byte) ((j11 >> 8) & 255);
        int i13 = i5 + 3;
        this.zzc = i13;
        bArr[i12] = (byte) ((j11 >> 16) & 255);
        int i14 = i5 + 4;
        this.zzc = i14;
        bArr[i13] = (byte) (255 & (j11 >> 24));
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
        this.zzd += 8;
    }

    public final void zzf(int i5) {
        if (!zzasx.zzb) {
            while ((i5 & (-128)) != 0) {
                byte[] bArr = this.zza;
                int i11 = this.zzc;
                this.zzc = i11 + 1;
                bArr[i11] = (byte) ((i5 | 128) & 255);
                this.zzd++;
                i5 >>>= 7;
            }
            byte[] bArr2 = this.zza;
            int i12 = this.zzc;
            this.zzc = i12 + 1;
            bArr2[i12] = (byte) i5;
            this.zzd++;
            return;
        }
        long j11 = this.zzc;
        while ((i5 & (-128)) != 0) {
            byte[] bArr3 = this.zza;
            int i13 = this.zzc;
            this.zzc = i13 + 1;
            zzawx.zzn(bArr3, i13, (byte) ((i5 | 128) & 255));
            i5 >>>= 7;
        }
        byte[] bArr4 = this.zza;
        int i14 = this.zzc;
        this.zzc = i14 + 1;
        zzawx.zzn(bArr4, i14, (byte) i5);
        this.zzd += (int) (this.zzc - j11);
    }

    public final void zzg(long j11) {
        if (zzasx.zzb) {
            long j12 = this.zzc;
            while (true) {
                int i5 = (int) j11;
                if ((j11 & (-128)) == 0) {
                    byte[] bArr = this.zza;
                    int i11 = this.zzc;
                    this.zzc = i11 + 1;
                    zzawx.zzn(bArr, i11, (byte) i5);
                    this.zzd += (int) (this.zzc - j12);
                    return;
                }
                byte[] bArr2 = this.zza;
                int i12 = this.zzc;
                this.zzc = i12 + 1;
                zzawx.zzn(bArr2, i12, (byte) ((i5 | 128) & 255));
                j11 >>>= 7;
            }
        } else {
            while (true) {
                int i13 = (int) j11;
                if ((j11 & (-128)) == 0) {
                    byte[] bArr3 = this.zza;
                    int i14 = this.zzc;
                    this.zzc = i14 + 1;
                    bArr3[i14] = (byte) i13;
                    this.zzd++;
                    return;
                }
                byte[] bArr4 = this.zza;
                int i15 = this.zzc;
                this.zzc = i15 + 1;
                bArr4[i15] = (byte) ((i13 | 128) & 255);
                this.zzd++;
                j11 >>>= 7;
            }
        }
    }
}
