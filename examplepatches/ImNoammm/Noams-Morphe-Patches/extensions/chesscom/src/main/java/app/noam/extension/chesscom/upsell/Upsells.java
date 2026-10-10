package app.noam.extension.chesscom.upsell;

import android.app.Activity;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.noam.extension.chesscom.Features;
import app.noam.extension.chesscom.Utils;
import app.noam.extension.chesscom.review.LichessReview;

/**
 * Limits show as toasts instead of Premium offers. The app decides a limit before asking for the
 * offer, so swallowing it grants nothing. Directions are recognised by what their data classes
 * print, which keeps the original names.
 */
public final class Upsells {
    private Upsells() {}

    /**
     * Called first thing when the app is about to show a dialog direction. Returns true when the
     * dialog was replaced by a toast (or dropped), so the caller must not show it.
     */
    public static boolean interceptDialog(Object direction, Object fragmentManager) {
        // Review on Lichess goes first: the review limit then opens Lichess, not a toast.
        if (LichessReview.onDialog(direction, fragmentManager)) return true;
        if (direction == null || !Features.isEnabled(Features.LIMIT_TOASTS)) return false;
        try {
            String description = String.valueOf(direction);
            switch (name(description)) {
                case "GameReviewUpgrade":
                    Utils.toast(gameReviewLimit(value(description, "quotaType")));
                    return true;
                case "PuzzlesLimitUpgrade":
                    Utils.toast(puzzleLimit());
                    closeScreenIfAsked(description, fragmentManager);
                    return true;
                case "LessonsLimitUpgrade":
                    Utils.toast(lessonLimit("WEEKLY".equals(value(description, "quotaType"))));
                    closeScreenIfAsked(description, fragmentManager);
                    return true;
                case "FeatureLimitHeroUpgrade":
                    return upgradeType(value(description, "accountUpgradeType"), description, fragmentManager);
                case "AccountUpgrade":
                    return upgradeType(value(description, "type"), description, fragmentManager);
                case "PeriodicUpgradeV6":
                case "SpringSale":
                case "SpringSalePicnic":
                case "AccountUpgradePrepaidPlan":
                    return true; // Promotions nobody asked for.
                default:
                    return false;
            }
        } catch (Throwable throwable) {
            Utils.logError("Upsell dialog not intercepted", throwable);
            return false;
        }
    }

    /**
     * Called first thing when the app navigates to a screen. Full-screen offers that a limit opens
     * on its own (Game Review, Play Coach) become a toast; offers the user opened on purpose stay.
     */
    public static boolean interceptScreen(Object activity, Object directions) {
        if (LichessReview.onScreen(activity, directions)) return true;
        if (directions == null || !Features.isEnabled(Features.LIMIT_TOASTS)) return false;
        try {
            String description = String.valueOf(directions);
            if (!"Paywall".equals(name(description))) return false;
            String source = value(description, "source");
            if ("GAME_REVIEW".equals(source)) {
                Utils.toast(gameReviewLimit(value(description, "quotaType")));
                return true;
            }
            if ("PLAY_COACH".equals(source)) {
                Utils.toast(premiumOnly());
                return true;
            }
            return false;
        } catch (Throwable throwable) {
            Utils.logError("Upsell screen not intercepted", throwable);
            return false;
        }
    }

    private static boolean upgradeType(String type, String description, Object fragmentManager) {
        if (type == null) {
            Utils.toast(premiumOnly());
            return true;
        }
        if (type.startsWith("GUEST_")) return false; // Account sign-up, not Premium.
        String message;
        switch (type) {
            case "WEEKLY_UPGRADE":
                return true; // The weekly promotional pop-up.
            case "LIMIT_REACHED_PUZZLES":
                message = puzzleLimit();
                break;
            case "LIMIT_REACHED_LESSONS_DAILY":
                message = lessonLimit(false);
                break;
            case "LIMIT_REACHED_LESSONS_WEEKLY":
                message = lessonLimit(true);
                break;
            case "LIMIT_REACHED_DRILLS":
                message = Utils.appString("limit_reached_drills", "Selected Drill Locked");
                break;
            case "LIMIT_REACHED_ENDGAMES":
                message = Utils.appString("feature_limit_endgames_chip", "Endgame Locked");
                break;
            case "LIMIT_REACHED_OPENINGS":
                message = Utils.appString("upgrade_explorer_limit_reached", "Explorer Limit Reached");
                break;
            case "LIMIT_REACHED_VIDEOS":
                message = Utils.appString("limit_reached_videos", "Selected Video Locked");
                break;
            case "PUZZLE_EXPLANATION_LOCKED":
                message = Utils.appString("upgrade_video_locked", "Video Locked");
                break;
            case "DAILY_PUZZLE_OUT_OF_RANGE":
                message = Utils.appString("upgrade_daily_puzzle_locked", "Daily Puzzle Locked");
                break;
            case "SELECTED_BOT_LOCKED":
                message = Utils.appString("feature_limit_bots_chip", "Bot Locked");
                break;
            case "SELECTED_FLAIR_LOCKED":
                message = Utils.appString("feature_limit_flair_chip", "Flair Locked");
                break;
            default:
                message = premiumOnly();
                break;
        }
        Utils.toast(message);
        closeScreenIfAsked(description, fragmentManager);
        return true;
    }

    private static String gameReviewLimit(String quota) {
        if ("WEEK".equals(quota)) return "You’ve used your free Game Review for the week.";
        return Utils.appString("game_review_upgrade_dialog_header",
            "You’ve used your free Game Review for the day.");
    }

    private static String puzzleLimit() {
        return "Daily Limit for Puzzles Reached";
    }

    private static String lessonLimit(boolean weekly) {
        if (weekly) return "Weekly Limit for Lessons Reached";
        return Utils.appString("limit_reached_lessons", "Daily Limit for Lessons Reached");
    }

    private static String premiumOnly() {
        return Utils.appString("must_be_premium", "Must be premium.");
    }

    /**
     * Some limit dialogs open on top of a screen that has nothing to show without them, and close
     * that screen when dismissed ("backShouldCloseActivity"). Do the same after the toast.
     */
    private static void closeScreenIfAsked(String description, Object fragmentManager) {
        if (!"true".equals(value(description, "backShouldCloseActivity"))) return;
        Activity host = Utils.activityOwning(fragmentManager);
        if (host != null && !host.isFinishing()) host.finish();
    }

    private static String name(String description) {
        int open = description.indexOf('(');
        return open < 0 ? description : description.substring(0, open);
    }

    /** The value printed for {@code field}, e.g. value("X(type=WEEK, a=1)", "type") = "WEEK". */
    private static String value(String description, String field) {
        Matcher matcher = Pattern.compile("[(,]\\s*" + Pattern.quote(field) + "=([A-Za-z0-9_]+)")
            .matcher(description);
        return matcher.find() ? matcher.group(1) : null;
    }
}
