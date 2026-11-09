package nl.johninnl.navigation.alerts;

import java.io.IOException;

/** Blocking provider-private durability boundary; invoke only on the source's dedicated owner worker. */
public interface PlaybackStore {
    PlaybackGrant load() throws IOException;
    /** Atomically persist a possible-output grant, or null after verified quiescence. */
    void save(PlaybackGrant grant) throws IOException;
}
