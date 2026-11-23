package com.eclipse.android.data.models;

/** Kept-name app model for an album, as the catalogue loaders take it. */
public class CanonicalAlbum {
    /**
     * (id, title, artist, artworkURL, releaseYear, trackCount, provider, providerID, releaseDate,
     * genre, copyright, appleMusicAlbumId, isExplicit): the order f3c.v fills it in.
     */
    public CanonicalAlbum(String id, String title, String artist, String artworkURL, String releaseYear, Integer trackCount,
                          String provider, String providerID, String releaseDate, String genre, String copyright,
                          String appleMusicAlbumId, Boolean isExplicit) { }

    public final String getId() { return null; }
    public final String getTitle() { return null; }
    public final String getArtist() { return null; }
    public final String getArtworkURL() { return null; }
    public final String getReleaseDate() { return null; }
    public final Integer getTrackCount() { return null; }
    public final String getGenre() { return null; }
    public final Boolean isExplicit() { return null; }
    public final String getAppleMusicAlbumId() { return null; }
}
