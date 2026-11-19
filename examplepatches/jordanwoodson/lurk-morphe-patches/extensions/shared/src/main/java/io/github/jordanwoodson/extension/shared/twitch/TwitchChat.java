package io.github.jordanwoodson.extension.shared.twitch;

import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.SpannedString;
import android.text.TextPaint;
import android.text.style.CharacterStyle;
import android.text.style.UpdateAppearance;
import java.lang.reflect.Field;
import java.security.SecureRandom;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/** Hooks for the Twitch chat patches. */
@SuppressWarnings("unused")
public final class TwitchChat {
    static final String ANONYMOUS = "chat_anonymous";
    static final String SHOW_DELETED = "chat_show_deleted";
    static final String IGNORE_CLEARS = "chat_ignore_clears";
    static final String TIMESTAMPS = "chat_timestamps";
    static final String TIMESTAMP_FORMAT = "chat_timestamp_format";
    static final String AUTO_CLAIM = "chat_auto_claim";

    private static volatile Boolean anonymous;
    private static String guestNick;
    private static volatile Field sourceField;
    private static final Set<String> claimed = Collections.newSetFromMap(new LinkedHashMap<String, Boolean>() {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
            return size() > 64;
        }
    });

    private TwitchChat() { }

    // Anonymous chat. One snapshot per process, so the IRC login and the read-only input always agree.

    static boolean anonymous() {
        Boolean current = anonymous;
        if (current == null) {
            synchronized (TwitchChat.class) {
                current = anonymous;
                if (current == null) anonymous = current = Settings.isEnabled(ANONYMOUS);
            }
        }
        return current;
    }

    /** Injection point: the OAuth token for the IRC PASS line. Null makes Twitch send {@code PASS listen}. */
    public static String ircToken(String token) {
        return anonymous() ? null : token;
    }

    /** Injection point: the IRC NICK. A guest nick (justinfan and digits) that stays the same for the process. */
    public static String ircNick(String nick) {
        if (!anonymous()) return nick;
        synchronized (TwitchChat.class) {
            if (guestNick == null) {
                guestNick = "justinfan" + (100000000 + new SecureRandom().nextInt(900000000));
                Logger.d("chat: reading anonymously as " + guestNick);
            }
            return guestNick;
        }
    }

    /** Injection point: whether the chat input shows Twitch's log-in restriction instead of accepting text. */
    public static boolean readOnly() {
        return anonymous();
    }

    /** Injection point: the text of the chat input's log-in restriction, which anonymous chat reuses. */
    public static String loginLabel(String stock) {
        return anonymous() ? "Anonymous chat: read only" : stock;
    }

    /** Injection point: the failure a chat message send returns instead of reaching GraphQL, or null to send. */
    public static Throwable sendBlocked() {
        if (!anonymous()) return null;
        Logger.blocked("chat message send (anonymous chat is read-only)");
        return new IllegalStateException("Lurk: anonymous chat is read-only");
    }

    // Deleted messages.

    /** Injection point: the text of a message that was deleted before it was shown, or null for the placeholder. */
    public static SpannedString deletedBody(SpannedString body) {
        if (body == null || !Settings.isEnabled(SHOW_DELETED)) return null;
        SpannableStringBuilder text = new SpannableStringBuilder(body);
        text.setSpan(new DeletedSpan(), 0, text.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        Logger.d("chat: kept a message deleted before it was shown");
        return new SpannedString(text);
    }

    /**
     * Injection point: a shown line whose message was deleted, with the message from {@code bodyStart} on
     * struck through, or null for Twitch's placeholder.
     */
    public static Spanned deletedLine(SpannedString line, int bodyStart) {
        if (line == null || bodyStart < 0 || bodyStart > line.length() || !Settings.isEnabled(SHOW_DELETED)) return null;
        SpannableStringBuilder text = new SpannableStringBuilder(line);
        text.setSpan(new DeletedSpan(), bodyStart, text.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        Logger.d("chat: kept a deleted message");
        return text;
    }

    /** Injection point: whether a moderator's clear of the whole chat is ignored. Timeouts and bans still apply. */
    public static boolean ignoreChatClears() {
        boolean ignore = Settings.isEnabled(IGNORE_CLEARS);
        if (ignore) Logger.d("chat: kept the messages of a cleared chat");
        return ignore;
    }

    /** Struck through, with the text's own color at half strength, so it works on light and dark themes. */
    static final class DeletedSpan extends CharacterStyle implements UpdateAppearance {
        @Override
        public void updateDrawState(TextPaint paint) {
            paint.setStrikeThruText(true);
            paint.setAlpha(paint.getAlpha() / 2);
        }
    }

    // Timestamps.

    /**
     * Injection point: whether a chat line shows its time. {@code config} is the line's click configuration;
     * only lines from channel chat (its source is the {@code Chat} entry) gain a time, not whispers.
     */
    public static boolean timestamps(Object config, boolean stock) {
        if (stock || !Settings.isEnabled(TIMESTAMPS)) return stock;
        Enum<?> source = source(config);
        return source != null && "Chat".equals(source.name());
    }

    /**
     * Injection point: the send time (Unix seconds) of a chat message read from IRC, from its tmi-sent-ts tag. The
     * copy of a message you send, shown at once, is an IRC line Twitch builds without that tag; while Chat
     * timestamps is on it gets the time it is read, which is when it was sent.
     */
    public static Long sentTime(Long stock) {
        if (stock != null || !Settings.isEnabled(TIMESTAMPS)) return stock;
        return System.currentTimeMillis() / 1000;
    }

    /**
     * Injection point: the pattern of the time shown before a chat line. Read once per formatter. The same
     * formatter draws Twitch's own chat-history timestamps, so the clock choice applies only while Chat
     * timestamps is on.
     */
    public static String timestampPattern(String stock) {
        if (!Settings.isEnabled(TIMESTAMPS)) return stock;
        return Settings.getInt(TIMESTAMP_FORMAT) == 1 ? "h:mm" : stock;
    }

    private static Enum<?> source(Object config) {
        if (config == null) return null;
        try {
            Class<?> type = config.getClass();
            Field field = sourceField;
            if (field == null || field.getDeclaringClass() != type) {
                field = null;
                for (Field candidate : type.getDeclaredFields()) {
                    if (!candidate.getType().isEnum()) continue;
                    if (field != null) return null; // Ambiguous: keep Twitch's choice.
                    field = candidate;
                }
                if (field == null) return null;
                field.setAccessible(true);
                sourceField = field;
            }
            return (Enum<?>) field.get(config);
        } catch (ReflectiveOperationException | RuntimeException e) {
            return null;
        }
    }

    // Channel points.

    /** Injection point: whether to claim the bonus {@code claimId} now. True once per claim, while switched on. */
    public static boolean autoClaim(String claimId) {
        if (claimId == null || claimId.isEmpty() || !Settings.isEnabled(AUTO_CLAIM)) return false;
        synchronized (claimed) {
            if (!claimed.add(claimId)) return false;
        }
        Logger.d("chat: claiming a channel points bonus");
        return true;
    }
}
