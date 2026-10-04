package app.morphe.extension.twitch.chat;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.media.AudioManager;
import android.media.ToneGenerator;
import android.os.SystemClock;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.SpannedString;
import android.text.style.LineBackgroundSpan;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

import io.github.bakwudo.uyu.extension.settings.Settings;

/**
 * Detects Twitch's own local-user MentionToken and highlights the complete chat line.
 *
 * PurpleTV's working implementation uses the same stable signal: a live chat message contains
 * a mention token whose generated toString() includes "isLocalUser=true". Kizu receives a
 * MessageRecyclerItem at the TextView binder, so this class resolves the nested LiveChatMessage
 * structurally without relying on an obfuscated class or field name.
 */
public final class MentionSupport {
    private static final Object LOCK = new Object();
    private static final Map<TextView, Object> MODELS =
            Collections.synchronizedMap(new java.util.WeakHashMap<TextView, Object>());
    private static final Map<TextView, Object> SOUND_MODELS =
            Collections.synchronizedMap(new java.util.WeakHashMap<TextView, Object>());
    private static volatile long lastSoundAtMs = Long.MIN_VALUE;
    private static ToneGenerator toneGenerator;

    /** Default highlight kept for backwards compatibility with the first mention build. */
    public static final int DEFAULT_HIGHLIGHT_COLOR = 0x4D9146FF;

    private static final String LIVE_MESSAGE_PREFIX = "LiveChatMessage(";
    private static final String MENTION_PREFIX = "MentionToken(";
    private static final String[] TOKEN_PREFIXES = {
            MENTION_PREFIX,
            "TextToken(",
            "EmoteToken(",
            "UrlToken(",
            "BitsToken(",
            "CensoredTextToken("
    };

    private static final class MarkerSpan {}
    private static final class MentionBar implements LineBackgroundSpan {
        private final int color;

        MentionBar(int color) {
            this.color = color;
        }

        @Override
        public void drawBackground(
                Canvas canvas,
                Paint paint,
                int left,
                int right,
                int top,
                int baseline,
                int bottom,
                CharSequence text,
                int start,
                int end,
                int lineNumber
        ) {
            int previous = paint.getColor();
            paint.setColor(color);
            canvas.drawRect(left, top, right, bottom, paint);
            paint.setColor(previous);
        }
    }

    private MentionSupport() {}

    public static void bind(Object messageModel, TextView textView) {
        if (textView == null) return;
        synchronized (LOCK) {
            SOUND_MODELS.remove(textView);
            if (messageModel == null) {
                MODELS.remove(textView);
            } else {
                MODELS.put(textView, messageModel);
            }
        }
    }

    public static void forget(TextView textView) {
        if (textView == null) return;
        synchronized (LOCK) {
            MODELS.remove(textView);
            SOUND_MODELS.remove(textView);
        }
    }

    /**
     * Applies or removes our row highlight after EmoteSupport has finished writing the row text.
     * Never throws: this sits directly on Twitch's chat RecyclerView binding path.
     */
    public static void apply(TextView textView) {
        if (textView == null) return;
        try {
            Object model;
            synchronized (LOCK) {
                model = MODELS.get(textView);
            }

            CharSequence current = textView.getText();
            if (current == null || current.length() == 0) return;

            boolean highlightEnabled = Settings.CHAT_MENTION_HIGHLIGHT.get();
            boolean soundEnabled = Settings.CHAT_MENTION_SOUND.get();
            boolean mention = (highlightEnabled || soundEnabled) && mentionsLocalUser(model);

            Spanned spanned = current instanceof Spanned ? (Spanned) current : null;
            MentionBar[] oldBars = spanned == null
                    ? new MentionBar[0]
                    : spanned.getSpans(0, spanned.length(), MentionBar.class);
            MarkerSpan[] oldMarkers = spanned == null
                    ? new MarkerSpan[0]
                    : spanned.getSpans(0, spanned.length(), MarkerSpan.class);

            if (!mention && oldBars.length == 0 && oldMarkers.length == 0) return;

            SpannableStringBuilder out = new SpannableStringBuilder(current);
            for (MentionBar span : oldBars) {
                out.removeSpan(span);
            }
            for (MarkerSpan span : oldMarkers) {
                out.removeSpan(span);
            }

            if (mention && highlightEnabled && out.length() > 0) {
                out.setSpan(
                        new MentionBar(Settings.CHAT_MENTION_HIGHLIGHT_COLOR.get()),
                        0,
                        out.length(),
                        Spannable.SPAN_EXCLUSIVE_EXCLUSIVE
                );
                out.setSpan(
                        new MarkerSpan(),
                        0,
                        out.length(),
                        Spannable.SPAN_INCLUSIVE_INCLUSIVE
                );
            }

            textView.setText(new SpannedString(out), TextView.BufferType.SPANNABLE);

            if (mention && soundEnabled) {
                maybePlayMentionSound(textView, model);
            }
        } catch (Throwable ignored) {
            // A malformed message model must never take down Twitch chat.
        }
    }

