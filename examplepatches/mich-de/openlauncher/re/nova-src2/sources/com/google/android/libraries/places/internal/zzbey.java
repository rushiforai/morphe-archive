package com.google.android.libraries.places.internal;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public final class zzbey {
    private final zzbbq zza;
    private final String zzb;

    public zzbey(zzbbq zzbbqVar, String str) {
        zzmt.zzc(zzbbqVar, "registry");
        this.zza = zzbbqVar;
        this.zzb = "pick_first";
    }

    public static /* bridge */ /* synthetic */ zzbbo zza(zzbey zzbeyVar, String str, String str2) throws zzbex {
        zzbbo zzbboVarZza = zzbeyVar.zza.zza("pick_first");
        if (zzbboVarZza != null) {
            return zzbboVarZza;
        }
        throw new zzbex("Trying to load 'pick_first' because using default policy, but it's unavailable", null);
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x003f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final zzbcp zzc(Map map) {
        List<zzbqf> listUnmodifiableList;
        String strZze;
        if (map != null) {
            try {
                ArrayList arrayList = new ArrayList();
                if (map.containsKey("loadBalancingConfig")) {
                    arrayList.addAll(zzbkg.zzh(map, "loadBalancingConfig"));
                }
                if (arrayList.isEmpty() && (strZze = zzbkg.zze(map, "loadBalancingPolicy")) != null) {
                    arrayList.add(Collections.singletonMap(strZze.toLowerCase(Locale.ROOT), Collections.EMPTY_MAP));
                }
                List<Map> listUnmodifiableList2 = Collections.unmodifiableList(arrayList);
                if (listUnmodifiableList2 == null) {
                    listUnmodifiableList = null;
                } else {
                    ArrayList arrayList2 = new ArrayList();
                    for (Map map2 : listUnmodifiableList2) {
                        if (map2.size() != 1) {
                            throw new RuntimeException("There are " + map2.size() + " fields in a LoadBalancingConfig object. Exactly one is expected. Config=" + String.valueOf(map2));
                        }
                        String str = (String) ((Map.Entry) map2.entrySet().iterator().next()).getKey();
                        arrayList2.add(new zzbqf(str, zzbkg.zzj(map2, str)));
                    }
                    listUnmodifiableList = Collections.unmodifiableList(arrayList2);
                }
            } catch (RuntimeException e3) {
                return zzbcp.zzb(zzbdo.zzc.zzg("can't parse load balancer configuration").zzf(e3));
            }
        }
        if (listUnmodifiableList == null || listUnmodifiableList.isEmpty()) {
            return null;
        }
        zzbbq zzbbqVar = this.zza;
        ArrayList arrayList3 = new ArrayList();
        for (zzbqf zzbqfVar : listUnmodifiableList) {
            String strZza = zzbqfVar.zza();
            zzbbo zzbboVarZza = zzbbqVar.zza(strZza);
            if (zzbboVarZza != null) {
                if (!arrayList3.isEmpty()) {
                    Logger.getLogger(zzbqh.class.getName()).logp(Level.FINEST, "io.grpc.internal.ServiceConfigUtil", "selectLbPolicyFromList", "{0} specified by Service Config are not available", arrayList3);
                }
                zzbcp zzbcpVarZzc = zzbboVarZza.zzc(zzbqfVar.zzb());
                return zzbcpVarZzc.zzc() == null ? zzbcp.zza(new zzbqg(zzbboVarZza, zzbcpVarZzc.zzd())) : zzbcpVarZzc;
            }
            arrayList3.add(strZza);
        }
        return zzbcp.zzb(zzbdo.zzc.zzg("None of " + arrayList3.toString() + " specified by Service Config are available."));
    }
}
