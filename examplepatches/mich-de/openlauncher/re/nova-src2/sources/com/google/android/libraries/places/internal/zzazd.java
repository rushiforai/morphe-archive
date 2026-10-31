package com.google.android.libraries.places.internal;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/* loaded from: classes3.dex */
public final class zzazd {
    private static final zzazd zza = new zzazd(new zzayz(), zzaza.zza);
    private final ConcurrentMap zzb = new ConcurrentHashMap();

    public zzazd(zzazc... zzazcVarArr) {
        for (int i5 = 0; i5 < 2; i5++) {
            zzazc zzazcVar = zzazcVarArr[i5];
            this.zzb.put(zzazcVar.zzb(), zzazcVar);
        }
    }

    public static zzazd zza() {
        return zza;
    }
}
