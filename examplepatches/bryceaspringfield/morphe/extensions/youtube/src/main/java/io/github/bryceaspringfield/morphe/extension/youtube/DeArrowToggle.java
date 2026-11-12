package io.github.bryceaspringfield.morphe.extension.youtube;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Handler;
import android.os.Looper;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.text.style.ReplacementSpan;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.CompletableFuture;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.patches.LithoRelayoutPatch;
import app.morphe.extension.shared.patches.components.ContextInterface;
import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.shared.PlayerType;

/**
 * Taps on Morphe's DeArrow icon, and title suggestions. Morphe shows a bullseye icon before each title it took from
 * DeArrow; a tap on the icon switches that title between DeArrow's and the video's own, and a second tap switches it
 * back. On the page of the open video a pencil follows the icon (or stands alone when the video has no DeArrow title),
 * and a tap on it opens a dialog which sends a title to DeArrow under the SponsorBlock user ID of Morphe's settings.
 * <p>
 * The patch calls {@link #in} at the start of Morphe's Litho text hook and passes each text the hook returns through
 * {@link #out}.
 */
@SuppressWarnings("unused")
public final class DeArrowToggle {

    private static final String API = "https://sponsor.ajay.app";
    private static final char ICON = '\u25CE';
    private static final char PENCIL = '\u270E';
    /** Marks a title taken from the video's top comments ({@link CommentTitle}); a tap switches it. */
    private static final char QUOTE = '\u275D';
    /** An en space: wider than a space, so the icon and the pencil are separate tap targets. */
    private static final char GAP = '\u2002';

    /** What is known of a video whose title DeArrow replaced. */
    private static final class Info {
        volatile String videoId;
        volatile String original;
    }

