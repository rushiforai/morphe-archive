package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public abstract class zzbeg implements zzbnv {
    @Override // com.google.android.libraries.places.internal.zzbnv, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
    }

    public final void zza(int i5) {
        if (zzf() < i5) {
            throw new IndexOutOfBoundsException();
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbnv
    public void zzb() {
    }

    @Override // com.google.android.libraries.places.internal.zzbnv
    public void zzc() {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.android.libraries.places.internal.zzbnv
    public boolean zzd() {
        return false;
    }
}
