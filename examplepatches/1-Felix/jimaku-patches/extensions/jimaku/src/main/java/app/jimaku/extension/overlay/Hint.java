package app.jimaku.extension.overlay;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.jimaku.extension.Guard;
import app.jimaku.extension.shared.Wording;

/**
 * The one-time pointer at Jimaku's button on the first video after a fresh install, as the
 * extension's hint ({@code lib/hint.ts}): the player message's glass, centred under the button and
 * never past the player's edges. It goes with YouTube's controls, as faded as they are, so the
 * player decides when it shows. Its words are read out politely once, and it never takes TalkBack's
 * focus.
 */
public final class Hint extends ViewGroup {
    /** Long enough for TalkBack to settle after the controls appear, as the message waits. */
    private static final long SETTLE_MILLIS = 1000;
    private static final int GROUND = 0x99000000;
    private static final int TEXT = 0xFFFFFFFF;
    private static final int CLOSE = 0xFFAAAAAA;
    private static final int PRESSED = 0x33FFFFFF;
    private static final Typeface MEDIUM = Typeface.create("sans-serif-medium", Typeface.NORMAL);

    private final float density;
    private final Chip chip;
    private final TextView text;
    private Runnable onClose;
    private Runnable follow;
    private int anchorCentre = -1;
    private int anchorTop = -1;
    private boolean announced;
    /** What the last call asked for, so a hide that waited for a layout pass doesn't undo a later show. */
    private boolean wanted;
    private final Runnable settled = () -> Guard.run("hint read-out", this::settled);
    private final ViewTreeObserver.OnPreDrawListener preDraw = () -> {
        if (follow != null) Guard.run("hint follows the controls", follow);
        return true;
    };

    public Hint(Context context) {
        super(context);
        density = context.getResources().getDisplayMetrics().density;
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        setClipChildren(false);

        chip = new Chip(context);
        chip.setOrientation(LinearLayout.HORIZONTAL);
        chip.setGravity(Gravity.CENTER_VERTICAL);
        chip.setPaddingRelative(dp(12), 0, 0, 0);
        chip.setVisibility(GONE);
        chip.setLayoutDirection(LAYOUT_DIRECTION_LTR);

        text = new TextView(context);
        text.setTextColor(TEXT);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        text.setTypeface(MEDIUM);
        text.setSingleLine(true);
        text.setEllipsize(TextUtils.TruncateAt.END);
        text.setGravity(Gravity.CENTER_VERTICAL);
        text.setTextLocale(java.util.Locale.ENGLISH);
        LinearLayout.LayoutParams textParams = new LinearLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.MATCH_PARENT, 1f);
        textParams.setMarginEnd(dp(4));
        chip.addView(text, textParams);

