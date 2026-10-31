package com.google.android.libraries.places.internal;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
final class zzbpd {
    final boolean zza;
    final List zzb;
    final Collection zzc;
    final Collection zzd;
    final int zze;
    final zzbpm zzf;
    final boolean zzg;
    final boolean zzh;

    public zzbpd(List list, Collection collection, Collection collection2, zzbpm zzbpmVar, boolean z11, boolean z12, boolean z13, int i5) {
        this.zzb = list;
        zzmt.zzc(collection, "drainedSubstreams");
        this.zzc = collection;
        this.zzf = zzbpmVar;
        this.zzd = collection2;
        this.zzg = z11;
        this.zza = z12;
        this.zzh = z13;
        this.zze = i5;
        zzmt.zzp(!z12 || list == null, "passThrough should imply buffer is null");
        zzmt.zzp((z12 && zzbpmVar == null) ? false : true, "passThrough should imply winningSubstream != null");
        zzmt.zzp(!z12 || (collection.size() == 1 && collection.contains(zzbpmVar)) || (collection.size() == 0 && zzbpmVar.zzb), "passThrough should imply winningSubstream is drained");
        zzmt.zzp((z11 && zzbpmVar == null) ? false : true, "cancelled should imply committed");
    }

    public final zzbpd zza(zzbpm zzbpmVar) {
        Collection collectionUnmodifiableCollection;
        zzmt.zzp(!this.zzh, "hedging frozen");
        zzmt.zzp(this.zzf == null, "already committed");
        Collection collection = this.zzd;
        if (collection == null) {
            collectionUnmodifiableCollection = Collections.singleton(zzbpmVar);
        } else {
            ArrayList arrayList = new ArrayList(collection);
            arrayList.add(zzbpmVar);
            collectionUnmodifiableCollection = Collections.unmodifiableCollection(arrayList);
        }
        return new zzbpd(this.zzb, this.zzc, collectionUnmodifiableCollection, this.zzf, this.zzg, this.zza, this.zzh, this.zze + 1);
    }

    public final zzbpd zzb() {
        return this.zzh ? this : new zzbpd(this.zzb, this.zzc, this.zzd, this.zzf, this.zzg, this.zza, true, this.zze);
    }

    public final zzbpd zzc(zzbpm zzbpmVar) {
        Collection collectionUnmodifiableCollection;
        zzmt.zzp(!this.zza, "Already passThrough");
        if (zzbpmVar.zzb) {
            collectionUnmodifiableCollection = this.zzc;
        } else if (this.zzc.isEmpty()) {
            collectionUnmodifiableCollection = Collections.singletonList(zzbpmVar);
        } else {
            ArrayList arrayList = new ArrayList(this.zzc);
            arrayList.add(zzbpmVar);
            collectionUnmodifiableCollection = Collections.unmodifiableCollection(arrayList);
        }
        Collection collection = collectionUnmodifiableCollection;
        zzbpm zzbpmVar2 = this.zzf;
        boolean z11 = zzbpmVar2 != null;
        List list = this.zzb;
        if (z11) {
            zzmt.zzp(zzbpmVar2 == zzbpmVar, "Another RPC attempt has already committed");
            list = null;
        }
        return new zzbpd(list, collection, this.zzd, this.zzf, this.zzg, z11, this.zzh, this.zze);
    }
}
