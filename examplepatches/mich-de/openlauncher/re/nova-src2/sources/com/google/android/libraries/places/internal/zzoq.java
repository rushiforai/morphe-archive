package com.google.android.libraries.places.internal;

import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.Objects;

/* loaded from: classes3.dex */
final class zzoq extends zznx {
    private final transient Object[] zza;
    private final transient int zzb;
    private final transient int zzc;

    public zzoq(Object[] objArr, int i5, int i11) {
        this.zza = objArr;
        this.zzb = i5;
        this.zzc = i11;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        zzmt.zza(i5, this.zzc, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX);
        Object obj = this.zza[i5 + i5 + this.zzb];
        Objects.requireNonNull(obj);
        return obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final boolean zzf() {
        return true;
    }
}
