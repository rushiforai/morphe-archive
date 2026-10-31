/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.extension.syncforreddit.http.undelete;

import org.json.JSONObject;

import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Says why something was taken down. Patcheddit's Boost patch shows this as a symbol in a field
 * of its own model, rendered beside the author. Sync has no such field, so the wording is put
 * into the line under the author instead, where it reads as part of the comment's own header
 * rather than as part of what the author wrote.
 */
final class RemovalReason {
    private static final String DELETED = "[deleted]";
    private static final String REMOVED = "[removed]";

    /** What Reddit leaves where it says who took something down. */
    private static final Pattern ATTRIBUTED =
            Pattern.compile("\\[\\s*(removed|deleted)\\s+by\\s+([^\\]]+?)\\s*\\]",
                    Pattern.CASE_INSENSITIVE);

    private static final String BY_AUTHOR_TEXT = "deleted by author";
    private static final String BY_MODERATOR_TEXT = "removed by moderator";
    private static final String BY_ADMIN_TEXT = "removed by admin";
    private static final String BY_ANTI_SPAM_TEXT = "caught by the spam filter";
    private static final String BY_ANTI_EVIL_TEXT = "removed by anti evil operations";
    private static final String COPYRIGHT_TEXT = "removed over copyright";
    private static final String REMOVED_TEXT = "removed";
    private static final String UNKNOWN_TEXT = "recovered from the archive";

    private RemovalReason() {}

    /**
     * Reddit does not always say who removed something, and Arctic Shift only has what Reddit
     * exposed at the time, so an unattributed category is the common case rather than an error.
     * What Reddit leaves in place of what it took away says the rest.
     * What Reddit leaves in place of the text says more than it looks: an author deleting their
     * own comment leaves "[deleted]", while anyone else removing it leaves "[removed]".
     *
     * @param placeholder What Reddit served in place of the text that was taken away.
     */
    static String describe(JSONObject archived, String placeholder) {
        String left = placeholder == null ? "" : placeholder.trim();
        if (DELETED.equalsIgnoreCase(left)) {
            return BY_AUTHOR_TEXT;
        }

        // Reddit often writes out who took it down, as "[ Removed by Reddit ]" and the like,
        // which says it better than a category that is usually not there at all.
        Matcher attributed = ATTRIBUTED.matcher(left);
        if (attributed.matches()) {
            return attributed.group(1).toLowerCase(Locale.ROOT) + " by "
                    + attributed.group(2).trim().toLowerCase(Locale.ROOT);
        }

        String category = archived.optString("removed_by_category", "");

        switch (category) {
            case "deleted":
            case "author":
                return BY_AUTHOR_TEXT;
            case "moderator":
            case "community_ops":
                return BY_MODERATOR_TEXT;
            case "reddit":
            case "admin":
                return BY_ADMIN_TEXT;
            case "automod_filtered":
            case "anti_spam":
                return BY_ANTI_SPAM_TEXT;
            case "anti_evil_ops":
                return BY_ANTI_EVIL_TEXT;
            case "copyright_takedown":
            case "content_takedown":
                return COPYRIGHT_TEXT;
            default:
                // Taken down by someone other than the author, and Reddit did not say who.
                return REMOVED.equalsIgnoreCase(left) ? REMOVED_TEXT : UNKNOWN_TEXT;
        }
    }

    /**
     * Reddit does not always say who removed something, and Arctic Shift only has what Reddit
     * exposed at the time, so an unlabelled marker is the common case rather than an error.
     */
}
