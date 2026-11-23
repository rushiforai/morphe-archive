package com.eclipse.android.data.models.addon;

import java.util.List;

/** Kept-name app model for an addon's answer to a search: four parallel lists, each possibly null. */
public class EclipseAddonSearchResponse {
    public final List<EclipseAddonTrack> getTracks() { return null; }
    public final List<EclipseAddonAlbum> getAlbums() { return null; }
    public final List<EclipseAddonArtist> getArtists() { return null; }
    public final List<EclipseAddonPlaylistResult> getPlaylists() { return null; }
}
