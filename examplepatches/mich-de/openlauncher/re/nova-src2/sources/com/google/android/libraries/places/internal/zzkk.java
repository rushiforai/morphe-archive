package com.google.android.libraries.places.internal;

import b.c0;
import com.google.android.libraries.places.api.model.LocationBias;
import com.google.android.libraries.places.api.model.LocationRestriction;
import com.google.android.libraries.places.api.model.TypeFilter;
import com.google.android.libraries.places.widget.model.AutocompleteActivityMode;

/* loaded from: classes3.dex */
abstract class zzkk extends zzkt {
    private final AutocompleteActivityMode zza;
    private final zznx zzb;
    private final zzkr zzc;
    private final String zzd;
    private final String zze;
    private final LocationBias zzf;
    private final LocationRestriction zzg;
    private final zznx zzh;
    private final TypeFilter zzi;
    private final zznx zzj;
    private final int zzk;
    private final int zzl;
    private final String zzm;

    public zzkk(AutocompleteActivityMode autocompleteActivityMode, zznx zznxVar, zzkr zzkrVar, String str, String str2, LocationBias locationBias, LocationRestriction locationRestriction, zznx zznxVar2, TypeFilter typeFilter, zznx zznxVar3, int i5, int i11, String str3) {
        if (autocompleteActivityMode == null) {
            throw new NullPointerException("Null mode");
        }
        this.zza = autocompleteActivityMode;
        if (zznxVar == null) {
            throw new NullPointerException("Null placeFields");
        }
        this.zzb = zznxVar;
        if (zzkrVar == null) {
            throw new NullPointerException("Null origin");
        }
        this.zzc = zzkrVar;
        this.zzd = str;
        this.zze = str2;
        this.zzf = locationBias;
        this.zzg = locationRestriction;
        if (zznxVar2 == null) {
            throw new NullPointerException("Null countries");
        }
        this.zzh = zznxVar2;
        this.zzi = typeFilter;
        if (zznxVar3 == null) {
            throw new NullPointerException("Null typesFilter");
        }
        this.zzj = zznxVar3;
        this.zzk = i5;
        this.zzl = i11;
        this.zzm = str3;
    }

