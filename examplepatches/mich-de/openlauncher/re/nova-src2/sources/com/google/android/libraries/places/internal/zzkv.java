package com.google.android.libraries.places.internal;

import com.google.android.gms.common.api.Status;
import com.google.android.libraries.places.api.model.AutocompletePrediction;
import com.google.android.libraries.places.api.model.Place;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class zzkv {
    public static zzkv zzg() {
        return zzr(3).zzf();
    }

    public static zzkv zzh(String str) {
        str.getClass();
        zzku zzkuVarZzr = zzr(6);
        zzkuVarZzr.zzd(str);
        return zzkuVarZzr.zzf();
    }

    public static zzkv zzi(String str, Status status) {
        str.getClass();
        status.getClass();
        zzku zzkuVarZzr = zzr(7);
        zzkuVarZzr.zzd(str);
        zzkuVarZzr.zze(status);
        return zzkuVarZzr.zzf();
    }

    public static zzkv zzj(List list) {
        list.getClass();
        zzku zzkuVarZzr = zzr(5);
        zzkuVarZzr.zzc(list);
        return zzkuVarZzr.zzf();
    }

    public static zzkv zzk() {
        return zzr(2).zzf();
    }

    public static zzkv zzl() {
        zzku zzkuVarZzr = zzr(10);
        zzkuVarZzr.zze(new Status(16, null, null, null));
        return zzkuVarZzr.zzf();
    }

    public static zzkv zzm(AutocompletePrediction autocompletePrediction, Status status) {
        status.getClass();
        zzku zzkuVarZzr = zzr(9);
        zzkuVarZzr.zzb(autocompletePrediction);
        zzkuVarZzr.zze(status);
        return zzkuVarZzr.zzf();
    }

    public static zzkv zzn(Place place) {
        place.getClass();
        zzku zzkuVarZzr = zzr(8);
        zzkuVarZzr.zza(place);
        return zzkuVarZzr.zzf();
    }

    public static zzkv zzo() {
        return zzr(1).zzf();
    }

    public static zzkv zzp() {
        return zzr(4).zzf();
    }

    public static zzkv zzq(Status status) {
        status.getClass();
        zzku zzkuVarZzr = zzr(10);
        zzkuVarZzr.zze(status);
        return zzkuVarZzr.zzf();
    }

    private static zzku zzr(int i5) {
        zzkn zzknVar = new zzkn();
        zzknVar.zzg(i5);
        return zzknVar;
    }

    public abstract Status zza();

    public abstract AutocompletePrediction zzb();

    public abstract Place zzc();

    public abstract zznx zzd();

    public abstract String zze();

    public abstract int zzf();
}
