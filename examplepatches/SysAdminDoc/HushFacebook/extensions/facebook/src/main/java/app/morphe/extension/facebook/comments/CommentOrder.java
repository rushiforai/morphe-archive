/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.comments;

import androidx.annotation.Nullable;

/**
 * The orders a comment sheet can be told to open in, each with the token Facebook's request names
 * it by. {@link #FACEBOOK} names none, which leaves the choice to Facebook's servers as before.
 *
 * <p>The tokens are Facebook's own: the ones its sort menu sends for Most relevant, Newest and All
 * comments, which facebook.com sends too and both patched builds keep among their MobileConfig
 * defaults. Like {@code StartTab}, this holds no Android type and reads no setting, and the label
 * a person reads is the settings screen's, in the phone's language.
 */
public enum CommentOrder {
    FACEBOOK(null, "facebook"),
    MOST_RELEVANT("RANKED_FILTERED_INTENT_V1", "most_relevant"),
    NEWEST("RECENT_ACTIVITY_INTENT_V1", "newest"),
    ALL_COMMENTS("RANKED_UNFILTERED_CHRONOLOGICAL_REPLIES_INTENT_V1", "all_comments");

    /** What the request asks for, or null to ask for nothing and take Facebook's choice. */
    @Nullable
    public final String token;

    /** What a settings file holds for this order, and what a log line calls it. It never changes once written. */
    public final String fileValue;

    CommentOrder(@Nullable String token, String fileValue) {
        this.token = token;
        this.fileValue = fileValue;
    }

    /** The order a settings file names, or null when it names none this build knows. */
    @Nullable
    public static CommentOrder fromFile(@Nullable Object value) {
        if (!(value instanceof String)) return null;
        for (CommentOrder order : values()) {
            if (order.fileValue.equals(value)) return order;
        }
        return null;
    }

    /** The order whose token is [token], or null when it's none of these. */
    @Nullable
    public static CommentOrder ofToken(@Nullable String token) {
        if (token == null) return null;
        for (CommentOrder order : values()) {
            if (token.equals(order.token)) return order;
        }
        return null;
    }
}
