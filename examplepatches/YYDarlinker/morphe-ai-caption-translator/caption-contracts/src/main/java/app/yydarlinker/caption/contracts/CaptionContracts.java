package app.yydarlinker.caption.contracts;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Locale;
import java.util.Objects;

/** Shared action, source-format marker and hashing contracts. */
public final class CaptionContracts {
    private CaptionContracts() {}

    public enum SpeakerBoundaryKind {
        OPEN,
        CLOSE,
        CARRY
    }

    /** Explicit source-format event, not an acoustic speaker identification or speech token. */
    public static final class SpeakerMarker {
        public final int offsetUtf16;
        public final String label, rawMarkup;
        public final SpeakerBoundaryKind kind;

        public SpeakerMarker(int offset, String label, String rawMarkup, SpeakerBoundaryKind kind) {
            if (offset < 0) throw new IllegalArgumentException("invalid_speaker_offset");
            offsetUtf16 = offset;
            this.label = Objects.requireNonNull(label);
            this.rawMarkup = Objects.requireNonNull(rawMarkup);
            this.kind = Objects.requireNonNull(kind);
        }
    }

    public enum Action {
        CONFIGURATION,
        APPEARANCE,
        UI_LOCALE,
        CLEAR_CACHE,
        DEACTIVATE,
        ACTIVATE,
        SOURCE,
        PLAYER_TYPE,
        VIDEO,
        POSITION_RESET,
        RECOVER,
        SOURCE_CATALOG,
        PREWARM
    }

    /**
     * UI dependency. An independent fake can replace this without core/provider/Android imports.
     */
    public interface CaptionPort {
        void command(Action action, String value);

        boolean active();

        boolean ownsNativeTrack();

        String restoreTarget(String url);

        String videoId();

        void playback(long mediaTimeMs);
    }

    public static String hash(String value) {
        return hashBytes(value.getBytes(StandardCharsets.UTF_8));
    }

    public static String hashBytes(byte[] value) {
        try {
            byte[] d = MessageDigest.getInstance("SHA-256").digest(value);
            StringBuilder s = new StringBuilder();
            for (byte b : d) s.append(String.format(Locale.ROOT, "%02x", b & 255));
            return s.toString();
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
    }
}
