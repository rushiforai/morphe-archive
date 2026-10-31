package com.google.android.libraries.places.internal;

import java.nio.charset.Charset;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class zzazq {
    static final zzmh zza = zzmh.zzb(AbstractJsonLexerKt.COMMA);
    private static final zzazq zzb = new zzazq(zzaza.zza, false, new zzazq(new zzayz(), true, new zzazq()));
    private final Map zzc;
    private final byte[] zzd;

    private zzazq() {
        this.zzc = new LinkedHashMap(0);
        this.zzd = new byte[0];
    }

    public static zzazq zzb() {
        return zzb;
    }

    public final zzazo zza(String str) {
        zzazp zzazpVar = (zzazp) this.zzc.get(str);
        if (zzazpVar != null) {
            return zzazpVar.zza;
        }
        return null;
    }

    public final byte[] zzc() {
        return this.zzd;
    }

    private zzazq(zzazo zzazoVar, boolean z11, zzazq zzazqVar) {
        String strZzb = zzazoVar.zzb();
        zzmt.zzf(!strZzb.contains(","), "Comma is currently not allowed in message encoding");
        int size = zzazqVar.zzc.size();
        LinkedHashMap linkedHashMap = new LinkedHashMap(zzazqVar.zzc.containsKey(zzazoVar.zzb()) ? size : size + 1);
        for (zzazp zzazpVar : zzazqVar.zzc.values()) {
            String strZzb2 = zzazpVar.zza.zzb();
            if (!strZzb2.equals(strZzb)) {
                linkedHashMap.put(strZzb2, new zzazp(zzazpVar.zza, zzazpVar.zzb));
            }
        }
        linkedHashMap.put(strZzb, new zzazp(zzazoVar, z11));
        Map mapUnmodifiableMap = Collections.unmodifiableMap(linkedHashMap);
        this.zzc = mapUnmodifiableMap;
        zzmh zzmhVar = zza;
        HashSet hashSet = new HashSet(mapUnmodifiableMap.size());
        for (Map.Entry entry : mapUnmodifiableMap.entrySet()) {
            if (((zzazp) entry.getValue()).zzb) {
                hashSet.add((String) entry.getKey());
            }
        }
        this.zzd = zzmhVar.zzf(Collections.unmodifiableSet(hashSet)).getBytes(Charset.forName("US-ASCII"));
    }
}
