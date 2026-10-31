package com.google.android.libraries.places.internal;

import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.Objects;

/* loaded from: classes3.dex */
final class zzom extends zznx {
    static final zznx zza = new zzom(new Object[0], 0);
    final transient Object[] zzb;
    private final transient int zzc;

    public zzom(Object[] objArr, int i5) {
        this.zzb = objArr;
        this.zzc = i5;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        zzmt.zza(i5, this.zzc, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX);
        Object obj = this.zzb[i5];
        Objects.requireNonNull(obj);
        return obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.internal.zznx, com.google.android.libraries.places.internal.zznt
    public final int zza(Object[] objArr, int i5) {
        System.arraycopy(this.zzb, 0, objArr, i5, this.zzc);
        return i5 + this.zzc;
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final int zzb() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final int zzc() {
        return 0;
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final boolean zzf() {
        return false;
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final Object[] zzg() {
        return this.zzb;
    }
}
