package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzbui {
    private final String zza;
    private final String zzb;
    private final int zzc;
    private final String zzd;

    public /* synthetic */ zzbui(zzbug zzbugVar, zzbuh zzbuhVar) {
        this.zza = zzbugVar.zza;
        this.zzb = zzbugVar.zzb;
        this.zzc = zzbugVar.zza();
        this.zzd = zzbugVar.toString();
    }

    public static int zza(char c11) {
        if (c11 >= '0' && c11 <= '9') {
            return c11 - '0';
        }
        if (c11 >= 'a' && c11 <= 'f') {
            return c11 - 'W';
        }
        if (c11 < 'A' || c11 > 'F') {
            return -1;
        }
        return c11 - '7';
    }

    public static int zzb(String str) {
        if (str.equals("http")) {
            return 80;
        }
        return str.equals("https") ? 443 : -1;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof zzbui) && ((zzbui) obj).zzd.equals(this.zzd);
    }

    public final int hashCode() {
        return this.zzd.hashCode();
    }

    public final String toString() {
        return this.zzd;
    }

    public final int zzc() {
        return this.zzc;
    }

    public final String zzd() {
        return this.zzb;
    }
}
