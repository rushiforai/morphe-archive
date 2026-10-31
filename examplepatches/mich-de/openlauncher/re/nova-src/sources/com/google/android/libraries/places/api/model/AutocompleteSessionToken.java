package com.google.android.libraries.places.api.model;

import android.os.ParcelUuid;
import android.os.Parcelable;
import androidx.annotation.RecentlyNonNull;
import java.util.UUID;

/* loaded from: classes3.dex */
public abstract class AutocompleteSessionToken implements Parcelable {
    @RecentlyNonNull
    public static AutocompleteSessionToken newInstance() {
        return new zzaw(new ParcelUuid(UUID.randomUUID()));
    }

    @RecentlyNonNull
    public final String toString() {
        return zza().toString();
    }

    public abstract ParcelUuid zza();
}
