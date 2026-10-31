package com.google.android.libraries.places.internal;

import java.io.Closeable;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
public interface zzbnv extends Closeable {
    @Override // java.io.Closeable, java.lang.AutoCloseable
    void close();

    void zzb();

    void zzc();

    boolean zzd();

    int zze();

    int zzf();

    zzbnv zzg(int i5);

    void zzi(ByteBuffer byteBuffer);

    void zzj(OutputStream outputStream, int i5) throws IOException;

    void zzk(byte[] bArr, int i5, int i11);

    void zzl(int i5);
}
