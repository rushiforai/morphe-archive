package com.google.android.libraries.places.internal;

import android.location.Location;
import com.google.android.gms.tasks.Task;
import com.google.android.libraries.places.api.net.FetchPhotoRequest;
import com.google.android.libraries.places.api.net.FetchPlaceRequest;
import com.google.android.libraries.places.api.net.FindAutocompletePredictionsRequest;
import com.google.android.libraries.places.api.net.FindCurrentPlaceRequest;

/* loaded from: classes3.dex */
public interface zzev {
    Task zza(FetchPhotoRequest fetchPhotoRequest, int i5);

    Task zzb(FetchPlaceRequest fetchPlaceRequest, int i5);

    Task zzc(FindAutocompletePredictionsRequest findAutocompletePredictionsRequest, int i5);

    Task zzd(FindCurrentPlaceRequest findCurrentPlaceRequest, Location location, zznx zznxVar, int i5);
}
