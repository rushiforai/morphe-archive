package com.google.android.libraries.places.internal;

import com.google.android.gms.maps.model.LatLng;
import com.google.android.libraries.places.api.model.CircularBounds;
import com.google.android.libraries.places.api.model.RectangularBounds;

/* loaded from: classes3.dex */
final class zzge {
    public static final zzamq zza(CircularBounds circularBounds) {
        LatLng center = circularBounds.getCenter();
        zzamp zzampVarZza = zzamq.zza();
        zzaxo zzaxoVarZzf = zzaxp.zzf();
        zzaxoVarZzf.zza(center.f33742f);
        zzaxoVarZzf.zzb(center.f33743g);
        zzampVarZza.zza(zzaxoVarZzf);
        zzampVarZza.zzb(circularBounds.getRadius());
        return (zzamq) zzampVarZza.zzt();
    }

    public static final zzaki zzb(RectangularBounds rectangularBounds) {
        LatLng southwest = rectangularBounds.getSouthwest();
        LatLng northeast = rectangularBounds.getNortheast();
        zzakh zzakhVarZza = zzaki.zza();
        zzaxo zzaxoVarZzf = zzaxp.zzf();
        zzaxoVarZzf.zza(southwest.f33742f);
        zzaxoVarZzf.zzb(southwest.f33743g);
        zzakhVarZza.zzb((zzaxp) zzaxoVarZzf.zzt());
        zzaxo zzaxoVarZzf2 = zzaxp.zzf();
        zzaxoVarZzf2.zza(northeast.f33742f);
        zzaxoVarZzf2.zzb(northeast.f33743g);
        zzakhVarZza.zza((zzaxp) zzaxoVarZzf2.zzt());
        return (zzaki) zzakhVarZza.zzt();
    }
}
