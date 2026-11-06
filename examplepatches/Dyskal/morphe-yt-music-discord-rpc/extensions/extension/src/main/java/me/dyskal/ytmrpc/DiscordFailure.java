package me.dyskal.ytmrpc;

import java.io.IOException;

/** Only controlled, credential-free messages cross the network/UI boundary. */
public final class DiscordFailure extends IOException {
    public enum Kind { AUTHORIZATION, CONFIGURATION, TRANSIENT, CANCELLED, STORAGE, PROTOCOL }
    public final Kind kind;
    public final int httpStatus;
    public final long retryAfterMillis;

    public DiscordFailure(Kind kind, String message) { this(kind, message, 0, 0); }
    public DiscordFailure(Kind kind, String message, int httpStatus, long retryAfterMillis) {
        super(message);
        this.kind = kind;
        this.httpStatus = httpStatus;
        this.retryAfterMillis = retryAfterMillis;
    }

    public boolean isRetryable() { return kind == Kind.TRANSIENT; }

    public static DiscordFailure network(Throwable error) {
        return new DiscordFailure(Kind.TRANSIENT, "Network request failed (" + error.getClass().getSimpleName() + ")");
    }

    public static String describe(Throwable error) {
        return error instanceof DiscordFailure ? error.getMessage() : "Operation failed (" + error.getClass().getSimpleName() + ")";
    }
}
