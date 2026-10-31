package com.google.android.libraries.places.internal;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
final class zzbgy extends zzayn {
    private final zzayn zza;
    private volatile boolean zzb;
    private List zzc = new ArrayList();

    public zzbgy(zzayn zzaynVar) {
        this.zza = zzaynVar;
    }

    private final void zzg(Runnable runnable) {
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

    @Override // com.google.android.libraries.places.internal.zzayn
    public final void zza(zzbdo zzbdoVar, zzbcf zzbcfVar) {
        zzg(new zzbgw(this, zzbdoVar, zzbcfVar));
    }

    @Override // com.google.android.libraries.places.internal.zzayn
    public final void zzb(zzbcf zzbcfVar) {
        if (this.zzb) {
            this.zza.zzb(zzbcfVar);
        } else {
            zzg(new zzbgu(this, zzbcfVar));
        }
    }

    @Override // com.google.android.libraries.places.internal.zzayn
    public final void zzc(Object obj) {
        if (this.zzb) {
            this.zza.zzc(obj);
        } else {
            zzg(new zzbgv(this, obj));
        }
    }

    @Override // com.google.android.libraries.places.internal.zzayn
    public final void zzd() {
        if (this.zzb) {
            this.zza.zzd();
        } else {
            zzg(new zzbgx(this));
        }
    }

    public final void zzf() {
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
}
