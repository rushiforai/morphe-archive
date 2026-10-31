package com.google.android.libraries.places.api.model;

import b.c0;
import java.util.List;

/* loaded from: classes3.dex */
abstract class zzc extends AddressComponents {
    private final List zza;

    public zzc(List list) {
        if (list == null) {
            throw new NullPointerException("Null asList");
        }
        this.zza = list;
    }

    @Override // com.google.android.libraries.places.api.model.AddressComponents
    public final List<AddressComponent> asList() {
        return this.zza;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof AddressComponents) {
            return this.zza.equals(((AddressComponents) obj).asList());
        }
        return false;
    }

    public final int hashCode() {
        return this.zza.hashCode() ^ 1000003;
    }

    public final String toString() {
        return c0.l("AddressComponents{asList=", this.zza.toString(), "}");
    }
}
