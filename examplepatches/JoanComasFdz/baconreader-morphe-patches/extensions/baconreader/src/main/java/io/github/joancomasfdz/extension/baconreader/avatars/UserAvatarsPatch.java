// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.avatars;

import static app.morphe.extension.shared.StringRef.str;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Shader;
import android.os.Handler;
import android.os.Looper;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.text.style.ReplacementSpan;
import android.util.LruCache;
import android.view.View;
import android.widget.TextView;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import io.github.joancomasfdz.extension.baconreader.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * <p>
 * User avatars before the author of comments, as on Reddit's website. The comment JSON has the author's id
 * (author_fullname, a field the patch adds to the app's Comment class); avatars come from
 * api/user_data_by_account_ids (profile_img), up to 100 users per request.
 */
@SuppressWarnings("unused")
public final class UserAvatarsPatch {
    private static final String USER_DATA_PATH = "api/user_data_by_account_ids";
    private static final int BATCH_SIZE = 100;
    private static final long BATCH_DELAY_MS = 150;
    /** Avatars are drawn at about 20dp; this keeps them sharp on any screen. */
    private static final int BITMAP_SIZE = 128;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService LOADER = Executors.newFixedThreadPool(3);

    /** User name -> user id (t2_...), from the comments shown, for the reply screen. */
    private static final Map<String, String> IDS = new HashMap<>();
    /** User id (t2_...) -> avatar URL, or "" when the user has none. */
    private static final Map<String, String> URLS = new HashMap<>();
    private static final LruCache<String, Bitmap> BITMAPS = new LruCache<>(300);
    /** User ids whose avatar is being looked up or downloaded. */
    private static final Set<String> LOADING = new HashSet<>();
    /** User ids to look up in the next request. */
    private static final Set<String> QUEUE = new LinkedHashSet<>();
    /** Spans waiting for their avatar. */
    private static final Map<String, List<WeakReference<AvatarSpan>>> WAITING = new HashMap<>();
    private static boolean batchScheduled;
    /** The error is shown once per session, so the user knows why there are no avatars. */
    private static boolean errorShown;
    /** The comment whose author line is being built (set at the start of getCommentSubText). */
    private static final ThreadLocal<Object> CURRENT_COMMENT = new ThreadLocal<>();

    private UserAvatarsPatch() {
    }

    // region Hooks

    /** Injected at the start of SubTextBuilder.getCommentSubText, where its Comment parameter is still known. */
    public static void setComment(Object comment) {
        CURRENT_COMMENT.set(comment);
    }

    /**
     * Injected before SubTextBuilder.getCommentSubText returns the author line of a comment:
     * puts the avatar before it.
     */
    public static Spannable withAvatar(Spannable subText) {
        Object comment = CURRENT_COMMENT.get();
        CURRENT_COMMENT.remove();
        try {
            if (subText == null || comment == null || !Settings.USER_AVATARS.get()) return subText;
            String userId = (String) comment.getClass().getField("author_fullname").get(comment);
            if (TextUtils.isEmpty(userId) || !userId.startsWith("t2_")) return subText;
            Object author = comment.getClass().getField("author").get(comment);
            if (author instanceof String) {
                synchronized (URLS) {
                    IDS.put((String) author, userId);
                }
            }

            AvatarSpan span = new AvatarSpan();
            SpannableStringBuilder text = new SpannableStringBuilder("￼ ");
            text.setSpan(span, 0, 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            text.append(subText);
            request(userId, span);
            return text;
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not add the avatar", ex);
            return subText;
        }
    }

    /** Injected after CommentHolder sets the author line: the view to redraw when the avatar arrives. */
    public static void bindAvatars(TextView textView) {
        CharSequence text = textView.getText();
        if (!(text instanceof Spanned)) return;
        for (AvatarSpan span : ((Spanned) text).getSpans(0, text.length(), AvatarSpan.class)) {
            span.view = new WeakReference<>(textView);
        }
    }

    /**
     * Injected after the reply screen sets "Reply to [author] in r/... as [you]": puts the avatar before the
     * author. The comment reaches that screen without its author id, so the user is found by name.
     */
    public static void replyAvatar(TextView textView) {
        try {
            if (!Settings.USER_AVATARS.get()) return;
            CharSequence text = textView.getText();
            if (!(text instanceof Spanned)) return;
            Spanned spanned = (Spanned) text;
            ForegroundColorSpan[] colors = spanned.getSpans(0, spanned.length(), ForegroundColorSpan.class);
            if (colors.length == 0) return;
            // The author is the first colored part.
            ForegroundColorSpan first = colors[0];
            for (ForegroundColorSpan color : colors) {
                if (spanned.getSpanStart(color) < spanned.getSpanStart(first)) first = color;
            }
            int start = spanned.getSpanStart(first);
            String author = spanned.subSequence(start, spanned.getSpanEnd(first)).toString();
            insertAvatar(textView, start, author, null);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not add the avatar to the reply screen", ex);
        }
    }

    /**
     * Injected after an inbox item sets its label ("Comment reply: [author]", "to [recipient], from [author]"):
     * puts the avatars of the message's author and, for private messages, of its recipient before their names.
     */
    public static void inboxAvatar(Object holder, TextView label) {
        try {
            if (!Settings.USER_AVATARS.get()) return;
            java.lang.reflect.Field messageField = holder.getClass().getDeclaredField("message");
            messageField.setAccessible(true);
            Object message = messageField.get(holder);
            if (message == null) return;
            String text = label.getText().toString();
            boolean isComment = message.getClass().getName().equals("com.onelouder.baconreader.reddit.Comment");

            // The sender: "Comment reply: [author]" or "from [author]" (not shown when the user is the sender).
            Object author = message.getClass().getField("author").get(message);
            int authorStart = -1;
            if (author instanceof String) {
                if (isComment) {
                    authorStart = text.lastIndexOf((String) author);
                } else {
                    int from = text.lastIndexOf("from " + author);
                    if (from >= 0) authorStart = from + "from ".length();
                }
            }
            // The recipient of a private message: "to [user]" (Messages and Sent).
            Object dest = isComment ? null : message.getClass().getField("dest").get(message);
            int destStart = -1;
            // Not a subreddit's mod mail ("#subreddit").
            if (dest instanceof String && !((String) dest).startsWith("#") && !((String) dest).contains("/")) {
                int to = text.lastIndexOf("to " + dest); // After the subject, which can contain "to "...
                if (to >= 0) destStart = to + "to ".length();
            }

            // The later one first, so the position of the other one does not move.
            Object authorId = message.getClass().getField("author_fullname").get(message);
            String authorUserId = authorId instanceof String ? (String) authorId : null;
            if (authorStart > destStart) {
                insertAvatar(label, authorStart, (String) author, authorUserId);
                if (destStart >= 0) insertAvatar(label, destStart, (String) dest, null);
            } else {
                if (destStart >= 0) insertAvatar(label, destStart, (String) dest, null);
                if (authorStart >= 0) insertAvatar(label, authorStart, (String) author, authorUserId);
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not add the avatar to the inbox", ex);
        }
    }

    /**
     * Puts the avatar of the user at [start] of the text of the view. Without the user's id, it comes from the
     * comments already shown, else from user/[name]/about.
     */
    private static void insertAvatar(TextView textView, int start, final String author, String userId) {
        if (author.isEmpty() || author.equals("[deleted]")) return;
        final AvatarSpan span = new AvatarSpan();
        span.view = new WeakReference<>(textView);
        SpannableStringBuilder withAvatar = new SpannableStringBuilder(textView.getText());
        withAvatar.insert(start, "\uFFFC ");
        withAvatar.setSpan(span, start, start + 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        textView.setText(withAvatar);

        synchronized (URLS) {
            if (userId != null && userId.startsWith("t2_")) {
                IDS.put(author, userId);
            } else {
                userId = IDS.get(author);
            }
        }
        if (userId != null) {
            request(userId, span);
            return;
        }
        LOADER.execute(() -> {
            try {
                JSONObject about = new JSONObject(apiGet("user/" + author + "/about", new HashMap<>()));
                String id = about.getJSONObject("data").optString("id", "");
                if (id.isEmpty()) return;
                final String found = "t2_" + id;
                synchronized (URLS) {
                    IDS.put(author, found);
                }
                MAIN.post(() -> request(found, span));
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not look up the user " + author, ex);
                showError(ex);
            }
        });
    }

    // endregion

    // region Loading

    private static void request(String userId, AvatarSpan span) {
        synchronized (URLS) {
            Bitmap bitmap = BITMAPS.get(userId);
            if (bitmap != null) {
                span.bitmap = bitmap;
                return;
            }
            if ("".equals(URLS.get(userId))) return; // No avatar.

            List<WeakReference<AvatarSpan>> spans = WAITING.get(userId);
            if (spans == null) {
                spans = new ArrayList<>();
                WAITING.put(userId, spans);
            }
            spans.add(new WeakReference<>(span));
            if (LOADING.contains(userId)) return;
            LOADING.add(userId);

            String url = URLS.get(userId);
            if (url != null) {
                download(userId, url);
                return;
            }
            QUEUE.add(userId);
            if (!batchScheduled) {
                batchScheduled = true;
                MAIN.postDelayed(UserAvatarsPatch::lookUpQueue, BATCH_DELAY_MS);
            }
        }
    }

    /** Looks up the queued users, 100 per request. */
    private static void lookUpQueue() {
        final List<String> ids;
        synchronized (URLS) {
            batchScheduled = false;
            ids = new ArrayList<>(QUEUE);
            QUEUE.clear();
        }
        for (int start = 0; start < ids.size(); start += BATCH_SIZE) {
            final List<String> batch = ids.subList(start, Math.min(ids.size(), start + BATCH_SIZE));
            LOADER.execute(() -> lookUp(new ArrayList<>(batch)));
        }
    }

    private static void lookUp(List<String> ids) {
        Map<String, String> found = new HashMap<>();
        try {
            JSONObject users = new JSONObject(userData(TextUtils.join(",", ids)));
            for (String id : ids) {
                JSONObject user = users.optJSONObject(id);
                String url = user == null ? "" : user.optString("profile_img", "").replace("&amp;", "&");
                found.put(id, url);
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not look up the avatars of " + ids.size() + " users", ex);
            showError(ex);
        }
        synchronized (URLS) {
            for (String id : ids) {
                String url = found.get(id);
                if (url == null) {
                    // The request failed: try again for the next comment of this user.
                    LOADING.remove(id);
                    WAITING.remove(id);
                    continue;
                }
                URLS.put(id, url);
                if (url.isEmpty()) {
                    LOADING.remove(id);
                    WAITING.remove(id);
                } else {
                    download(id, url);
                }
            }
        }
    }

    private static void download(final String userId, final String url) {
        LOADER.execute(() -> {
            Bitmap bitmap = null;
            try {
                byte[] data = get(url);
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inJustDecodeBounds = true;
                BitmapFactory.decodeByteArray(data, 0, data.length, options);
                options.inSampleSize = 1;
                while (Math.min(options.outWidth, options.outHeight) / (options.inSampleSize * 2) >= BITMAP_SIZE) {
                    options.inSampleSize *= 2;
                }
                options.inJustDecodeBounds = false;
                bitmap = BitmapFactory.decodeByteArray(data, 0, data.length, options);
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not load the avatar " + url, ex);
                showError(ex);
            }
            final Bitmap loaded = bitmap;
            MAIN.post(() -> deliver(userId, loaded));
        });
    }

    private static void showError(Exception ex) {
        Throwable cause = ex instanceof java.lang.reflect.InvocationTargetException && ex.getCause() != null
                ? ex.getCause() : ex;
        final String message = cause.getMessage() != null ? cause.getMessage() : cause.getClass().getSimpleName();
        MAIN.post(() -> {
            if (errorShown) return;
            errorShown = true;
            Utils.showToastLong(str("revanced_baconreader_user_avatars_error", message));
        });
    }

    private static void deliver(String userId, Bitmap bitmap) {
        List<WeakReference<AvatarSpan>> spans;
        synchronized (URLS) {
            LOADING.remove(userId);
            spans = WAITING.remove(userId);
            if (bitmap == null) return;
            BITMAPS.put(userId, bitmap);
        }
        if (spans == null) return;
        for (WeakReference<AvatarSpan> reference : spans) {
            AvatarSpan span = reference.get();
            if (span == null) continue;
            span.bitmap = bitmap;
            View view = span.view == null ? null : span.view.get();
            if (view != null) view.invalidate();
        }
    }

    /**
     * The users' data, through the app's own request code (RedditApi.httpRequest): with the login, it calls
     * oauth.reddit.com with the session's token (refreshed when needed) and the app's user agent. Reddit blocks
     * other requests from apps.
     */
    private static String userData(String ids) throws Exception {
        Map<String, String> params = new HashMap<>();
        params.put("ids", ids);
        return apiGet(USER_DATA_PATH, params);
    }

    /** A GET to Reddit's API through the app's request code, as userData. */
    private static String apiGet(String path, Map<String, String> params) throws Exception {
        Object token = Class.forName("com.onelouder.baconreader.data.SessionManager")
                .getMethod("getToken").invoke(null);
        Class<?> requestMethod = Class.forName("com.onelouder.baconreader.RequestMethod");
        Class<?> api = Class.forName("com.onelouder.baconreader.reddit.RedditApi");
        Method httpRequest = api.getDeclaredMethod("httpRequest", Context.class, requestMethod, String.class,
                Map.class, Class.forName("com.onelouder.baconreader.data.SessionToken"));
        httpRequest.setAccessible(true);
        // Without a login the app calls www.reddit.com, which needs the .json suffix.
        if (token == null) path += ".json";
        @SuppressWarnings({"unchecked", "rawtypes"})
        Object get = Enum.valueOf((Class<Enum>) requestMethod, "GET");
        return (String) httpRequest.invoke(null, Utils.getContext(), get, path, params, token);
    }

    private static byte[] get(String url) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        try {
            connection.setConnectTimeout(15000);
            connection.setReadTimeout(15000);
            connection.setRequestProperty("User-Agent", "android:com.onelouder.baconreader (Morphe)");
            int code = connection.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) throw new java.io.IOException("HTTP " + code + " for " + url);
            try (InputStream in = connection.getInputStream()) {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buffer = new byte[16384];
                int read;
                while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
                return out.toByteArray();
            }
        } finally {
            connection.disconnect();
        }
    }

    // endregion

    /** The size of the comment avatars of Reddit's website (Large). */
    private static final int REDDIT_SIZE_DP = 24;

    /**
     * The avatar diameter in pixels for a text line of the given height, for the "Avatar size" setting:
     * Normal is the text line height, Large the size of Reddit's website, Medium halfway between them and
     * Extra large one such step bigger than Large.
     */
    private static int avatarSize(int lineHeight) {
        float density = Utils.getContext().getResources().getDisplayMetrics().density;
        float normal = lineHeight;
        // With a big font the text line can be as tall as Reddit's avatars: Large is still bigger than Normal.
        float large = Math.max(REDDIT_SIZE_DP * density, normal + 4 * density);
        float step = (large - normal) / 2f;
        int size = Math.max(0, Math.min(3, Settings.USER_AVATAR_SIZE.get()));
        return Math.round(normal + size * step);
    }

    /**
     * A round avatar, as tall as the text line (Normal) or bigger, centered on the text, with a faint disc
     * until it is loaded (and behind it, when enabled). A bigger avatar makes its line taller.
     */
    static final class AvatarSpan extends ReplacementSpan {
        volatile Bitmap bitmap;
        WeakReference<View> view;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
        private final Matrix matrix = new Matrix();

        @Override
        public int getSize(Paint textPaint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
            Paint.FontMetricsInt metrics = textPaint.getFontMetricsInt();
            int lineHeight = metrics.descent - metrics.ascent;
            int size = avatarSize(lineHeight);
            if (fm != null) {
                int extra = size - lineHeight;
                fm.ascent = metrics.ascent - extra / 2;
                fm.descent = metrics.descent + (extra - extra / 2);
                fm.top = Math.min(metrics.top, fm.ascent);
                fm.bottom = Math.max(metrics.bottom, fm.descent);
            }
            return size;
        }

        @Override
        public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom,
                         Paint textPaint) {
            Paint.FontMetricsInt metrics = textPaint.getFontMetricsInt();
            float size = avatarSize(metrics.descent - metrics.ascent);
            float radius = size / 2f;
            float cx = x + radius;
            // The middle of the text, so the avatar stays centered when it is taller than the text.
            float cy = y + (metrics.ascent + metrics.descent) / 2f;
            Bitmap current = bitmap;
            // A faint disc while loading, and behind the avatar when enabled: many avatars are transparent.
            if (current == null || Settings.USER_AVATAR_BACKGROUND.get()) {
                paint.setShader(null);
                paint.setColor(textPaint.getColor());
                paint.setAlpha(64); // 25%.
                canvas.drawCircle(cx, cy, radius, paint);
                if (current == null) return;
            }
            BitmapShader shader = new BitmapShader(current, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
            float scale = size / Math.min(current.getWidth(), current.getHeight());
            matrix.reset();
            matrix.setScale(scale, scale);
            matrix.postTranslate(cx - current.getWidth() * scale / 2f, cy - current.getHeight() * scale / 2f);
            shader.setLocalMatrix(matrix);
            paint.setShader(shader);
            paint.setAlpha(255);
            canvas.drawCircle(cx, cy, radius, paint);
        }
    }
}
