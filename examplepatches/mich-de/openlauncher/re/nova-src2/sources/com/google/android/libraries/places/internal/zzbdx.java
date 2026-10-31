package com.google.android.libraries.places.internal;

import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
final class zzbdx extends zzazi {
    private static final Logger zzb = Logger.getLogger(zzbdx.class.getName());
    static final ThreadLocal zza = new ThreadLocal();

    @Override // com.google.android.libraries.places.internal.zzazi
    public final zzazj zza() {
        zzazj zzazjVar = (zzazj) zza.get();
        return zzazjVar == null ? zzazj.zzb : zzazjVar;
    }

    @Override // com.google.android.libraries.places.internal.zzazi
    public final zzazj zzb(zzazj zzazjVar) {
        zzazj zzazjVarZza = zza();
        zza.set(zzazjVar);
        return zzazjVarZza;
    }

    @Override // com.google.android.libraries.places.internal.zzazi
    public final void zzc(zzazj zzazjVar, zzazj zzazjVar2) {
        if (zza() != zzazjVar) {
            zzb.logp(Level.SEVERE, "io.grpc.ThreadLocalContextStorage", "detach", "Context was not attached when detaching", new Throwable().fillInStackTrace());
        }
        if (zzazjVar2 != zzazj.zzb) {
            zza.set(zzazjVar2);
        } else {
            zza.set(null);
        }
    }
}
