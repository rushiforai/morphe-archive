package com.google.android.libraries.places.internal;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes3.dex */
abstract class zzbpo implements zzbfr {
    private static final zzbdo zza;
    private static final Random zzb;
    static final zzbca zzh;
    static final zzbca zzi;
    private zzboy zzA;
    private long zzB;
    private zzbdo zzC;
    private boolean zzD;
    private final zzbcl zzc;
    private final Executor zzd;
    private final ScheduledExecutorService zzf;
    private final zzbcf zzg;
    private final zzbpp zzj;
    private final zzbje zzk;
    private final boolean zzl;
    private final zzbox zzn;
    private final long zzo;
    private final long zzp;
    private final zzbpn zzq;
    private zzbpb zzw;
    private long zzx;
    private zzbft zzy;
    private zzboy zzz;
    private final Executor zze = new zzbdw(new zzbof(this));
    private final Object zzm = new Object();
    private final zzbjj zzr = new zzbjj();
    private volatile zzbpd zzs = new zzbpd(new ArrayList(8), Collections.EMPTY_LIST, null, null, false, false, false, 0);
    private final AtomicBoolean zzt = new AtomicBoolean();
    private final AtomicInteger zzu = new AtomicInteger();
    private final AtomicInteger zzv = new AtomicInteger();

    static {
        zzbbx zzbbxVar = zzbcf.zzb;
        zzh = zzbca.zzc("grpc-previous-rpc-attempts", zzbbxVar);
        zzi = zzbca.zzc("grpc-retry-pushback-ms", zzbbxVar);
        zza = zzbdo.zzb.zzg("Stream thrown away because RetriableStream committed");
        zzb = new Random();
    }

    public zzbpo(zzbcl zzbclVar, zzbcf zzbcfVar, zzbox zzboxVar, long j11, long j12, Executor executor, ScheduledExecutorService scheduledExecutorService, zzbpp zzbppVar, zzbje zzbjeVar, zzbpn zzbpnVar) {
        this.zzc = zzbclVar;
        this.zzn = zzboxVar;
        this.zzo = j11;
        this.zzp = j12;
        this.zzd = executor;
        this.zzf = scheduledExecutorService;
        this.zzg = zzbcfVar;
        this.zzj = zzbppVar;
        if (zzbppVar != null) {
            this.zzB = zzbppVar.zzb;
        }
        this.zzk = zzbjeVar;
        zzmt.zzf(zzbppVar == null || zzbjeVar == null, "Should not provide both retryPolicy and hedgingPolicy");
        this.zzl = zzbjeVar != null;
        this.zzq = zzbpnVar;
    }

    public static /* bridge */ /* synthetic */ void zzW(zzbpo zzbpoVar, zzbpm zzbpmVar) {
        Runnable runnableZzag = zzbpoVar.zzag(zzbpmVar);
        if (runnableZzag != null) {
            zzbpoVar.zzd.execute(runnableZzag);
        }
    }

