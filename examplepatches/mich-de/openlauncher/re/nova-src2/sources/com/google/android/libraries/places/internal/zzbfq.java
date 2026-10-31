package com.google.android.libraries.places.internal;

import java.nio.charset.Charset;
import java.util.concurrent.CancellationException;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
final class zzbfq extends zzayo {
    private static final Logger zza = Logger.getLogger(zzbfq.class.getName());
    private static final byte[] zzb = "gzip".getBytes(Charset.forName("US-ASCII"));
    private static final double zzc = TimeUnit.SECONDS.toNanos(1);
    private final zzbcl zzd;
    private final zzbvs zze;
    private final Executor zzf;
    private final boolean zzg;
    private final zzbfg zzh;
    private final zzazj zzi;
    private zzbfj zzj;
    private final boolean zzk;
    private zzayj zzl;
    private zzbfr zzm;
    private boolean zzn;
    private boolean zzo;
    private final zzbfp zzp;
    private final ScheduledExecutorService zzq;
    private zzazq zzr = zzazq.zzb();
    private zzazd zzs = zzazd.zza();

    public zzbfq(zzbcl zzbclVar, Executor executor, zzayj zzayjVar, zzbfp zzbfpVar, ScheduledExecutorService scheduledExecutorService, zzbfg zzbfgVar, zzbam zzbamVar) {
        this.zzd = zzbclVar;
        this.zze = zzbvr.zzc(zzbclVar.zzf(), System.identityHashCode(this));
        if (executor == zzakb.zza()) {
            this.zzf = new zzbpx();
            this.zzg = true;
        } else {
            this.zzf = new zzbqe(executor);
            this.zzg = false;
        }
        this.zzh = zzbfgVar;
        this.zzi = zzazj.zzb();
        this.zzk = zzbclVar.zzb() == zzbcj.UNARY || zzbclVar.zzb() == zzbcj.SERVER_STREAMING;
        this.zzl = zzayjVar;
        this.zzp = zzbfpVar;
        this.zzq = scheduledExecutorService;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final zzazn zzr() {
        zzazn zzaznVarZzi = this.zzl.zzi();
        if (zzaznVarZzi == null) {
            return null;
        }
        return zzaznVarZzi;
    }

    private final void zzs(Object obj) {
        zzmt.zzp(this.zzm != null, "Not started");
        zzmt.zzp(!this.zzn, "call was cancelled");
        zzmt.zzp(!this.zzo, "call was half-closed");
        try {
            zzbfr zzbfrVar = this.zzm;
            if (zzbfrVar instanceof zzbpo) {
                ((zzbpo) zzbfrVar).zzab(obj);
            } else {
                zzbfrVar.zzw(this.zzd.zzc(obj));
            }
            if (this.zzk) {
                return;
            }
            this.zzm.zzr();
        } catch (Error e3) {
            this.zzm.zzh(zzbdo.zzb.zzg("Client sendMessage() failed with Error"));
            throw e3;
        } catch (RuntimeException e11) {
            this.zzm.zzh(zzbdo.zzb.zzf(e11).zzg("Failed to stream message"));
        }
    }

    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzd("method", this.zzd);
        return zzmmVarZzb.toString();
    }

    @Override // com.google.android.libraries.places.internal.zzayo
    public final void zza(String str, Throwable th2) {
        int i5 = zzbvr.zza;
        if (str == null && th2 == null) {
            CancellationException cancellationException = new CancellationException("Cancelled without a message or cause");
            zza.logp(Level.WARNING, "io.grpc.internal.ClientCallImpl", "cancelInternal", "Cancelling without a message or cause is suboptimal", (Throwable) cancellationException);
            th2 = cancellationException;
        }
        if (this.zzn) {
            return;
        }
        this.zzn = true;
        try {
            if (this.zzm != null) {
                zzbdo zzbdoVar = zzbdo.zzb;
                zzbdo zzbdoVarZzg = str != null ? zzbdoVar.zzg(str) : zzbdoVar.zzg("Call cancelled without message");
                if (th2 != null) {
                    zzbdoVarZzg = zzbdoVarZzg.zzf(th2);
                }
                this.zzm.zzh(zzbdoVarZzg);
            }
            zzbfj zzbfjVar = this.zzj;
            if (zzbfjVar != null) {
                zzbfjVar.zzd();
            }
        } finally {
        }
    }

    @Override // com.google.android.libraries.places.internal.zzayo
    public final void zzb() {
        int i5 = zzbvr.zza;
        zzmt.zzp(this.zzm != null, "Not started");
        zzmt.zzp(!this.zzn, "call was cancelled");
        zzmt.zzp(!this.zzo, "call already half-closed");
        this.zzo = true;
        this.zzm.zzj();
    }

