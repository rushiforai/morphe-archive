package com.google.android.libraries.places.internal;

import java.io.IOException;

/* loaded from: classes3.dex */
abstract class zzbrh implements Runnable {
    final /* synthetic */ zzbri zzc;

    @Override // java.lang.Runnable
    public final void run() throws IOException {
        try {
            if (this.zzc.zzh == null) {
                throw new IOException("Unable to perform write due to unavailable sink.");
            }
            zza();
        } catch (Exception e3) {
            this.zzc.zzd.zzb(e3);
        }
    }

    public abstract void zza() throws IOException;
}
