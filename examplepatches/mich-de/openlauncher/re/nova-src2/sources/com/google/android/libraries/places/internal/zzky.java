package com.google.android.libraries.places.internal;

import b.c0;
import b.u4;
import fi.b;

/* loaded from: classes3.dex */
final class zzky extends zzld {
    private final b zza;
    private final String zzb;

    public zzky(b bVar, String str) {
        this.zza = bVar;
        if (str == null) {
            throw new NullPointerException("Null query");
        }
        this.zzb = str;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof zzld) {
            zzld zzldVar = (zzld) obj;
            if (this.zza.equals(zzldVar.zza()) && this.zzb.equals(zzldVar.zzb())) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return ((this.zza.hashCode() ^ 1000003) * 1000003) ^ this.zzb.hashCode();
    }

    public final String toString() {
        return c0.q(u4.k("AutocompleteRequest{source=", this.zza.toString(), ", query="), this.zzb, "}");
    }

    @Override // com.google.android.libraries.places.internal.zzlg
    public final b zza() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.internal.zzld
    public final String zzb() {
        return this.zzb;
    }
}
