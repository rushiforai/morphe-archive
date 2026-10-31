package com.google.android.libraries.places.internal;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/* loaded from: classes3.dex */
final class zzavp {
    private static final zzavp zza = new zzavp();
    private final ConcurrentMap zzc = new ConcurrentHashMap();
    private final zzavu zzb = new zzaux();

    private zzavp() {
    }

    public static zzavp zza() {
        return zza;
    }

    public final zzavt zzb(Class cls) {
        zzaud.zzc(cls, "messageType");
        zzavt zzavtVar = (zzavt) this.zzc.get(cls);
        if (zzavtVar != null) {
            return zzavtVar;
        }
        zzavt zzavtVarZza = this.zzb.zza(cls);
        zzaud.zzc(cls, "messageType");
        zzavt zzavtVar2 = (zzavt) this.zzc.putIfAbsent(cls, zzavtVarZza);
        return zzavtVar2 == null ? zzavtVarZza : zzavtVar2;
    }
}
