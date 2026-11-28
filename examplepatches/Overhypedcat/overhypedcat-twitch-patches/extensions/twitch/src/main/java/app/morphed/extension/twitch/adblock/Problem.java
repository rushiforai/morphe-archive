package app.morphed.extension.twitch.adblock;

/**
 * What can go wrong with the ad blocker: Twitch changing something (the patches then need an update), or a failure
 * of its own or of the network.
 */
public enum Problem {
    UNRECOGNIZED_AD_MARKERS("E1", Headings.NEEDS_UPDATE, "Unrecognised ad markers, ads may play"),
    BACKUPS_UNAVAILABLE("E2", "Ad blocker couldn't get ad-free streams", "Ad-free backup streams unavailable (Twitch refused or the network failed), ads are cut out instead"),
    PROCESSING_FAILED("E3", "Ad blocker failed", "Playlist processing failed, ads may play"),
    UNRECOGNIZED_PLAYLIST("E4", Headings.NEEDS_UPDATE, "Unrecognised live playlist, ads may play"),
    CLIENT_ADS_NOT_BLOCKED("E5", Headings.NEEDS_UPDATE, "Client-side ad check changed, ads may play"),
    LABEL_FAILED("E7", "Ad label failed", "Ad label could not be shown, ads are still blocked");

    private static final class Headings {
        static final String NEEDS_UPDATE = "Ad blocker needs an update";
    }

    public final String code;
    /** What kind of problem it is, as the message's first line: only a change on Twitch's side needs an update. */
    public final String heading;
    public final String description;

    Problem(String code, String heading, String description) {
        this.code = code;
        this.heading = heading;
        this.description = description;
    }

    public interface Reporter {
        Reporter NONE = (problem, detail) -> {
        };

        void report(Problem problem, String detail);
    }
}
