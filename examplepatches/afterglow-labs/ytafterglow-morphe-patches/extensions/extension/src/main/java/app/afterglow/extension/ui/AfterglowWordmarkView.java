package app.afterglow.extension.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BlurMaskFilter;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.text.Layout;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.style.CharacterStyle;
import android.text.style.ForegroundColorSpan;
import android.text.style.UpdateAppearance;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.TextView;

import app.afterglow.extension.settings.ThemeColors;

/**
 * The glowing "Afterglow" wordmark, as iOS draws it on its YouTube settings entry
 * (Settings.x:338-380, 426-431, 486-514):
 * <ul>
 * <li>bold version of the cell's font; "After" white, "glow" (characters 5-8) orange
 *     (1.00, 0.45, 0.02);</li>
 * <li>label layer shadow: orange, opacity 0.60, radius 20, offset 0 (behind the text);</li>
 * <li>secondary glow layer: layer opacity 0.50, shadow opacity 1.0, radius 20, shadow path =
 *     the label bounds inset by (-2, -1) with corner radius 6. Sublayers composite above
 *     the label's own content in Core Animation, so this glow is drawn over the text.</li>
 * </ul>
 * None of these colors come from the theme on iOS: the white, the orange and the glow are
 * constants on every branch. The owner's dark-mode screenshot (YouTube 21.43.5, Display P3)
 * agrees: converted to sRGB, "glow" is exactly #ff7305 while the themed icons beside it are
 * #ff7b1f, and "After" is white under a 17% wash of the orange glow layer (#ffe7d4). Only the
 * sparkles icon follows the theme, through the tint YouTube gives its settings icons.
 * <p>
 * The YouTube settings cell's title label is much wider than its text, so on iOS the
 * secondary glow is a wide band across the row. Fitting that screenshot: blur sigma 20pt (the
 * shadow radius), glow rect x 51-387pt on a 402pt screen, 31pt tall, centred on the text, peak
 * 0.276 of the orange over the background. That is a label from the text to 17pt before the
 * cell's right edge, 29pt tall. Android's title view is as tall as its text and runs to the
 * row edge, so the rect is built from those label measurements (LABEL_*) instead.
 * The glow spills up over the row above (the header on iOS) and stops at the row's bottom
 * edge, where iOS's next cell covers it.
 * <p>
 * Framework-only TextView so the patched YouTube settings layout can inflate it by name
 * with id android:id/title (androidx.preference methods are obfuscated in YouTube, so a
 * Preference subclass is not an option). The glow is drawn natively: blurred alpha masks
 * rendered once on a software bitmap with BlurMaskFilter, then drawn with an orange paint.
 */
public class AfterglowWordmarkView extends TextView {
    /** iOS YTAGAfterglowSettingsDisplayTitle. */
    public static final String DISPLAY_TITLE = "Afterglow";
    /** iOS YTAGAfterglowWordmarkWhiteColor: white even on light backgrounds, as on iOS. */
    static final int WORDMARK_WHITE = Color.WHITE;
    /** iOS YTAGAfterglowWordmarkPorangeColor (1.00, 0.45, 0.02). */
    static final int WORDMARK_ORANGE = Color.rgb(255, 115, 5);

    /** CALayer shadowRadius 20 as the Gaussian sigma, in dp (the screenshot fit gives 20pt). */
    static final float GLOW_SIGMA_DP = 20f;
    /** Label layer shadowOpacity. */
    static final float LABEL_GLOW_OPACITY = 0.60f;
    /** Secondary layer opacity 0.50 x shadowOpacity 1.0. */
    static final float RECT_GLOW_OPACITY = 0.50f;
    /** Secondary glow drawn above the text (Core Animation sublayer order). */
    static final boolean RECT_GLOW_ABOVE_TEXT = true;
    static final float RECT_INSET_X_DP = -2f;
    static final float RECT_INSET_Y_DP = -1f;
    static final float RECT_CORNER_DP = 6f;
    /** Height of iOS's settings title label, centred on the text (measured, see above). */
    static final float LABEL_HEIGHT_DP = 29f;
    /** iOS's settings title label ends this far before the cell's right edge (measured). */
    static final float LABEL_TRAILING_DP = 17f;
    /** Ancestors unclipped by default so the glow spills past the row (column, row, list). */
    static final int UNCLIP_DEPTH = 3;
    /** Ancestor playing the iOS cell in the YouTube settings row: text column, then the row. */
    static final int GLOW_ROW_DEPTH = 2;

