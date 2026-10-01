package app.spicetify.extension.spotify.localserver;

import java.io.IOException;
import java.util.List;

interface ProviderSession {
    List<RemoteTrack> scan() throws IOException;
    default int skippedTracks() { return 0; }
    int read(RemoteTrack track, long offset, int size, byte[] data) throws IOException;
}