        Close close = new Close(context);
        close.setContentDescription(Wording.t(Wording.HINT_CLOSE));
        close.setOnClickListener(v -> Guard.run("hint close", () -> {
            hide();
            if (onClose != null) onClose.run();
        }));
        GradientDrawable mask = new GradientDrawable();
        mask.setColor(0xFFFFFFFF);
        mask.setCornerRadius(dp(16));
        // The press shows in the pill's 32 dp band, not the whole 48 dp target.
        close.setBackground(new InsetDrawable(new RippleDrawable(ColorStateList.valueOf(PRESSED), null, mask), 0, dp(8), 0, dp(8)));
        close.setAccessibilityDelegate(new AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName("android.widget.Button");
            }
        });
        chip.addView(close, new LinearLayout.LayoutParams(dp(36), LayoutParams.MATCH_PARENT));

        addView(chip, new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT));
    }

    /** Told when the viewer closes the hint: it has been seen. */
    public void setOnClose(Runnable listener) {
        onClose = listener;
    }

    /** Run before each frame drawn while the hint is attached, so it can follow the controls as they fade. */
    public void setFollow(Runnable listener) {
        follow = listener;
    }

    /**
     * Shows {@code words} with its top at {@code top} and its middle at {@code centre}, in this view's
     * coordinates, at {@code alpha}. Changes nothing where nothing changed, so following each frame
     * costs no layout.
     */
    public void show(String words, int centre, int top, float alpha) {
        wanted = true;
        if (isInLayout()) {
            // From the player's layout listener the change waits for the pass to end, as the message's does.
            post(() -> Guard.run("hint", () -> {
                if (wanted) show(words, centre, top, alpha);
            }));
            return;
        }
        if (!TextUtils.equals(text.getText(), words)) text.setText(words);
        if (centre != anchorCentre || top != anchorTop) {
            anchorCentre = centre;
            anchorTop = top;
            requestLayout();
        }
        setAlpha(alpha);
        if (chip.getVisibility() != VISIBLE) {
            chip.setVisibility(VISIBLE);
            if (!announced) {
                removeCallbacks(settled);
                postDelayed(settled, SETTLE_MILLIS);
            }
        }
    }

    public void hide() {
        wanted = false;
        removeCallbacks(settled);
        if (chip.getVisibility() == GONE) return;
        if (isInLayout()) post(() -> {
            if (!wanted) chip.setVisibility(GONE);
        });
        else chip.setVisibility(GONE);
    }

    /** Read out once, politely, after the controls have settled; later appearances stay quiet. */
    private void settled() {
        if (announced || chip.getVisibility() != VISIBLE) return;
        announced = true;
        text.setAccessibilityLiveRegion(ACCESSIBILITY_LIVE_REGION_POLITE);
        text.setText(text.getText());
        postDelayed(() -> text.setAccessibilityLiveRegion(ACCESSIBILITY_LIVE_REGION_NONE), SETTLE_MILLIS);
    }

    /**
     * Keeps the words out of what YouTube's player says when it takes focus, which reads its children's
     * text; the hint's own polite announcement is the one heard. The hint's views still send their own events.
     */
    @Override
    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent event) {
        return false;
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        getViewTreeObserver().addOnPreDrawListener(preDraw);
    }

    @Override
    protected void onDetachedFromWindow() {
        getViewTreeObserver().removeOnPreDrawListener(preDraw);
        removeCallbacks(settled);
        super.onDetachedFromWindow();
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int width = MeasureSpec.getSize(widthMeasureSpec);
        int height = MeasureSpec.getSize(heightMeasureSpec);
        setMeasuredDimension(width, height);
        if (chip.getVisibility() == GONE) return;
        chip.measure(MeasureSpec.makeMeasureSpec(Math.max(0, width - 2 * dp(12)), MeasureSpec.AT_MOST),
                MeasureSpec.makeMeasureSpec(chip.wantedHeight(), MeasureSpec.EXACTLY));
    }

    @Override
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        if (chip.getVisibility() == GONE) return;
        int width = r - l;
        int w = chip.getMeasuredWidth();
        // Centred under the button, as YouTube centres its tooltips, but never past the player's edges.
        int left = anchorCentre >= 0 ? anchorCentre - w / 2 : width - dp(12) - w;
        left = Math.max(dp(12), Math.min(left, width - dp(12) - w));
        int top = Math.max(0, anchorTop);
        chip.layout(left, top, left + w, top + chip.getMeasuredHeight());
    }

    private int dp(float value) {
        return Math.round(value * density);
    }

    /** The chip: its 48 dp touch band, with the message's glass pill drawn in its middle 32 dp. */
    private final class Chip extends LinearLayout {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF band = new RectF();

        Chip(Context context) {
            super(context);
            setWillNotDraw(false);
            paint.setColor(GROUND);
        }

        int wantedHeight() {
            return Math.max(dp(32), text.getLineHeight() + dp(12)) + dp(16);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float top = dp(8);
            float bottom = getHeight() - dp(8);
            band.set(0, top, getWidth(), bottom);
            float radius = (bottom - top) / 2;
            canvas.drawRoundRect(band, radius, radius, paint);
        }
    }

    /** ×, two bars as YouTube draws its own, 12 dp in a 36 dp wide target. */
    private final class Close extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        Close(Context context) {
            super(context);
            paint.setColor(CLOSE);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float size = dp(12);
            float k = size / 12f;
            float left = (getWidth() - size) / 2f;
            float top = (getHeight() - size) / 2f;
            paint.setStrokeWidth(1.5f * k);
            canvas.drawLine(left + 2.11f * k, top + 2.11f * k, left + 9.89f * k, top + 9.89f * k, paint);
            canvas.drawLine(left + 9.89f * k, top + 2.11f * k, left + 2.11f * k, top + 9.89f * k, paint);
        }
    }
}
