package com.google.android.libraries.places.internal;

import b.c0;
import java.io.EOFException;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
final class zzbsl extends zzbeg {
    private final zzbwb zza;

    public zzbsl(zzbwb zzbwbVar) {
        this.zza = zzbwbVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbeg, com.google.android.libraries.places.internal.zzbnv, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws EOFException {
        zzbwb zzbwbVar = this.zza;
        zzbwbVar.zzF(zzbwbVar.zzg());
    }

    @Override // com.google.android.libraries.places.internal.zzbnv
    public final int zze() {
        try {
            return this.zza.zzc() & 255;
        } catch (EOFException e3) {
            throw new IndexOutOfBoundsException(e3.getMessage());
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbnv
    public final int zzf() {
        return (int) this.zza.zzg();
    }

    @Override // com.google.android.libraries.places.internal.zzbnv
    public final zzbnv zzg(int i5) {
        zzbwb zzbwbVar = new zzbwb();
        zzbwbVar.zzn(this.zza, i5);
        return new zzbsl(zzbwbVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbnv
    public final void zzi(ByteBuffer byteBuffer) {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.android.libraries.places.internal.zzbnv
    public final void zzj(OutputStream outputStream, int i5) throws IOException {
        this.zza.zzr(outputStream, i5);
    }

    @Override // com.google.android.libraries.places.internal.zzbnv
    public final void zzk(byte[] bArr, int i5, int i11) {
        while (i11 > 0) {
            int iZzd = this.zza.zzd(bArr, i5, i11);
            if (iZzd == -1) {
                throw new IndexOutOfBoundsException(c0.i(i11, "EOF trying to read ", " bytes"));
            }
            i11 -= iZzd;
            i5 += iZzd;
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbnv
    public final void zzl(int i5) {
        try {
            this.zza.zzF(i5);
        } catch (EOFException e3) {
            throw new IndexOutOfBoundsException(e3.getMessage());
        }
    }
}
