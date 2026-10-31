package com.google.android.libraries.places.internal;

import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public final class zzbux {
    static final zzayh zza;
    private static final Logger zzb = Logger.getLogger(zzbux.class.getName());

    static {
        if (!zznb.zzd(System.getenv("GRPC_CLIENT_CALL_REJECT_RUNNABLE"))) {
            System.getenv("GRPC_CLIENT_CALL_REJECT_RUNNABLE");
        }
        zza = zzayh.zza("internal-stub-type");
    }

    private zzbux() {
    }

    public static zzaka zza(zzayo zzayoVar, Object obj) {
        zzbus zzbusVar = new zzbus(zzayoVar);
        zzc(zzayoVar, obj, new zzbuw(zzbusVar));
        return zzbusVar;
    }

    private static RuntimeException zzb(zzayo zzayoVar, Throwable th2) {
        try {
            zzayoVar.zza(null, th2);
        } catch (Error | RuntimeException e3) {
            zzb.logp(Level.SEVERE, "io.grpc.stub.ClientCalls", "cancelThrow", "RuntimeException encountered while closing call", e3);
        }
        if (th2 instanceof RuntimeException) {
            throw ((RuntimeException) th2);
        }
        if (th2 instanceof Error) {
            throw ((Error) th2);
        }
        throw new AssertionError(th2);
    }

    private static void zzc(zzayo zzayoVar, Object obj, zzbuu zzbuuVar) {
        zzayoVar.zze(zzbuuVar, new zzbcf());
        zzbuuVar.zze();
        try {
            zzayoVar.zzd(obj);
            zzayoVar.zzb();
        } catch (Error | RuntimeException e3) {
            throw zzb(zzayoVar, e3);
        }
    }
}
