package com.google.android.libraries.places.internal;

import b.c0;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
final class zzbse implements Runnable, zzbtq {
    final zzbtr zza;
    final /* synthetic */ zzbsf zzc;
    private final zzbsi zzd = new zzbsi(Level.FINE, zzbsf.class);
    boolean zzb = true;

    public zzbse(zzbsf zzbsfVar, zzbtr zzbtrVar) {
        this.zzc = zzbsfVar;
        this.zza = zzbtrVar;
    }

    @Override // java.lang.Runnable
    public final void run() throws IOException {
        zzbdo zzbdoVarZzg;
        String name = Thread.currentThread().getName();
        Thread.currentThread().setName("OkHttpClientTransport");
        while (this.zza.zza(this)) {
            try {
                zzbsf zzbsfVar = this.zzc;
                if (zzbsfVar.zzK != null) {
                    zzbsfVar.zzK.zza();
                }
            } catch (Throwable th2) {
                try {
                    this.zzc.zzaa(0, zzbtp.PROTOCOL_ERROR, zzbdo.zzo.zzg("error in frame handler").zzf(th2));
                } catch (Throwable th3) {
                    try {
                        this.zza.close();
                    } catch (IOException e3) {
                        zzbsf.zzd.logp(Level.INFO, "io.grpc.okhttp.OkHttpClientTransport$ClientFrameHandler", "run", "Exception closing frame reader", (Throwable) e3);
                    } catch (RuntimeException e11) {
                        if (!"bio == null".equals(e11.getMessage())) {
                            throw e11;
                        }
                    }
                    this.zzc.zzl.zze();
                    Thread.currentThread().setName(name);
                    throw th3;
                }
            }
        }
        synchronized (this.zzc.zzo) {
            zzbdoVarZzg = this.zzc.zzz;
        }
        if (zzbdoVarZzg == null) {
            zzbdoVarZzg = zzbdo.zzp.zzg("End of stream or IOException");
        }
        this.zzc.zzaa(0, zzbtp.INTERNAL_ERROR, zzbdoVarZzg);
        try {
            this.zza.close();
        } catch (IOException e12) {
            zzbsf.zzd.logp(Level.INFO, "io.grpc.okhttp.OkHttpClientTransport$ClientFrameHandler", "run", "Exception closing frame reader", (Throwable) e12);
        } catch (RuntimeException e13) {
            if (!"bio == null".equals(e13.getMessage())) {
                throw e13;
            }
        }
        this.zzc.zzl.zze();
        Thread.currentThread().setName(name);
    }

