package com.google.android.libraries.places.internal;

import java.lang.ref.ReferenceQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
final class zzbmf extends zzbiq {
    private static final ReferenceQueue zza = new ReferenceQueue();
    private static final ConcurrentMap zzb = new ConcurrentHashMap();
    private static final Logger zzc = Logger.getLogger(zzbmf.class.getName());
    private final zzbme zzd;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zzbmf(zzbbr zzbbrVar) {
        super(zzbbrVar);
        ReferenceQueue referenceQueue = zza;
        ConcurrentMap concurrentMap = zzb;
        this.zzd = new zzbme(this, zzbbrVar, referenceQueue, concurrentMap);
    }
}
