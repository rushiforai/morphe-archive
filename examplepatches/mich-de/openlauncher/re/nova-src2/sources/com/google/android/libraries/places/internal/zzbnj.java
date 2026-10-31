package com.google.android.libraries.places.internal;

import java.net.SocketAddress;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
final class zzbnj extends zzbbm {
    private static final Logger zzf = Logger.getLogger(zzbnj.class.getName());
    private final zzbbd zzg;
    private zzbnd zzi;
    private zzbdv zzl;
    private zzaze zzm;
    private zzaze zzn;
    private final boolean zzo;
    private final Map zzh = new HashMap();
    private int zzj = 0;
    private boolean zzk = true;

    public zzbnj(zzbbd zzbbdVar) {
        zzaze zzazeVar = zzaze.IDLE;
        this.zzm = zzazeVar;
        this.zzn = zzazeVar;
        this.zzo = zzbjd.zzj("GRPC_EXPERIMENTAL_XDS_DUALSTACK_ENDPOINTS", true);
        this.zzg = zzbbdVar;
    }

    private final void zzn() {
        zzbdv zzbdvVar = this.zzl;
        if (zzbdvVar != null) {
            zzbdvVar.zza();
            this.zzl = null;
        }
    }

    private final void zzo() {
        if (this.zzo) {
            zzbdv zzbdvVar = this.zzl;
            if (zzbdvVar == null || !zzbdvVar.zzb()) {
                try {
                    zzbdw zzbdwVarZzb = this.zzg.zzb();
                    this.zzl = zzbdwVarZzb.zza(new zzbna(this), 250L, TimeUnit.MILLISECONDS, this.zzg.zzc());
                } catch (NullPointerException unused) {
                }
            }
        }
    }