    /** DeArrow title to its video, the newest 2,000. */
    private static final Map<String, Info> BY_TITLE = Collections.synchronizedMap(new LinkedHashMap<>() {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Info> eldest) {
            return size() > 2000;
        }
    });

    /** The DeArrow titles the user switched to the video's own title. */
    private static final Set<String> SHOW_ORIGINAL = Collections.synchronizedSet(new HashSet<>());

    private static final ThreadLocal<CharSequence> INPUT = new ThreadLocal<>();
    private static final ThreadLocal<String> IDENTIFIER = new ThreadLocal<>();
    /** Whether the text is the open video's title under the player (video_metadata, outside its subtitle). */
    private static final ThreadLocal<Boolean> WATCH_TITLE = new ThreadLocal<>();

    private DeArrowToggle() {
    }

    /** Marks a text this class built: the DeArrow title it stands for, and which of the two titles it shows. */
    private static final class State implements LithoRelayoutPatch.RelayoutSpan {
        final String key;
        final boolean original;
        final boolean pencil;
        /** For a video without a DeArrow title: its own title, and whether the comments' title is shown. */
        final String plain;
        final boolean commentShown;

        State(String key, boolean original, boolean pencil) {
            this(key, original, pencil, null, false);
        }

        State(String key, boolean original, boolean pencil, String plain, boolean commentShown) {
            this.key = key;
            this.original = original;
            this.pencil = pencil;
            this.plain = plain;
            this.commentShown = commentShown;
        }

        @Override
        public boolean isOutdated() {
            if (plain != null) return (CommentTitle.shown(plain) != null) != commentShown
                    || (!commentShown && CommentTitle.known(plain) != null && XSettings.COMMENT_TITLE.get() && !hasQuote);
            return key != null && showsOriginal(key) != original;
        }

        /** Whether the text drawn has the comments' quote mark. */
        boolean hasQuote;

        @Override
        public boolean canRelayoutHost(View host) {
            return true;
        }
    }

    private static final class IconClick extends ClickableSpan {
        final String key;

        IconClick(String key) {
            this.key = key;
        }

        @Override
        public void onClick(View widget) {
            toggle(key);
        }

        @Override
        public void updateDrawState(TextPaint paint) {
            // The icon keeps the title's color, with no underline.
        }
    }

    private static final class PencilClick extends ClickableSpan {
        final String videoId;
        final String shown;

        PencilClick(String videoId, String shown) {
            this.videoId = videoId;
            this.shown = shown;
        }

        @Override
        public void onClick(View widget) {
            suggest(widget, videoId, shown);
        }

        @Override
        public void updateDrawState(TextPaint paint) {
            paint.setAlpha(paint.getAlpha() / 2);
        }
    }

    /** Injection point, at the start of Morphe's Litho text hook: the text as YouTube built it. */
    public static void in(Object context, CharSequence text) {
        INPUT.set(text);
        String id = null;
        boolean watchTitle = false;
        try {
            if (context instanceof ContextInterface c) {
                id = c.patch_getIdentifier();
                // As Morphe's Copy video title finds the title: the metadata element, its inner text, not the subtitle.
                if (id != null && id.startsWith("video_metadata.e")) {
                    StringBuilder path = c.patch_getPathBuilder();
                    String p = path == null ? "" : path.toString();
                    watchTitle = p.contains("video_metadata_inner.e") && !p.contains("video_subtitle.e") && p.endsWith("|TextType|");
                }
            }
        } catch (Throwable ignored) {
        }
        IDENTIFIER.set(id);
        WATCH_TITLE.set(watchTitle);
    }

    /** Injection point, on each text Morphe's Litho text hook returns. */
    public static CharSequence out(CharSequence text) {
        try {
            boolean taps = XSettings.DEARROW_TAP.get();
            boolean suggests = XSettings.DEARROW_SUGGEST.get();
            if ((!taps && !suggests) || text == null || text.length() == 0) return text;
            State state = null;
            if (text instanceof Spanned s) {
                State[] states = s.getSpans(0, s.length(), State.class);
                if (states.length > 0) state = states[0];
            }
            String key = state != null ? state.key : hasIcon(text) ? text.toString().substring(1).trim() : null;
            if (key == null) {
                // No DeArrow title: a title the video's top comments correct shows the corrected one, with a quote
                // mark; only the open video's own title gets the pencil.
                String own = state != null && state.plain != null ? state.plain : stripped(text);
                String comment = CommentTitle.shown(own);
                boolean quote = XSettings.COMMENT_TITLE.get() && CommentTitle.known(own) != null;
                String videoId = suggests ? openVideo(own, stripped(INPUT.get())) : null;
                if (state != null && (state.plain == null || (state.commentShown == (comment != null)
                        && state.hasQuote == quote && state.pencil == (videoId != null)))) return text;
                if (!quote && videoId == null) {
                    // A plain title gets a span only on the open video's page, where a comments' title may arrive.
                    return text;
                }
                if (XSettings.DEBUG.get() && quote) {
                    Logger.printDebug(() -> "YouTube Extras: comments' title " + comment + " | own " + own + " | " + IDENTIFIER.get());
                }
                return buildPlain(text, own, comment, quote, videoId);
            }
            if (key.isEmpty()) return text;
            Info info = info(key);
            if (info.original == null) {
                String input = stripped(INPUT.get());
                if (input != null && !input.isEmpty() && !input.equals(key) && input.charAt(0) != ICON) info.original = input;
            }
            if (!taps && state == null && !suggests) return text;
            boolean original = taps && showsOriginal(key);
            String title = original ? info.original : key;
            String videoId = suggests ? openVideo(key, info.original) : null;
            if (videoId != null && info.videoId == null) info.videoId = videoId;
            if (state != null && state.original == original && state.pencil == (videoId != null)) return text;
            if (XSettings.DEBUG.get()) {
                Logger.printDebug(() -> "YouTube Extras: DeArrow title " + key + " | own " + info.original + " | shows own " + original
                        + " | pencil " + videoId + " | " + IDENTIFIER.get());
            }
            return build(text, taps ? key : null, title, original, videoId);
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: DeArrow title failure", t);
            return text;
        }
    }

    private static Info info(String key) {
        synchronized (BY_TITLE) {
            Info info = BY_TITLE.get(key);
            if (info == null) BY_TITLE.put(key, info = new Info());
            return info;
        }
    }

    private static boolean showsOriginal(String key) {
        if (!SHOW_ORIGINAL.contains(key)) return false;
        Info info = BY_TITLE.get(key);
        return info != null && info.original != null;
    }

    /** Whether the text starts with Morphe's DeArrow icon (an icon span over the bullseye placeholder). */
    private static boolean hasIcon(CharSequence text) {
        if (!(text instanceof Spanned s) || s.length() < 3 || s.charAt(0) != ICON) return false;
        for (ReplacementSpan span : s.getSpans(0, 1, ReplacementSpan.class)) {
            if (span.getClass().getName().endsWith("IconSpan")) return true;
        }
        return false;
    }

    /** A text without the invisible characters Morphe appends to mark a title, trimmed. */
    private static String stripped(CharSequence text) {
        if (text == null) return null;
        int end = text.length();
        while (end > 0) {
            char c = text.charAt(end - 1);
            if (Character.isWhitespace(c) || Character.getType(c) == Character.FORMAT
                    || Character.getType(c) == Character.PRIVATE_USE || Character.getType(c) == Character.UNASSIGNED
                    || (c >= '\uFE00' && c <= '\uFE0F')) end--;
            else break;
        }
        return text.subSequence(0, end).toString().trim();
    }

    /**
     * The ID of the open video when one of the titles is that video's title on its own page (the maximized player,
     * outside the lists of other videos and the player's overlay); null otherwise.
     */
    private static String openVideo(String a, String b) {
        try {
            String videoId0 = VideoInformation.getVideoId();
            // The title element under the player is the open video's, whether or not its title is known yet (a title
            // laid out before the player knew it got no pencil and was never laid out again).
            if (Boolean.TRUE.equals(WATCH_TITLE.get()) && videoId0 != null && videoId0.length() == 11) {
                if (XSettings.DEBUG.get()) Logger.printDebug(() -> "YouTube Extras: open video title by its element: " + videoId0);
                return videoId0;
            }
            if (PlayerType.getCurrent() != PlayerType.WATCH_WHILE_MAXIMIZED) return null;
            String id = IDENTIFIER.get();
            if (id != null && (id.contains("video_with_context") || id.contains("video_lockup") || id.contains("compact_")
                    || id.contains("shorts") || id.contains("player_overlay") || id.contains("comment"))) return null;
            String title = VideoInformation.getVideoTitle();
            String videoId = VideoInformation.getVideoId();
            if (title == null || videoId == null || videoId.length() != 11) return null;
            title = title.trim();
            if (title.isEmpty() || !(title.equals(a) || title.equals(b))) return null;
            if (XSettings.DEBUG.get()) Logger.printDebug(() -> "YouTube Extras: open video title in " + id);
            return videoId;
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * The text to show: the icon when the video has a DeArrow title (a tap target when key is given), the pencil when
     * the video is the open one, then the title, with the spans the source set over its whole length.
     */
    private static CharSequence build(CharSequence source, String key, String title, boolean original, String pencilVideoId) {
        boolean icon = hasIcon(source) || firstState(source) != null && firstState(source).key != null;
        SpannableStringBuilder b = new SpannableStringBuilder();
        if (icon) b.append(ICON).append(GAP);
        int pencilStart = b.length();
        if (pencilVideoId != null) b.append(PENCIL).append(GAP);
        int titleStart = b.length();
        b.append(title);
        if (source instanceof Spanned s) {
            for (Object span : s.getSpans(0, s.length(), Object.class)) {
                if (span instanceof State || span instanceof IconClick || span instanceof PencilClick) continue;
                int start = s.getSpanStart(span), end = s.getSpanEnd(span);
                if (start == 0 && end == s.length()) b.setSpan(span, 0, b.length(), s.getSpanFlags(span));
                else if (icon && start == 0 && end == 1 && span instanceof ReplacementSpan) {
                    b.setSpan(span, 0, 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                }
            }
        }
        String stateKey = icon ? (key != null ? key : keyOf(source)) : null;
        b.setSpan(new State(stateKey, original, pencilVideoId != null), 0, b.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        if (icon && key != null) b.setSpan(new IconClick(key), 0, 2, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        if (pencilVideoId != null) {
            b.setSpan(new PencilClick(pencilVideoId, title), pencilStart, titleStart, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        return b;
    }

    /** A title without a DeArrow title: the quote mark when the comments correct it, the pencil, then the title. */
    private static CharSequence buildPlain(CharSequence source, String own, String comment, boolean quote, String pencilVideoId) {
        SpannableStringBuilder b = new SpannableStringBuilder();
        if (quote) b.append(QUOTE).append(GAP);
        int pencilStart = b.length();
        if (pencilVideoId != null) b.append(PENCIL).append(GAP);
        int titleStart = b.length();
        String title = comment != null ? comment : own;
        b.append(title);
        if (source instanceof Spanned s) {
            for (Object span : s.getSpans(0, s.length(), Object.class)) {
                if (span instanceof State || span instanceof IconClick || span instanceof PencilClick || span instanceof QuoteClick) continue;
                if (s.getSpanStart(span) == 0 && s.getSpanEnd(span) == s.length()) b.setSpan(span, 0, b.length(), s.getSpanFlags(span));
            }
        }
        State state = new State(null, false, pencilVideoId != null, own, comment != null);
        state.hasQuote = quote;
        b.setSpan(state, 0, b.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        if (quote) b.setSpan(new QuoteClick(own), 0, 2, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        if (pencilVideoId != null) {
            // The suggestion starts from the comments' title when they give one.
            CommentTitle.Found f = CommentTitle.known(own);
            b.setSpan(new PencilClick(pencilVideoId, f != null ? f.title : title), pencilStart, titleStart, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        return b;
    }

    private static final class QuoteClick extends ClickableSpan {
        final String own;

        QuoteClick(String own) {
            this.own = own;
        }

        @Override
        public void onClick(View widget) {
            CommentTitle.toggle(own);
        }

        @Override
        public void updateDrawState(TextPaint paint) {
            paint.setAlpha(paint.getAlpha() * 2 / 3);
        }
    }

    private static State firstState(CharSequence text) {
        if (!(text instanceof Spanned s)) return null;
        State[] states = s.getSpans(0, s.length(), State.class);
        return states.length > 0 ? states[0] : null;
    }

    private static String keyOf(CharSequence source) {
        State state = firstState(source);
        return state != null ? state.key : source.toString().substring(1).trim();
    }

    /** A tap on the icon: switches the title, after fetching the video's own title when it is not known yet. */
    private static void toggle(String key) {
        if (XSettings.DEBUG.get()) Logger.printDebug(() -> "YouTube Extras: DeArrow icon tapped: " + key);
        if (SHOW_ORIGINAL.remove(key)) {
            LithoRelayoutPatch.relayoutOutdatedTexts();
            return;
        }
        Info info = info(key);
        if (info.original != null) {
            SHOW_ORIGINAL.add(key);
            LithoRelayoutPatch.relayoutOutdatedTexts();
            return;
        }
        new Thread(() -> {
            if (info.videoId == null || info.original == null) lookUp(key, info);
            if (info.original == null && info.videoId != null) info.original = oEmbedTitle(info.videoId);
            if (info.original == null || info.original.equals(key)) {
                info.original = null;
                toast(Strings.get("dearrow_no_original"));
                return;
            }
            SHOW_ORIGINAL.add(key);
            LithoRelayoutPatch.relayoutOutdatedTexts();
        }, "yx-dearrow-title").start();
    }

    /** Reads Morphe's cache of fetched titles for the video which has this DeArrow title. */
    private static void lookUp(String key, Info info) {
        try {
            Class<?> request = Class.forName("app.morphe.extension.youtube.patches.originaltitles.OriginalTitleRequest");
            Field field = request.getDeclaredField("cache");
            field.setAccessible(true);
            Map<?, ?> cache = (Map<?, ?>) field.get(null);
            if (cache == null) return;
            Object[] entries;
            synchronized (cache) {
                entries = cache.entrySet().toArray();
            }
            for (Object o : entries) {
                Map.Entry<?, ?> e = (Map.Entry<?, ?>) o;
                if (!(e.getValue() instanceof CompletableFuture<?> f) || !f.isDone() || f.isCompletedExceptionally()) continue;
                Object titles = f.getNow(null);
                if (titles == null) continue;
                Object deArrow = call(titles, "deArrowTitle");
                if (!(deArrow instanceof String d) || !d.trim().equals(key)) continue;
                info.videoId = String.valueOf(e.getKey());
                Object original = call(titles, "originalTitle");
                if (original instanceof String s && !s.trim().isEmpty() && !s.trim().equals(key)) info.original = s.trim();
                return;
            }
        } catch (Throwable t) {
            Logger.printDebug(() -> "YouTube Extras: Morphe's title cache was not read: " + t);
        }
    }

    private static Object call(Object owner, String method) throws Exception {
        java.lang.reflect.Method m = owner.getClass().getDeclaredMethod(method);
        m.setAccessible(true);
        return m.invoke(owner);
    }

    /** The video's own title from YouTube's oEmbed answer; null on any failure. */
    private static String oEmbedTitle(String videoId) {
        try {
            String url = "https://www.youtube.com/oembed?format=json&url="
                    + URLEncoder.encode("https://www.youtube.com/watch?v=" + videoId, "UTF-8");
            HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
            c.setConnectTimeout(5000);
            c.setReadTimeout(8000);
            if (c.getResponseCode() != 200) return null;
            String title = new JSONObject(read(c.getInputStream())).optString("title", "").trim();
            return title.isEmpty() ? null : title;
        } catch (Exception e) {
            Logger.printDebug(() -> "YouTube Extras: the video's own title was not fetched: " + e);
            return null;
        }
    }

    private static String read(InputStream in) throws Exception {
        if (in == null) return "";
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buf = new byte[8192];
        int n;
        while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
        return out.toString("UTF-8");
    }

    private static Activity activity(View view) {
        Context c = view == null ? null : view.getContext();
        while (c instanceof ContextWrapper w) {
            if (c instanceof Activity a) return a;
            c = w.getBaseContext();
        }
        return null;
    }

    /** A tap on the pencil: a dialog with the title to send to DeArrow for the open video. */
    private static void suggest(View widget, String videoId, String shown) {
        try {
            Activity activity = activity(widget);
            if (XSettings.DEBUG.get()) Logger.printDebug(() -> "YouTube Extras: DeArrow pencil tapped: " + videoId + " " + activity);
            if (activity == null || activity.isFinishing()) return;
            EditText edit = new EditText(activity);
            edit.setText(shown);
            edit.setSelection(edit.getText().length());
            edit.setMinLines(2);
            int pad = (int) (20 * activity.getResources().getDisplayMetrics().density);
            android.widget.FrameLayout frame = new android.widget.FrameLayout(activity);
            frame.setPadding(pad, pad / 2, pad, 0);
            frame.addView(edit);
            new AlertDialog.Builder(activity)
                    .setTitle(Strings.get("dearrow_suggest_title"))
                    .setMessage(Strings.get("dearrow_suggest_message"))
                    .setView(frame)
                    .setNegativeButton(android.R.string.cancel, null)
                    .setPositiveButton(Strings.get("dearrow_send"), (dialog, which) -> {
                        String title = edit.getText().toString().replaceAll("\\s+", " ").trim();
                        if (title.isEmpty()) return;
                        new Thread(() -> toast(submit(videoId, title)), "yx-dearrow-submit").start();
                    })
                    .show();
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: DeArrow suggestion dialog failure", t);
        }
    }

    /** The private user ID DeArrow counts submissions under: SponsorBlock's in Morphe's settings, else this bundle's own. */
    private static String userId() {
        try {
            String id = app.morphe.extension.youtube.settings.Settings.SB_PRIVATE_USER_ID.get();
            if (id != null && id.length() >= 30) return id;
        } catch (Throwable ignored) {
        }
        String own = XSettings.DEARROW_USER_ID.get();
        if (own == null || own.length() < 30) {
            own = (UUID.randomUUID().toString() + UUID.randomUUID()).replace("-", "");
            XSettings.DEARROW_USER_ID.save(own);
        }
        return own;
    }

    /** Sends the title to DeArrow; returns the line to show the user. */
    private static String submit(String videoId, String title) {
        try {
            JSONObject body = new JSONObject()
                    .put("videoID", videoId)
                    .put("userID", userId())
                    .put("service", "YouTube")
                    .put("userAgent", "YouTubeExtras/1.0")
                    .put("title", new JSONObject().put("title", title))
                    .put("downvote", false)
                    .put("autoLock", false);
            HttpURLConnection c = (HttpURLConnection) new URL(API + "/api/branding").openConnection();
            c.setConnectTimeout(6000);
            c.setReadTimeout(10000);
            c.setRequestMethod("POST");
            c.setDoOutput(true);
            c.setRequestProperty("Content-Type", "application/json");
            try (OutputStream o = c.getOutputStream()) {
                o.write(body.toString().getBytes(StandardCharsets.UTF_8));
            }
            int code = c.getResponseCode();
            if (code == 200) return Strings.get("dearrow_sent");
            String answer = read(code < 400 ? c.getInputStream() : c.getErrorStream()).trim();
            Logger.printDebug(() -> "YouTube Extras: DeArrow answered " + code);
            return Strings.get("dearrow_refused") + " (" + code + ")"
                    + (answer.isEmpty() || answer.startsWith("<") ? "" : ": " + (answer.length() > 160 ? answer.substring(0, 160) : answer));
        } catch (Exception e) {
            Logger.printDebug(() -> "YouTube Extras: DeArrow submission failed: " + e);
            return Strings.get("dearrow_failed");
        }
    }

    private static void toast(String text) {
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                Toast.makeText(Utils.getContext(), text, Toast.LENGTH_LONG).show();
            } catch (Throwable ignored) {
            }
        });
    }
}
