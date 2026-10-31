package com.fyber.inneractive.sdk.external;

/* loaded from: classes3.dex */
public class InneractiveVideoError extends InneractiveError {

    /* renamed from: a, reason: collision with root package name */
    public final Error f28007a;

    /* renamed from: b, reason: collision with root package name */
    public final Throwable f28008b;

    public enum Error {
        ERROR_NO_MEDIA_FILES("ErrorNoMediaFiles", true),
        ERROR_FAILED_PLAYING_MEDIA_FILE("ErrorPlayingMediaFile", false),
        ERROR_FAILED_PLAYING_ALL_MEDIA_FILES("ErrorPlayingAllMediaFile", true),
        ERROR_PRE_BUFFER_TIMEOUT("ErrorPreBufferTimeout", false),
        ERROR_BUFFER_TIMEOUT("ErrorBufferTimeout", false);

        private String errorString;
        private boolean isFatal;

        Error(String str, boolean z11) {
            this.errorString = str;
            this.isFatal = z11;
        }

        public String getErrorString() {
            return this.errorString;
        }

        public boolean isFatal() {
            return this.isFatal;
        }
    }

    public InneractiveVideoError(Error error) {
        this.f28007a = error;
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveError
    public String description() {
        if (this.f28008b == null) {
            return this.f28007a.getErrorString();
        }
        return this.f28007a.getErrorString() + ": " + this.f28008b;
    }

    public Throwable getCause() {
        return this.f28008b;
    }

    public Error getPlayerError() {
        return this.f28007a;
    }

    public InneractiveVideoError(Error error, Throwable th2) {
        this(error);
        this.f28008b = th2;
    }
}
