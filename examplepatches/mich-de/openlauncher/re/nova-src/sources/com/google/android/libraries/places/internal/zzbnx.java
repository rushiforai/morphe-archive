package com.google.android.libraries.places.internal;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.InvalidMarkException;

/* loaded from: classes3.dex */
final class zzbnx extends zzbeg {
    int zza;
    final int zzb;
    final byte[] zzc;
    int zzd = -1;

    public zzbnx(byte[] bArr, int i5, int i11) {
        zzmt.zzf(i5 >= 0, "offset must be >= 0");
        zzmt.zzf(i11 >= 0, "length must be >= 0");
        int i12 = i11 + i5;
        zzmt.zzf(i12 <= 0, "offset + length exceeds array boundary");
        this.zzc = bArr;
        this.zza = i5;
        this.zzb = i12;
    }

    @Override // com.google.android.libraries.places.internal.zzbeg, com.google.android.libraries.places.internal.zzbnv
    public final void zzb() {
        this.zzd = this.zza;
    }

    @Override // com.google.android.libraries.places.internal.zzbeg, com.google.android.libraries.places.internal.zzbnv
    public final void zzc() {
        int i5 = this.zzd;
        if (i5 == -1) {
            throw new InvalidMarkException();
        }
        this.zza = i5;
    }

    @Override // com.google.android.libraries.places.internal.zzbeg, com.google.android.libraries.places.internal.zzbnv
    public final boolean zzd() {
        return true;
    }

    @Override // com.google.android.libraries.places.internal.zzbnv
    public final int zze() {
        zza(1);
        int i5 = this.zza;
        this.zza = i5 + 1;
        return this.zzc[i5] & 255;
    }

    @Override // com.google.android.libraries.places.internal.zzbnv
    public final int zzf() {
        return this.zzb - this.zza;
    }

    @Override // com.google.android.libraries.places.internal.zzbnv
    public final /* bridge */ /* synthetic */ zzbnv zzg(int i5) {
        zza(i5);
        int i11 = this.zza;
        this.zza = i11 + i5;
        return new zzbnx(this.zzc, i11, i5);
    }

    @Override // com.google.android.libraries.places.internal.zzbnv
    public final void zzi(ByteBuffer byteBuffer) {
        zzmt.zzc(byteBuffer, "dest");
        int iRemaining = byteBuffer.remaining();
        zza(iRemaining);
        byteBuffer.put(this.zzc, this.zza, iRemaining);
        this.zza += iRemaining;
    }

    @Override // com.google.android.libraries.places.internal.zzbnv
    public final void zzj(OutputStream outputStream, int i5) throws IOException {
        zza(i5);
        outputStream.write(this.zzc, this.zza, i5);
        this.zza += i5;
    }

    @Override // com.google.android.libraries.places.internal.zzbnv
    public final void zzk(byte[] bArr, int i5, int i11) {
        System.arraycopy(this.zzc, this.zza, bArr, i5, i11);
        this.zza += i11;
    }

    @Override // com.google.android.libraries.places.internal.zzbnv
    public final void zzl(int i5) {
        zza(i5);
        this.zza += i5;
    }
}