    private Paint glowPaint;
    private int unclipDepth;
    private int glowRowDepth;
    private boolean clipGlowToRow;
    private Bitmap textGlow;
    private Bitmap rectGlow;
    private int[] textGlowOffset;
    private int[] rectGlowOffset;
    private String glowKey;
    private String rectKey;
    private final RectF rowFrame = new RectF();
    private final RectF rect = new RectF();

    public AfterglowWordmarkView(Context context) {
        super(context);
        init();
    }

    public AfterglowWordmarkView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public AfterglowWordmarkView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    private void init() {
        unclipDepth = UNCLIP_DEPTH;
        glowRowDepth = GLOW_ROW_DEPTH;
        clipGlowToRow = true;
        glowPaint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
        glowPaint.setColor(WORDMARK_ORANGE);
        // iOS ytag_boldenSettingsLabel: bold version of the cell's own font and size.
        setTypeface(Typeface.create(getTypeface(), Typeface.BOLD));
        // Re-apply the wordmark to whatever the layout or the Preference set before init.
        CharSequence text = getText();
        if (text != null && text.length() > 0) setText(text, BufferType.SPANNABLE);
    }

    /**
     * "After": iOS's white wherever the row's own title color is light (dark appearance). Where
     * that color is dark (light appearance), white would vanish into the page, so "After" keeps
     * the row's title color: YouTube's ytTextPrimary on its settings row, the theme's primary
     * text on Afterglow's pages. Read at draw time, so it follows text color and theme changes.
     */
    static final class AfterSpan extends CharacterStyle implements UpdateAppearance {
        @Override
        public void updateDrawState(TextPaint paint) {
            int color = paint.getColor();
            if (ThemeColors.luminance(color) >= 0.5) paint.setColor((WORDMARK_WHITE & 0x00FFFFFF) | (color & 0xFF000000));
        }
    }

    /** True when the text is the Afterglow title (iOS checks the visible title text). */
    static boolean isWordmark(CharSequence text) {
        return text != null && DISPLAY_TITLE.contentEquals(text.toString());
    }

