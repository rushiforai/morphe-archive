package com.google.android.libraries.places.internal;

import b.c0;
import com.google.android.gms.internal.measurement.k2;

/* loaded from: classes3.dex */
public class zzpr {
    private final String zza;
    private final Class zzb;
    private final boolean zzc;

    public zzpr(String str, Class cls, boolean z11) {
        this(str, cls, z11, true);
    }

    public static zzpr zza(String str, Class cls) {
        return new zzpr(str, cls, false, false);
    }

    public final String toString() {
        Class cls = this.zzb;
        String name = getClass().getName();
        return c0.s(k2.k(name, "/"), this.zza, "[", cls.getName(), "]");
    }

    public final boolean zzb() {
        return this.zzc;
    }

    private zzpr(String str, Class cls, boolean z11, boolean z12) {
        zzrr.zzb(str);
        this.zza = str;
        this.zzb = cls;
        this.zzc = z11;
        for (int i5 = 0; i5 < 5; i5++) {
        }
    }
}
