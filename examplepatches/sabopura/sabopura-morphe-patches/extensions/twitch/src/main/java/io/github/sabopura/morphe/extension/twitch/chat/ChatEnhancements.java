package io.github.sabopura.morphe.extension.twitch.chat;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.SpannedString;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.ParagraphStyle;
import android.text.style.RelativeSizeSpan;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.chat.emotes.EmoteSupport;
import io.github.sabopura.morphe.extension.twitch.chat.emotes.EmoteTap;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

import java.lang.ref.WeakReference;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.regex.Pattern;

/**
 * Hooks only already-rendered chat rows. Does not access account credentials or mutate messages.
 */
public final class ChatEnhancements {
    /** View tag key; the 0x7e package id belongs to no resource table, so it cannot collide. */
    private static final int ROW_TAG = 0x7efffe02;
    private static final Pattern LOGIN = Pattern.compile("[A-Za-z0-9_]{1,25}");
    private static final int FIRST_MESSAGE_COLOR = 0x4D00C853;
    private static final int ALTERNATE_COLOR = 0x206f6f6f;
    /** Bound rows, to refresh them. Each row's state lives on its view, so nothing here retains a row. */
    private static final Map<TextView, Boolean> ROWS = new WeakHashMap<>();
    private static final RepeatFilter REPEATS = new RepeatFilter();
    private static volatile String currentRoom;
    private static volatile String currentChannel;
    private static SimpleDateFormat minutes, seconds;

    /** Whether a chat row is visible to the user; on the main thread, like every row access. */
    static boolean anyRowOnScreen() {
        for (TextView text : ROWS.keySet())
            if (text.isAttachedToWindow() && text.getWindowVisibility() == View.VISIBLE) return true;
        return false;
    }

    public static String channelId() {
        return currentRoom;
    }

    public static String channelName() {
        return currentChannel;
    }

    private static int sequence;
    private static final java.util.LinkedHashMap<String, Integer> ORDER =
            new java.util.LinkedHashMap<String, Integer>() {
                protected boolean removeEldestEntry(Map.Entry<String, Integer> e) {
                    return size() > 1024;
                }
            };

    private ChatEnhancements() {}

    public static void onChannelChanged(String channelId, String channelName) {
        currentRoom = channelId;
        currentChannel = channelName;
    }

    /** Injection point: Twitch asks its chat client to join a channel; a refused join has no name. */
    public static void onChannelJoin(Object channelId, String channelName) {
        try {
            if (channelId != null && channelName != null && !channelName.isEmpty())
                onChannelChanged(String.valueOf(channelId), channelName);
        } catch (RuntimeException | LinkageError failure) {
            Diagnostics.note("chat.channel-join", failure);
        }
    }

    public static void bind(Object holder, Object model) {
        TextView text = null;
        try {
            text = RowAccess.textView(holder);
            View item = RowAccess.itemView(holder);
            Long timestamp = RowAccess.timestamp(model);
            bindRow(
                    text,
                    item,
                    RowAccess.messageId(model),
                    RowAccess.channelId(model),
                    RowAccess.username(model),
                    RowAccess.userId(model),
                    ChatTime.nativeSecondsToMillis(timestamp));
        } catch (RuntimeException | LinkageError failure) {
            Diagnostics.note("chat.row", failure);
            forget(text);
        }
    }

    /** Takes back what the row's last message left on a recycled view whose new message could not be bound. */
    private static void forget(TextView text) {
        if (text == null) return;
        Row old = rowOf(text);
        if (old != null) {
            old.restoreVisibility();
            old.showBand(text, 0, false);
        }
        text.setTag(ROW_TAG, null);
        ROWS.remove(text);
    }

