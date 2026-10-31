package com.google.android.libraries.places.internal;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* loaded from: classes3.dex */
final class zzbiw implements zzbql {
    public final String toString() {
        return "grpc-default-executor";
    }

    @Override // com.google.android.libraries.places.internal.zzbql
    public final /* bridge */ /* synthetic */ Object zza() {
        return Executors.newCachedThreadPool(zzbjd.zzg("grpc-default-executor-%d", true));
    }

    @Override // com.google.android.libraries.places.internal.zzbql
    public final /* bridge */ /* synthetic */ void zzb(Object obj) {
        ((ExecutorService) obj).shutdown();
    }
}