    /**
     * Preference binding calls setText(title); the one-argument setText is final, so the
     * wordmark is applied here. Runs during TextView's constructor too, before this class's
     * fields exist, so it must not touch them except to clear the cache.
     */
    @Override
    public void setText(CharSequence text, BufferType type) {
        if (isWordmark(text) && !(text instanceof Spanned && ((Spanned) text).getSpans(0, text.length(), ForegroundColorSpan.class).length > 0)) {
            SpannableString wordmark = new SpannableString(DISPLAY_TITLE);
            wordmark.setSpan(new AfterSpan(), 0, 5, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            wordmark.setSpan(new ForegroundColorSpan(WORDMARK_ORANGE), 5, DISPLAY_TITLE.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            super.setText(wordmark, BufferType.SPANNABLE);
        } else {
            super.setText(text, type);
        }
        glowKey = null;
        rectKey = null;
    }

    /**
     * How many ancestors may let the glow spill past them. The YouTube settings row uses the
     * default (text column, row, RecyclerView); the scroll view or list above still clips, as
     * the iOS collection view clips a top-of-list cell's glow.
     */
    public void setUnclipDepth(int depth) {
        unclipDepth = Math.max(0, depth);
    }

    /**
     * Which ancestor plays the iOS settings cell (0 = this view): the glow band ends
     * LABEL_TRAILING_DP before its right edge and, with clipToRow, stops at its bottom edge
     * the way iOS's next cell covers it. Defaults to the YouTube settings row layout.
     */
    public void setGlowRow(int depth, boolean clipToRow) {
        glowRowDepth = Math.max(0, depth);
        clipGlowToRow = clipToRow;
        invalidate();
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        // iOS: masksToBounds = NO, the glow spills over neighbouring content. Let it spill
        // past this view, its text column, its row and the list holding the row. Padding
        // clipping is left alone, so the list's own container still bounds the glow.
        ViewParent parent = getParent();
        for (int depth = 0; depth < unclipDepth && parent instanceof ViewGroup; depth++) {
            ((ViewGroup) parent).setClipChildren(false);
            parent = parent.getParent();
        }
    }

    @Override
    protected void onDraw(Canvas canvas) {
        Layout layout = getLayout();
        if (!isWordmark(getText()) || layout == null || glowPaint == null) {
            super.onDraw(canvas);
            return;
        }
        float density = getResources().getDisplayMetrics().density;
        float originX = getCompoundPaddingLeft();
        float originY = getExtendedPaddingTop() + verticalOffset(layout);
        ensureTextGlow(layout, density);
        rowFrame(rowFrame);
        labelGlowRect(layout, originX, originY, density, rowFrame, rect);
        ensureRectGlow(rect, density);

        // 1. Label shadow, beneath the text.
        glowPaint.setAlpha(Math.round(LABEL_GLOW_OPACITY * 255));
        int saved = clipToRow(canvas);
        canvas.drawBitmap(textGlow, originX + textGlowOffset[0], originY + textGlowOffset[1], glowPaint);
        if (!RECT_GLOW_ABOVE_TEXT) drawRectGlow(canvas);
        canvas.restoreToCount(saved);
        // 2. The text (TextView clips its own drawing; the glows are drawn outside it).
        super.onDraw(canvas);
        // 3. Secondary glow layer.
        if (RECT_GLOW_ABOVE_TEXT) {
            saved = clipToRow(canvas);
            drawRectGlow(canvas);
            canvas.restoreToCount(saved);
        }
    }

    private void drawRectGlow(Canvas canvas) {
        glowPaint.setAlpha(Math.round(RECT_GLOW_OPACITY * 255));
        canvas.drawBitmap(rectGlow, rect.left + rectGlowOffset[0], rect.top + rectGlowOffset[1], glowPaint);
    }

    /** Clips the glow at the row's bottom edge when the row plays an iOS cell. */
    private int clipToRow(Canvas canvas) {
        int saved = canvas.save();
        if (clipGlowToRow) {
            float reach = 4 * GLOW_SIGMA_DP * getResources().getDisplayMetrics().density;
            canvas.clipRect(rowFrame.left - reach, rowFrame.top - reach, rowFrame.right + reach, rowFrame.bottom);
        }
        return saved;
    }

    /** The glow row's bounds in this view's coordinates. */
    private void rowFrame(RectF out) {
        View row = this;
        int x = 0, y = 0;
        for (int depth = 0; depth < glowRowDepth && row.getParent() instanceof View; depth++) {
            x += row.getLeft();
            y += row.getTop();
            row = (View) row.getParent();
        }
        out.set(-x, -y, row.getWidth() - x, row.getHeight() - y);
    }

    /**
     * The secondary glow's shadow path: iOS's title label (from the text to LABEL_TRAILING_DP
     * before the row's far edge, LABEL_HEIGHT_DP tall around the text) inset by (-2, -1).
     */
    static void labelGlowRect(Layout layout, float originX, float originY, float density, RectF row, RectF out) {
        int last = layout.getLineCount() - 1;
        float textLeft = originX + layout.getLineLeft(0);
        float textRight = originX + layout.getLineRight(0);
        float textTop = originY + layout.getLineTop(0);
        float textBottom = originY + layout.getLineBottom(last);
        boolean rtl = layout.getParagraphDirection(0) == Layout.DIR_RIGHT_TO_LEFT;
        float trailing = LABEL_TRAILING_DP * density;
        float left = rtl ? Math.min(textLeft, row.left + trailing) : textLeft;
        float right = rtl ? textRight : Math.max(textRight, row.right - trailing);
        float half = Math.max(textBottom - textTop, LABEL_HEIGHT_DP * density) / 2f;
        float centre = (textTop + textBottom) / 2f;
        out.set(left + RECT_INSET_X_DP * density, centre - half + RECT_INSET_Y_DP * density,
                right - RECT_INSET_X_DP * density, centre + half - RECT_INSET_Y_DP * density);
    }

    /** TextView's vertical gravity offset for the text block. */
    private int verticalOffset(Layout layout) {
        int gravity = getGravity() & Gravity.VERTICAL_GRAVITY_MASK;
        int box = getMeasuredHeight() - getExtendedPaddingTop() - getExtendedPaddingBottom();
        int text = layout.getHeight();
        if (gravity == Gravity.BOTTOM) return Math.max(0, box - text);
        if (gravity == Gravity.CENTER_VERTICAL) return Math.max(0, (box - text) / 2);
        return 0;
    }

    private static Paint blurPaint(float density) {
        float sigma = GLOW_SIGMA_DP * density;
        // Skia converts a blur radius to sigma as 0.57735 * radius + 0.5.
        float radius = Math.max(0.5f, (sigma - 0.5f) / 0.57735f);
        Paint blur = new Paint();
        blur.setMaskFilter(new BlurMaskFilter(radius, BlurMaskFilter.Blur.NORMAL));
        return blur;
    }

    /** Label shadow: the blurred glyphs of the whole title, once per text, size and density. */
    private void ensureTextGlow(Layout layout, float density) {
        String key = getText() + "|" + layout.getWidth() + "x" + layout.getHeight() + "|" + getTextSize() + "|" + density;
        if (key.equals(glowKey) && textGlow != null) return;
        Bitmap glyphs = Bitmap.createBitmap(Math.max(1, layout.getWidth()), Math.max(1, layout.getHeight()), Bitmap.Config.ARGB_8888);
        layout.draw(new Canvas(glyphs));
        int[] offset = new int[2];
        Bitmap blurred = glyphs.extractAlpha(blurPaint(density), offset);
        glyphs.recycle();
        if (textGlow != null) textGlow.recycle();
        textGlow = blurred;
        textGlowOffset = offset;
        glowKey = key;
    }

    /** Secondary layer: the blurred rounded rect (corner 6), once per rect size and density. */
    private void ensureRectGlow(RectF rect, float density) {
        int width = Math.max(1, Math.round(rect.width()));
        int height = Math.max(1, Math.round(rect.height()));
        String key = width + "x" + height + "|" + density;
        if (key.equals(rectKey) && rectGlow != null) return;
        Bitmap shape = Bitmap.createBitmap(width, height, Bitmap.Config.ALPHA_8);
        Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        new Canvas(shape).drawRoundRect(new RectF(0, 0, width, height), RECT_CORNER_DP * density, RECT_CORNER_DP * density, fill);
        int[] offset = new int[2];
        Bitmap blurred = shape.extractAlpha(blurPaint(density), offset);
        shape.recycle();
        if (rectGlow != null) rectGlow.recycle();
        rectGlow = blurred;
        rectGlowOffset = offset;
        rectKey = key;
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (textGlow != null) textGlow.recycle();
        if (rectGlow != null) rectGlow.recycle();
        textGlow = null;
        rectGlow = null;
        glowKey = null;
        rectKey = null;
    }
}
