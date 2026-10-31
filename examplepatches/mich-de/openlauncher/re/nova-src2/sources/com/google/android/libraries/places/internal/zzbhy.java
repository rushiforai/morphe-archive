package com.google.android.libraries.places.internal;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
class zzbhy implements zzbfr {
    private volatile boolean zza;
    private zzbft zzb;
    private zzbfr zzc;
    private zzbdo zzd;
    private zzbhx zzf;
    private long zzg;
    private long zzh;
    private List zze = new ArrayList();
    private List zzi = new ArrayList();

    private final void zza(Runnable runnable) {
        zzmt.zzp(this.zzb != null, "May only be called after start");
        synchronized (this) {
            try {
                if (this.zza) {
                    runnable.run();
                } else {
                    this.zze.add(runnable);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0024, code lost:
    
        r0 = r1.iterator();
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x002c, code lost:
    
        if (r0.hasNext() == false) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x002e, code lost:
    
        ((java.lang.Runnable) r0.next()).run();
     */
    /* JADX WARN: Removed duplicated region for block: B:26:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void zzb() {
        zzbhx zzbhxVar;
        List list;
        List arrayList = new ArrayList();
        while (true) {
            synchronized (this) {
                if (this.zze.isEmpty()) {
                    break;
                }
                list = this.zze;
                this.zze = arrayList;
            }
            if (zzbhxVar == null) {
                zzbhxVar.zzb();
                return;
            }
            return;
            list.clear();
            arrayList = list;
        }
        this.zze = null;
        this.zza = true;
        zzbhxVar = this.zzf;
        if (zzbhxVar == null) {
        }
    }

    private final void zzi(zzbft zzbftVar) {
        Iterator it = this.zzi.iterator();
        while (it.hasNext()) {
            ((Runnable) it.next()).run();
        }
        this.zzi = null;
        this.zzc.zzo(zzbftVar);
    }

    private final void zzq(zzbfr zzbfrVar) {
        zzbfr zzbfrVar2 = this.zzc;
        zzmt.zzr(zzbfrVar2 == null, "realStream already set to %s", zzbfrVar2);
        this.zzc = zzbfrVar;
        this.zzh = System.nanoTime();
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final zzaye zzam() {
        throw null;
    }

    public void zzc(zzbdo zzbdoVar) {
    }

    public final Runnable zze(zzbfr zzbfrVar) {
        synchronized (this) {
            try {
                if (this.zzc == null) {
                    zzq(zzbfrVar);
                    zzbft zzbftVar = this.zzb;
                    if (zzbftVar == null) {
                        this.zze = null;
                        this.zza = true;
                    }
                    if (zzbftVar != null) {
                        zzi(zzbftVar);
                        return new zzbho(this);
                    }
                }
            } finally {
            }
        }
        return null;
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public void zzg(zzbjj zzbjjVar) {
        synchronized (this) {
            try {
                if (this.zzb == null) {
                    return;
                }
                if (this.zzc != null) {
                    zzbjjVar.zzb("buffered_nanos", Long.valueOf(this.zzh - this.zzg));
                    this.zzc.zzg(zzbjjVar);
                } else {
                    zzbjjVar.zzb("buffered_nanos", Long.valueOf(System.nanoTime() - this.zzg));
                    zzbjjVar.zza("waiting_for_connection");
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public void zzh(zzbdo zzbdoVar) {
        boolean z11 = false;
        zzmt.zzp(this.zzb != null, "May only be called after start");
        zzmt.zzc(zzbdoVar, "reason");
        synchronized (this) {
            try {
                if (this.zzc == null) {
                    zzq(zzbmy.zza);
                    this.zzd = zzbdoVar;
                } else {
                    z11 = true;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (z11) {
            zza(new zzbhr(this, zzbdoVar));
            return;
        }
        zzb();
        zzc(zzbdoVar);
        this.zzb.zzd(zzbdoVar, zzbfs.PROCESSED, new zzbcf());
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzj() {
        zzmt.zzp(this.zzb != null, "May only be called after start");
        zza(new zzbhs(this));
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzk(zzazn zzaznVar) {
        zzmt.zzp(this.zzb == null, "May only be called before start");
        this.zzi.add(new zzbhn(this, zzaznVar));
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzl(zzazq zzazqVar) {
        zzmt.zzp(this.zzb == null, "May only be called before start");
        zzmt.zzc(zzazqVar, "decompressorRegistry");
        this.zzi.add(new zzbhk(this, zzazqVar));
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzm(int i5) {
        zzmt.zzp(this.zzb == null, "May only be called before start");
        this.zzi.add(new zzbhl(this, i5));
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzn(int i5) {
        zzmt.zzp(this.zzb == null, "May only be called before start");
        this.zzi.add(new zzbhm(this, i5));
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzo(zzbft zzbftVar) {
        zzbdo zzbdoVar;
        boolean z11;
        zzmt.zzp(this.zzb == null, "already started");
        synchronized (this) {
            try {
                zzbdoVar = this.zzd;
                z11 = this.zza;
                if (!z11) {
                    zzbhx zzbhxVar = new zzbhx(zzbftVar);
                    this.zzf = zzbhxVar;
                    zzbftVar = zzbhxVar;
                }
                this.zzb = zzbftVar;
                this.zzg = System.nanoTime();
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (zzbdoVar != null) {
            zzbftVar.zzd(zzbdoVar, zzbfs.PROCESSED, new zzbcf());
        } else if (z11) {
            zzi(zzbftVar);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbqp
    public final boolean zzp() {
        if (this.zza) {
            return this.zzc.zzp();
        }
        return false;
    }

    @Override // com.google.android.libraries.places.internal.zzbqp
    public final void zzr() {
        zzmt.zzp(this.zzb != null, "May only be called after start");
        if (this.zza) {
            this.zzc.zzr();
        } else {
            zza(new zzbhq(this));
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbqp
    public final void zzt() {
        zzmt.zzp(this.zzb == null, "May only be called before start");
        this.zzi.add(new zzbhi(this));
    }

    @Override // com.google.android.libraries.places.internal.zzbqp
    public final void zzu(int i5) {
        zzmt.zzp(this.zzb != null, "May only be called after start");
        if (this.zza) {
            this.zzc.zzu(2);
        } else {
            zza(new zzbhh(this, 2));
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbqp
    public final void zzv(zzazc zzazcVar) {
        zzmt.zzp(this.zzb == null, "May only be called before start");
        this.zzi.add(new zzbhj(this, zzazcVar));
    }

    @Override // com.google.android.libraries.places.internal.zzbqp
    public final void zzw(InputStream inputStream) {
        zzmt.zzp(this.zzb != null, "May only be called after start");
        if (this.zza) {
            this.zzc.zzw(inputStream);
        } else {
            zza(new zzbhp(this, inputStream));
        }
    }
}
