package com.google.android.libraries.places.internal;

import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes3.dex */
public final class zzrz {
    public static final zzrz zza = new zzrz(b.f42142b);
    public static final zzrz zzb = new zzrz("<br>");
    public static final zzrz zzc = new zzrz("<!DOCTYPE html>");
    private final String zzd;

    public zzrz(String str) {
        this.zzd = str;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof zzrz) {
            return this.zzd.equals(((zzrz) obj).zzd);
        }
        return false;
    }

    public final int hashCode() {
        return this.zzd.hashCode() ^ 867184553;
    }

    public final String toString() {
        return c0.q(new StringBuilder("SafeHtml{"), this.zzd, "}");
    }

    public final String zza() {
        return this.zzd;
    }
}
