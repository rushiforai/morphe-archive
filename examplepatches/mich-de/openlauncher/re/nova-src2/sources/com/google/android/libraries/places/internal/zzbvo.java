package com.google.android.libraries.places.internal;

import java.util.Map;

/* loaded from: classes3.dex */
public final class zzbvo extends zzbbo {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f34002a = 0;

    @Override // com.google.android.libraries.places.internal.zzbbb
    public final zzbbm zza(zzbbd zzbbdVar) {
        return new zzbvn(zzbbdVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbbo
    public final int zzb() {
        return 5;
    }

    @Override // com.google.android.libraries.places.internal.zzbbo
    public final zzbcp zzc(Map map) {
        return zzbcp.zza("no service config");
    }

    @Override // com.google.android.libraries.places.internal.zzbbo
    public final String zzd() {
        return "round_robin";
    }

    @Override // com.google.android.libraries.places.internal.zzbbo
    public final boolean zze() {
        return true;
    }
}
