package com.google.android.libraries.places.internal;

import java.util.IdentityHashMap;
import java.util.Map;

/* loaded from: classes3.dex */
public final class zzayb {
    private zzaye zza;
    private IdentityHashMap zzb;

    public /* synthetic */ zzayb(zzaye zzayeVar, zzaya zzayaVar) {
        this.zza = zzayeVar;
    }

    public final zzayb zza(zzayc zzaycVar) {
        if (this.zza.zzc.containsKey(zzaycVar)) {
            IdentityHashMap identityHashMap = new IdentityHashMap(this.zza.zzc);
            identityHashMap.remove(zzaycVar);
            this.zza = new zzaye(identityHashMap, null);
        }
        IdentityHashMap identityHashMap2 = this.zzb;
        if (identityHashMap2 != null) {
            identityHashMap2.remove(zzaycVar);
        }
        return this;
    }

    public final zzayb zzb(zzayc zzaycVar, Object obj) {
        if (this.zzb == null) {
            this.zzb = new IdentityHashMap(1);
        }
        this.zzb.put(zzaycVar, obj);
        return this;
    }

    public final zzaye zzc() {
        if (this.zzb != null) {
            for (Map.Entry entry : this.zza.zzc.entrySet()) {
                if (!this.zzb.containsKey(entry.getKey())) {
                    this.zzb.put((zzayc) entry.getKey(), entry.getValue());
                }
            }
            this.zza = new zzaye(this.zzb, null);
            this.zzb = null;
        }
        return this.zza;
    }
}
