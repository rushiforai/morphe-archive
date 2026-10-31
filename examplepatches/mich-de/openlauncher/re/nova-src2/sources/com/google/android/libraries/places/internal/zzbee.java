package com.google.android.libraries.places.internal;

import java.util.logging.Level;

/* loaded from: classes3.dex */
public abstract class zzbee extends zzbei {
    private final zzbqo zza;
    private boolean zzb;
    private zzbft zzc;
    private zzazq zzd;
    private boolean zze;
    private Runnable zzf;
    private volatile boolean zzg;
    private boolean zzh;
    private boolean zzi;

    public zzbee(int i5, zzbqo zzbqoVar, zzbqz zzbqzVar, zzayj zzayjVar) {
        super(i5, zzbqoVar, zzbqzVar);
        this.zzd = zzazq.zzb();
        this.zze = false;
        this.zza = zzbqoVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzA(zzbdo zzbdoVar, zzbfs zzbfsVar, zzbcf zzbcfVar) {
        if (this.zzb) {
            return;
        }
        this.zzb = true;
        this.zza.zzm(zzbdoVar);
        zzm().zze(zzbdoVar.zzl());
        this.zzc.zzd(zzbdoVar, zzbfsVar, zzbcfVar);
    }

    public static /* bridge */ /* synthetic */ void zzc(zzbee zzbeeVar, zzazq zzazqVar) {
        zzmt.zzp(zzbeeVar.zzc == null, "Already called start");
        zzmt.zzc(zzazqVar, "decompressorRegistry");
        zzbeeVar.zzd = zzazqVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbei
    public final /* synthetic */ zzbqr zza() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.internal.zzbmm
    public void zze(boolean z11) {
        zzmt.zzp(this.zzh, "status should have been reported on deframer closed");
        this.zze = true;
        if (this.zzi && z11) {
            zzj(zzbdo.zzo.zzg("Encountered end-of-stream mid-frame"), zzbfs.PROCESSED, true, new zzbcf());
        }
        Runnable runnable = this.zzf;
        if (runnable != null) {
            runnable.run();
            this.zzf = null;
        }
    }

    public final void zzf(zzbnv zzbnvVar) throws Throwable {
        boolean z11 = true;
        try {
            if (this.zzh) {
                zzbef.zza.logp(Level.INFO, "io.grpc.internal.AbstractClientStream$TransportState", "inboundDataReceived", "Received data on closed stream");
                zzbnvVar.close();
                return;
            }
            try {
                zzq(zzbnvVar);
            } catch (Throwable th2) {
                th = th2;
                z11 = false;
                if (z11) {
                    zzbnvVar.close();
                }
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
        }
    }

    public final void zzg(zzbcf zzbcfVar) {
        zzmt.zzp(!this.zzh, "Received headers on closed stream");
        this.zza.zzb();
        String str = (String) zzbcfVar.zzb(zzbjd.zzc);
        if (str != null) {
            zzazo zzazoVarZza = this.zzd.zza(str);
            if (zzazoVarZza == null) {
                zzF(new zzbdq(zzbdo.zzo.zzg("Can't find decompressor for ".concat(str)), null));
                return;
            } else if (zzazoVarZza != zzaza.zza) {
                zzw(zzazoVarZza);
            }
        }
        this.zzc.zze(zzbcfVar);
    }

    public final void zzh(zzbcf zzbcfVar, zzbdo zzbdoVar) {
        if (this.zzh) {
            zzbef.zza.logp(Level.INFO, "io.grpc.internal.AbstractClientStream$TransportState", "inboundTrailersReceived", "Received trailers on closed stream:\n {1}\n {2}", new Object[]{zzbdoVar, zzbcfVar});
        } else {
            this.zza.zzc(zzbcfVar);
            zzj(zzbdoVar, zzbfs.PROCESSED, false, zzbcfVar);
        }
    }

    public final void zzi(zzbft zzbftVar) {
        zzmt.zzp(this.zzc == null, "Already called setListener");
        this.zzc = zzbftVar;
    }

    public final void zzj(zzbdo zzbdoVar, zzbfs zzbfsVar, boolean z11, zzbcf zzbcfVar) {
        zzmt.zzc(zzbdoVar, "status");
        zzmt.zzc(zzbcfVar, "trailers");
        if (this.zzh) {
            if (!z11) {
                return;
            } else {
                z11 = true;
            }
        }
        this.zzh = true;
        this.zzi = zzbdoVar.zzl();
        zzu();
        if (this.zze) {
            this.zzf = null;
            zzA(zzbdoVar, zzbfsVar, zzbcfVar);
        } else {
            this.zzf = new zzbed(this, zzbdoVar, zzbfsVar, zzbcfVar);
            zzp(z11);
        }
    }

    public final boolean zzk() {
        return this.zzg;
    }
}
