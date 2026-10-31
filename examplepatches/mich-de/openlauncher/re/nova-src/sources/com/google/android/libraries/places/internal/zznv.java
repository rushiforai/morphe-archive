package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zznv extends zzni {
    private final zznx zza;

    public zznv(zznx zznxVar, int i5) {
        super(zznxVar.size(), i5);
        this.zza = zznxVar;
    }

    @Override // com.google.android.libraries.places.internal.zzni
    public final Object zza(int i5) {
        return this.zza.get(i5);
    }
}