    @Override // com.google.android.libraries.places.internal.zzayo
    public final void zzc(int i5) {
        int i11 = zzbvr.zza;
        zzmt.zzp(this.zzm != null, "Not started");
        this.zzm.zzu(2);
    }

    @Override // com.google.android.libraries.places.internal.zzayo
    public final void zzd(Object obj) {
        int i5 = zzbvr.zza;
        zzs(obj);
    }

    @Override // com.google.android.libraries.places.internal.zzayo
    public final void zze(zzayn zzaynVar, zzbcf zzbcfVar) {
        int i5 = zzbvr.zza;
        zzmt.zzp(this.zzm == null, "Already started");
        zzmt.zzp(!this.zzn, "call was cancelled");
        zzbmg zzbmgVar = (zzbmg) this.zzl.zzl(zzbmg.zza);
        if (zzbmgVar != null) {
            Long l9 = zzbmgVar.zzb;
            if (l9 != null) {
                zzazn zzaznVarZzd = zzazn.zzd(l9.longValue(), TimeUnit.NANOSECONDS);
                zzazn zzaznVarZzi = this.zzl.zzi();
                if (zzaznVarZzi == null || zzaznVarZzd.compareTo(zzaznVarZzi) < 0) {
                    this.zzl = this.zzl.zza(zzaznVarZzd);
                }
            }
            Boolean bool = zzbmgVar.zzc;
            if (bool != null) {
                this.zzl = bool.booleanValue() ? this.zzl.zzg() : this.zzl.zzh();
            }
            if (zzbmgVar.zzd != null) {
                Integer numZzj = this.zzl.zzj();
                if (numZzj != null) {
                    this.zzl = this.zzl.zzc(Math.min(numZzj.intValue(), zzbmgVar.zzd.intValue()));
                } else {
                    this.zzl = this.zzl.zzc(zzbmgVar.zzd.intValue());
                }
            }
            if (zzbmgVar.zze != null) {
                Integer numZzk = this.zzl.zzk();
                if (numZzk != null) {
                    this.zzl = this.zzl.zzd(Math.min(numZzk.intValue(), zzbmgVar.zze.intValue()));
                } else {
                    this.zzl = this.zzl.zzd(zzbmgVar.zze.intValue());
                }
            }
        }
        zzazb zzazbVar = zzaza.zza;
        zzazq zzazqVar = this.zzr;
        zzbcfVar.zzd(zzbjd.zzg);
        zzbcfVar.zzd(zzbjd.zzc);
        zzbca zzbcaVar = zzbjd.zzd;
        zzbcfVar.zzd(zzbcaVar);
        byte[] bArrZza = zzban.zza(zzazqVar);
        if (bArrZza.length != 0) {
            zzbcfVar.zzf(zzbcaVar, bArrZza);
        }
        zzbcfVar.zzd(zzbjd.zze);
        zzbcfVar.zzd(zzbjd.zzf);
        zzazn zzaznVarZzr = zzr();
        boolean z11 = zzaznVarZzr != null && zzaznVarZzr.equals(null);
        zzbfj zzbfjVar = new zzbfj(this, zzaznVarZzr, z11);
        this.zzj = zzbfjVar;
        if (zzaznVarZzr == null || zzbfjVar.zzd > 0) {
            this.zzm = this.zzp.zza(this.zzd, this.zzl, zzbcfVar, this.zzi);
        } else {
            zzayx[] zzayxVarArrZzk = zzbjd.zzk(this.zzl, zzbcfVar, 0, false);
            String str = true != z11 ? "CallOptions" : "Context";
            Long l11 = (Long) this.zzl.zzl(zzayx.zza);
            double d5 = this.zzj.zzd;
            double d11 = zzc;
            this.zzm = new zzbil(zzbdo.zze.zzg(String.format("ClientCall started after %s deadline was exceeded %.9f seconds ago. Name resolution delay %.9f seconds.", str, Double.valueOf(d5 / d11), Double.valueOf(l11 == null ? 0.0d : l11.longValue() / d11))), zzbfs.PROCESSED, zzayxVarArrZzk);
        }
        if (this.zzg) {
            this.zzm.zzt();
        }
        if (this.zzl.zzj() != null) {
            this.zzm.zzm(this.zzl.zzj().intValue());
        }
        if (this.zzl.zzk() != null) {
            this.zzm.zzn(this.zzl.zzk().intValue());
        }
        if (zzaznVarZzr != null) {
            this.zzm.zzk(zzaznVarZzr);
        }
        this.zzm.zzv(zzazbVar);
        this.zzm.zzl(this.zzr);
        this.zzh.zzb();
        this.zzm.zzo(new zzbfo(this, zzaynVar));
        this.zzj.zzc();
    }

    public final zzbfq zzm(zzazd zzazdVar) {
        this.zzs = zzazdVar;
        return this;
    }

    public final zzbfq zzn(zzazq zzazqVar) {
        this.zzr = zzazqVar;
        return this;
    }
}
