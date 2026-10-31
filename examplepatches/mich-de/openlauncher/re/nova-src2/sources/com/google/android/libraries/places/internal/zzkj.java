package com.google.android.libraries.places.internal;

import com.google.android.libraries.places.api.model.LocationBias;
import com.google.android.libraries.places.api.model.LocationRestriction;
import com.google.android.libraries.places.api.model.TypeFilter;
import com.google.android.libraries.places.widget.model.AutocompleteActivityMode;
import java.util.List;

/* loaded from: classes3.dex */
final class zzkj extends zzks {
    private AutocompleteActivityMode zza;
    private zznx zzb;
    private zzkr zzc;
    private String zzd;
    private String zze;
    private LocationBias zzf;
    private LocationRestriction zzg;
    private zznx zzh;
    private TypeFilter zzi;
    private zznx zzj;
    private int zzk;
    private int zzl;
    private String zzm;
    private byte zzn;

    public zzkj() {
    }

    @Override // com.google.android.libraries.places.internal.zzks
    public final zzks zza(List list) {
        this.zzh = zznx.zzj(list);
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzks
    public final zzks zzb(String str) {
        this.zze = str;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzks
    public final zzks zzc(String str) {
        this.zzd = str;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzks
    public final zzks zzd(LocationBias locationBias) {
        this.zzf = locationBias;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzks
    public final zzks zze(LocationRestriction locationRestriction) {
        this.zzg = locationRestriction;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzks
    public final zzks zzf(AutocompleteActivityMode autocompleteActivityMode) {
        if (autocompleteActivityMode == null) {
            throw new NullPointerException("Null mode");
        }
        this.zza = autocompleteActivityMode;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzks
    public final zzks zzg(zzkr zzkrVar) {
        if (zzkrVar == null) {
            throw new NullPointerException("Null origin");
        }
        this.zzc = zzkrVar;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzks
    public final zzks zzh(List list) {
        this.zzb = zznx.zzj(list);
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzks
    public final zzks zzi(int i5) {
        this.zzk = i5;
        this.zzn = (byte) (this.zzn | 1);
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzks
    public final zzks zzj(int i5) {
        this.zzl = i5;
        this.zzn = (byte) (this.zzn | 2);
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzks
    public final zzks zzk(String str) {
        this.zzm = str;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzks
    public final zzks zzl(TypeFilter typeFilter) {
        this.zzi = typeFilter;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzks
    public final zzks zzm(List list) {
        this.zzj = zznx.zzj(list);
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzks
    public final zzkt zzn() {
        AutocompleteActivityMode autocompleteActivityMode;
        zznx zznxVar;
        zzkr zzkrVar;
        zznx zznxVar2;
        zznx zznxVar3;
        if (this.zzn == 3 && (autocompleteActivityMode = this.zza) != null && (zznxVar = this.zzb) != null && (zzkrVar = this.zzc) != null && (zznxVar2 = this.zzh) != null && (zznxVar3 = this.zzj) != null) {
            return new zzkm(autocompleteActivityMode, zznxVar, zzkrVar, this.zzd, this.zze, this.zzf, this.zzg, zznxVar2, this.zzi, zznxVar3, this.zzk, this.zzl, this.zzm);
        }
        StringBuilder sb2 = new StringBuilder();
        if (this.zza == null) {
            sb2.append(" mode");
        }
        if (this.zzb == null) {
            sb2.append(" placeFields");
        }
        if (this.zzc == null) {
            sb2.append(" origin");
        }
        if (this.zzh == null) {
            sb2.append(" countries");
        }
        if (this.zzj == null) {
            sb2.append(" typesFilter");
        }
        if ((this.zzn & 1) == 0) {
            sb2.append(" primaryColor");
        }
        if ((this.zzn & 2) == 0) {
            sb2.append(" primaryColorDark");
        }
        throw new IllegalStateException("Missing required properties:".concat(sb2.toString()));
    }

    public zzkj(zzkt zzktVar) {
        this.zza = zzktVar.zzh();
        this.zzb = zzktVar.zzj();
        this.zzc = zzktVar.zzf();
        this.zzd = zzktVar.zzm();
        this.zze = zzktVar.zzl();
        this.zzf = zzktVar.zzc();
        this.zzg = zzktVar.zzd();
        this.zzh = zzktVar.zzi();
        this.zzi = zzktVar.zze();
        this.zzj = zzktVar.zzk();
        this.zzk = zzktVar.zza();
        this.zzl = zzktVar.zzb();
        this.zzm = zzktVar.zzn();
        this.zzn = (byte) 3;
    }
}