    @Override // com.google.android.libraries.places.internal.zzbtq
    public final void zza(boolean z11, int i5, zzbwd zzbwdVar, int i11, int i12) throws IOException {
        this.zzd.zza(1, i5, ((zzbwl) zzbwdVar).zzb, i11, z11);
        zzbry zzbryVarZzr = this.zzc.zzr(i5);
        if (zzbryVarZzr != null) {
            long j11 = i11;
            zzbwdVar.zzD(j11);
            zzbwb zzbwbVar = new zzbwb();
            zzbwbVar.zzn(((zzbwl) zzbwdVar).zzb, j11);
            zzbryVarZzr.zzD().zzI();
            int i13 = zzbvr.zza;
            synchronized (this.zzc.zzo) {
                zzbryVarZzr.zzD().zzO(zzbwbVar, z11, i12 - i11);
            }
        } else if (!this.zzc.zzU(i5)) {
            zzbsf zzbsfVar = this.zzc;
            zzbtp zzbtpVar = zzbtp.PROTOCOL_ERROR;
            zzbsfVar.zzaa(0, zzbtpVar, zzbsf.zzm(zzbtpVar).zzc(c0.h(i5, "Received data for unknown stream: ")));
            return;
        } else {
            synchronized (this.zzc.zzo) {
                this.zzc.zzm.zzc(i5, zzbtp.STREAM_CLOSED);
            }
            zzbwdVar.zzF(i11);
        }
        this.zzc.zzw += i12;
        zzbsf zzbsfVar2 = this.zzc;
        if (zzbsfVar2.zzw >= zzbsfVar2.zzj * 0.5f) {
            synchronized (zzbsfVar2.zzo) {
                this.zzc.zzm.zzk(0, r9.zzw);
            }
            this.zzc.zzw = 0;
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbtq
    public final void zzb(int i5, zzbtp zzbtpVar, zzbwf zzbwfVar) {
        this.zzd.zzb(1, i5, zzbtpVar, zzbwfVar);
        if (zzbtpVar == zzbtp.ENHANCE_YOUR_CALM) {
            String strZzf = zzbwfVar.zzf();
            zzbsf.zzd.logp(Level.WARNING, "io.grpc.okhttp.OkHttpClientTransport$ClientFrameHandler", "goAway", this + ": Received GOAWAY with ENHANCE_YOUR_CALM. Debug data: " + strZzf);
            if ("too_many_pings".equals(strZzf)) {
                ((zzbrs) this.zzc.zzL).zza.zza();
            }
        }
        zzbdo zzbdoVarZzc = zzbjb.zza(zzbtpVar.zzs).zzc("Received Goaway");
        if (zzbwfVar.zzc() > 0) {
            zzbdoVarZzc = zzbdoVarZzc.zzc(zzbwfVar.zzf());
        }
        this.zzc.zzaa(i5, null, zzbdoVarZzc);
    }

    @Override // com.google.android.libraries.places.internal.zzbtq
    public final void zzc(boolean z11, int i5, int i11) {
        zzbjh zzbjhVar;
        long j11 = (i5 << 32) | (i11 & 4294967295L);
        this.zzd.zzd(1, j11);
        if (!z11) {
            synchronized (this.zzc.zzo) {
                this.zzc.zzm.zzb(true, i5, i11);
            }
            return;
        }
        synchronized (this.zzc.zzo) {
            try {
                zzbsf zzbsfVar = this.zzc;
                zzbjhVar = null;
                if (zzbsfVar.zzB == null) {
                    zzbsf.zzd.logp(Level.WARNING, "io.grpc.okhttp.OkHttpClientTransport$ClientFrameHandler", "ping", "Received unexpected ping ack. No ping outstanding");
                } else if (zzbsfVar.zzB.zza() == j11) {
                    zzbsf zzbsfVar2 = this.zzc;
                    zzbjh zzbjhVar2 = zzbsfVar2.zzB;
                    zzbsfVar2.zzB = null;
                    zzbjhVar = zzbjhVar2;
                } else {
                    Logger logger = zzbsf.zzd;
                    Level level = Level.WARNING;
                    Locale locale = Locale.US;
                    logger.logp(level, "io.grpc.okhttp.OkHttpClientTransport$ClientFrameHandler", "ping", "Received unexpected ping ack. Expecting " + this.zzc.zzB.zza() + ", got " + j11);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (zzbjhVar != null) {
            zzbjhVar.zzc();
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbtq
    public final void zzd(int i5, int i11, List list) throws IOException {
        this.zzd.zzf(1, i5, i11, list);
        synchronized (this.zzc.zzo) {
            this.zzc.zzm.zzc(i5, zzbtp.PROTOCOL_ERROR);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbtq
    public final void zze(int i5, zzbtp zzbtpVar) {
        boolean z11 = true;
        this.zzd.zzg(1, i5, zzbtpVar);
        zzbdo zzbdoVarZzc = zzbsf.zzm(zzbtpVar).zzc("Rst Stream");
        if (zzbdoVarZzc.zza() != zzbdj.CANCELLED && zzbdoVarZzc.zza() != zzbdj.DEADLINE_EXCEEDED) {
            z11 = false;
        }
        boolean z12 = z11;
        synchronized (this.zzc.zzo) {
            try {
                zzbry zzbryVar = (zzbry) this.zzc.zzr.get(Integer.valueOf(i5));
                if (zzbryVar != null) {
                    zzbryVar.zzD().zzI();
                    int i11 = zzbvr.zza;
                    this.zzc.zzP(i5, zzbdoVarZzc, zzbtpVar == zzbtp.REFUSED_STREAM ? zzbfs.REFUSED : zzbfs.PROCESSED, z12, null, null);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbtq
    public final void zzf(boolean z11, zzbue zzbueVar) {
        boolean zZzh;
        this.zzd.zzh(1, zzbueVar);
        synchronized (this.zzc.zzo) {
            try {
                if (zzbueVar.zzf(4)) {
                    this.zzc.zzH = zzbueVar.zza(4);
                }
                if (zzbueVar.zzf(7)) {
                    zZzh = this.zzc.zzn.zzh(zzbueVar.zza(7));
                } else {
                    zZzh = false;
                }
                if (this.zzb) {
                    zzbsf zzbsfVar = this.zzc;
                    zzbmk zzbmkVar = zzbsfVar.zzl;
                    zzaye zzayeVar = zzbsfVar.zzy;
                    zzbmkVar.zza(zzayeVar);
                    zzbsfVar.zzy = zzayeVar;
                    this.zzc.zzl.zzc();
                    this.zzb = false;
                }
                this.zzc.zzm.zza(zzbueVar);
                if (zZzh) {
                    this.zzc.zzn.zzg();
                }
                this.zzc.zzad();
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0050  */
    /* JADX WARN: Removed duplicated region for block: B:23:? A[RETURN, SYNTHETIC] */
    @Override // com.google.android.libraries.places.internal.zzbtq
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void zzg(int i5, long j11) {
        boolean z11 = true;
        this.zzd.zzj(1, i5, j11);
        synchronized (this.zzc.zzo) {
            try {
                if (i5 == 0) {
                    this.zzc.zzn.zza(null, (int) j11);
                    return;
                }
                zzbry zzbryVar = (zzbry) this.zzc.zzr.get(Integer.valueOf(i5));
                if (zzbryVar == null) {
                    if (this.zzc.zzU(i5)) {
                    }
                    if (z11) {
                        return;
                    }
                    zzbsf zzbsfVar = this.zzc;
                    zzbtp zzbtpVar = zzbtp.PROTOCOL_ERROR;
                    zzbsfVar.zzaa(0, zzbtpVar, zzbsf.zzm(zzbtpVar).zzc(c0.h(i5, "Received window_update for unknown stream: ")));
                    return;
                }
                this.zzc.zzn.zza(zzbryVar.zzD().zzH(), (int) j11);
                z11 = false;
                if (z11) {
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbtq
    public final void zzh(boolean z11, boolean z12, int i5, int i11, List list, int i12) {
        boolean z13 = true;
        this.zzd.zzc(1, i5, list, z12);
        zzbdo zzbdoVarZzg = null;
        if (this.zzc.zzM != Integer.MAX_VALUE) {
            long jZzc = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                zzbtt zzbttVar = (zzbtt) list.get(i13);
                jZzc += zzbttVar.zzi.zzc() + zzbttVar.zzh.zzc() + 32;
            }
            int iMin = (int) Math.min(jZzc, 2147483647L);
            if (iMin > this.zzc.zzM) {
                zzbdo zzbdoVar = zzbdo.zzj;
                Locale locale = Locale.US;
                StringBuilder sbV = c0.v("Response ", this.zzc.zzM, true != z12 ? "header" : "trailer", " metadata larger than ", ": ");
                sbV.append(iMin);
                zzbdoVarZzg = zzbdoVar.zzg(sbV.toString());
            }
        }
        synchronized (this.zzc.zzo) {
            try {
                zzbry zzbryVar = (zzbry) this.zzc.zzr.get(Integer.valueOf(i5));
                if (zzbryVar == null) {
                    if (this.zzc.zzU(i5)) {
                        this.zzc.zzm.zzc(i5, zzbtp.STREAM_CLOSED);
                    }
                } else if (zzbdoVarZzg == null) {
                    zzbryVar.zzD().zzI();
                    int i14 = zzbvr.zza;
                    zzbryVar.zzD().zzP(list, z12);
                } else {
                    if (!z12) {
                        this.zzc.zzm.zzc(i5, zzbtp.CANCEL);
                    }
                    zzbryVar.zzD().zzj(zzbdoVarZzg, zzbfs.PROCESSED, false, new zzbcf());
                }
                z13 = false;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (z13) {
            zzbsf zzbsfVar = this.zzc;
            zzbtp zzbtpVar = zzbtp.PROTOCOL_ERROR;
            zzbsfVar.zzaa(0, zzbtpVar, zzbsf.zzm(zzbtpVar).zzc(c0.h(i5, "Received header for unknown stream: ")));
        }
    }
}
