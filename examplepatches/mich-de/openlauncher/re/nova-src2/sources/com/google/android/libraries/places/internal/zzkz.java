package com.google.android.libraries.places.internal;

import b.c0;
import b.u4;
import fi.b;

/* loaded from: classes3.dex */
final class zzkz extends zzle {
    private final b zza;
    private final String zzb;

    public zzkz(b bVar, String str) {
        this.zza = bVar;
        if (str == null) {
            throw new NullPointerException("Null placeId");
        }
        this.zzb = str;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof zzle) {
            zzle zzleVar = (zzle) obj;
            if (this.zza.equals(zzleVar.zza()) && this.zzb.equals(zzleVar.zzb())) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return ((this.zza.hashCode() ^ 1000003) * 1000003) ^ this.zzb.hashCode();
    }

    public final String toString() {
        return c0.q(u4.k("PlaceRequest{source=", this.zza.toString(), ", placeId="), this.zzb, "}");
    }

    @Override // com.google.android.libraries.places.internal.zzlg
    public final b zza() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.internal.zzle
    public final String zzb() {
        return this.zzb;
    }
}