    public static void bindVod(Object row, Object holder) {
        TextView view = null;
        try {
            view = VodRowAccess.textView(holder);
            Object model = VodRowAccess.model(row), commenter = VodRowAccess.commenter(model);
            long timestamp = 0;
            try {
                timestamp = java.time.Instant.parse(VodRowAccess.createdAt(model)).toEpochMilli();
            } catch (RuntimeException ignored) {
            }
            // Twitch gives the VOD text its own touch listener, which an emote tap would replace.
            bindRow(
                    view,
                    RowAccess.itemView(holder),
                    "vod:" + VodRowAccess.id(model),
                    VodRowAccess.channel(model),
                    VodRowAccess.username(commenter),
                    VodRowAccess.userId(commenter),
                    timestamp,
                    false);
        } catch (RuntimeException | LinkageError failure) {
            Diagnostics.note("chat.vod-row", failure);
            forget(view);
        }
    }

    private static Row rowOf(TextView text) {
        Object tag = text.getTag(ROW_TAG);
        return tag instanceof Row ? (Row) tag : null;
    }

    /** Also used by the isolated Android harness with synthetic chat rows. */
    public static void bindRow(
            TextView text,
            View item,
            String id,
            String room,
            String username,
            String userId,
            long timestamp) {
        bindRow(text, item, id, room, username, userId, timestamp, true);
    }

    private static void bindRow(
            TextView text,
            View item,
            String id,
            String room,
            String username,
            String userId,
            long timestamp,
            boolean emoteTap) {
        if (text == null || item == null) return;
        Row old = rowOf(text);
        if (old != null) {
            old.restoreVisibility();
            text.setTextSize(TypedValue.COMPLEX_UNIT_PX, old.fontPx);
        }
        String effectiveRoom = room == null || room.isEmpty() ? currentRoom : room;
        Row row = new Row(text, item, effectiveRoom, username, userId, timestamp);
        if (old != null) row.band = old.band;
        row.key = effectiveRoom + ":" + id;
        row.first = ChatLineHooks.isFirstMessage(id);
        Integer order = ORDER.get(row.key);
        row.alert =
                order == null
                        && timestamp > 0
                        && Math.abs(System.currentTimeMillis() - timestamp) < 30000;
        row.order = order == null ? -1 : order;
        ChatSettings settings = ChatSettings.get(text.getContext());
        if (emoteTap && Features.has(Feature.EMOTE_PREVIEW) && settings.emotePreview) EmoteTap.bind(text);
        if (Features.has(Feature.CHAT_HISTORY))
            ChatHistory.record(
                    text.getContext(),
                    new HistoryMessage(id, effectiveRoom, username, username, row.body, timestamp, userId,
                            // The tag counts positions in the message alone. A row without "name: " in front
                            // (a "/me") keeps the name in its text, so the positions would not fit.
                            row.body.length() < text.getText().length() ? ChatLineHooks.emotesTag(id) : ""));
        row.repeat = Features.has(Feature.CHAT_FILTERS) && settings.repeats
                && REPEATS.isRepeat(effectiveRoom, userId, id, row.folded(), timestamp);
        text.setTag(ROW_TAG, row);
        ROWS.put(text, Boolean.TRUE);
        apply(text, row);
    }

    /**
     * Binds a sample row of the settings preview. It is decorated like a real row, but it is never
     * recorded, never looked up with the emote or badge services, and its place in the list is given.
     */
    public static void bindPreview(TextView text, View item, String username, long timestamp, int order, boolean first) {
        Row old = rowOf(text);
        if (old != null) old.restoreVisibility();
        Row row = new Row(text, item, null, username, null, timestamp);
        if (old != null) row.band = old.band;
        row.key = "preview:" + order;
        row.preview = true;
        row.order = order;
        row.first = first;
        text.setTag(ROW_TAG, row);
        ROWS.put(text, Boolean.TRUE);
        apply(text, row);
    }

