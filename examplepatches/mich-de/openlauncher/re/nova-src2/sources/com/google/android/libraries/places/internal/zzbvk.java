package com.google.android.libraries.places.internal;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public abstract class zzbvk extends zzbbm {
    private static final Logger zzi = Logger.getLogger(zzbvk.class.getName());
    protected boolean zzf;
    protected zzaze zzh;
    private final zzbbd zzk;
    private final Map zzj = new LinkedHashMap();
    protected final zzbbo zzg = new zzbnq();

    public zzbvk(zzbbd zzbbdVar) {
        this.zzk = zzbbdVar;
        zzi.logp(Level.FINE, "io.grpc.util.MultiChildLoadBalancer", "<init>", "Created");
    }

    @Override // com.google.android.libraries.places.internal.zzbbm
    public final zzbdo zza(zzbbi zzbbiVar) {
        zzbdo zzbdoVarZzg;
        zzbvj zzbvjVar;
        zzazs zzazsVar;
        try {
            this.zzf = true;
            zzi.logp(Level.FINE, "io.grpc.util.MultiChildLoadBalancer", "acceptResolvedAddressesInternal", "Received resolution result: {0}", zzbbiVar);
            HashMap map = new HashMap();
            Iterator it = zzbbiVar.zze().iterator();
            while (it.hasNext()) {
                zzbvj zzbvjVar2 = new zzbvj((zzazs) it.next());
                zzbvi zzbviVar = (zzbvi) this.zzj.get(zzbvjVar2);
                if (zzbviVar != null) {
                    map.put(zzbvjVar2, zzbviVar);
                } else {
                    map.put(zzbvjVar2, new zzbvi(this, zzbvjVar2, this.zzg, null, new zzbbc(zzbbe.zzc()), null, false));
                }
            }
            ArrayList arrayList = null;
            if (map.isEmpty()) {
                zzbdoVarZzg = zzbdo.zzp.zzg("NameResolver returned no usable address. ".concat(zzbbiVar.toString()));
                zzb(zzbdoVarZzg);
            } else {
                ArrayList arrayList2 = new ArrayList();
                for (Map.Entry entry : map.entrySet()) {
                    Object key = entry.getKey();
                    if (this.zzj.containsKey(key)) {
                        zzbvi zzbviVar2 = (zzbvi) this.zzj.get(key);
                        if (zzbviVar2.zzm()) {
                            arrayList2.add(zzbviVar2);
                        }
                    } else {
                        this.zzj.put(key, (zzbvi) entry.getValue());
                    }
                }
                Iterator it2 = arrayList2.iterator();
                while (it2.hasNext()) {
                    zzbvi zzbviVar3 = (zzbvi) it2.next();
                    zzbviVar3.zzi(zzbviVar3.zzc());
                }
                for (Map.Entry entry2 : map.entrySet()) {
                    zzbvi zzbviVar4 = (zzbvi) this.zzj.get(entry2.getKey());
                    Object key2 = entry2.getKey();
                    if (key2 instanceof zzazs) {
                        zzbvjVar = new zzbvj((zzazs) key2);
                    } else {
                        zzmt.zzf(key2 instanceof zzbvj, "key is wrong type");
                        zzbvjVar = (zzbvj) key2;
                    }
                    Iterator it3 = zzbbiVar.zze().iterator();
                    while (true) {
                        if (!it3.hasNext()) {
                            zzazsVar = null;
                            break;
                        }
                        zzazsVar = (zzazs) it3.next();
                        if (zzbvjVar.equals(new zzbvj(zzazsVar))) {
                            break;
                        }
                    }
                    zzmt.zzc(zzazsVar, String.valueOf(key2).concat(" no longer present in load balancer children"));
                    zzbbg zzbbgVarZzc = zzbbiVar.zzc();
                    zzbbgVarZzc.zza(Collections.singletonList(zzazsVar));
                    zzayb zzaybVarZza = zzaye.zza();
                    zzaybVarZza.zzb(zzbbm.zzd, Boolean.TRUE);
                    zzbbgVarZzc.zzb(zzaybVarZza.zzc());
                    zzbbgVarZzc.zzc(null);
                    zzbbi zzbbiVarZzd = zzbbgVarZzc.zzd();
                    zzbviVar4.zzj(zzbbiVarZzd);
                    if (!zzbviVar4.zzh) {
                        zzbviVar4.zzd.zzg().zzc(zzbbiVarZzd);
                    }
                }
                zzbdoVarZzg = zzbdo.zza;
                Set setKeySet = map.keySet();
                arrayList = new ArrayList();
                zznx zznxVarZzj = zznx.zzj(this.zzj.keySet());
                int size = zznxVarZzj.size();
                for (int i5 = 0; i5 < size; i5++) {
                    Object obj = zznxVarZzj.get(i5);
                    if (!setKeySet.contains(obj)) {
                        zzbvi zzbviVar5 = (zzbvi) this.zzj.get(obj);
                        zzbviVar5.zzh();
                        arrayList.add(zzbviVar5);
                    }
                }
            }
            if (zzbdoVarZzg.zzl()) {
                zzl();
                Iterator it4 = arrayList.iterator();
                while (it4.hasNext()) {
                    ((zzbvi) it4.next()).zzk();
                }
            }
            return zzbdoVarZzg;
        } finally {
            this.zzf = false;
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbbm
    public final void zzb(zzbdo zzbdoVar) {
        if (this.zzh != zzaze.READY) {
            this.zzk.zze(zzaze.TRANSIENT_FAILURE, new zzbbc(zzbbe.zzb(zzbdoVar)));
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbbm
    public final void zze() {
        zzi.logp(Level.FINE, "io.grpc.util.MultiChildLoadBalancer", "shutdown", "Shutdown");
        Iterator it = this.zzj.values().iterator();
        while (it.hasNext()) {
            ((zzbvi) it.next()).zzk();
        }
        this.zzj.clear();
    }

    public final zzbbd zzh() {
        return this.zzk;
    }

    public final Collection zzi() {
        return this.zzj.values();
    }

    public abstract void zzl();
}
