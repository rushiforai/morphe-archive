package app.jimaku.extension.gateway;

import java.util.List;

import app.jimaku.extension.subtitles.Line;

/** The calls that make subtitles, on behalf of this phone's install. Calls block; run them off the main thread. */
public interface Writes {
    StartedJob start(StartRequest request, Cancellation cancellation) throws GatewayException;

    JobStatus job(String id, Cancellation cancellation) throws GatewayException;

    /** Stops the job for this install; with no other install waiting on it, the job ends. */
    StoppedJob stop(String id, Cancellation cancellation) throws GatewayException;

    /** The lines of a running job translated so far, from the video's start; none while there are none. */
    List<Line> partial(String id, Cancellation cancellation) throws GatewayException;

    /** A Standard job's lines, which only the install that asked can read. */
    CaptionResult result(String id, Cancellation cancellation) throws GatewayException;

    /** The lookup past the edge cache, read right after this install's own job finished. */
    Lookup freshLookup(String video, Cancellation cancellation) throws GatewayException;
}
