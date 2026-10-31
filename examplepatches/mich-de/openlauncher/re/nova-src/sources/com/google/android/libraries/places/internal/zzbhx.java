package com.google.android.libraries.places.internal;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
final class zzbhx implements zzbft {
    private final zzbft zza;
    private volatile boolean zzb;
    private List zzc = new ArrayList();

    public zzbhx(zzbft zzbftVar) {
        this.zza = zzbftVar;
    }

    private final void zzc(Runnable runnable) {
        synchronized (this) {
            try {
                if (this.zzb) {
                    runnable.run();
                } else {
                    this.zzc.add(runnable);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void zzb() {
        List list;
        List arrayList = new ArrayList();
        while (true) {
            synchronized (this) {
                try {
                    if (this.zzc.isEmpty()) {
                        this.zzc = null;
                        this.zzb = true;
                        return;
                    } else {
                        list = this.zzc;
                        this.zzc = arrayList;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            Iterator it = list.iterator();
            while (it.hasNext()) {
                ((Runnable) it.next()).run();
            }
            list.clear();
            arrayList = list;
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbft
    public final void zzd(zzbdo zzbdoVar, zzbfs zzbfsVar, zzbcf zzbcfVar) {
        zzc(new zzbhw(this, zzbdoVar, zzbfsVar, zzbcfVar));
    }

    @Override // com.google.android.libraries.places.internal.zzbft
    public final void zze(zzbcf zzbcfVar) {
        zzc(new zzbhv(this, zzbcfVar));
    }

    @Override // com.google.android.libraries.places.internal.zzbqr
    public final void zzf(zzbqq zzbqqVar) {
        if (this.zzb) {
            this.zza.zzf(zzbqqVar);
        } else {
            zzc(new zzbht(this, zzbqqVar));
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbqr
    public final void zzg() {
        if (this.zzb) {
            this.zza.zzg();
        } else {
            zzc(new zzbhu(this));
        }
    }
}
