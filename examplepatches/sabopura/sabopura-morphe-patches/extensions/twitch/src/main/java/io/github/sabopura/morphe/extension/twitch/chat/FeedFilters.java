package io.github.sabopura.morphe.extension.twitch.chat;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;
import android.content.SharedPreferences;

import io.github.sabopura.morphe.extension.twitch.player.PlayerTools;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

public final class FeedFilters {
    public static final String[][] OPTIONS = {
        {"hide_followed_games", "フォロー中のカテゴリ", "followed categories", "FollowedCategories"},
        {"hide_recommended_streams", "おすすめ配信", "recommended streams", "RecommendedLiveChannels"},
        {"hide_continue_watching", "視聴の続き", "continue watching", "ContinueWatching"},
        {"hide_offline_channels", "オフラインのチャンネル", "offline channels", "FollowedOfflineChannels"}
    };

    private FeedFilters() {}

    public static List<?> filter(List<?> rows) {
        if (!Features.has(Feature.FOLLOWING_FEED)) return rows;
        SharedPreferences p = PlayerTools.preferences();
        if (p == null || rows == null) return rows;
        return filterSections(
                rows,
                p,
                row -> {
                    if (!FeedAccess.isHeader(row)) return null;
                    Object section = FeedAccess.section(row);
                    return section instanceof Enum
                            ? ((Enum<?>) section).name()
                            : String.valueOf(section);
                });
    }

    /**
     * Runs before the adapter computes its diff and header-index map. A failure gives back {@code rows} itself:
     * from 31.5.2 the patch casts the result to the ArrayList Twitch passed in.
     */
    public static <T> List<T> filterSections(
            List<T> rows, SharedPreferences p, Function<T, String> sectionOf) {
        try {
            boolean any = false;
            for (String[] option : OPTIONS) any |= p.getBoolean(option[0], false);
            if (!any) return rows;
            ArrayList<T> output = new ArrayList<>();
            boolean hidden = false;
            for (T row : rows) {
                String section = sectionOf.apply(row);
                if (section != null) {
                    hidden = false;
                    for (String[] option : OPTIONS)
                        if (option[3].equals(section)) hidden = p.getBoolean(option[0], false);
                }
                if (!hidden) output.add(row);
            }
            return output;
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.feed-filter", e);
            return rows;
        }
    }

    public static boolean fullCards(boolean original) {
        if (!Features.has(Feature.FOLLOWING_FEED)) return original;
        try {
            SharedPreferences p = PlayerTools.preferences();
            return original || p != null && p.getBoolean("full_channel_cards", false);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.feed-full-cards", e);
            return original;
        }
    }
}
