package com.google.android.libraries.places.internal;

import android.os.Parcelable;
import com.google.android.libraries.places.api.model.LocationBias;
import com.google.android.libraries.places.api.model.LocationRestriction;
import com.google.android.libraries.places.api.model.TypeFilter;
import com.google.android.libraries.places.widget.model.AutocompleteActivityMode;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class zzkt implements Parcelable {
    public static zzks zzo(AutocompleteActivityMode autocompleteActivityMode, List list, zzkr zzkrVar) {
        zzkj zzkjVar = new zzkj();
        zzkjVar.zza(new ArrayList());
        zzkjVar.zzm(new ArrayList());
        zzkjVar.zzf(autocompleteActivityMode);
        zzkjVar.zzh(list);
        zzkjVar.zzg(zzkrVar);
        zzkjVar.zzi(0);
        zzkjVar.zzj(0);
        return zzkjVar;
    }

    public abstract int zza();

    public abstract int zzb();

    public abstract LocationBias zzc();

    public abstract LocationRestriction zzd();

    @Deprecated
    public abstract TypeFilter zze();

    public abstract zzkr zzf();

    public abstract zzks zzg();

    public abstract AutocompleteActivityMode zzh();

    public abstract zznx zzi();

    public abstract zznx zzj();

    public abstract zznx zzk();

    public abstract String zzl();

    public abstract String zzm();

    public abstract String zzn();
}
