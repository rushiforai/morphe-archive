package app.drbushytop.extension.relay.inline;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.text.Spanned;
import android.text.style.ReplacementSpan;
import android.util.DisplayMetrics;
import android.widget.TextView;

import java.lang.ref.WeakReference;

/**
 * A picture drawn in place of a link's text in a comment. The text stays (the link's address),
 * so copying and screen readers still get it.
 *
 * <p>It is not clickable itself: the {@link android.text.style.URLSpan} over the same text is,
 * so Relay's own link handling opens the picture full screen when it is tapped.
 *
 * <p>A GIF shows its still frame first. The animation then loads on Wi-Fi and replaces it; on a
 * metered network the still stays, with a play badge.
 */
final class MediaSpan extends ReplacementSpan {
    private static final float MAX_HEIGHT_OF_SCREEN = 0.6f;
    /**
     * Room left under the picture, in dp. A tap there is not on the picture, so it reaches the
     * comment (to collapse it) instead of opening the viewer.
     */
    static final int SPACE_BELOW_DP = 12;
    static final int CORNER_RADIUS_DP = 6;

    final InlineCommentMedia.Media media;
    /** The post the comment is on, as {@code t3_<id>}, or null. */
    private final String postName;
    /** Whether Reddit marked the comment's post NSFW in the comment itself. */
    private final boolean postNsfw;
    private int naturalWidth;
    private int naturalHeight;
    /** Whether the size is the loaded file's own, not Reddit's description of it. */
    private boolean sizeFromFile;
    private int availableWidth;
    private WeakReference<TextView> host = new WeakReference<>(null);
    /** Whether the last draw showed the picture itself, not a placeholder. */
    private boolean pictureDrawn;

