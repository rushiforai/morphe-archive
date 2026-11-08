package app.morphe.extension.instagram.patches.story;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.util.LruCache;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.io.File;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Two-column grid adapter for the story like history. Each cell is a thumbnail (3:4-ish,
 * rounded top corners, with the story's posted time overlaid) over the author's display name,
 * {@code @username} and the time the story was liked.
 */
@SuppressWarnings("unused")
public final class StoryLikeHistoryAdapter extends BaseAdapter {

    /** Callbacks for a cell's tappable regions, wired by the hosting Activity. */
    public interface Listener {
        void onThumbnail(StoryLikeHistoryEntry entry);

        void onProfile(StoryLikeHistoryEntry entry);

        void onMenu(StoryLikeHistoryEntry entry, View anchor);
    }

    private static final Listener NOOP = new Listener() {
        @Override public void onThumbnail(StoryLikeHistoryEntry entry) { }
        @Override public void onProfile(StoryLikeHistoryEntry entry) { }
        @Override public void onMenu(StoryLikeHistoryEntry entry, View anchor) { }
    };

    private static final int TEXT_PRIMARY = Color.WHITE;
    private static final int TEXT_SECONDARY = 0xFF9AA3AE;
    private static final int ACCENT = 0xFFE1306C;
    private static final int PLACEHOLDER = 0xFF2A2F36;
    private static final int BADGE_BG = 0x99000000;
    private static final int THUMB_HEIGHT_DP = 200;
    private static final int CORNER_DP = 12;
    private static final int SAMPLE_WIDTH = 300;
    private static final int CACHE_KB = 24 * 1024;

    /** Decoded thumbnails, keyed by path; small enough for a phone screen of cells. */
    private static final LruCache<String, Bitmap> CACHE = new LruCache<>(CACHE_KB) {
        @Override
        protected int sizeOf(String key, Bitmap value) {
            return value.getByteCount() / 1024;
        }
    };

    private static final ExecutorService DECODER = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "wagg13-story-likes-thumbs");
        thread.setDaemon(true);
        return thread;
    });

    private final Context context;
    private final Listener listener;
    private final List<StoryLikeHistoryEntry> entries = new ArrayList<>();

    public StoryLikeHistoryAdapter(Context context, List<StoryLikeHistoryEntry> entries) {
        this(context, entries, NOOP);
    }

    public StoryLikeHistoryAdapter(Context context, List<StoryLikeHistoryEntry> entries, Listener listener) {
        this.context = context;
        this.listener = listener;
        this.entries.addAll(entries);
    }

    public void submit(List<StoryLikeHistoryEntry> entries) {
        this.entries.clear();
        this.entries.addAll(entries);
        notifyDataSetChanged();
    }

    @Override
    public int getCount() {
        return entries.size();
    }

    @Override
    public StoryLikeHistoryEntry getItem(int position) {
        return entries.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        StoryLikeHistoryEntry entry = getItem(position);
        View cell = convertView != null ? convertView : buildCell();
        bind((LinearLayout) cell, entry);
        return cell;
    }

    // ---- construction (once per recycled cell) -------------------------------------------

    private LinearLayout buildCell() {
        LinearLayout cell = new LinearLayout(context);
        cell.setOrientation(LinearLayout.VERTICAL);

        // Thumbnail + posted-time badge + (later) video indicator.
        FrameLayout media = new FrameLayout(context);
        ImageView thumb = new ImageView(context);
        thumb.setScaleType(ImageView.ScaleType.CENTER_CROP);
        GradientDrawable bg = roundedTop();
        bg.setColor(PLACEHOLDER);
        thumb.setBackground(bg);
        thumb.setClipToOutline(true);
        media.addView(thumb, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(THUMB_HEIGHT_DP)));

        TextView badge = new TextView(context);
        badge.setTextColor(Color.WHITE);
        badge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        badge.setBackgroundColor(BADGE_BG);
        badge.setPadding(dp(6), dp(2), dp(6), dp(2));
        FrameLayout.LayoutParams badgeLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.START);
        badgeLp.setMargins(dp(4), dp(4), 0, 0);
        media.addView(badge, badgeLp);

        TextView expired = new TextView(context);
        expired.setText(pt() ? "EXPIRADO" : "EXPIRED");
        expired.setTextColor(Color.WHITE);
        expired.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10);
        expired.setTypeface(null, android.graphics.Typeface.BOLD);
        GradientDrawable expiredBg = new GradientDrawable();
        expiredBg.setColor(0xCCE1306C);
        expiredBg.setCornerRadius(dp(4));
        expired.setBackground(expiredBg);
        expired.setPadding(dp(6), dp(2), dp(6), dp(2));
        FrameLayout.LayoutParams expiredLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM | Gravity.START);
        expiredLp.setMargins(dp(4), 0, 0, dp(4));
        media.addView(expired, expiredLp);

        TextView play = new TextView(context);
        play.setText("\u25B6");
        play.setTextColor(Color.WHITE);
        play.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
        play.setGravity(Gravity.CENTER);
        GradientDrawable playBg = new GradientDrawable();
        playBg.setColor(BADGE_BG);
        playBg.setShape(GradientDrawable.OVAL);
        play.setBackground(playBg);
        FrameLayout.LayoutParams playLp = new FrameLayout.LayoutParams(dp(34), dp(34), Gravity.CENTER);
        media.addView(play, playLp);

        cell.addView(media);

        // Text block.
        LinearLayout texts = new LinearLayout(context);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.setPadding(dp(4), dp(8), dp(4), dp(8));

        TextView name = new TextView(context);
        name.setTextColor(TEXT_PRIMARY);
        name.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        name.setSingleLine(true);
        name.setEllipsize(android.text.TextUtils.TruncateAt.END);
        texts.addView(name);

        TextView handle = new TextView(context);
        handle.setTextColor(ACCENT);
        handle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        handle.setSingleLine(true);
        handle.setEllipsize(android.text.TextUtils.TruncateAt.END);
        texts.addView(handle);

        TextView liked = new TextView(context);
        liked.setTextColor(TEXT_SECONDARY);
        liked.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        texts.addView(liked);

        cell.addView(texts);
        return cell;
    }

    // ---- binding (every recycle) ---------------------------------------------------------

    private void bind(LinearLayout cell, final StoryLikeHistoryEntry entry) {
        FrameLayout media = (FrameLayout) cell.getChildAt(0);
        ImageView thumb = (ImageView) media.getChildAt(0);
        TextView badge = (TextView) media.getChildAt(1);
        TextView expired = (TextView) media.getChildAt(2);
        TextView play = (TextView) media.getChildAt(3);
        LinearLayout texts = (LinearLayout) cell.getChildAt(1);
        TextView name = (TextView) texts.getChildAt(0);
        TextView handle = (TextView) texts.getChildAt(1);
        TextView liked = (TextView) texts.getChildAt(2);

        applyThumbnail(thumb, entry);

        String path = entry.thumbnailPath;
        play.setVisibility(path != null && path.endsWith(".mp4") ? View.VISIBLE : View.GONE);

        if (entry.postedAt > 0) {
            badge.setVisibility(View.VISIBLE);
            badge.setText(DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.MEDIUM)
                    .format(new Date(entry.postedAt)));
        } else {
            badge.setVisibility(View.GONE);
        }

        name.setText(entry.displayName == null || entry.displayName.isEmpty() ? entry.username : entry.displayName);
        handle.setText(entry.username == null || entry.username.isEmpty() ? "" : "@" + entry.username);
        liked.setText((pt() ? "Curtido às " : "Liked at ")
                + DateFormat.getTimeInstance(DateFormat.SHORT).format(new Date(entry.likedAt)));

        expired.setVisibility(entry.isExpired(System.currentTimeMillis()) ? View.VISIBLE : View.GONE);

        thumb.setOnClickListener(v -> listener.onThumbnail(entry));
        name.setOnClickListener(v -> listener.onProfile(entry));
        handle.setOnClickListener(v -> listener.onProfile(entry));
        texts.setOnClickListener(v -> listener.onMenu(entry, texts));
    }

    /** Loads the local thumbnail off the UI thread, with a decoded-bitmap cache. */
    private void applyThumbnail(final ImageView thumb, StoryLikeHistoryEntry entry) {
        final String path = entry.thumbnailPath;
        if (path == null || path.isEmpty()) {
            thumb.setTag(null);
            thumb.setImageDrawable(null);
            return;
        }

        Bitmap cached = CACHE.get(path);
        if (cached != null) {
            thumb.setTag(path);
            thumb.setImageBitmap(cached);
            return;
        }

        thumb.setTag(path);
        thumb.setImageDrawable(null);
        DECODER.execute(() -> {
            Bitmap bitmap = decode(path);
            if (bitmap == null) return;
            CACHE.put(path, bitmap);
            thumb.post(() -> {
                if (path.equals(thumb.getTag())) thumb.setImageBitmap(bitmap);
            });
        });
    }

    private static Bitmap decode(String path) {
        try {
            if (!new File(path).isFile()) return null;
            BitmapFactory.Options bounds = new BitmapFactory.Options();
            bounds.inJustDecodeBounds = true;
            BitmapFactory.decodeFile(path, bounds);
            int sample = 1;
            while (bounds.outWidth / (sample * 2) >= SAMPLE_WIDTH) sample *= 2;
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inSampleSize = sample;
            return BitmapFactory.decodeFile(path, options);
        } catch (Throwable t) {
            return null;
        }
    }

    private GradientDrawable roundedTop() {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setCornerRadii(new float[]{
                dp(CORNER_DP), dp(CORNER_DP), dp(CORNER_DP), dp(CORNER_DP),
                0, 0, 0, 0});
        return drawable;
    }

    private boolean pt() {
        return "pt".equals(Locale.getDefault().getLanguage());
    }

    private int dp(int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics()));
    }
}
