package app.jimaku.extension.jobs;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import app.jimaku.extension.menu.MenuModel;
import app.jimaku.extension.shared.Wording;

/**
 * Every failure the gateway or the processor can report, in a few plain words of Jimaku's own, on one
 * line, ported from {@code explain} in the extension's {@code lib/messages.ts} with its shared cases.
 * The server's wording never reaches the viewer: an unknown code reads as a general failure.
 */
public final class Failures {
    /** What a failure means to the viewer, and what it offers as the way forward. */
    public static final class Explained {
        public final String text;
        /** Offer Standard instead, where the video allows it. */
        public final boolean standard;
        /** Premium needs more minutes; offer the account page. */
        public final boolean buy;

        Explained(String text, boolean standard, boolean buy) {
            this.text = text;
            this.standard = standard;
            this.buy = buy;
        }
    }

    /** What the failure is said against. */
    public static final class Context {
        /** Whether Standard could make these subtitles instead. */
        public final boolean standardAvailable;
        /** The title of the video whose job is still running, when this install started it. */
        public final String runningTitle;
        /** The balance in seconds, when known. */
        public final Double balance;

        public Context(boolean standardAvailable, String runningTitle, Double balance) {
            this.standardAvailable = standardAvailable;
            this.runningTitle = runningTitle;
            this.balance = balance;
        }
    }

    /** A running video's title is cut to this many characters, so the message stays on one line. */
    public static final int TITLE_LIMIT = 24;

    private static final Map<String, String> KNOWN = new HashMap<>();
    static {
        KNOWN.put("unavailable", Wording.FAIL_UNAVAILABLE);
        KNOWN.put("download_refused", Wording.FAIL_DOWNLOAD);
        KNOWN.put("unreachable", Wording.FAIL_UNREACHABLE);
        KNOWN.put("offline", Wording.FAIL_UNREACHABLE);
        KNOWN.put("no_speech", Wording.FAIL_NO_SPEECH);
        KNOWN.put("translation_failed", Wording.FAIL_TRANSLATION);
        KNOWN.put("invalid_captions", Wording.FAIL_INVALID_CAPTIONS);
        KNOWN.put("no_captions", Wording.FAIL_NO_CAPTIONS);
        KNOWN.put("live", Wording.FAIL_LIVE);
        KNOWN.put("blocked", Wording.FAIL_BLOCKED);
        KNOWN.put("video_busy", Wording.FAIL_VIDEO_BUSY);
        KNOWN.put("daily_limit", Wording.FAIL_DAILY_LIMIT);
        KNOWN.put("too_many_installs", Wording.FAIL_TOO_MANY_INSTALLS);
        KNOWN.put("offer_off", Wording.FAIL_OFFER_OFF);
        KNOWN.put("offer_cap", Wording.FAIL_OFFER_CAP);
        KNOWN.put("already_claimed", Wording.FAIL_ALREADY_CLAIMED);
        KNOWN.put("stale", Wording.FAIL_STALE);
    }

    /** Reasons the premium path couldn't run on this video, where Standard may still work. */
    private static final Set<String> PREMIUM_FAILED = Set.of("no_minutes", "too_long", "unavailable", "download_refused");

    private Failures() {
    }

    /** {@code title} cut to 24 characters, counted as the extension counts them (code points), with an ellipsis. */
    public static String shortTitle(String title) {
        String trimmed = title.strip();
        int count = trimmed.codePointCount(0, trimmed.length());
        if (count <= TITLE_LIMIT) return trimmed;
        int end = trimmed.offsetByCodePoints(0, TITLE_LIMIT - 1);
        return stripTrailing(trimmed.substring(0, end)) + "…";
    }

    /** As JavaScript's trimEnd: whitespace and line ends only. */
    private static String stripTrailing(String text) {
        int end = text.length();
        while (end > 0 && Character.isWhitespace(text.charAt(end - 1))) end--;
        return text.substring(0, end);
    }

    public static Explained explain(Locale locale, String code, Map<String, Object> extra, Context context) {
        boolean standard = context.standardAvailable && PREMIUM_FAILED.contains(code);
        if (code.equals("no_minutes") || code.equals("too_long")) {
            Object given = extra.get("balance");
            Double balance = given instanceof Number ? ((Number) given).doubleValue() : context.balance;
            String text = code.equals("no_minutes") || balance == null || balance <= 0 ? Wording.t(locale, Wording.FAIL_NO_MINUTES)
                    : Wording.t(locale, Wording.FAIL_TOO_LONG, String.valueOf(MenuModel.minutesLeft(balance)));
            return new Explained(text, standard, true);
        }
        if (code.equals("busy")) {
            String text = context.runningTitle != null && !context.runningTitle.isEmpty()
                    ? Wording.t(locale, Wording.FAIL_BUSY_TITLE, shortTitle(context.runningTitle)) : Wording.t(locale, Wording.FAIL_BUSY);
            return new Explained(text, false, false);
        }
        String known = KNOWN.get(code);
        return new Explained(Wording.t(locale, known != null ? known : Wording.FAIL_GENERAL), standard, false);
    }
}