    public final boolean equals(Object obj) {
        String str;
        String str2;
        LocationBias locationBias;
        LocationRestriction locationRestriction;
        TypeFilter typeFilter;
        String str3;
        if (obj == this) {
            return true;
        }
        if (obj instanceof zzkt) {
            zzkt zzktVar = (zzkt) obj;
            if (this.zza.equals(zzktVar.zzh()) && this.zzb.equals(zzktVar.zzj()) && this.zzc.equals(zzktVar.zzf()) && ((str = this.zzd) != null ? str.equals(zzktVar.zzm()) : zzktVar.zzm() == null) && ((str2 = this.zze) != null ? str2.equals(zzktVar.zzl()) : zzktVar.zzl() == null) && ((locationBias = this.zzf) != null ? locationBias.equals(zzktVar.zzc()) : zzktVar.zzc() == null) && ((locationRestriction = this.zzg) != null ? locationRestriction.equals(zzktVar.zzd()) : zzktVar.zzd() == null) && this.zzh.equals(zzktVar.zzi()) && ((typeFilter = this.zzi) != null ? typeFilter.equals(zzktVar.zze()) : zzktVar.zze() == null) && this.zzj.equals(zzktVar.zzk()) && this.zzk == zzktVar.zza() && this.zzl == zzktVar.zzb() && ((str3 = this.zzm) != null ? str3.equals(zzktVar.zzn()) : zzktVar.zzn() == null)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = ((((this.zza.hashCode() ^ 1000003) * 1000003) ^ this.zzb.hashCode()) * 1000003) ^ this.zzc.hashCode();
        String str = this.zzd;
        int iHashCode2 = ((iHashCode * 1000003) ^ (str == null ? 0 : str.hashCode())) * 1000003;
        String str2 = this.zze;
        int iHashCode3 = (iHashCode2 ^ (str2 == null ? 0 : str2.hashCode())) * 1000003;
        LocationBias locationBias = this.zzf;
        int iHashCode4 = (iHashCode3 ^ (locationBias == null ? 0 : locationBias.hashCode())) * 1000003;
        LocationRestriction locationRestriction = this.zzg;
        int iHashCode5 = (((iHashCode4 ^ (locationRestriction == null ? 0 : locationRestriction.hashCode())) * 1000003) ^ this.zzh.hashCode()) * 1000003;
        TypeFilter typeFilter = this.zzi;
        int iHashCode6 = (((((((iHashCode5 ^ (typeFilter == null ? 0 : typeFilter.hashCode())) * 1000003) ^ this.zzj.hashCode()) * 1000003) ^ this.zzk) * 1000003) ^ this.zzl) * 1000003;
        String str3 = this.zzm;
        return iHashCode6 ^ (str3 != null ? str3.hashCode() : 0);
    }

    public final String toString() {
        zznx zznxVar = this.zzj;
        TypeFilter typeFilter = this.zzi;
        zznx zznxVar2 = this.zzh;
        LocationRestriction locationRestriction = this.zzg;
        LocationBias locationBias = this.zzf;
        zzkr zzkrVar = this.zzc;
        zznx zznxVar3 = this.zzb;
        String string = this.zza.toString();
        String string2 = zznxVar3.toString();
        String string3 = zzkrVar.toString();
        String strValueOf = String.valueOf(locationBias);
        String strValueOf2 = String.valueOf(locationRestriction);
        String string4 = zznxVar2.toString();
        String strValueOf3 = String.valueOf(typeFilter);
        String string5 = zznxVar.toString();
        StringBuilder sbW = c0.w("AutocompleteOptions{mode=", string, ", placeFields=", string2, ", origin=");
        sbW.append(string3);
        sbW.append(", initialQuery=");
        sbW.append(this.zzd);
        sbW.append(", hint=");
        c0.D(sbW, this.zze, ", locationBias=", strValueOf, ", locationRestriction=");
        c0.D(sbW, strValueOf2, ", countries=", string4, ", typeFilter=");
        c0.D(sbW, strValueOf3, ", typesFilter=", string5, ", primaryColor=");
        sbW.append(this.zzk);
        sbW.append(", primaryColorDark=");
        sbW.append(this.zzl);
        sbW.append(", regionCode=");
        return c0.q(sbW, this.zzm, "}");
    }

    @Override // com.google.android.libraries.places.internal.zzkt
    public final int zza() {
        return this.zzk;
    }

    @Override // com.google.android.libraries.places.internal.zzkt
    public final int zzb() {
        return this.zzl;
    }

    @Override // com.google.android.libraries.places.internal.zzkt
    public final LocationBias zzc() {
        return this.zzf;
    }

    @Override // com.google.android.libraries.places.internal.zzkt
    public final LocationRestriction zzd() {
        return this.zzg;
    }

    @Override // com.google.android.libraries.places.internal.zzkt
    @Deprecated
    public final TypeFilter zze() {
        return this.zzi;
    }

    @Override // com.google.android.libraries.places.internal.zzkt
    public final zzkr zzf() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.internal.zzkt
    public final zzks zzg() {
        return new zzkj(this);
    }

    @Override // com.google.android.libraries.places.internal.zzkt
    public final AutocompleteActivityMode zzh() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.internal.zzkt
    public final zznx zzi() {
        return this.zzh;
    }

    @Override // com.google.android.libraries.places.internal.zzkt
    public final zznx zzj() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.internal.zzkt
    public final zznx zzk() {
        return this.zzj;
    }

    @Override // com.google.android.libraries.places.internal.zzkt
    public final String zzl() {
        return this.zze;
    }

    @Override // com.google.android.libraries.places.internal.zzkt
    public final String zzm() {
        return this.zzd;
    }

    @Override // com.google.android.libraries.places.internal.zzkt
    public final String zzn() {
        return this.zzm;
    }
}
