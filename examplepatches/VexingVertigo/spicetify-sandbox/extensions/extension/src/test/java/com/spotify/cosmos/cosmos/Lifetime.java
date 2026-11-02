package com.spotify.cosmos.cosmos;

/** Stands in for Spotify's kept {@code Lifetime} interface. */
public interface Lifetime {
    void release();
}