    private final void zzp(zzaze zzazeVar, zzbbk zzbbkVar) {
        if (zzazeVar == this.zzn && (zzazeVar == zzaze.IDLE || zzazeVar == zzaze.CONNECTING)) {
            return;
        }
        this.zzn = zzazeVar;
        this.zzg.zze(zzazeVar, zzbbkVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzq(zzbni zzbniVar) {
        zzaze zzazeVar = zzbniVar.zzb;
        zzaze zzazeVar2 = zzaze.READY;
        if (zzazeVar != zzazeVar2) {
            return;
        }
        if (zzbni.zzb(zzbniVar) == zzazeVar2) {
            zzp(zzazeVar2, new zzbbc(zzbbe.zzd(zzbniVar.zza, null)));
            return;
        }
        zzaze zzazeVarZzb = zzbni.zzb(zzbniVar);
        zzaze zzazeVar3 = zzaze.TRANSIENT_FAILURE;
        if (zzazeVarZzb == zzazeVar3) {
            zzp(zzazeVar3, new zzbnf(zzbbe.zzb(zzbniVar.zzc.zzb.zzd())));
        } else if (this.zzn != zzazeVar3) {
            zzp(zzbni.zzb(zzbniVar), new zzbnf(zzbbe.zzc()));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static final SocketAddress zzr(zzbbj zzbbjVar) {
        boolean z11;
        zzblx zzblxVar = (zzblx) zzbbjVar;
        zzblxVar.zzj.zzf.zzd();
        zzmt.zzp(zzblxVar.zzg, "not started");
        List list = zzblxVar.zze;
        if (list != null) {
            z11 = list.size() == 1;
        }
        zzmt.zzr(z11, "%s does not have exactly one group", list);
        return (SocketAddress) ((zzazs) list.get(0)).zzb().get(0);
    }

    @Override // com.google.android.libraries.places.internal.zzbbm
    public final zzbdo zza(zzbbi zzbbiVar) {
        zzaze zzazeVar;
        Boolean bool;
        if (this.zzm == zzaze.SHUTDOWN) {
            return zzbdo.zzk.zzg("Already shut down");
        }
        List listZze = zzbbiVar.zze();
        if (listZze.isEmpty()) {
            zzbdo zzbdoVarZzg = zzbdo.zzp.zzg("NameResolver returned no usable address. addrs=" + String.valueOf(zzbbiVar.zze()) + ", attrs=" + zzbbiVar.zza().toString());
            zzb(zzbdoVarZzg);
            return zzbdoVarZzg;
        }
        Iterator it = listZze.iterator();
        while (it.hasNext()) {
            if (((zzazs) it.next()) == null) {
                zzbdo zzbdoVarZzg2 = zzbdo.zzp.zzg("NameResolver returned address list with null endpoint. addrs=" + String.valueOf(zzbbiVar.zze()) + ", attrs=" + zzbbiVar.zza().toString());
                zzb(zzbdoVarZzg2);
                return zzbdoVarZzg2;
            }
        }
        this.zzk = true;
        if ((zzbbiVar.zzd() instanceof zzbne) && (bool = ((zzbne) zzbbiVar.zzd()).zza) != null && bool.booleanValue()) {
            ArrayList arrayList = new ArrayList(listZze);
            Collections.shuffle(arrayList, new Random());
            listZze = arrayList;
        }
        zznu zznuVar = new zznu();
        zznuVar.zzf(listZze);
        zznx zznxVarZzg = zznuVar.zzg();
        zzbnd zzbndVar = this.zzi;
        if (zzbndVar == null) {
            this.zzi = new zzbnd(zznxVarZzg);
        } else if (this.zzm == zzaze.READY) {
            SocketAddress socketAddressZzc = zzbndVar.zzc();
            this.zzi.zze(zznxVarZzg);
            if (this.zzi.zzh(socketAddressZzc)) {
                zzbbj zzbbjVarZze = ((zzbni) this.zzh.get(socketAddressZzc)).zze();
                zzbnd zzbndVar2 = this.zzi;
                zzbbjVarZze.zzd(Collections.singletonList(new zzazs(Collections.singletonList(zzbndVar2.zzc()), zzbndVar2.zzb())));
                return zzbdo.zza;
            }
            this.zzi.zzd();
        } else {
            zzbndVar.zze(zznxVarZzg);
        }
        HashSet hashSet = new HashSet(this.zzh.keySet());
        HashSet hashSet2 = new HashSet();
        int size = zznxVarZzg.size();
        for (int i5 = 0; i5 < size; i5++) {
            hashSet2.addAll(((zzazs) zznxVarZzg.get(i5)).zzb());
        }
        Iterator it2 = hashSet.iterator();
        while (it2.hasNext()) {
            SocketAddress socketAddress = (SocketAddress) it2.next();
            if (!hashSet2.contains(socketAddress)) {
                ((zzbni) this.zzh.remove(socketAddress)).zze().zzb();
            }
        }
        if (hashSet.size() == 0 || (zzazeVar = this.zzm) == zzaze.CONNECTING || zzazeVar == zzaze.READY) {
            zzaze zzazeVar2 = zzaze.CONNECTING;
            this.zzm = zzazeVar2;
            zzp(zzazeVar2, new zzbnf(zzbbe.zzc()));
            zzn();
            zzd();
        } else {
            zzaze zzazeVar3 = zzaze.IDLE;
            if (zzazeVar == zzazeVar3) {
                zzp(zzazeVar3, new zzbnh(this, this));
            } else if (zzazeVar == zzaze.TRANSIENT_FAILURE) {
                zzn();
                zzd();
            }
        }
        return zzbdo.zza;
    }

    @Override // com.google.android.libraries.places.internal.zzbbm
    public final void zzb(zzbdo zzbdoVar) {
        Iterator it = this.zzh.values().iterator();
        while (it.hasNext()) {
            ((zzbni) it.next()).zze().zzb();
        }
        this.zzh.clear();
        zzp(zzaze.TRANSIENT_FAILURE, new zzbnf(zzbbe.zzb(zzbdoVar)));
    }

    @Override // com.google.android.libraries.places.internal.zzbbm
    public final void zzd() {
        final zzbbj zzbbjVarZza;
        zzbnd zzbndVar = this.zzi;
        if (zzbndVar == null || !zzbndVar.zzg() || this.zzm == zzaze.SHUTDOWN) {
            return;
        }
        SocketAddress socketAddressZzc = this.zzi.zzc();
        if (this.zzh.containsKey(socketAddressZzc)) {
            zzbbjVarZza = ((zzbni) this.zzh.get(socketAddressZzc)).zze();
        } else {
            zzaye zzayeVarZzb = this.zzi.zzb();
            zzbnc zzbncVar = new zzbnc(this, null);
            zzbbd zzbbdVar = this.zzg;
            zzbax zzbaxVarZzb = zzbba.zzb();
            zzazs[] zzazsVarArr = {new zzazs(Collections.singletonList(socketAddressZzc), zzayeVarZzb)};
            ArrayList arrayList = new ArrayList(6);
            Collections.addAll(arrayList, zzazsVarArr);
            zzbaxVarZzb.zzb(arrayList);
            zzbaxVarZzb.zza(zzbbm.zzb, zzbncVar);
            zzbbjVarZza = zzbbdVar.zza(zzbaxVarZzb.zzc());
            zzbni zzbniVar = new zzbni(zzbbjVarZza, zzaze.IDLE, zzbncVar);
            zzbncVar.zzc = zzbniVar;
            this.zzh.put(socketAddressZzc, zzbniVar);
            if (((zzblx) zzbbjVarZza).zza.zza().zzc(zzbbm.zzc) == null) {
                zzbncVar.zzb = zzazf.zzb(zzaze.READY);
            }
            zzbbjVarZza.zzc(new zzbbl() { // from class: com.google.android.libraries.places.internal.zzbmz
                @Override // com.google.android.libraries.places.internal.zzbbl
                public final void zza(zzazf zzazfVar) {
                    this.zza.zzm(zzbbjVarZza, zzazfVar);
                }
            });
        }
        int iOrdinal = ((zzbni) this.zzh.get(socketAddressZzc)).zzc().ordinal();
        if (iOrdinal == 0) {
            if (this.zzo) {
                zzo();
                return;
            } else {
                zzbbjVarZza.zza();
                return;
            }
        }
        if (iOrdinal == 1) {
            zzf.logp(Level.WARNING, "io.grpc.internal.PickFirstLeafLoadBalancer", "requestConnection", "Requesting a connection even though we have a READY subchannel");
            return;
        }
        if (iOrdinal == 2) {
            this.zzi.zzf();
            zzd();
        } else {
            if (iOrdinal != 3) {
                return;
            }
            zzbbjVarZza.zza();
            zzbni.zzg((zzbni) this.zzh.get(socketAddressZzc), zzaze.CONNECTING);
            zzo();
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbbm
    public final void zze() {
        zzf.logp(Level.FINE, "io.grpc.internal.PickFirstLeafLoadBalancer", "shutdown", "Shutting down, currently have {} subchannels created", Integer.valueOf(this.zzh.size()));
        zzaze zzazeVar = zzaze.SHUTDOWN;
        this.zzm = zzazeVar;
        this.zzn = zzazeVar;
        zzn();
        Iterator it = this.zzh.values().iterator();
        while (it.hasNext()) {
            ((zzbni) it.next()).zze().zzb();
        }
        this.zzh.clear();
    }

    public final void zzm(zzbbj zzbbjVar, zzazf zzazfVar) {
        zzaze zzazeVarZza = zzazfVar.zza();
        zzbni zzbniVar = (zzbni) this.zzh.get(zzr(zzbbjVar));
        if (zzbniVar == null || zzbniVar.zze() != zzbbjVar || zzazeVarZza == zzaze.SHUTDOWN) {
            return;
        }
        zzaze zzazeVar = zzaze.IDLE;
        if (zzazeVarZza == zzazeVar) {
            this.zzg.zzd();
        }
        zzbni.zzg(zzbniVar, zzazeVarZza);
        zzaze zzazeVar2 = this.zzm;
        zzaze zzazeVar3 = zzaze.TRANSIENT_FAILURE;
        if (zzazeVar2 == zzazeVar3 || this.zzn == zzazeVar3) {
            if (zzazeVarZza == zzaze.CONNECTING) {
                return;
            }
            if (zzazeVarZza == zzazeVar) {
                zzd();
                return;
            }
        }
        int iOrdinal = zzazeVarZza.ordinal();
        if (iOrdinal == 0) {
            zzaze zzazeVar4 = zzaze.CONNECTING;
            this.zzm = zzazeVar4;
            zzp(zzazeVar4, new zzbnf(zzbbe.zzc()));
            return;
        }
        if (iOrdinal == 1) {
            zzn();
            for (zzbni zzbniVar2 : this.zzh.values()) {
                if (!zzbniVar2.zze().equals(zzbniVar.zza)) {
                    zzbniVar2.zze().zzb();
                }
            }
            this.zzh.clear();
            zzaze zzazeVar5 = zzaze.READY;
            zzbni.zzg(zzbniVar, zzazeVar5);
            this.zzh.put(zzr(zzbniVar.zza), zzbniVar);
            this.zzi.zzh(zzr(zzbbjVar));
            this.zzm = zzazeVar5;
            zzq(zzbniVar);
            return;
        }
        if (iOrdinal != 2) {
            if (iOrdinal != 3) {
                throw new IllegalArgumentException("Unsupported state:".concat(zzazeVarZza.toString()));
            }
            this.zzi.zzd();
            this.zzm = zzazeVar;
            zzp(zzazeVar, new zzbnh(this, this));
            return;
        }
        if (this.zzi.zzg() && ((zzbni) this.zzh.get(this.zzi.zzc())).zze() == zzbbjVar && this.zzi.zzf()) {
            zzn();
            zzd();
        }
        zzbnd zzbndVar = this.zzi;
        if (zzbndVar == null || zzbndVar.zzg() || this.zzh.size() < this.zzi.zza()) {
            return;
        }
        Iterator it = this.zzh.values().iterator();
        while (it.hasNext()) {
            if (!((zzbni) it.next()).zzh()) {
                return;
            }
        }
        zzaze zzazeVar6 = zzaze.TRANSIENT_FAILURE;
        this.zzm = zzazeVar6;
        zzp(zzazeVar6, new zzbnf(zzbbe.zzb(zzazfVar.zzd())));
        int i5 = this.zzj + 1;
        this.zzj = i5;
        if (i5 >= this.zzi.zza() || this.zzk) {
            this.zzk = false;
            this.zzj = 0;
            this.zzg.zzd();
        }
    }
}
