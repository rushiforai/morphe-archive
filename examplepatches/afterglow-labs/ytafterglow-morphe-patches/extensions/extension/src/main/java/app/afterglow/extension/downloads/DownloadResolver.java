package app.afterglow.extension.downloads;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Network extraction belongs to the host adapter. None of these results are serialized. */
public interface DownloadResolver {
    DownloadCatalog inspect(String videoId, Cancellation cancellation) throws Exception;
    ResolvedDownload resolve(DownloadRequest request, Cancellation cancellation) throws Exception;

    interface Cancellation {
        boolean isCancelled();
        void throwIfCancelled() throws IOException;
    }
    enum Role { VIDEO, AUDIO, CAPTIONS, THUMBNAIL, COMBINED }
    final class Track {
        public final Role role;
        public final String url, identity, mimeType;
        public final Map<String,String> headers;
        public final long expectedBytes;
        /** identity must be stable across URL refresh, including itag/track/language/DRC. */
        public Track(Role role, String url, Map<String,String> headers, String identity,
                     String mimeType, long expectedBytes) {
            this.role=role; this.url=url; this.identity=identity; this.mimeType=mimeType;
            this.headers=Collections.unmodifiableMap(new LinkedHashMap<>(headers == null ? Collections.emptyMap() : headers));
            this.expectedBytes=expectedBytes;
        }
    }
    final class ResolvedDownload {
        public final List<Track> tracks;
        public final String container;
        /** mp4/m4a or webm for media; vtt/srt/txt/jpg/png/webp for direct text/image files. */
        public ResolvedDownload(List<Track> tracks, String container) {
            this.tracks=Collections.unmodifiableList(new ArrayList<>(tracks)); this.container=container;
        }
    }
    /** Safe user-facing errors: do not include URLs, headers, account data, or response bodies. */
    final class Failure extends IOException {
        public enum Category { NETWORK, AUTHENTICATION, UNAVAILABLE, UNSUPPORTED, STORAGE }
        public final Category category;
        public Failure(Category category, String safeMessage) { super(safeMessage); this.category=category; }
    }
}
