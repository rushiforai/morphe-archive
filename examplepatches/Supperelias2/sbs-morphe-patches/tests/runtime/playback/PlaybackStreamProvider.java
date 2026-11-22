package com.sbs.ondemand.model.playback;

/** Exact provider type names exercise the runtime reflection boundary. */
public abstract class PlaybackStreamProvider {
    public static final class AkamaiHLSProvider extends PlaybackStreamProvider {}
    public static final class GoogleDAIProvider extends PlaybackStreamProvider {}
}
