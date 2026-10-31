package com.google.android.libraries.places.api.model;

import b.c0;
import java.util.List;

/* loaded from: classes3.dex */
abstract class zzb extends AddressComponent {
    private final String zza;
    private final String zzb;
    private final List zzc;

    public zzb(String str, String str2, List list) {
        if (str == null) {
            throw new NullPointerException("Null name");
        }
        this.zza = str;
        this.zzb = str2;
        if (list == null) {
            throw new NullPointerException("Null types");
        }
        this.zzc = list;
    }

    public final boolean equals(Object obj) {
        String str;
        if (obj == this) {
            return true;
        }
        if (obj instanceof AddressComponent) {
            AddressComponent addressComponent = (AddressComponent) obj;
            if (this.zza.equals(addressComponent.getName()) && ((str = this.zzb) != null ? str.equals(addressComponent.getShortName()) : addressComponent.getShortName() == null) && this.zzc.equals(addressComponent.getTypes())) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.model.AddressComponent
    public final String getName() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.api.model.AddressComponent
    public final String getShortName() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.model.AddressComponent
    public final List<String> getTypes() {
        return this.zzc;
    }

    public final int hashCode() {
        int iHashCode = this.zza.hashCode() ^ 1000003;
        String str = this.zzb;
        return (((iHashCode * 1000003) ^ (str == null ? 0 : str.hashCode())) * 1000003) ^ this.zzc.hashCode();
    }

    public final String toString() {
        String string = this.zzc.toString();
        StringBuilder sb2 = new StringBuilder("AddressComponent{name=");
        sb2.append(this.zza);
        sb2.append(", shortName=");
        return c0.s(sb2, this.zzb, ", types=", string, "}");
    }
}