    /** Sets the row's text only when it differs from what the row already shows. */
    private static void apply(TextView text, Row row) {
        row.restoreVisibility();
        ChatSettings settings = ChatSettings.get(text.getContext());
        boolean alert = row.alert;
        row.alert = false;
        boolean appearance = Features.has(Feature.CHAT_APPEARANCE);
        // Before decorating: badge and emote images take their size from the row's text size.
        float fontPx = settings.enabled && appearance ? row.fontPx * settings.fontPercent / 100f : row.fontPx;
        if (text.getTextSize() != fontPx) text.setTextSize(TypedValue.COMPLEX_UNIT_PX, fontPx);
        CharSequence out = row.original;
        boolean alternating = false;
        Drawable background = text.getBackground();
        // The band is the background of the text view; one that Twitch put there is left alone.
        boolean bandFree = background == null || background == row.band;
        int mark = 0;
        if (settings.enabled) {
            boolean filters = Features.has(Feature.CHAT_FILTERS);
            if (filters && (settings.rules.blocksFolded(row::folded, row.username, row.userId)
                    || settings.repeats && row.repeat)) {
                EmoteSupport.clear(text);
                row.showBand(text, 0, false);
                row.hide();
                return;
            }
            if (row.order < 0) {
                row.order = sequence++;
                ORDER.put(row.key, row.order);
            }
            alternating = appearance && settings.alternating;
            boolean highlighted = filters && (settings.rules.highlightsFolded(row::folded)
                    || settings.rules.highlightsUser(row.username, row.userId) || mentionsOwnLogin(row, settings));
            if (highlighted) mark = settings.highlightColor;
            else if (row.first && Features.has(Feature.FIRST_TIME_CHATTERS) && settings.firstChatters) mark = FIRST_MESSAGE_COLOR;
            if (highlighted && alert && settings.vibrateHighlight) vibrate(text, settings.vibrationMs);
            out = decorate(text, row, settings, appearance, bandFree ? 0 : mark);
            boolean textEmotes = Features.has(Feature.COMPACT_CHAT) && settings.compactEmotes;
            if (Features.has(Feature.CHAT_EMOTES) && !row.preview && !textEmotes
                    && (settings.sevenTv || settings.bttv || settings.ffz)) {
                out = EmoteSupport.compose(text, out, row.room);
            } else {
                EmoteSupport.clear(text);
            }
        } else {
            EmoteSupport.clear(text);
        }
        int band = mark != 0 ? mark : bandShows(alternating, row.order, !bandFree) ? ALTERNATE_COLOR : 0;
        row.showBand(text, bandFree ? band : 0, mark != 0);
        if (out != row.shown) {
            text.setText(out, TextView.BufferType.SPANNABLE);
            row.shown = out;
        }
    }

