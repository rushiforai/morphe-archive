package com.google.android.libraries.places.internal;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: classes3.dex */
final class zzbtw {
    private static final zzbwf zza;
    private static final zzbtt[] zzb;
    private static final Map zzc;

    static {
        zzbwe zzbweVar = zzbwf.zza;
        zza = zzbwe.zza(":");
        zzbtt zzbttVar = new zzbtt(zzbtt.zze, zzbwe.zza(b.f42142b));
        zzbwf zzbwfVar = zzbtt.zzb;
        zzbtt zzbttVar2 = new zzbtt(zzbwfVar, zzbwe.zza("GET"));
        zzbtt zzbttVar3 = new zzbtt(zzbwfVar, zzbwe.zza("POST"));
        zzbwf zzbwfVar2 = zzbtt.zzc;
        zzbtt zzbttVar4 = new zzbtt(zzbwfVar2, zzbwe.zza("/"));
        zzbtt zzbttVar5 = new zzbtt(zzbwfVar2, zzbwe.zza("/index.html"));
        zzbwf zzbwfVar3 = zzbtt.zzd;
        zzbtt zzbttVar6 = new zzbtt(zzbwfVar3, zzbwe.zza("http"));
        zzbtt zzbttVar7 = new zzbtt(zzbwfVar3, zzbwe.zza("https"));
        zzbwf zzbwfVar4 = zzbtt.zza;
        zzb = new zzbtt[]{zzbttVar, zzbttVar2, zzbttVar3, zzbttVar4, zzbttVar5, zzbttVar6, zzbttVar7, new zzbtt(zzbwfVar4, zzbwe.zza("200")), new zzbtt(zzbwfVar4, zzbwe.zza("204")), new zzbtt(zzbwfVar4, zzbwe.zza("206")), new zzbtt(zzbwfVar4, zzbwe.zza("304")), new zzbtt(zzbwfVar4, zzbwe.zza("400")), new zzbtt(zzbwfVar4, zzbwe.zza("404")), new zzbtt(zzbwfVar4, zzbwe.zza("500")), new zzbtt("accept-charset", b.f42142b), new zzbtt("accept-encoding", "gzip, deflate"), new zzbtt("accept-language", b.f42142b), new zzbtt("accept-ranges", b.f42142b), new zzbtt("accept", b.f42142b), new zzbtt("access-control-allow-origin", b.f42142b), new zzbtt(InneractiveMediationDefs.KEY_AGE, b.f42142b), new zzbtt("allow", b.f42142b), new zzbtt("authorization", b.f42142b), new zzbtt("cache-control", b.f42142b), new zzbtt("content-disposition", b.f42142b), new zzbtt("content-encoding", b.f42142b), new zzbtt("content-language", b.f42142b), new zzbtt("content-length", b.f42142b), new zzbtt("content-location", b.f42142b), new zzbtt("content-range", b.f42142b), new zzbtt("content-type", b.f42142b), new zzbtt("cookie", b.f42142b), new zzbtt("date", b.f42142b), new zzbtt("etag", b.f42142b), new zzbtt("expect", b.f42142b), new zzbtt("expires", b.f42142b), new zzbtt("from", b.f42142b), new zzbtt("host", b.f42142b), new zzbtt("if-match", b.f42142b), new zzbtt("if-modified-since", b.f42142b), new zzbtt("if-none-match", b.f42142b), new zzbtt("if-range", b.f42142b), new zzbtt("if-unmodified-since", b.f42142b), new zzbtt("last-modified", b.f42142b), new zzbtt("link", b.f42142b), new zzbtt("location", b.f42142b), new zzbtt("max-forwards", b.f42142b), new zzbtt("proxy-authenticate", b.f42142b), new zzbtt("proxy-authorization", b.f42142b), new zzbtt("range", b.f42142b), new zzbtt("referer", b.f42142b), new zzbtt("refresh", b.f42142b), new zzbtt("retry-after", b.f42142b), new zzbtt("server", b.f42142b), new zzbtt("set-cookie", b.f42142b), new zzbtt("strict-transport-security", b.f42142b), new zzbtt("transfer-encoding", b.f42142b), new zzbtt("user-agent", b.f42142b), new zzbtt("vary", b.f42142b), new zzbtt("via", b.f42142b), new zzbtt("www-authenticate", b.f42142b)};
        LinkedHashMap linkedHashMap = new LinkedHashMap(61);
        int i5 = 0;
        while (true) {
            zzbtt[] zzbttVarArr = zzb;
            int length = zzbttVarArr.length;
            if (i5 >= 61) {
                zzc = Collections.unmodifiableMap(linkedHashMap);
                return;
            } else {
                if (!linkedHashMap.containsKey(zzbttVarArr[i5].zzh)) {
                    linkedHashMap.put(zzbttVarArr[i5].zzh, Integer.valueOf(i5));
                }
                i5++;
            }
        }
    }

    public static /* bridge */ /* synthetic */ zzbwf zzc(zzbwf zzbwfVar) throws IOException {
        int iZzc = zzbwfVar.zzc();
        for (int i5 = 0; i5 < iZzc; i5++) {
            byte bZza = zzbwfVar.zza(i5);
            if (bZza >= 65 && bZza <= 90) {
                throw new IOException("PROTOCOL_ERROR response malformed: mixed case name: ".concat(zzbwfVar.zzf()));
            }
        }
        return zzbwfVar;
    }
}
