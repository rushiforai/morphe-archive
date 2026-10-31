package com.google.android.libraries.places.internal;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes3.dex */
final class zzbnw extends InputStream implements zzbav {
    private final zzbnv zza;

    public zzbnw(zzbnv zzbnvVar) {
        zzmt.zzc(zzbnvVar, "buffer");
        this.zza = zzbnvVar;
    }

    @Override // java.io.InputStream
    public final int available() throws IOException {
        return this.zza.zzf();
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.zza.close();
    }

    @Override // java.io.InputStream
    public final void mark(int i5) {
        this.zza.zzb();
    }

    @Override // java.io.InputStream
    public final boolean markSupported() {
        return this.zza.zzd();
    }

    @Override // java.io.InputStream
    public final int read() {
        if (this.zza.zzf() == 0) {
            return -1;
        }
        return this.zza.zze();
    }

    @Override // java.io.InputStream
    public final void reset() throws IOException {
        this.zza.zzc();
    }

    @Override // java.io.InputStream
    public final long skip(long j11) throws IOException {
        int iMin = (int) Math.min(this.zza.zzf(), j11);
        this.zza.zzl(iMin);
        return iMin;
    }

    @Override // java.io.InputStream
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        if (this.zza.zzf() == 0) {
            return -1;
        }
        int iMin = Math.min(this.zza.zzf(), i11);
        this.zza.zzk(bArr, i5, iMin);
        return iMin;
    }
}