    /**
     * The row with the chosen decorations, or the original when none applies.
     *
     * @param markBehindText the highlight or first-message colour when the band cannot carry it, else 0
     */
    private static CharSequence decorate(TextView text, Row row, ChatSettings settings, boolean appearance,
                                         int markBehindText) {
        SpannableStringBuilder decorated = new SpannableStringBuilder(row.original);
        int length = decorated.length();
        boolean changed = false;
        if (settings.paints && Features.has(Feature.CHAT_BADGES) && !row.preview)
            changed |= NamePaintSpan.apply(text, decorated, row.room, row.userId);
        if (appearance && settings.showLogin) changed |= showLogin(decorated, row.username);
        boolean compactBadges = Features.has(Feature.COMPACT_CHAT) && settings.compactBadges;
        if (Features.has(Feature.CHAT_BADGES) && !row.preview)
            ChatMetadata.decorate(text, decorated, row.username, row.userId, row.room, compactBadges);
        if (appearance && settings.timestamps && row.timestamp > 0) {
            String stamp = timeFormat(settings.timestampSeconds).format(new Date(row.timestamp));
            insertBefore(decorated, stamp);
            decorated.setSpan(new RelativeSizeSpan(.8f), 0, stamp.length() - 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE); // the gap after it stays full width
            // Quieter than the message, in either theme.
            decorated.setSpan(new ForegroundColorSpan(text.getCurrentTextColor() & 0x00FFFFFF | 0x99000000), 0, stamp.length(),
                    Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            changed = true;
        }
        // After the time is in, so the colour runs behind it too.
        if (markBehindText != 0) {
            decorated.setSpan(new BackgroundColorSpan(markBehindText), 0, decorated.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            changed = true;
        }
        return changed || decorated.length() != length ? decorated : row.original;
    }

    /**
     * Puts {@code text} in front of the row. Twitch's row starts with a badge image or the styled name, and a
     * style that starts where text is inserted takes that text in: the time turned into a second badge, or
     * took the name's colour. Paragraph styles have to keep starting at the row's start.
     */
    static void insertBefore(SpannableStringBuilder row, String text) {
        Object[] leading = row.getSpans(0, 0, Object.class);
        row.insert(0, text);
        for (Object span : leading) {
            int end = row.getSpanEnd(span);
            if (span instanceof ParagraphStyle || row.getSpanStart(span) != 0 || end < text.length()) continue;
            row.setSpan(span, text.length(), end, row.getSpanFlags(span));
        }
    }

    /**
     * Whether a row shows the alternating band: every other row while the setting is on, and never where
     * Twitch gave the row a background of its own (mentions, highlighted and first messages).
     */
    static boolean bandShows(boolean alternating, int order, boolean twitchBackground) {
        return alternating && (order & 1) != 0 && !twitchBackground;
    }

    /**
     * Whether Twitch draws a background under the text: on the row, on a view between the row and the
     * text, or on a view laid out beneath the text, like an animated message's bubble. Twitch sets the
     * row's background after the text, so this is only known when the row is drawn.
     */
    private static boolean underlaid(TextView text) {
        Row row = rowOf(text);
        View item = row == null ? null : row.item.get();
        View child = text;
        while (child != item && child.getParent() instanceof ViewGroup) {
            ViewGroup parent = (ViewGroup) child.getParent();
            if (seen(parent.getBackground())) return true;
            for (int i = parent.indexOfChild(child) - 1; i >= 0; i--) {
                View beneath = parent.getChildAt(i);
                if (beneath.getVisibility() == View.VISIBLE && seen(beneath.getBackground())) return true;
            }
            child = parent;
        }
        return false;
    }

    /** VOD rows get a transparent colour when they are not highlighted; that draws nothing. */
    private static boolean seen(Drawable background) {
        return background != null
                && !(background instanceof ColorDrawable && ((ColorDrawable) background).getAlpha() == 0);
    }

    private static boolean mentionsOwnLogin(Row row, ChatSettings settings) {
        if (!settings.highlightMentions) return false;
        String login = ChatLineHooks.ownLogin();
        return login != null && !login.equalsIgnoreCase(row.username) && ChatRules.mentions(row.body, login);
    }

    private static SimpleDateFormat timeFormat(boolean withSeconds) {
        if (withSeconds) {
            if (seconds == null) seconds = new SimpleDateFormat("HH:mm:ss ", Locale.getDefault());
            return seconds;
        }
        if (minutes == null) minutes = new SimpleDateFormat("HH:mm ", Locale.getDefault());
        return minutes;
    }

    private static void vibrate(TextView text, int milliseconds) {
        try {
            android.os.Vibrator vibrator =
                    (android.os.Vibrator) text.getContext().getSystemService(android.content.Context.VIBRATOR_SERVICE);
            if (vibrator != null)
                vibrator.vibrate(android.os.VibrationEffect.createOneShot(
                        Math.max(10, Math.min(1000, milliseconds)), android.os.VibrationEffect.DEFAULT_AMPLITUDE));
        } catch (SecurityException ignored) {
        }
    }

    /** Where to put " (login)" in a rendered row, or -1 when the display name is already the login. */
    static int loginInsertion(String row, String login) {
        if (login == null || !LOGIN.matcher(login).matches()) return -1;
        int split = row.indexOf(": ");
        return split <= 0 || row.substring(0, split).toLowerCase(Locale.ROOT).contains(login.toLowerCase(Locale.ROOT))
                ? -1 : split;
    }

    /** "表示名 (login)" when the display name is not just the login in another case. */
    static boolean showLogin(SpannableStringBuilder text, String login) {
        int split = loginInsertion(text.toString(), login);
        if (split < 0) return false;
        String shown = " (" + login + ")";
        text.insert(split, shown);
        text.setSpan(new RelativeSizeSpan(.85f), split, split + shown.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        text.setSpan(new ForegroundColorSpan(0xFFADADB8), split, split + shown.length(),
                Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return true;
    }

    public static void refresh() {
        for (TextView text : new ArrayList<>(ROWS.keySet())) {
            try {
                Row row = rowOf(text);
                if (row != null) apply(text, row);
            } catch (RuntimeException | LinkageError failure) {
                Diagnostics.note("chat.row-refresh", failure);
            }
        }
    }

    private static final class Row {
        final SpannedString original;
        /** The message without the sender, for word rules and repeats. */
        final String body;
        final WeakReference<View> item;
        final float fontPx;
        final String room, username, userId;
        final long timestamp;
        final int visibility, height;
        String key;
        private String folded;
        /** The text the row currently shows. */
        CharSequence shown;
        /** The text view's band, handed to the view's next row so binds allocate none. */
        Band band;
        boolean hidden, repeat, first;
        boolean alert, preview;
        int order;

        Row(TextView text, View view, String room, String username, String userId, long timestamp) {
            original = SpannedString.valueOf(text.getText());
            shown = original;
            body = ChatRules.body(original.toString());
            item = new WeakReference<>(view);
            fontPx = text.getTextSize();
            this.room = room;
            this.username = username;
            this.userId = userId;
            this.timestamp = timestamp;
            visibility = view.getVisibility();
            height =
                    view.getLayoutParams() == null
                            ? ViewGroup.LayoutParams.WRAP_CONTENT
                            : view.getLayoutParams().height;
        }

        String folded() {
            if (folded == null) folded = ChatRules.normalize(body);
            return folded;
        }

        void hide() {
            View view = item.get();
            if (view == null) return;
            hidden = true;
            view.setVisibility(View.GONE);
            ViewGroup.LayoutParams p = view.getLayoutParams();
            if (p != null) {
                p.height = 0;
                view.setLayoutParams(p);
            }
        }

        /**
         * Puts the band behind the text in this colour, or takes it away for 0; a background that is not
         * the band is left alone. A highlight shows {@code overTwitch}, on rows Twitch coloured too.
         */
        void showBand(TextView text, int color, boolean overTwitch) {
            Drawable current = text.getBackground();
            if (color != 0 && (current == null || current == band)) {
                if (band == null) band = new Band();
                band.show(color, overTwitch);
                if (current == null) text.setBackground(band);
            } else if (color == 0 && current != null && current == band) {
                text.setBackground(null);
            }
        }

        void restoreVisibility() {
            View view = item.get();
            if (!hidden || view == null) return;
            view.setVisibility(visibility);
            ViewGroup.LayoutParams p = view.getLayoutParams();
            if (p != null) {
                p.height = height;
                view.setLayoutParams(p);
            }
            hidden = false;
        }
    }

    /** A colour across the whole text of the row, under its emotes and badges too. */
    private static final class Band extends Drawable {
        private final Paint paint = new Paint();
        private boolean overTwitch;

        void show(int color, boolean overTwitch) {
            if (paint.getColor() == color && this.overTwitch == overTwitch) return;
            paint.setColor(color);
            this.overTwitch = overTwitch;
            invalidateSelf();
        }

        @Override
        public void draw(Canvas canvas) {
            Callback host = getCallback();
            if (!overTwitch && host instanceof TextView && underlaid((TextView) host)) return;
            canvas.drawRect(getBounds(), paint);
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter filter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
