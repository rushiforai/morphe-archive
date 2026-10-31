package com.google.android.libraries.places.internal;

import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;

/* loaded from: classes3.dex */
public abstract class zzbji {
    private final Set zza = Collections.newSetFromMap(new IdentityHashMap());

    public abstract void zza();

    public abstract void zzb();

    public final void zzc(Object obj, boolean z11) {
        int size = this.zza.size();
        if (z11) {
            this.zza.add(obj);
            if (size == 0) {
                zza();
                return;
            }
            return;
        }
        if (this.zza.remove(obj) && size == 1) {
            zzb();
        }
    }

    public final boolean zzd(Object... objArr) {
        for (int i5 = 0; i5 < 2; i5++) {
            if (this.zza.contains(objArr[i5])) {
                return true;
            }
        }
        return false;
    }

    public final boolean zze() {
        return !this.zza.isEmpty();
    }
}
