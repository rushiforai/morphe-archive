package com.google.android.libraries.places.internal;

import java.util.concurrent.atomic.AtomicReference;
import java.util.logging.Level;

/* loaded from: classes3.dex */
final class zzazh {
    static final zzazi zza;

    static {
        zzazi zzbdxVar;
        AtomicReference atomicReference = new AtomicReference();
        try {
            zzbdxVar = (zzazi) Class.forName("io.grpc.override.ContextStorageOverride").asSubclass(zzazi.class).getConstructor(null).newInstance(null);
        } catch (ClassNotFoundException e3) {
            atomicReference.set(e3);
            zzbdxVar = new zzbdx();
        } catch (Exception e11) {
            throw new RuntimeException("Storage override failed to initialize", e11);
        }
        zza = zzbdxVar;
        Throwable th2 = (Throwable) atomicReference.get();
        if (th2 != null) {
            zzazj.zza.logp(Level.FINE, "io.grpc.Context$LazyStorage", "<clinit>", "Storage override doesn't exist. Using default", th2);
        }
    }
}
