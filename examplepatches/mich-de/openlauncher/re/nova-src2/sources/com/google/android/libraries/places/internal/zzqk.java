package com.google.android.libraries.places.internal;

import java.util.Iterator;
import java.util.Set;

/* loaded from: classes3.dex */
public final class zzqk {
    private static final zzqg zza = new zzqi();
    private static final zzqf zzb = new zzqj();

    public static zzqc zza(Set set) {
        zzqc zzqcVar = new zzqc(zza, null);
        zzqcVar.zza(zzb);
        Iterator it = set.iterator();
        while (it.hasNext()) {
            zzqcVar.zzg((zzpr) it.next());
        }
        return zzqcVar;
    }
}