    public static /* bridge */ /* synthetic */ void zzZ(zzbpo zzbpoVar, Integer num) {
        if (num == null) {
            return;
        }
        if (num.intValue() < 0) {
            zzbpoVar.zzaj();
            return;
        }
        synchronized (zzbpoVar.zzm) {
            try {
                zzboy zzboyVar = zzbpoVar.zzA;
                if (zzboyVar == null) {
                    return;
                }
                Future futureZza = zzboyVar.zza();
                zzboy zzboyVar2 = new zzboy(zzbpoVar.zzm);
                zzbpoVar.zzA = zzboyVar2;
                if (futureZza != null) {
                    futureZza.cancel(false);
                }
                zzboyVar2.zzb(zzbpoVar.zzf.schedule(new zzbpa(zzbpoVar, zzboyVar2), num.intValue(), TimeUnit.MILLISECONDS));
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final zzbpm zzaf(int i5, boolean z11) {
        int i11;
        do {
            i11 = this.zzv.get();
            if (i11 < 0) {
                return null;
            }
        } while (!this.zzv.compareAndSet(i11, i11 + 1));
        zzbpm zzbpmVar = new zzbpm(i5);
        zzbos zzbosVar = new zzbos(this, new zzbow(this, zzbpmVar));
        zzbcf zzbcfVar = this.zzg;
        zzbcf zzbcfVar2 = new zzbcf();
        zzbcfVar2.zze(zzbcfVar);
        if (i5 > 0) {
            zzbcfVar2.zzf(zzh, String.valueOf(i5));
        }
        zzbpmVar.zza = zzb(zzbcfVar2, zzbosVar, i5, z11);
        return zzbpmVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Runnable zzag(zzbpm zzbpmVar) {
        List list;
        Collection collectionSingleton;
        boolean z11;
        Future future;
        Future future2;
        synchronized (this.zzm) {
            try {
                if (this.zzs.zzf != null) {
                    return null;
                }
                Collection collection = this.zzs.zzc;
                zzbpd zzbpdVar = this.zzs;
                zzmt.zzp(zzbpdVar.zzf == null, "Already committed");
                List list2 = zzbpdVar.zzb;
                if (zzbpdVar.zzc.contains(zzbpmVar)) {
                    list = null;
                    collectionSingleton = Collections.singleton(zzbpmVar);
                    z11 = true;
                } else {
                    list = list2;
                    collectionSingleton = Collections.EMPTY_LIST;
                    z11 = false;
                }
                this.zzs = new zzbpd(list, collectionSingleton, zzbpdVar.zzd, zzbpmVar, zzbpdVar.zzg, z11, zzbpdVar.zzh, zzbpdVar.zze);
                this.zzn.zza(-this.zzx);
                zzboy zzboyVar = this.zzz;
                boolean z12 = zzboyVar != null ? zzboyVar.zzc : false;
                if (zzboyVar != null) {
                    Future futureZza = zzboyVar.zza();
                    this.zzz = null;
                    future = futureZza;
                } else {
                    future = null;
                }
                zzboy zzboyVar2 = this.zzA;
                if (zzboyVar2 != null) {
                    Future futureZza2 = zzboyVar2.zza();
                    this.zzA = null;
                    future2 = futureZza2;
                } else {
                    future2 = null;
                }
                return new zzboh(this, collection, zzbpmVar, future, z12, future2);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    private final void zzah(zzbov zzbovVar) {
        Collection collection;
        synchronized (this.zzm) {
            try {
                if (!this.zzs.zza) {
                    this.zzs.zzb.add(zzbovVar);
                }
                collection = this.zzs.zzc;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            zzbovVar.zza((zzbpm) it.next());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0037, code lost:
    
        if (r1 == null) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0039, code lost:
    
        r10 = (com.google.android.libraries.places.internal.zzbdw) r9.zze;
        r10.zzc(r1);
        r10.zzb();
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0043, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0044, code lost:
    
        if (r4 != false) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0046, code lost:
    
        r10.zza.zzo(new com.google.android.libraries.places.internal.zzbpl(r9, r10));
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0050, code lost:
    
        r0 = r10.zza;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0056, code lost:
    
        if (r9.zzs.zzf != r10) goto L32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0058, code lost:
    
        r10 = r9.zzC;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x005b, code lost:
    
        r10 = com.google.android.libraries.places.internal.zzbpo.zza;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x005d, code lost:
    
        r0.zzh(r10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0060, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x008e, code lost:
    
        r2 = r3.size();
        r5 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x0093, code lost:
    
        if (r5 >= r2) goto L59;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x0095, code lost:
    
        r6 = (com.google.android.libraries.places.internal.zzbov) r3.get(r5);
        r6.zza(r10);
        r4 = r4 | (r6 instanceof com.google.android.libraries.places.internal.zzbpc);
        r6 = r9.zzs;
        r8 = r6.zzf;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00a5, code lost:
    
        if (r8 == null) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00a7, code lost:
    
        if (r8 != r10) goto L60;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00a9, code lost:
    
        r5 = r5 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00ad, code lost:
    
        if (r6.zzg == false) goto L62;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void zzai(zzbpm zzbpmVar) {
        int iMin;
        zzbot zzbotVar = null;
        int i5 = 0;
        boolean z11 = false;
        ArrayList arrayList = null;
        while (true) {
            synchronized (this.zzm) {
                try {
                    zzbpd zzbpdVar = this.zzs;
                    zzbpm zzbpmVar2 = zzbpdVar.zzf;
                    if (zzbpmVar2 == null || zzbpmVar2 == zzbpmVar) {
                        if (!zzbpdVar.zzg) {
                            if (i5 == zzbpdVar.zzb.size()) {
                                this.zzs = zzbpdVar.zzc(zzbpmVar);
                                if (!zzp()) {
                                    return;
                                } else {
                                    zzbotVar = new zzbot(this);
                                }
                            } else {
                                if (zzbpmVar.zzb) {
                                    return;
                                }
                                iMin = Math.min(i5 + 128, zzbpdVar.zzb.size());
                                if (arrayList == null) {
                                    arrayList = new ArrayList(zzbpdVar.zzb.subList(i5, iMin));
                                } else {
                                    arrayList.clear();
                                    arrayList.addAll(zzbpdVar.zzb.subList(i5, iMin));
                                }
                            }
                        }
                    }
                } finally {
                }
            }
            i5 = iMin;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzaj() {
        Future future;
        synchronized (this.zzm) {
            try {
                zzboy zzboyVar = this.zzA;
                future = null;
                if (zzboyVar != null) {
                    Future futureZza = zzboyVar.zza();
                    this.zzA = null;
                    future = futureZza;
                }
                this.zzs = this.zzs.zzb();
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (future != null) {
            future.cancel(false);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzak(zzbdo zzbdoVar, zzbfs zzbfsVar, zzbcf zzbcfVar) {
        this.zzw = new zzbpb(zzbdoVar, zzbfsVar, zzbcfVar);
        if (this.zzv.addAndGet(Integer.MIN_VALUE) == Integer.MIN_VALUE) {
            zzbdw zzbdwVar = (zzbdw) this.zze;
            zzbdwVar.zzc(new zzbou(this, zzbdoVar, zzbfsVar, zzbcfVar));
            zzbdwVar.zzb();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean zzal(zzbpd zzbpdVar) {
        return zzbpdVar.zzf == null && zzbpdVar.zze < this.zzk.zza && !zzbpdVar.zzh;
    }

    public abstract zzbdo zza();

    public final void zzab(Object obj) {
        zzbpd zzbpdVar = this.zzs;
        if (zzbpdVar.zza) {
            zzbpdVar.zzf.zza.zzw(this.zzc.zzc(obj));
        } else {
            zzah(new zzbor(this, obj));
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final zzaye zzam() {
        throw null;
    }

    public abstract zzbfr zzb(zzbcf zzbcfVar, zzayu zzayuVar, int i5, boolean z11);

    public abstract void zzc();

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzg(zzbjj zzbjjVar) {
        zzbpd zzbpdVar;
        synchronized (this.zzm) {
            zzbjjVar.zzb("closed", this.zzr);
            zzbpdVar = this.zzs;
        }
        if (zzbpdVar.zzf != null) {
            zzbjj zzbjjVar2 = new zzbjj();
            zzbpdVar.zzf.zza.zzg(zzbjjVar2);
            zzbjjVar.zzb("committed", zzbjjVar2);
            return;
        }
        zzbjj zzbjjVar3 = new zzbjj();
        for (zzbpm zzbpmVar : zzbpdVar.zzc) {
            zzbjj zzbjjVar4 = new zzbjj();
            zzbpmVar.zza.zzg(zzbjjVar4);
            zzbjjVar3.zza(zzbjjVar4);
        }
        zzbjjVar.zzb("open", zzbjjVar3);
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzh(zzbdo zzbdoVar) {
        zzbpm zzbpmVar;
        zzbpm zzbpmVar2 = new zzbpm(0);
        zzbpmVar2.zza = new zzbmy();
        Runnable runnableZzag = zzag(zzbpmVar2);
        if (runnableZzag != null) {
            synchronized (this.zzm) {
                this.zzs = this.zzs.zzc(zzbpmVar2);
            }
            runnableZzag.run();
            zzak(zzbdoVar, zzbfs.PROCESSED, new zzbcf());
            return;
        }
        synchronized (this.zzm) {
            try {
                if (this.zzs.zzc.contains(this.zzs.zzf)) {
                    zzbpmVar = this.zzs.zzf;
                } else {
                    this.zzC = zzbdoVar;
                    zzbpmVar = null;
                }
                zzbpd zzbpdVar = this.zzs;
                this.zzs = new zzbpd(zzbpdVar.zzb, zzbpdVar.zzc, zzbpdVar.zzd, zzbpdVar.zzf, true, zzbpdVar.zza, zzbpdVar.zzh, zzbpdVar.zze);
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (zzbpmVar != null) {
            zzbpmVar.zza.zzh(zzbdoVar);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzj() {
        zzah(new zzbom(this));
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzk(zzazn zzaznVar) {
        zzah(new zzboj(this, zzaznVar));
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzl(zzazq zzazqVar) {
        zzah(new zzbok(this, zzazqVar));
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzm(int i5) {
        zzah(new zzbon(this, i5));
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzn(int i5) {
        zzah(new zzboo(this, i5));
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzo(zzbft zzbftVar) {
        zzboy zzboyVar;
        zzbpn zzbpnVar;
        this.zzy = zzbftVar;
        zzbdo zzbdoVarZza = zza();
        if (zzbdoVarZza != null) {
            zzh(zzbdoVarZza);
            return;
        }
        synchronized (this.zzm) {
            this.zzs.zzb.add(new zzbpc(this));
        }
        zzbpm zzbpmVarZzaf = zzaf(0, false);
        if (zzbpmVarZzaf == null) {
            return;
        }
        if (this.zzl) {
            synchronized (this.zzm) {
                try {
                    this.zzs = this.zzs.zza(zzbpmVarZzaf);
                    zzboyVar = null;
                    if (zzal(this.zzs) && ((zzbpnVar = this.zzq) == null || zzbpnVar.zza())) {
                        zzboyVar = new zzboy(this.zzm);
                        this.zzA = zzboyVar;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            if (zzboyVar != null) {
                zzboyVar.zzb(this.zzf.schedule(new zzbpa(this, zzboyVar), this.zzk.zzb, TimeUnit.NANOSECONDS));
            }
        }
        zzai(zzbpmVarZzaf);
    }

    @Override // com.google.android.libraries.places.internal.zzbqp
    public final boolean zzp() {
        Iterator it = this.zzs.zzc.iterator();
        while (it.hasNext()) {
            if (((zzbpm) it.next()).zza.zzp()) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.internal.zzbqp
    public final void zzr() {
        zzbpd zzbpdVar = this.zzs;
        if (zzbpdVar.zza) {
            zzbpdVar.zzf.zza.zzr();
        } else {
            zzah(new zzbol(this));
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbqp
    public final void zzt() {
        zzah(new zzbop(this));
    }

    @Override // com.google.android.libraries.places.internal.zzbqp
    public final void zzu(int i5) {
        zzbpd zzbpdVar = this.zzs;
        if (zzbpdVar.zza) {
            zzbpdVar.zzf.zza.zzu(2);
        } else {
            zzah(new zzboq(this, 2));
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbqp
    public final void zzv(zzazc zzazcVar) {
        zzah(new zzboi(this, zzazcVar));
    }

    @Override // com.google.android.libraries.places.internal.zzbqp
    public final void zzw(InputStream inputStream) {
        throw new IllegalStateException("RetriableStream.writeMessage() should not be called directly");
    }
}
