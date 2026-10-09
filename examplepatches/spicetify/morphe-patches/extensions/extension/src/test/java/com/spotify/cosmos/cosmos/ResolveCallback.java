package com.spotify.cosmos.cosmos;

/** Stands in for Spotify's kept {@code ResolveCallback} interface. */
public interface ResolveCallback {
    void onResolved(Response response);

    void onError(Throwable error);
}
