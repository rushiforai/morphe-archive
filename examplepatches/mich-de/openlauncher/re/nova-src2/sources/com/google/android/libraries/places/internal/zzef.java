package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class zzef {
    private final String zza;

    private zzef(String str) {
        this.zza = str;
    }

    public static zzef zza(zzef zzefVar, zzef... zzefVarArr) {
        return new zzef(zzefVar.zza.concat(zzmh.zzc(b.f42142b).zzf(zzoh.zza(Arrays.asList(zzefVarArr), new zzmd() { // from class: com.google.android.libraries.places.internal.zzee
        }))));
    }

    public static zzef zzb(String str) {
        return new zzef(str);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof zzef) {
            return this.zza.equals(((zzef) obj).zza);
        }
        return false;
    }

    public final int hashCode() {
        return this.zza.hashCode();
    }

    public final String toString() {
        return this.zza;
    }
}
