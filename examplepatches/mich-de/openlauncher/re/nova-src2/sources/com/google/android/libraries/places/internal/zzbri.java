package com.google.android.libraries.places.internal;

import java.io.IOException;
import java.net.Socket;

/* loaded from: classes3.dex */
final class zzbri implements zzbwq {
    private final zzbqe zzc;
    private final zzbrj zzd;
    private zzbwq zzh;
    private Socket zzi;
    private boolean zzj;
    private int zzk;
    private int zzl;
    private final Object zza = new Object();
    private final zzbwb zzb = new zzbwb();
    private boolean zze = false;
    private boolean zzf = false;
    private boolean zzg = false;

    private zzbri(zzbqe zzbqeVar, zzbrj zzbrjVar, int i5) {
        zzmt.zzc(zzbqeVar, "executor");
        this.zzc = zzbqeVar;
        this.zzd = zzbrjVar;
    }

    public static zzbri zzc(zzbqe zzbqeVar, zzbrj zzbrjVar, int i5) {
        return new zzbri(zzbqeVar, zzbrjVar, 10000);
    }

    @Override // com.google.android.libraries.places.internal.zzbwq, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        if (this.zzg) {
            return;
        }
        this.zzg = true;
        this.zzc.execute(new zzbre(this));
    }

    @Override // com.google.android.libraries.places.internal.zzbwq, java.io.Flushable
    public final void flush() throws IOException {
        if (this.zzg) {
            throw new IOException("closed");
        }
        int i5 = zzbvr.zza;
        synchronized (this.zza) {
            try {
                if (this.zzf) {
                    return;
                }
                this.zzf = true;
                this.zzc.execute(new zzbrd(this));
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void zzm(zzbwq zzbwqVar, Socket socket) {
        zzmt.zzp(this.zzh == null, "AsyncSink's becomeConnected should only be called once.");
        this.zzh = zzbwqVar;
        zzmt.zzc(socket, "socket");
        this.zzi = socket;
    }

    @Override // com.google.android.libraries.places.internal.zzbwq
    public final void zzn(zzbwb zzbwbVar, long j11) throws IOException {
        if (this.zzg) {
            throw new IOException("closed");
        }
        int i5 = zzbvr.zza;
        synchronized (this.zza) {
            try {
                this.zzb.zzn(zzbwbVar, j11);
                int i11 = this.zzl + this.zzk;
                this.zzl = i11;
                boolean z11 = false;
                this.zzk = 0;
                if (this.zzj || i11 <= 10000) {
                    if (!this.zze && !this.zzf && this.zzb.zzf() > 0) {
                        this.zze = true;
                    }
                    return;
                }
                this.zzj = true;
                z11 = true;
                if (!z11) {
                    this.zzc.execute(new zzbrc(this));
                    return;
                }
                try {
                    this.zzi.close();
                } catch (IOException e3) {
                    this.zzd.zzb(e3);
                }
            } finally {
            }
        }
    }
}
