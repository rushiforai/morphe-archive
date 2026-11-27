package app.jimaku.extension.menu;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

import app.jimaku.extension.gateway.Lookup;

/** What is known about a video for its menu, as the extension's {@code MenuInput}. Built with {@link Builder}. */
public final class MenuInput {
    /** The account as it was last read: of the extension's {@code Me}, what the menu reads. */
    public static final class Account {
        /** The minutes left, in seconds; below zero when overspent. */
        public final double balance;
        public final boolean signedIn;

        public Account(double balance, boolean signedIn) {
            this.balance = balance;
            this.signedIn = signedIn;
        }
    }

    /** The subtitles a job this page waits on is making, with what its step reads. */
    public static final class Working {
        public final Subtitle subtitle;
        public final String step;

        public Working(Subtitle subtitle, String step) {
            this.subtitle = Objects.requireNonNull(subtitle);
            this.step = step == null ? "" : step;
        }
    }

    /** What the shared cache holds for the video, or null when nothing. */
    public final Lookup lookup;
    /** Languages this device keeps Standard subtitles in for the video. */
    public final List<String> kept;
    /** The source language of kept Standard captions, or null. */
    public final String standardOriginal;
    public final String preferred;
    /** The subtitles on screen, or null while none are. */
    public final Subtitle showing;
    /** The account as it was last read, or null when it never was. */
    public final Account me;
    /** Whether the minutes in {@link #me} can be counted on: false once reading them failed, and while there is no account. */
    public final boolean minutesKnown;
    /** The video's length in seconds, or null while unknown. */
    public final Double duration;
    /** Whether the player has said which caption track Standard translates from; the extension's undefined track. */
    public final boolean trackKnown;
    /** That track's language once known, null when the video has none or while it isn't known. */
    public final String track;
    /** A stream that is live, yet to start, or still being processed: nothing whole to make subtitles from. */
    public final boolean live;
    /** The languages the video has captions uploaded in, once the player has said. */
    public final List<String> uploaded;
    /** The mode the viewer set the Premium switch to, or null until they flip it. */
    public final Version mode;
    /** The job this page waits on, or null. */
    public final Working working;
    /** The interface's language: the wording, and the order of names. */
    public final Locale locale;

    private MenuInput(Builder builder) {
        lookup = builder.lookup;
        kept = Collections.unmodifiableList(new ArrayList<>(builder.kept));
        standardOriginal = builder.standardOriginal;
        preferred = builder.preferred;
        showing = builder.showing;
        me = builder.me;
        minutesKnown = builder.minutesKnown;
        duration = builder.duration;
        trackKnown = builder.trackKnown;
        track = builder.track;
        live = builder.live;
        uploaded = Collections.unmodifiableList(new ArrayList<>(builder.uploaded));
        mode = builder.mode;
        working = builder.working;
        locale = builder.locale;
    }

    /**
     * Starts from nothing known but the preferred language: nothing cached or kept, nothing on
     * screen, no account, no length, the track not yet said, the switch not flipped.
     */
    public static final class Builder {
        private Lookup lookup;
        private List<String> kept = Collections.emptyList();
        private String standardOriginal;
        private final String preferred;
        private Subtitle showing;
        private Account me;
        private boolean minutesKnown;
        private Double duration;
        private boolean trackKnown;
        private String track;
        private boolean live;
        private List<String> uploaded = Collections.emptyList();
        private Version mode;
        private Working working;
        private Locale locale = Locale.getDefault();

        public Builder(String preferred) {
            this.preferred = Objects.requireNonNull(preferred);
        }

        public Builder lookup(Lookup value) {
            lookup = value;
            return this;
        }

        public Builder kept(List<String> value) {
            kept = Objects.requireNonNull(value);
            return this;
        }

        public Builder standardOriginal(String value) {
            standardOriginal = value;
            return this;
        }

        public Builder showing(Subtitle value) {
            showing = value;
            return this;
        }

        public Builder me(Account value) {
            me = value;
            return this;
        }

        public Builder minutesKnown(boolean value) {
            minutesKnown = value;
            return this;
        }

        public Builder duration(Double seconds) {
            duration = seconds;
            return this;
        }

        /** The caption track's language as the player said it, or null for none. */
        public Builder track(String value) {
            trackKnown = true;
            track = value;
            return this;
        }

        /** The player hasn't said yet. */
        public Builder trackUnknown() {
            trackKnown = false;
            track = null;
            return this;
        }

        public Builder live(boolean value) {
            live = value;
            return this;
        }

        public Builder uploaded(List<String> value) {
            uploaded = Objects.requireNonNull(value);
            return this;
        }

        public Builder mode(Version value) {
            mode = value;
            return this;
        }

        public Builder working(Working value) {
            working = value;
            return this;
        }

        public Builder locale(Locale value) {
            locale = Objects.requireNonNull(value);
            return this;
        }

        public MenuInput build() {
            return new MenuInput(this);
        }
    }
}
