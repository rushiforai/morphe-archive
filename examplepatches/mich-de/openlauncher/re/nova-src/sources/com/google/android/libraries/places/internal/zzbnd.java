package com.google.android.libraries.places.internal;

import java.net.SocketAddress;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
final class zzbnd {
    private List zza;
    private int zzb;
    private int zzc;

    public zzbnd(List list) {
        this.zza = list == null ? Collections.EMPTY_LIST : list;
    }

    public final int zza() {
        List list = this.zza;
        if (list != null) {
            return list.size();
        }
        return 0;
    }

    public final zzaye zzb() {
        if (zzg()) {
            return ((zzazs) this.zza.get(this.zzb)).zza();
        }
        throw new IllegalStateException("Index is off the end of the address group list");
    }

    public final SocketAddress zzc() {
        if (zzg()) {
            return (SocketAddress) ((zzazs) this.zza.get(this.zzb)).zzb().get(this.zzc);
        }
        throw new IllegalStateException("Index is past the end of the address group list");
    }

    public final void zzd() {
        this.zzb = 0;
        this.zzc = 0;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v2, types: [java.util.List] */
    public final void zze(zznx zznxVar) {
        zznx zznxVar2 = zznxVar;
        if (zznxVar == null) {
            zznxVar2 = Collections.EMPTY_LIST;
        }
        this.zza = zznxVar2;
        zzd();
    }

    public final boolean zzf() {
        if (!zzg()) {
            return false;
        }
        zzazs zzazsVar = (zzazs) this.zza.get(this.zzb);
        int i5 = this.zzc + 1;
        this.zzc = i5;
        if (i5 < zzazsVar.zzb().size()) {
            return true;
        }
        int i11 = this.zzb + 1;
        this.zzb = i11;
        this.zzc = 0;
        return i11 < this.zza.size();
    }

    public final boolean zzg() {
        return this.zzb < this.zza.size();
    }

    public final boolean zzh(SocketAddress socketAddress) {
        for (int i5 = 0; i5 < this.zza.size(); i5++) {
            int iIndexOf = ((zzazs) this.zza.get(i5)).zzb().indexOf(socketAddress);
            if (iIndexOf != -1) {
                this.zzb = i5;
                this.zzc = iIndexOf;
                return true;
            }
        }
        return false;
    }
}
