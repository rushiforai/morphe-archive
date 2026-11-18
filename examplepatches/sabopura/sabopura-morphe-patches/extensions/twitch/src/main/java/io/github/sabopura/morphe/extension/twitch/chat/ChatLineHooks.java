package io.github.sabopura.morphe.extension.twitch.chat;

import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.SpannedString;
import android.text.style.ForegroundColorSpan;
import android.text.style.StrikethroughSpan;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/** Injection points that run before a chat line reaches its row. */
public final class ChatLineHooks {
    private static final int MAX_FIRST_IDS = 512;
    private static final Set<String> FIRST_IDS = Collections.newSetFromMap(Collections.synchronizedMap(
            new LinkedHashMap<String, Boolean>() {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
                    return size() > MAX_FIRST_IDS;
                }
            }));
    /** Messages are shown moments after their line arrives, so a few hundred tags are enough to find each one's. */
    private static final int MAX_EMOTE_TAGS = 600;
    private static final Map<String, String> EMOTE_TAGS = Collections.synchronizedMap(
            new LinkedHashMap<String, String>() {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
                    return size() > MAX_EMOTE_TAGS;
                }
            });
    private static volatile String ownLogin;

    private ChatLineHooks() {}

    /** Stub replaced at patch time by the Show deleted messages patch: its settings appear only then. */
    public static boolean deletedMessagesPatched() {
        return false;
    }

    /** Bridge bodies replaced at patch time with reads of Twitch's chat image size enum. */
    public static float stockSizeDp(Object kind) {
        return 0;
    }

    public static Float stockLandscapeSizeDp(Object kind) {
        return null;
    }

    private static ChatSettings live() {
        ChatSettings settings = ChatSettings.current();
        return settings != null && settings.enabled ? settings : null;
    }

    // ---- compact chat ----

    /** Injection point: a chat line's badge span, just before the line's spans are put together. */
    public static CharSequence badges(CharSequence badges) {
        try {
            ChatSettings settings = live();
            return settings != null && settings.compactBadges && Features.has(Feature.COMPACT_CHAT) ? "" : badges;
        } catch (RuntimeException | LinkageError failure) {
            Diagnostics.note("chat.compact-badges", failure);
            return badges;
        }
    }

    /** Injection point: Twitch building an emote's image span; true makes it the emote's code as text. */
    public static boolean emotesAsText() {
        try {
            ChatSettings settings = live();
            return settings != null && settings.compactEmotes && Features.has(Feature.COMPACT_CHAT);
        } catch (RuntimeException | LinkageError failure) {
            Diagnostics.note("chat.compact-emotes", failure);
            return false;
        }
    }

    // ---- first-time chatters ----

    /** Injection point: Twitch split an IRC line into its tags. */
    public static void ircTags(Map<?, ?> tags) {
        try {
            if (tags == null) return;
            Object id = tags.get("id");
            if (!(id instanceof String)) return;
            if ("1".equals(tags.get("first-msg")) && Features.has(Feature.FIRST_TIME_CHATTERS)) FIRST_IDS.add((String) id);
            // Kept for the history sheet, which draws the message again without Twitch's own emote images.
            Object emotes = tags.get("emotes");
            if (emotes instanceof String && !((String) emotes).isEmpty() && Features.has(Feature.CHAT_HISTORY))
                EMOTE_TAGS.put((String) id, (String) emotes);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("chat.first-time-tags", e);
        }
    }

    /** The "emotes" tag of the message with this id: which stretches of its text are Twitch emotes; "" when none. */
    static String emotesTag(String id) {
        String tag = id == null ? null : EMOTE_TAGS.get(id);
        return tag == null ? "" : tag;
    }

    static boolean isFirstMessage(String id) {
        return id != null && FIRST_IDS.contains(id);
    }

    // ---- mentions ----

    /** Injection point: the IRC login's nickname. Nothing else of the credentials is touched. */
    public static void credentials(String nickname) {
        if (nickname == null || nickname.startsWith("justinfan")) return;
        ownLogin = nickname.toLowerCase(Locale.ROOT);
    }

    static String ownLogin() {
        return ownLogin;
    }

    // ---- image and row sizes ----

    /** Injection point: Twitch's chat image size enum, for the size it would use. */
    public static float imageSizeDp(Object kind) {
        return stockSizeDp(kind) * imageScale(kind);
    }

    public static Float landscapeImageSizeDp(Object kind) {
        Float stock = stockLandscapeSizeDp(kind);
        return stock == null ? null : stock * imageScale(kind);
    }

    private static float imageScale(Object kind) {
        try {
            ChatSettings settings = live();
            if (settings == null || !Features.has(Feature.CHAT_APPEARANCE) || !(kind instanceof Enum)) return 1;
            switch (((Enum<?>) kind).name()) {
                case "Emote":
                case "GigantifiedEmote":
                    return settings.emotePercent / 100f;
                case "Badge":
                    return settings.badgePercent / 100f;
                default:
                    return 1;
            }
        } catch (RuntimeException | LinkageError failure) {
            Diagnostics.note("chat.image-size", failure);
            return 1;
        }
    }

    /** Injection point: the vertical padding Twitch is about to give a chat row. */
    public static int rowPadding(int stock) {
        try {
            ChatSettings settings = live();
            if (settings == null || settings.spacingPercent == 100 || !Features.has(Feature.CHAT_APPEARANCE)) return stock;
            return Math.round(stock * settings.spacingPercent / 100f);
        } catch (RuntimeException | LinkageError failure) {
            Diagnostics.note("chat.row-padding", failure);
            return stock;
        }
    }

    // ---- deleted messages ----

    /** Injection point: Twitch formatting a deleted message; null keeps the tappable spoiler. */
    public static Spanned deletedLine(SpannedString line, int bodyStart) {
        try {
            ChatSettings settings = ChatSettings.current();
            if (settings == null || !settings.deletedStrike || bodyStart < 0 || bodyStart >= line.length()) return null;
            return struck(line, bodyStart);
        } catch (RuntimeException | LinkageError failure) {
            Diagnostics.note("chat.deleted-strike", failure);
            return null;
        }
    }

    static Spanned struck(CharSequence line, int bodyStart) {
        SpannableStringBuilder text = new SpannableStringBuilder(line);
        text.setSpan(new StrikethroughSpan(), bodyStart, text.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        text.setSpan(new ForegroundColorSpan(0xFFADADB8), bodyStart, text.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return text;
    }

    /** Injection point: a moderator cleared the whole chat. True keeps the messages. */
    public static boolean ignoreChatClears() {
        try {
            ChatSettings settings = ChatSettings.current();
            return settings != null && settings.ignoreClearChat;
        } catch (RuntimeException | LinkageError failure) {
            Diagnostics.note("chat.ignore-clears", failure);
            return false;
        }
    }

    // ---- finer highlight switches ----

    /** Injection point: Twitch's flags for the Bits and gift leaderboards. */
    public static boolean leaderboardEnabled(boolean stock) {
        try {
            ChatSettings settings = ChatSettings.current();
            return stock && !(settings != null && settings.hideGiftLeaderboards
                    && Features.has(Feature.CHAT_HIDE_HIGHLIGHTS));
        } catch (RuntimeException | LinkageError failure) {
            Diagnostics.note("chat.leaderboards", failure);
            return stock;
        }
    }

    /** Injection point: a private pop-up about to be queued. True drops it. */
    public static boolean hideCallout(Enum<?> type) {
        try {
            ChatSettings settings = ChatSettings.current();
            return type != null && settings != null && settings.hideWatchStreaks
                    && "WATCH_STREAK_REACHED".equals(type.name()) && Features.has(Feature.CHAT_HIDE_HIGHLIGHTS);
        } catch (RuntimeException | LinkageError failure) {
            Diagnostics.note("chat.watch-streaks", failure);
            return false;
        }
    }
}