    private final Rect bounds = new Rect();
    private final RectF clip = new RectF();
    private final Path clipPath = new Path();
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);

    MediaSpan(InlineCommentMedia.Media media, String postName, boolean postNsfw) {
        this.media = media;
        this.postName = postName;
        this.postNsfw = postNsfw;
        this.naturalWidth = media.width;
        this.naturalHeight = media.height;
    }

    void attach(TextView view, int width) {
        host = new WeakReference<>(view);
        if (width > 0) availableWidth = width;
    }

    /** The view showing this span right now, if any. Views are recycled, so ask each time. */
    TextView shownIn() {
        TextView view = host.get();
        if (view == null) return null;
        CharSequence text = view.getText();
        if (text instanceof Spanned && ((Spanned) text).getSpanStart(this) >= 0) return view;
        return null;
    }

    static int dp(float value) {
        return Math.round(value * Resources.getSystem().getDisplayMetrics().density);
    }

    /**
     * Width and height to draw at, in pixels. While laying out, a picture another comment has
     * already loaded gives its own size, so the same picture is the same size everywhere.
     */
    private void measure(int[] out, boolean layingOut) {
        if (layingOut && !sizeFromFile) {
            MediaLoader.Result loaded = MediaLoader.cached(media.loadUrl);
            if (loaded != null && loaded.width > 0 && loaded.height > 0) {
                naturalWidth = loaded.width;
                naturalHeight = loaded.height;
                sizeFromFile = true;
            }
        }
        DisplayMetrics metrics = Resources.getSystem().getDisplayMetrics();
        int maxWidth = availableWidth > 0 ? availableWidth : InlineCommentMedia.screenWidth() - dp(48);
        int maxHeight = (int) (Math.max(metrics.widthPixels, metrics.heightPixels) * MAX_HEIGHT_OF_SCREEN);

        float width;
        float height;
        if (naturalWidth > 0 && naturalHeight > 0) {
            // Drawn at its own size on a 2x screen, so a small picture stays small.
            float scale = Math.max(1f, metrics.density / 2f);
            width = naturalWidth * scale;
            height = naturalHeight * scale;
        } else {
            // Size not known until it has loaded; hold a 4:3 space for it meanwhile.
            width = Math.min(maxWidth, dp(240));
            height = width * 3f / 4f;
        }
        if (width > maxWidth) {
            height = height * maxWidth / width;
            width = maxWidth;
        }
        if (height > maxHeight) {
            width = width * maxHeight / height;
            height = maxHeight;
        }
        out[0] = Math.max(1, Math.round(width));
        out[1] = Math.max(1, Math.round(height));
    }

    @Override
    public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
        int[] size = new int[2];
        measure(size, true);
        if (fm != null) {
            fm.ascent = -size[1];
            fm.top = fm.ascent;
            fm.descent = dp(SPACE_BELOW_DP);
            fm.bottom = fm.descent;
        }
        return size[0];
    }

    /** Hidden because the post is NSFW and Relay is set not to show NSFW thumbnails. */
    private boolean hiddenAsNsfw() {
        if (InlineMediaSettings.showNsfwThumbnails()) return false;
        return postNsfw || InlineCommentMedia.isNsfwPost(postName);
    }

    @Override
    public void draw(Canvas canvas, CharSequence text, int start, int end, float x,
                     int top, int y, int bottom, Paint paint) {
        int[] size = new int[2];
        measure(size, false);
        int left = Math.round(x);
        bounds.set(left, y - size[1], left + size[0], y);
        clip.set(bounds);
        float radius = dp(CORNER_RADIUS_DP);
        pictureDrawn = false;

        if (hiddenAsNsfw()) {
            drawPlaceholder(canvas, paint, radius, "NSFW · tap to open");
            return;
        }

        MediaLoader.Result shown;
        boolean still = false;
        if (!media.animated) {
            shown = MediaLoader.cached(media.loadUrl);
            if (shown == null) MediaLoader.request(this, media.loadUrl);
        } else {
            boolean animate = InlineMediaSettings.animateGifs();
            MediaLoader.Result animation = animate ? MediaLoader.cached(media.loadUrl) : null;
            MediaLoader.Result frame = media.stillUrl != null ? MediaLoader.cached(media.stillUrl) : null;
            // Asked for last goes first, so the small still arrives before the animation.
            if (animate && animation == null) MediaLoader.request(this, media.loadUrl);
            if (animation == null && frame == null && media.stillUrl != null) {
                MediaLoader.request(this, media.stillUrl);
            }
            shown = animation != null ? animation : frame;
            still = animation == null;
        }

        if (shown == null) {
            drawPlaceholder(canvas, paint, radius, failed() ? "Tap to open" : null);
            if (media.animated && !InlineMediaSettings.animateGifs()) drawPlayBadge(canvas);
            return;
        }

        Drawable drawable = shown.drawable;
        Rect own = drawable.getBounds();
        int save = canvas.save();
        clipPath.reset();
        clipPath.addRoundRect(clip, radius, radius, Path.Direction.CW);
        canvas.clipPath(clipPath);
        canvas.translate(bounds.left, bounds.top);
        // Scale the canvas, not the drawable: other comments may show the same one at another size.
        canvas.scale(size[0] / (float) Math.max(1, own.width()), size[1] / (float) Math.max(1, own.height()));
        drawable.draw(canvas);
        canvas.restoreToCount(save);
        pictureDrawn = true;

        shown.drawnBy(this);
        if (drawable instanceof Animatable) {
            Animatable animatable = (Animatable) drawable;
            if (!animatable.isRunning()) animatable.start();
        }
        if (still && !InlineMediaSettings.animateGifs()) drawPlayBadge(canvas);
    }

    /** Whether the last draw showed the picture itself, not a placeholder. */
    boolean pictureDrawn() {
        return pictureDrawn;
    }

    /** The size the picture is drawn at, in pixels: width, then height. */
    void drawnSize(int[] out) {
        measure(out, false);
    }

    /** Nothing more will load for this picture. */
    private boolean failed() {
        if (!media.animated) return MediaLoader.failed(media.loadUrl);
        boolean stillGone = media.stillUrl == null || MediaLoader.failed(media.stillUrl);
        if (!InlineMediaSettings.animateGifs()) return media.stillUrl != null && stillGone;
        return stillGone && MediaLoader.failed(media.loadUrl);
    }

    private void drawPlaceholder(Canvas canvas, Paint paint, float radius, String label) {
        fill.setColor((paint.getColor() & 0x00FFFFFF) | 0x22000000);
        canvas.drawRoundRect(clip, radius, radius, fill);
        if (label != null) {
            Paint text = new Paint(paint);
            text.setTextAlign(Paint.Align.CENTER);
            Paint.FontMetrics metrics = text.getFontMetrics();
            canvas.drawText(label, clip.centerX(), clip.centerY() - (metrics.ascent + metrics.descent) / 2f, text);
        }
    }

    /** A round play button in the middle: this GIF is not animating. */
    private void drawPlayBadge(Canvas canvas) {
        float radius = Math.min(dp(22), Math.min(clip.width(), clip.height()) / 3f);
        float cx = clip.centerX();
        float cy = clip.centerY();
        fill.setColor(0x99000000);
        canvas.drawCircle(cx, cy, radius, fill);
        Path triangle = new Path();
        float side = radius * 0.9f;
        triangle.moveTo(cx - side * 0.35f, cy - side * 0.5f);
        triangle.lineTo(cx + side * 0.55f, cy);
        triangle.lineTo(cx - side * 0.35f, cy + side * 0.5f);
        triangle.close();
        fill.setColor(0xFFFFFFFF);
        canvas.drawPath(triangle, fill);
    }

    /**
     * Main thread. Whether this picture still needs loading: it is on screen, or it is shown
     * somewhere this patch does not track (no view was ever attached).
     */
    boolean wanted() {
        if (host.get() == null) return true;
        TextView view = shownIn();
        return view != null && view.isAttachedToWindow() && view.isShown();
    }

    /** On the main thread, once {@code url} has loaded or failed. */
    void onLoaded(String url, MediaLoader.Result result) {
        TextView view = shownIn();
        if (view == null) return;
        boolean animation = url.equals(media.loadUrl);
        boolean sizeKnown = naturalWidth > 0 && naturalHeight > 0;
        // The picture itself decides its size: Reddit's numbers can describe a different copy.
        // A still is a smaller copy, so it only stands in until the picture has loaded.
        if (result != null && result.width > 0 && result.height > 0
                && (animation ? !sizeFromFile : !sizeKnown)
                && (result.width != naturalWidth || result.height != naturalHeight)) {
            naturalWidth = result.width;
            naturalHeight = result.height;
            sizeFromFile = animation;
            // Its size changed, so the text has to be laid out again.
            view.setText(view.getText());
        } else {
            if (result != null && animation) sizeFromFile = true;
            view.invalidate();
        }
    }
}
