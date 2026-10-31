package com.google.android.libraries.places.internal;

import java.util.Collections;
import java.util.Comparator;

/* loaded from: classes3.dex */
public final class zzrp {
    private static final Comparator zza = new zzrh();
    private static final Comparator zzb = new zzri();
    private static final zzrp zzc = new zzrp(new zzrn(Collections.EMPTY_LIST));
    private final zzrn zzd;

    private zzrp(zzrn zzrnVar) {
        this.zzd = zzrnVar;
    }

    public static zzrp zza() {
        return zzc;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof zzrp) && ((zzrp) obj).zzd.equals(this.zzd);
    }

    public final int hashCode() {
        return ~this.zzd.hashCode();
    }

    public final String toString() {
        return this.zzd.toString();
    }
}
