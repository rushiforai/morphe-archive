package dev.brave.extension.media;

public enum MediaType {
    VIDEO,
    AUDIO,
    HLS_STREAM,
    DASH_STREAM,
    IMAGE;

    public boolean isStream() {
        return this == HLS_STREAM || this == DASH_STREAM;
    }

    public boolean isMediaStreamOrVideo() {
        return this == VIDEO || this == AUDIO || this == HLS_STREAM || this == DASH_STREAM;
    }

    public boolean isImage() {
        return this == IMAGE;
    }
}
