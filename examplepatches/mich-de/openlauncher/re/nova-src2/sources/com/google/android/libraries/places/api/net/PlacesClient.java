package com.google.android.libraries.places.api.net;

import androidx.annotation.RecentlyNonNull;
import com.google.android.gms.tasks.Task;

/* loaded from: classes3.dex */
public interface PlacesClient {
    @RecentlyNonNull
    Task<FetchPhotoResponse> fetchPhoto(@RecentlyNonNull FetchPhotoRequest fetchPhotoRequest);

    @RecentlyNonNull
    Task<FetchPlaceResponse> fetchPlace(@RecentlyNonNull FetchPlaceRequest fetchPlaceRequest);

    @RecentlyNonNull
    Task<FetchResolvedPhotoUriResponse> fetchResolvedPhotoUri(@RecentlyNonNull FetchResolvedPhotoUriRequest fetchResolvedPhotoUriRequest);

    @RecentlyNonNull
    Task<FindAutocompletePredictionsResponse> findAutocompletePredictions(@RecentlyNonNull FindAutocompletePredictionsRequest findAutocompletePredictionsRequest);

    @RecentlyNonNull
    Task<FindCurrentPlaceResponse> findCurrentPlace(@RecentlyNonNull FindCurrentPlaceRequest findCurrentPlaceRequest);

    @RecentlyNonNull
    Task<IsOpenResponse> isOpen(@RecentlyNonNull IsOpenRequest isOpenRequest);

    @RecentlyNonNull
    Task<SearchByTextResponse> searchByText(@RecentlyNonNull SearchByTextRequest searchByTextRequest);

    @RecentlyNonNull
    Task<SearchNearbyResponse> searchNearby(@RecentlyNonNull SearchNearbyRequest searchNearbyRequest);

    @RecentlyNonNull
    Task zzb(@RecentlyNonNull FetchPlaceRequest fetchPlaceRequest, int i5);

    @RecentlyNonNull
    Task zzd(@RecentlyNonNull FindAutocompletePredictionsRequest findAutocompletePredictionsRequest, int i5);
}
