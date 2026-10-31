package com.google.android.libraries.places.internal;

import java.util.Arrays;
import java.util.IdentityHashMap;
import java.util.Map;

/* loaded from: classes3.dex */
public final class zzaye {
    public static final zzaye zza;
    private static final IdentityHashMap zzb;
    private final IdentityHashMap zzc;

    static {
        IdentityHashMap identityHashMap = new IdentityHashMap();
        zzb = identityHashMap;
        zza = new zzaye(identityHashMap);
    }

    private zzaye(IdentityHashMap identityHashMap) {
        this.zzc = identityHashMap;
    }

    public static zzayb zza() {
        return new zzayb(zza, null);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || zzaye.class != obj.getClass()) {
            return false;
        }
        zzaye zzayeVar = (zzaye) obj;
        if (this.zzc.size() != zzayeVar.zzc.size()) {
            return false;
        }
        for (Map.Entry entry : this.zzc.entrySet()) {
            if (!zzayeVar.zzc.containsKey(entry.getKey()) || !zzmo.zza(entry.getValue(), zzayeVar.zzc.get(entry.getKey()))) {
                return false;
            }
        }
        return true;
    }

    public final int hashCode() {
        int iHashCode = 0;
        for (Map.Entry entry : this.zzc.entrySet()) {
            iHashCode += Arrays.hashCode(new Object[]{entry.getKey(), entry.getValue()});
        }
        return iHashCode;
    }

    public final String toString() {
        return this.zzc.toString();
    }

    public final zzayb zzb() {
        return new zzayb(this, null);
    }

    public final Object zzc(zzayc zzaycVar) {
        return this.zzc.get(zzaycVar);
    }

    public /* synthetic */ zzaye(IdentityHashMap identityHashMap, zzayd zzaydVar) {
        this.zzc = identityHashMap;
    }
}
