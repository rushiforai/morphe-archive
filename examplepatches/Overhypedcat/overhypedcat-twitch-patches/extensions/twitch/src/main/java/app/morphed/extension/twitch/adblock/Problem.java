package app.morphed.extension.twitch.adblock;

/**
 * Signs that Twitch changed something and ads may get through, so the patches need an update.
 */
public enum Problem {
    UNRECOGNIZED_AD_MARKERS("E1", "Unrecognised ad markers, ads may play"),
    BACKUPS_UNAVAILABLE("E2", "Ad-free backup streams unavailable"),
    PROCESSING_FAILED("E3", "Playlist processing failed, ads may play"),
    UNRECOGNIZED_PLAYLIST("E4", "Unrecognised live playlist, ads may play");

    public final String code;
    public final String description;

    Problem(String code, String description) {
        this.code = code;
        this.description = description;
    }

    public interface Reporter {
        Reporter NONE = (problem, detail) -> {
        };

        void report(Problem problem, String detail);
    }
}
