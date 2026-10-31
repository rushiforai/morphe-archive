package com.google.android.libraries.places.internal;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public class zzbgz extends zzayo {
    private static final Logger zza = Logger.getLogger(zzbgz.class.getName());
    private static final zzayo zzb = new zzbgs();
    private final ScheduledFuture zzc;
    private final Executor zzd;
    private final zzazj zze;
    private volatile boolean zzf;
    private zzayn zzg;
    private zzayo zzh;
    private zzbdo zzi;
    private List zzj = new ArrayList();
    private zzbgy zzk;

    public zzbgz(Executor executor, ScheduledExecutorService scheduledExecutorService, zzazn zzaznVar) {
        ScheduledFuture<?> scheduledFutureSchedule;
        zzmt.zzc(executor, "callExecutor");
        this.zzd = executor;
        zzmt.zzc(scheduledExecutorService, "scheduler");
        this.zze = zzazj.zzb();
        if (zzaznVar == null) {
            scheduledFutureSchedule = null;
        } else {
            TimeUnit timeUnit = TimeUnit.NANOSECONDS;
            long jZzb = zzaznVar.zzb(timeUnit);
            long jAbs = Math.abs(jZzb);
            TimeUnit timeUnit2 = TimeUnit.SECONDS;
            long nanos = jAbs / timeUnit2.toNanos(1L);
            long jAbs2 = Math.abs(jZzb) % timeUnit2.toNanos(1L);
            StringBuilder sb2 = new StringBuilder();
            if (jZzb < 0) {
                sb2.append("ClientCall started after CallOptions deadline was exceeded. Deadline has been exceeded for ");
            } else {
                sb2.append("Deadline CallOptions will be exceeded in ");
            }
            sb2.append(nanos);
            sb2.append(String.format(Locale.US, ".%09d", Long.valueOf(jAbs2)));
            sb2.append("s. ");
            scheduledFutureSchedule = scheduledExecutorService.schedule(new zzbgl(this, sb2), jZzb, timeUnit);
        }
        this.zzc = scheduledFutureSchedule;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzl(zzbdo zzbdoVar, boolean z11) {
        zzayn zzaynVar;
        boolean z12;
        synchronized (this) {
            try {
                if (this.zzh == null) {
                    zzo(zzb);
                    zzaynVar = this.zzg;
                    this.zzi = zzbdoVar;
                    z12 = false;
                } else {
                    if (z11) {
                        return;
                    }
                    zzaynVar = null;
                    z12 = true;
                }
                if (z12) {
                    zzm(new zzbgo(this, zzbdoVar));
                } else {
                    if (zzaynVar != null) {
                        this.zzd.execute(new zzbgt(this, zzaynVar, zzbdoVar));
                    }
                    zzn();
                }
                zzk();
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    private final void zzm(Runnable runnable) {
        synchronized (this) {
            try {
                if (this.zzf) {
                    runnable.run();
                } else {
                    this.zzj.add(runnable);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x002b, code lost:
    
        r0 = r1.iterator();
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0033, code lost:
    
        if (r0.hasNext() == false) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0035, code lost:
    
        ((java.lang.Runnable) r0.next()).run();
     */
    /* JADX WARN: Removed duplicated region for block: B:26:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void zzn() {
        zzbgy zzbgyVar;
        List list;
        List arrayList = new ArrayList();
        while (true) {
            synchronized (this) {
                if (this.zzj.isEmpty()) {
                    break;
                }
                list = this.zzj;
                this.zzj = arrayList;
            }
            if (zzbgyVar == null) {
                this.zzd.execute(new zzbgm(this, zzbgyVar));
                return;
            }
            return;
            list.clear();
            arrayList = list;
        }
        this.zzj = null;
        this.zzf = true;
        zzbgyVar = this.zzk;
        if (zzbgyVar == null) {
        }
    }

    private final void zzo(zzayo zzayoVar) {
        zzayo zzayoVar2 = this.zzh;
        zzmt.zzr(zzayoVar2 == null, "realCall already set to %s", zzayoVar2);
        ScheduledFuture scheduledFuture = this.zzc;
        if (scheduledFuture != null) {
            scheduledFuture.cancel(false);
        }
        this.zzh = zzayoVar;
    }

    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzd("realCall", this.zzh);
        return zzmmVarZzb.toString();
    }

    @Override // com.google.android.libraries.places.internal.zzayo
    public final void zza(String str, Throwable th2) {
        zzbdo zzbdoVar = zzbdo.zzb;
        zzbdo zzbdoVarZzg = str != null ? zzbdoVar.zzg(str) : zzbdoVar.zzg("Call cancelled without message");
        if (th2 != null) {
            zzbdoVarZzg = zzbdoVarZzg.zzf(th2);
        }
        zzl(zzbdoVarZzg, false);
    }

    @Override // com.google.android.libraries.places.internal.zzayo
    public final void zzb() {
        zzm(new zzbgr(this));
    }

    @Override // com.google.android.libraries.places.internal.zzayo
    public final void zzc(int i5) {
        if (this.zzf) {
            this.zzh.zzc(2);
        } else {
            zzm(new zzbgq(this, 2));
        }
    }

    @Override // com.google.android.libraries.places.internal.zzayo
    public final void zzd(Object obj) {
        if (this.zzf) {
            this.zzh.zzd(obj);
        } else {
            zzm(new zzbgp(this, obj));
        }
    }

    @Override // com.google.android.libraries.places.internal.zzayo
    public final void zze(zzayn zzaynVar, zzbcf zzbcfVar) {
        zzbdo zzbdoVar;
        boolean z11;
        zzmt.zzp(this.zzg == null, "already started");
        synchronized (this) {
            try {
                this.zzg = zzaynVar;
                zzbdoVar = this.zzi;
                z11 = this.zzf;
                if (!z11) {
                    zzbgy zzbgyVar = new zzbgy(zzaynVar);
                    this.zzk = zzbgyVar;
                    zzaynVar = zzbgyVar;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (zzbdoVar != null) {
            this.zzd.execute(new zzbgt(this, zzaynVar, zzbdoVar));
        } else if (z11) {
            this.zzh.zze(zzaynVar, zzbcfVar);
        } else {
            zzm(new zzbgn(this, zzaynVar, zzbcfVar));
        }
    }

    public final Runnable zzh(zzayo zzayoVar) {
        synchronized (this) {
            try {
                if (this.zzh != null) {
                    return null;
                }
                zzo(zzayoVar);
                return new zzbgk(this, this.zze);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public void zzk() {
    }
}
