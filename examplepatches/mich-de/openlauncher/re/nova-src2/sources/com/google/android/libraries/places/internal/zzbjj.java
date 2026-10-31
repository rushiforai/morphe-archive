package com.google.android.libraries.places.internal;

import b.u4;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class zzbjj {
    private final ArrayList zza = new ArrayList();

    public final String toString() {
        return this.zza.toString();
    }

    public final zzbjj zza(Object obj) {
        this.zza.add(obj.toString());
        return this;
    }

    public final zzbjj zzb(String str, Object obj) {
        this.zza.add(u4.m(str, "=", String.valueOf(obj)));
        return this;
    }
}
