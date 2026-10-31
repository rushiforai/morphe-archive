package com.google.android.libraries.places.internal;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;

/* loaded from: classes3.dex */
final class zzbqb extends zzbpz {
    private final AtomicIntegerFieldUpdater zza;

    public /* synthetic */ zzbqb(AtomicIntegerFieldUpdater atomicIntegerFieldUpdater, zzbqa zzbqaVar) {
        super(null);
        this.zza = atomicIntegerFieldUpdater;
    }

    @Override // com.google.android.libraries.places.internal.zzbpz
    public final void zza(zzbqe zzbqeVar, int i5) {
        this.zza.set(zzbqeVar, 0);
    }

    @Override // com.google.android.libraries.places.internal.zzbpz
    public final boolean zzb(zzbqe zzbqeVar, int i5, int i11) {
        return this.zza.compareAndSet(zzbqeVar, 0, -1);
    }
}
