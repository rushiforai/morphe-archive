package app.wordfeudwordfinder.extension.words;

import app.wordfeudwordfinder.extension.core.WfError;

/** Downloads a whole resource into memory. Implementations never log the content. */
public interface HttpFetcher {

    /** Download progress; {@code total} is -1 when the length is unknown. */
    interface ProgressListener {
        void onProgress(long read, long total);
    }

    /**
     * Fetches {@code url}. Throws {@link WfError#wlHttp} for a status outside 2xx and {@link WfError#wlNet} for
     * connection problems and time-outs. {@code progress} may be null.
     */
    byte[] fetch(String url, ProgressListener progress) throws WfError;

    default byte[] fetch(String url) throws WfError {
        return fetch(url, null);
    }
}
