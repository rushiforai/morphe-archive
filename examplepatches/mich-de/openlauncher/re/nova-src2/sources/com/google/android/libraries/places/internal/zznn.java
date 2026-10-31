package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes3.dex */
final class zznn extends zznp {
    private static final zznn zzb = new zznn();

    private zznn() {
        super(b.f42142b);
    }

    @Override // com.google.android.libraries.places.internal.zznp
    public final int hashCode() {
        return System.identityHashCode(this);
    }

    public final String toString() {
        return "-∞";
    }

    @Override // com.google.android.libraries.places.internal.zznp, java.lang.Comparable
    /* renamed from: zza */
    public final int compareTo(zznp zznpVar) {
        return zznpVar == this ? 0 : -1;
    }

    @Override // com.google.android.libraries.places.internal.zznp
    public final void zzc(StringBuilder sb2) {
        sb2.append("(-∞");
    }

    @Override // com.google.android.libraries.places.internal.zznp
    public final void zzd(StringBuilder sb2) {
        throw new AssertionError();
    }

    @Override // com.google.android.libraries.places.internal.zznp
    public final boolean zze(Comparable comparable) {
        return true;
    }
}
