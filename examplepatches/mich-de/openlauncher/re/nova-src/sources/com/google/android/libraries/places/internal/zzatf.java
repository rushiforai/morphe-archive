package com.google.android.libraries.places.internal;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes3.dex */
public final class zzatf {
    static final zzatf zza = new zzatf(true);
    private static volatile boolean zzb = false;
    private final Map zzc;

    public zzatf() {
        this.zzc = new HashMap();
    }

    public static zzatf zza() {
        return zza;
    }

    public final zzats zzb(zzavf zzavfVar, int i5) {
        return (zzats) this.zzc.get(new zzate(zzavfVar, i5));
    }

    public zzatf(boolean z11) {
        this.zzc = Collections.EMPTY_MAP;
    }
}
