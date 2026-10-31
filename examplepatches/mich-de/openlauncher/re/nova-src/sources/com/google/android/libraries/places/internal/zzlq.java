package com.google.android.libraries.places.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.libraries.places.api.model.AutocompleteSessionToken;
import com.google.android.libraries.places.widget.model.AutocompleteActivityMode;

/* loaded from: classes3.dex */
public final class zzlq implements Parcelable {
    public static final Parcelable.Creator<zzlq> CREATOR = new zzlo();
    private final zzkr zza;
    private final AutocompleteActivityMode zzb;
    private final AutocompleteSessionToken zzc;
    private boolean zzd;
    private boolean zze;
    private int zzf;
    private int zzg;
    private int zzh;
    private int zzi;
    private boolean zzj;
    private boolean zzk;
    private String zzl;
    private int zzm;
    private int zzn;
    private boolean zzo;
    private int zzp;
    private long zzq;
    private final zzdv zzr;

    public /* synthetic */ zzlq(Parcel parcel, zzlp zzlpVar) {
        this.zza = (zzkr) parcel.readParcelable(zzkr.class.getClassLoader());
        this.zzb = (AutocompleteActivityMode) parcel.readParcelable(AutocompleteActivityMode.class.getClassLoader());
        this.zzc = (AutocompleteSessionToken) parcel.readParcelable(AutocompleteSessionToken.class.getClassLoader());
        this.zzj = zzC(parcel);
        this.zzd = zzC(parcel);
        this.zze = zzC(parcel);
        this.zzi = parcel.readInt();
        this.zzf = parcel.readInt();
        this.zzg = parcel.readInt();
        this.zzk = zzC(parcel);
        this.zzh = parcel.readInt();
        this.zzl = zznb.zzc(parcel.readString());
        this.zzm = parcel.readInt();
        this.zzn = parcel.readInt();
        this.zzo = zzC(parcel);
        this.zzp = parcel.readInt();
        this.zzq = parcel.readLong();
        this.zzr = new zzdy();
    }

    private final boolean zzB() {
        return this.zzq != -1;
    }

    private static boolean zzC(Parcel parcel) {
        return parcel.readInt() != 0;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeParcelable(this.zza, i5);
        parcel.writeParcelable(this.zzb, i5);
        parcel.writeParcelable(this.zzc, i5);
        parcel.writeInt(this.zzj ? 1 : 0);
        parcel.writeInt(this.zzd ? 1 : 0);
        parcel.writeInt(this.zze ? 1 : 0);
        parcel.writeInt(this.zzi);
        parcel.writeInt(this.zzf);
        parcel.writeInt(this.zzg);
        parcel.writeInt(this.zzk ? 1 : 0);
        parcel.writeInt(this.zzh);
        parcel.writeString(this.zzl);
        parcel.writeInt(this.zzm);
        parcel.writeInt(this.zzn);
        parcel.writeInt(this.zzo ? 1 : 0);
        parcel.writeInt(this.zzp);
        parcel.writeLong(this.zzq);
    }

    public final boolean zzA() {
        return this.zzo;
    }

    public final int zza() {
        return this.zzg;
    }

    public final int zzb() {
        return this.zzf;
    }

    public final int zzc() {
        return this.zzn;
    }

    public final int zzd() {
        return this.zzi;
    }

    public final int zze() {
        return this.zzh;
    }

    public final int zzf() {
        return this.zzp;
    }

    public final int zzg() {
        return this.zzm;
    }

    public final AutocompleteSessionToken zzh() {
        return this.zzc;
    }

    public final zzkr zzi() {
        return this.zza;
    }

    public final AutocompleteActivityMode zzj() {
        return this.zzb;
    }

    public final String zzk() {
        return this.zzl;
    }

    public final void zzl() {
        if (zzB()) {
            return;
        }
        this.zzq = this.zzr.zza();
    }

    public final void zzm() {
        if (zzB()) {
            this.zzp += (int) (this.zzr.zza() - this.zzq);
            this.zzq = -1L;
        }
    }

    public final void zzn() {
        this.zzd = true;
    }

    public final void zzo() {
        if (this.zzd || this.zzk) {
            return;
        }
        this.zze = true;
    }

    public final void zzp() {
        this.zzf++;
    }

    public final void zzq() {
        this.zzk = true;
    }

    public final void zzr() {
        this.zzg++;
    }

    public final void zzs() {
        this.zzh++;
    }

    public final void zzt(String str) {
        this.zzm++;
        this.zzl = str;
    }

    public final void zzu(int i5) {
        this.zzj = true;
        this.zzi = i5;
    }

    public final void zzv() {
        this.zzo = true;
    }

    public final void zzw() {
        this.zzn++;
    }

    public final boolean zzx() {
        return this.zzd;
    }

    public final boolean zzy() {
        return this.zze;
    }

    public final boolean zzz() {
        return this.zzj;
    }

    public zzlq(zzkr zzkrVar, AutocompleteActivityMode autocompleteActivityMode, String str, zzdv zzdvVar) {
        this.zza = zzkrVar;
        this.zzb = autocompleteActivityMode;
        this.zzc = AutocompleteSessionToken.newInstance();
        this.zzl = zznb.zzc(str);
        this.zzi = -1;
        this.zzq = -1L;
        this.zzr = zzdvVar;
    }
}