    private static void maybePlayMentionSound(TextView textView, Object model) {
        if (textView == null || model == null) return;

        long now = SystemClock.uptimeMillis();
        int cooldown = Settings.CHAT_MENTION_SOUND_COOLDOWN_MS.get();
        synchronized (LOCK) {
            if (SOUND_MODELS.get(textView) == model) return;

            // Mark this message as processed even when the global cooldown suppresses its sound.
            SOUND_MODELS.put(textView, model);
            if (lastSoundAtMs != Long.MIN_VALUE && now - lastSoundAtMs < cooldown) {
                return;
            }
            lastSoundAtMs = now;
        }

        try {
            ToneGenerator generator;
            synchronized (LOCK) {
                if (toneGenerator == null) {
                    toneGenerator = new ToneGenerator(AudioManager.STREAM_NOTIFICATION, 75);
                }
                generator = toneGenerator;
            }
            generator.startTone(ToneGenerator.TONE_PROP_BEEP2, 140);
        } catch (Throwable ignored) {
            // Audio failure must never affect chat rendering.
        }
    }

    private static boolean mentionsLocalUser(Object model) {
        if (model == null) return false;

        Object liveMessage = findLiveMessage(
                model,
                3,
                new IdentityHashMap<Object, Boolean>()
        );
        if (liveMessage == null) return false;

        // Fast path and compatibility fallback: Kotlin data-class toString() keeps token labels.
        String messageText = safeString(liveMessage);
        if (messageText.contains(MENTION_PREFIX) && messageText.contains("isLocalUser=true")) {
            return true;
        }

        List<?> tokens = findTokenList(liveMessage);
        if (tokens == null) return false;

        for (Object token : tokens) {
            String value = safeString(token);
            if (value.startsWith(MENTION_PREFIX) && value.contains("isLocalUser=true")) {
                return true;
            }
        }
        return false;
    }

    private static Object findLiveMessage(Object root, int depth, Map<Object, Boolean> seen) {
        if (root == null || seen.put(root, Boolean.TRUE) != null) return null;

        String rootText = safeString(root);
        if (rootText.startsWith(LIVE_MESSAGE_PREFIX)) return root;
        if (depth <= 0) return null;

        Class<?> type = root.getClass();
        for (Class<?> current = type; current != null && current != Object.class;
             current = current.getSuperclass()) {
            Field[] fields;
            try {
                fields = current.getDeclaredFields();
            } catch (Throwable ignored) {
                continue;
            }

            for (Field field : fields) {
                try {
                    if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) {
                        continue;
                    }
                    if (List.class.isAssignableFrom(field.getType())
                            || Map.class.isAssignableFrom(field.getType())
                            || field.getType().isArray()) {
                        continue;
                    }
                    field.setAccessible(true);
                    Object value = field.get(root);
                    if (value == null) continue;

                    String valueText = safeString(value);
                    if (valueText.startsWith(LIVE_MESSAGE_PREFIX)) return value;

                    Object nested = findLiveMessage(value, depth - 1, seen);
                    if (nested != null) return nested;
                } catch (Throwable ignored) {
                    // Continue probing other fields.
                }
            }
        }
        return null;
    }

    private static List<?> findTokenList(Object message) {
        for (Class<?> current = message.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            Field[] fields;
            try {
                fields = current.getDeclaredFields();
            } catch (Throwable ignored) {
                continue;
            }

            for (Field field : fields) {
                try {
                    if (Modifier.isStatic(field.getModifiers())
                            || !List.class.isAssignableFrom(field.getType())) {
                        continue;
                    }
                    field.setAccessible(true);
                    Object value = field.get(message);
                    if (!(value instanceof List)) continue;

                    List<?> list = (List<?>) value;
                    int checked = 0;
                    for (Object token : list) {
                        if (token == null) continue;
                        String tokenText = safeString(token);
                        if (startsWithKnownToken(tokenText)) return list;
                        if (++checked >= 3) break;
                    }
                } catch (Throwable ignored) {
                    // Keep looking for the actual token list.
                }
            }
        }
        return null;
    }

    private static boolean startsWithKnownToken(String value) {
        for (String prefix : TOKEN_PREFIXES) {
            if (value.startsWith(prefix)) return true;
        }
        return false;
    }

    private static String safeString(Object value) {
        try {
            return value == null ? "" : String.valueOf(value);
        } catch (Throwable ignored) {
            return "";
        }
    }
}
