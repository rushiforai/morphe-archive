package com.google.android.libraries.places.internal;

import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.AbstractMap;
import java.util.Objects;

/* loaded from: classes3.dex */
final class zzon extends zznx {
    final /* synthetic */ zzoo zza;

    public zzon(zzoo zzooVar) {
        this.zza = zzooVar;
    }

    @Override // java.util.List
    public final /* bridge */ /* synthetic */ Object get(int i5) {
        zzmt.zza(i5, this.zza.zzc, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX);
        int i11 = i5 + i5;
        Object obj = this.zza.zzb[i11];
        Objects.requireNonNull(obj);
        Object obj2 = this.zza.zzb[i11 + 1];
        Objects.requireNonNull(obj2);
        return new AbstractMap.SimpleImmutableEntry(obj, obj2);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.zza.zzc;
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final boolean zzf() {
        return true;
    }
}
