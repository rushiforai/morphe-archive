/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.comments;

import androidx.annotation.Nullable;

import java.util.List;

/**
 * The orders a comment sheet can be told to open in, each with the token Facebook's request names
 * it by. {@link #FACEBOOK} names none, which leaves the choice to Facebook's servers as before.
 *
 * <p>The tokens are Facebook's own: the ones its sort menu sends for Most relevant, Newest and All
 * comments, which facebook.com sends too and both patched builds keep among their MobileConfig
 * defaults. Like {@code StartTab}, this holds no Android type and reads no setting, and the label
 * a person reads is the settings screen's, in the phone's language.
 *
 * <p>Some posts' sort menus name All comments' row by another token (#110). A diagnostic report
 * showed menus offering {@code [RANKED_FILTERED, REVERSE_CHRONOLOGICAL_UNFILTERED,
 * CHRONOLOGICAL_UNFILTERED]} and {@code [CHRONOLOGICAL_FILTERED, CHRONOLOGICAL_UNFILTERED]}
 * (each {@code _INTENT_V1}): the unfiltered row in All comments' place is
 * {@code CHRONOLOGICAL_UNFILTERED_INTENT_V1}, one of 582's MobileConfig defaults too. A menu that
 * offers {@link #token} still gets that one.
 *
 * <p>{@link #OLDEST} (#295) asks for that same chronological token up front, first comment first,
 * on every post. Facebook's menus show it as All comments where they offer it at all, so a request
 * naming it is the one way to get Oldest on a post whose menu doesn't.
 */
public enum CommentOrder {
    FACEBOOK(null, "facebook"),
    MOST_RELEVANT("RANKED_FILTERED_INTENT_V1", "most_relevant"),
    NEWEST("RECENT_ACTIVITY_INTENT_V1", "newest"),
    ALL_COMMENTS("RANKED_UNFILTERED_CHRONOLOGICAL_REPLIES_INTENT_V1", "all_comments",
            "CHRONOLOGICAL_UNFILTERED_INTENT_V1"),
    OLDEST("CHRONOLOGICAL_UNFILTERED_INTENT_V1", "oldest");

    /** What the request asks for, or null to ask for nothing and take Facebook's choice. */
    @Nullable
    public final String token;

    /** What a settings file holds for this order, and what a log line calls it. It never changes once written. */
    public final String fileValue;

    /** The tokens a sort menu may name this order's row by instead of {@link #token}, in preference order. */
    private final String[] menuAlternates;

    CommentOrder(@Nullable String token, String fileValue, String... menuAlternates) {
        this.token = token;
        this.fileValue = fileValue;
        this.menuAlternates = menuAlternates;
    }

    /** Whether [candidate] names this order, as a request does or as a sort menu's row may. */
    public boolean isNamedBy(@Nullable String candidate) {
        if (candidate == null || token == null) return false;
        if (candidate.equals(token)) return true;
        for (String alternate : menuAlternates) {
            if (candidate.equals(alternate)) return true;
        }
        return false;
    }

    /** The token of this order's row among a sort menu's [offered] tokens, or null when it has none. */
    @Nullable
    public String rowIn(List<String> offered) {
        if (token == null) return null;
        if (offered.contains(token)) return token;
        for (String alternate : menuAlternates) {
            if (offered.contains(alternate)) return alternate;
        }
        return null;
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

    /**
     * The order [token] names, as a request or a sort menu's row, or null when it's none of these.
     * {@link #OLDEST}'s token is All comments' row in the menus that offer it, so it reads as that.
     */
    @Nullable
    public static CommentOrder ofToken(@Nullable String token) {
        if (token == null) return null;
        for (CommentOrder order : values()) {
            if (order.isNamedBy(token)) return order;
        }
        return null;
    }
}
