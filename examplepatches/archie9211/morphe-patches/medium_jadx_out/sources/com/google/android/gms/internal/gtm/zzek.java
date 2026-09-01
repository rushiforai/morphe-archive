package com.google.android.gms.internal.gtm;

import android.text.TextUtils;
import com.drew.imaging.riff.pvS.uuLAxLN;
import defpackage.vp7;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class zzek {
    private final Map zza;
    private final List zzb;
    private final long zzc;
    private final long zzd;
    private final int zze;
    private final boolean zzf;
    private final String zzg;

    public zzek(zzbq zzbqVar, Map map, long j, boolean z, long j2, int i, List list) {
        String strZzb;
        String strZzj;
        String strZzj2;
        vp7.p(zzbqVar);
        vp7.p(map);
        this.zzd = j;
        this.zzf = z;
        this.zzc = j2;
        this.zze = i;
        this.zzb = list != null ? list : Collections.EMPTY_LIST;
        if (list != null) {
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                zzco zzcoVar = (zzco) it2.next();
                if ("appendVersion".equals(zzcoVar.zza())) {
                    strZzb = zzcoVar.zzb();
                    break;
                }
            }
            strZzb = null;
        } else {
            strZzb = null;
        }
        this.zzg = true != TextUtils.isEmpty(strZzb) ? strZzb : null;
        HashMap map2 = new HashMap();
        for (Map.Entry entry : map.entrySet()) {
            if (zzl(entry.getKey()) && (strZzj2 = zzj(zzbqVar, entry.getKey())) != null) {
                map2.put(strZzj2, zzk(zzbqVar, entry.getValue()));
            }
        }
        for (Map.Entry entry2 : map.entrySet()) {
            if (!zzl(entry2.getKey()) && (strZzj = zzj(zzbqVar, entry2.getKey())) != null) {
                map2.put(strZzj, zzk(zzbqVar, entry2.getValue()));
            }
        }
        if (!TextUtils.isEmpty(this.zzg)) {
            zzff.zzg(map2, "_v", this.zzg);
            if (this.zzg.equals("ma4.0.0") || this.zzg.equals("ma4.0.1")) {
                map2.remove("adid");
            }
        }
        this.zza = DesugarCollections.unmodifiableMap(map2);
    }

    private final String zzi(String str, String str2) {
        vp7.n(str);
        vp7.k("Short param name required", !str.startsWith("&"));
        String str3 = (String) this.zza.get(str);
        return str3 != null ? str3 : str2;
    }

    private static String zzj(zzbq zzbqVar, Object obj) {
        if (obj == null) {
            return null;
        }
        String string = obj.toString();
        if (string.startsWith("&")) {
            string = string.substring(1);
        }
        int length = string.length();
        if (length > 256) {
            string = string.substring(0, 256);
            zzbqVar.zzS("Hit param name is too long and will be trimmed", Integer.valueOf(length), string);
        }
        if (TextUtils.isEmpty(string)) {
            return null;
        }
        return string;
    }

    private static String zzk(zzbq zzbqVar, Object obj) {
        String string = obj == null ? "" : obj.toString();
        int length = string.length();
        if (length <= 8192) {
            return string;
        }
        String strSubstring = string.substring(0, 8192);
        zzbqVar.zzS("Hit param value is too long and will be trimmed", Integer.valueOf(length), strSubstring);
        return strSubstring;
    }

    private static boolean zzl(Object obj) {
        if (obj == null) {
            return false;
        }
        return obj.toString().startsWith("&");
    }

    public final int zza() {
        return this.zze;
    }

    public final long zzb() {
        return this.zzc;
    }

    public final long zzc() {
        return zzff.zza(zzi("_s", "0"));
    }

    public final long zzd() {
        return this.zzd;
    }

    public final Map zzg() {
        return this.zza;
    }

    public final boolean zzh() {
        return this.zzf;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ht=");
        sb.append(this.zzd);
        if (this.zzc != 0) {
            sb.append(", dbId=");
            sb.append(this.zzc);
        }
        if (this.zze != 0) {
            sb.append(uuLAxLN.qmE);
            sb.append(this.zze);
        }
        ArrayList arrayList = new ArrayList(this.zza.keySet());
        Collections.sort(arrayList);
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            String str = (String) arrayList.get(i);
            sb.append(", ");
            sb.append(str);
            sb.append("=");
            sb.append((String) this.zza.get(str));
        }
        return sb.toString();
    }
}
