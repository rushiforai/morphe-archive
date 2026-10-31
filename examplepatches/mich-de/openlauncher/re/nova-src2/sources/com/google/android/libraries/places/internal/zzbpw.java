package com.google.android.libraries.places.internal;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes3.dex */
public final class zzbpw extends zzbcu {
    private final boolean zza;
    private final zzbey zzb;

    public zzbpw(boolean z11, int i5, int i11, zzbey zzbeyVar) {
        this.zza = z11;
        zzmt.zzc(zzbeyVar, "autoLoadBalancerFactory");
        this.zzb = zzbeyVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbcu
    public final zzbcp zza(Map map) {
        Object objZzd;
        zzbpn zzbpnVar;
        zzbmj zzbmjVar;
        Map mapZzj;
        try {
            zzbcp zzbcpVarZzc = this.zzb.zzc(map);
            zzbmg zzbmgVar = null;
            if (zzbcpVarZzc == null) {
                objZzd = null;
            } else {
                if (zzbcpVarZzc.zzc() != null) {
                    return zzbcp.zzb(zzbcpVarZzc.zzc());
                }
                objZzd = zzbcpVarZzc.zzd();
            }
            boolean z11 = this.zza;
            if (!z11 || map == null || (mapZzj = zzbkg.zzj(map, "retryThrottling")) == null) {
                zzbpnVar = null;
            } else {
                float fFloatValue = zzbkg.zzb(mapZzj, "maxTokens").floatValue();
                float fFloatValue2 = zzbkg.zzb(mapZzj, "tokenRatio").floatValue();
                zzmt.zzp(fFloatValue > 0.0f, "maxToken should be greater than zero");
                zzmt.zzp(fFloatValue2 > 0.0f, "tokenRatio should be greater than zero");
                zzbpnVar = new zzbpn(fFloatValue, fFloatValue2);
            }
            HashMap map2 = new HashMap();
            HashMap map3 = new HashMap();
            Map mapZzj2 = map == null ? null : zzbkg.zzj(map, "healthCheckConfig");
            List<Map> listZzh = zzbkg.zzh(map, "methodConfig");
            if (listZzh == null) {
                zzbmjVar = new zzbmj(null, map2, map3, zzbpnVar, objZzd, mapZzj2);
            } else {
                for (Map map4 : listZzh) {
                    zzbmg zzbmgVar2 = new zzbmg(map4, z11, 5, 5);
                    List<Map> listZzh2 = zzbkg.zzh(map4, PendingUpgradeStore.KEY_NAME);
                    if (listZzh2 != null && !listZzh2.isEmpty()) {
                        for (Map map5 : listZzh2) {
                            String strZze = zzbkg.zze(map5, "service");
                            String strZze2 = zzbkg.zze(map5, "method");
                            if (zznb.zzd(strZze)) {
                                zzmt.zzj(zznb.zzd(strZze2), "missing service name for method %s", strZze2);
                                zzmt.zzj(zzbmgVar == null, "Duplicate default method config in service config %s", map);
                                zzbmgVar = zzbmgVar2;
                            } else if (zznb.zzd(strZze2)) {
                                zzmt.zzj(!map3.containsKey(strZze), "Duplicate service %s", strZze);
                                map3.put(strZze, zzbmgVar2);
                            } else {
                                String strZze3 = zzbcl.zze(strZze, strZze2);
                                zzmt.zzj(!map2.containsKey(strZze3), "Duplicate method name %s", strZze3);
                                map2.put(strZze3, zzbmgVar2);
                            }
                        }
                    }
                }
                zzbmjVar = new zzbmj(zzbmgVar, map2, map3, zzbpnVar, objZzd, mapZzj2);
            }
            return zzbcp.zza(zzbmjVar);
        } catch (RuntimeException e3) {
            return zzbcp.zzb(zzbdo.zzc.zzg("failed to parse service config").zzf(e3));
        }
    }
}
