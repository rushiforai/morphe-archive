package com.google.android.libraries.places.api.model;

import android.os.ParcelUuid;

/* loaded from: classes3.dex */
abstract class zzk extends AutocompleteSessionToken {
    private final ParcelUuid zza;

    public zzk(ParcelUuid parcelUuid) {
        if (parcelUuid == null) {
            throw new NullPointerException("Null UUID");
        }
        this.zza = parcelUuid;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof AutocompleteSessionToken) {
            return this.zza.equals(((AutocompleteSessionToken) obj).zza());
        }
        return false;
    }

    public final int hashCode() {
        return this.zza.hashCode() ^ 1000003;
    }

    @Override // com.google.android.libraries.places.api.model.AutocompleteSessionToken
    public final ParcelUuid zza() {
        return this.zza;
    }
}
