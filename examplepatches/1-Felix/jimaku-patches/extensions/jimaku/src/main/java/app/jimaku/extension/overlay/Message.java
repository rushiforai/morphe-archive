package app.jimaku.extension.overlay;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.StyleSpan;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.jimaku.extension.Guard;
import app.jimaku.extension.jobs.Glide;
import app.jimaku.extension.shared.Wording;

/**
 * The extension's message beside its control ({@code lib/toast.ts}), in the player: one line under
 * the top bar at its end, below Jimaku's button, that stays whether or not the controls show. It
 * has the look of YouTube's in-player chips: a pill of black at 60% as the 2× chip has over the
 * video, with white 12 sp type. An action reads in YouTube's link blue, and × comes last.
 *
 * <p>A message that only informs leaves after 6 seconds. One with an action or a failure stays until
 * closed, and closing progress only hides it. Progress can carry Stop, which asks first in place,
 * "Stop German?" with No and Yes, TalkBack's focus on No. Where the work's progress can be estimated,
 * the extension's thin bar fills under the words. What it says is announced politely; the bar isn't.
 *
 * <p>It fills the player's overlay and draws only its chip there: touches beside the chip pass on to
 * the player.
 */
public final class Message extends ViewGroup {
    /** An action the message offers: its label, and what a press does. */
    public static final class Action {
        public final String label;
        public final Runnable run;

        public Action(String label, Runnable run) {
            this.label = label;
            this.run = run;
        }
    }

    /** Long enough to read twice. */
    private static final long INFO_MILLIS = 6000;
    /**
     * TalkBack passes over a change made while a window closes, as the menu's sheet does when work
     * starts: a message that has just appeared is read out once this has passed.
     */
    private static final long SETTLE_MILLIS = 1000;
    private static final int GROUND = 0x99000000;
    private static final int TEXT = 0xFFFFFFFF;
    private static final int LINK = 0xFF3EA6FF;
    private static final int CLOSE = 0xFFAAAAAA;
    private static final int NO = 0x1AFFFFFF;
    private static final int YES = 0xFFF1F1F1;
    private static final int YES_TEXT = 0xFF0F0F0F;
    private static final int PRESSED = 0x33FFFFFF;
    private static final float HELD_ALPHA = 0.6f;
    private static final Typeface REGULAR = Typeface.create("sans-serif", Typeface.NORMAL);
    private static final Typeface MEDIUM = Typeface.create("sans-serif-medium", Typeface.NORMAL);

    private enum Kind { INFO, HOLD, PROGRESS, ASK }

    /** The latest progress, shown again when the question is answered No. */
    private static final class Work {
        final String text;
        final Action stop;
        final String strong;
        final Glide glide;

        Work(String text, Action stop, String strong, Glide glide) {
            this.text = text;
            this.stop = stop;
            this.strong = strong;
            this.glide = glide;
        }
    }

    private final float density;
    private final Chip chip;
    private final TextView text;
    private final TextView action;
    private final TextView secondary;
    private final TextView no;
    private final TextView yes;
    private final Close close;
    private final Runnable timeout = () -> Guard.run("message timeout", this::hide);
    private final Runnable settled = () -> Guard.run("message settled", this::settled);
    /** Whether the message appeared less than {@link #SETTLE_MILLIS} ago, and whether its words are to be read out then. */
    private boolean appearing;
    private boolean announceSettled;
    private Kind kind;
    private Work work;
    private Runnable run;
    private Runnable runSecondary;
    /** What Yes does, until it has been answered once. */
    private Runnable answer;
    private Runnable onDismiss;
    private int anchorEnd = -1;
    private int anchorTop = -1;
    private boolean anchorAtLeft;

    public Message(Context context) {
        super(context);
        density = context.getResources().getDisplayMetrics().density;
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        setClipChildren(false);

        chip = new Chip(context);
        chip.setOrientation(LinearLayout.HORIZONTAL);
        chip.setGravity(Gravity.CENTER_VERTICAL);
        chip.pad();
        chip.setVisibility(GONE);
        // The message's words are the extension's English, whatever the app's language.
        chip.setLayoutDirection(LAYOUT_DIRECTION_LTR);

        text = new TextView(context);
        text.setTextColor(TEXT);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        text.setTypeface(REGULAR);
        text.setFontFeatureSettings("tnum");
        text.setSingleLine(true);
        text.setEllipsize(TextUtils.TruncateAt.END);
        text.setGravity(Gravity.CENTER_VERTICAL);
        text.setTextLocale(java.util.Locale.ENGLISH);
        LinearLayout.LayoutParams textParams = new LinearLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.MATCH_PARENT, 1f);
        textParams.setMarginEnd(dp(4));
        chip.addView(text, textParams);

        action = link(context, () -> {
            if (run != null) run.run();
        });
        chip.addView(action, new LinearLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.MATCH_PARENT));
        secondary = link(context, () -> {
            if (runSecondary != null) runSecondary.run();
        });
        chip.addView(secondary, new LinearLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.MATCH_PARENT));

        no = pill(context, NO, TEXT, Wording.t(Wording.ASK_NO), this::unask);
        LinearLayout.LayoutParams noParams = new LinearLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.MATCH_PARENT);
        noParams.setMarginStart(dp(8));
        chip.addView(no, noParams);
        yes = pill(context, YES, YES_TEXT, Wording.t(Wording.ASK_YES), this::answerYes);
        LinearLayout.LayoutParams yesParams = new LinearLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.MATCH_PARENT);
        yesParams.setMarginStart(dp(6));
        chip.addView(yes, yesParams);

        close = new Close(context);
        close.setContentDescription(Wording.t(Wording.TOAST_CLOSE));
        close.setOnClickListener(v -> Guard.run("message close", this::dismiss));
        close.setBackground(press(dp(16)));
        readAsButton(close);
        chip.addView(close, new LinearLayout.LayoutParams(dp(36), LayoutParams.MATCH_PARENT));

        addView(chip, new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT));
    }

    /** Told when the viewer closed the message, so focus can go back to Jimaku's button. */
    public void setOnDismiss(Runnable listener) {
        onDismiss = listener;
    }

    /**
     * Where the chip goes, in this view's pixels: its end edge at {@code end}, on the left edge where
     * {@code atLeft} says the player's top bar is mirrored, and its touch band's top at {@code top}.
     */
    public void setAnchor(int end, int top, boolean atLeft) {
        if (end == anchorEnd && top == anchorTop && atLeft == anchorAtLeft) return;
        anchorEnd = end;
        anchorTop = top;
        anchorAtLeft = atLeft;
        // The player places it from its layout listener too: then the new place waits for the next pass.
        if (isInLayout()) post(this::requestLayout);
        else requestLayout();
    }

    /** Says what happened and leaves by itself, or sooner on ×. */
    public void info(String words) {
        show(words, null, null);
        kind = Kind.INFO;
        postDelayed(timeout, INFO_MILLIS);
    }

    /** Stays until closed, with an optional way forward and a second one, as Buy minutes. */
    public void hold(String words, Action forward, Action second) {
        show(words, forward, second);
        kind = Kind.HOLD;
    }

    /**
     * Work in progress: it stays while the work runs and can be closed, which only hides it. The words
     * change in place; only a new step is announced, not every percent. {@code stop} is the Stop action,
     * {@code strong} the part of the words that says how far the work has come, set in bold, and
     * {@code glide} how the bar moves, or null for no bar. While Stop's question is asked it stays,
     * without the bar, and No shows the latest progress.
     */
    public void progress(String words, boolean announce, Action stop, String strong, Glide glide) {
        work = new Work(words, stop, strong, glide);
        if (asking()) return;
        if (kind != Kind.PROGRESS || (action.getVisibility() == VISIBLE) != (stop != null)) {
            show(words, stop, null);
            kind = Kind.PROGRESS;
            write(words, strong, true);
            line(glide);
            return;
        }
        run = stop != null ? stop.run : null;
        write(words, strong, announce);
        line(glide);
    }

    /** Whether the chip shows, so the hint can stay out of its way. */
    public boolean showing() {
        return chip.getVisibility() == VISIBLE;
    }

    /** Whether it shows work in progress, so the caller knows whether to update it. */
    public boolean showingProgress() {
        return kind == Kind.PROGRESS;
    }

    /** Turns the message into a question, announced, with TalkBack's focus on No. */
    public void ask(String question, Runnable onYes) {
        removeCallbacks(timeout);
        answer = onYes;
        release(no);
        release(yes);
        kind = Kind.ASK;
        action.setVisibility(GONE);
        secondary.setVisibility(GONE);
        close.setVisibility(GONE);
        no.setVisibility(VISIBLE);
        yes.setVisibility(VISIBLE);
        chip.endPadding = dp(4);
        line(null);
        appear();
        write(question, null, true);
        focus(no);
    }

    /** New words for the question being asked, announced, so they are heard before anyone answers Yes. */
    public void reask(String question) {
        if (!asking() || question.contentEquals(text.getText())) return;
        write(question, null, true);
    }

    public boolean asking() {
        return kind == Kind.ASK;
    }

    /** The action is running: it is held until the next message replaces it. */
    public void busy(String words) {
        write(words, null, true);
        hold(action);
        hold(secondary);
    }

    public void hide() {
        removeCallbacks(timeout);
        removeCallbacks(settled);
        appearing = false;
        announceSettled = false;
        kind = null;
        answer = null;
        chip.setVisibility(GONE);
    }

    private void dismiss() {
        hide();
        if (onDismiss != null) onDismiss.run();
    }

    private void answerYes() {
        Runnable given = answer;
        if (given == null) return;
        answer = null;
        // Yes is under way: both answers are held until the next message replaces the question.
        hold(no);
        hold(yes);
        given.run();
    }

    /** No: the progress again, with focus on its Stop. Once Yes is under way, nothing. */
    private void unask() {
        if (answer == null) return;
        Work latest = work;
        if (latest == null) {
            dismiss();
            return;
        }
        show(latest.text, latest.stop, null);
        kind = Kind.PROGRESS;
        write(latest.text, latest.strong, false);
        line(latest.glide);
        focus(latest.stop != null ? action : close);
    }

    private void show(String words, Action forward, Action second) {
        removeCallbacks(timeout);
        answer = null;
        run = forward != null ? forward.run : null;
        runSecondary = second != null ? second.run : null;
        label(action, forward);
        label(secondary, second);
        no.setVisibility(GONE);
        yes.setVisibility(GONE);
        close.setVisibility(VISIBLE);
        chip.endPadding = 0;
        line(null);
        appear();
        write(words, null, true);
    }

    /** Shows the chip. Where it wasn't showing, its words are read out once it has settled in. */
    private void appear() {
        if (chip.getVisibility() != VISIBLE) {
            appearing = true;
            announceSettled = false;
            removeCallbacks(settled);
            postDelayed(settled, SETTLE_MILLIS);
        }
        chip.setVisibility(VISIBLE);
    }

    /** The words written since the message appeared, read out where one of them was to be. */
    private void settled() {
        appearing = false;
        if (!announceSettled) return;
        announceSettled = false;
        if (chip.getVisibility() != VISIBLE) return;
        text.setAccessibilityLiveRegion(ACCESSIBILITY_LIVE_REGION_POLITE);
        text.setText(text.getText());
    }

    private static void label(TextView button, Action given) {
        button.setVisibility(given != null ? VISIBLE : GONE);
        button.setText(given != null ? given.label : "");
        release(button);
    }

    /**
     * The words, with {@code strong} among them in bold. Announced where {@code announce} says so: the
     * words are a polite live region only then, so a percent that moves on is read only on request.
     */
    private void write(String words, String strong, boolean announce) {
        int at = strong != null ? words.lastIndexOf(strong) : -1;
        CharSequence shown = words;
        if (at >= 0) {
            SpannableString bold = new SpannableString(words);
            bold.setSpan(new StyleSpan(Typeface.BOLD), at, at + strong.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            shown = bold;
        }
        boolean same = TextUtils.equals(shown.toString(), text.getText().toString()) && sameBold(shown, text.getText());
        // A message that appears again with the words it had when it was hidden is still read out.
        if (appearing && announce) announceSettled = true;
        if (same) return;
        text.setAccessibilityLiveRegion(announce && !appearing ? ACCESSIBILITY_LIVE_REGION_POLITE : ACCESSIBILITY_LIVE_REGION_NONE);
        text.setText(shown);
    }

    private static boolean sameBold(CharSequence a, CharSequence b) {
        StyleSpan[] first = a instanceof Spanned spanned ? spanned.getSpans(0, a.length(), StyleSpan.class) : new StyleSpan[0];
        StyleSpan[] second = b instanceof Spanned spanned ? spanned.getSpans(0, b.length(), StyleSpan.class) : new StyleSpan[0];
        if (first.length != second.length) return false;
        for (int i = 0; i < first.length; i++) {
            if (((Spanned) a).getSpanStart(first[i]) != ((Spanned) b).getSpanStart(second[i])) return false;
        }
        return true;
    }

    /** The bar under the words, while the progress has a glide. */
    private void line(Glide glide) {
        chip.bar.setGlide(glide);
        chip.pad();
        chip.invalidate();
    }

    private static void hold(View button) {
        button.setEnabled(false);
        button.setAlpha(HELD_ALPHA);
    }

    private static void release(View button) {
        button.setEnabled(true);
        button.setAlpha(1f);
    }

    /** Moves TalkBack's focus to {@code target}, where TalkBack runs. */
    private void focus(View target) {
        AccessibilityManager accessibility = (AccessibilityManager) getContext().getSystemService(Context.ACCESSIBILITY_SERVICE);
        if (accessibility == null || !accessibility.isTouchExplorationEnabled()) return;
        post(() -> Guard.run("message focus", () -> {
            if (target.isShown()) target.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null);
        }));
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
        int end = anchorEnd >= 0 ? anchorEnd : anchorAtLeft ? dp(12) : width - dp(12);
        int left = anchorAtLeft ? end : end - w;
        left = Math.max(dp(12), Math.min(left, width - dp(12) - w));
        int top = anchorTop >= 0 ? anchorTop : dp(46);
        chip.layout(left, top, left + w, top + chip.getMeasuredHeight());
    }

    private int dp(float value) {
        return Math.round(value * density);
    }

    /** A text button in YouTube's link blue, as the extension's message has Stop and Try again. */
    private TextView link(Context context, Runnable press) {
        TextView button = new TextView(context);
        button.setTextColor(LINK);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        button.setTypeface(MEDIUM);
        button.setGravity(Gravity.CENTER);
        button.setSingleLine(true);
        button.setPadding(dp(8), 0, dp(8), 0);
        button.setMinWidth(dp(40));
        button.setBackground(press(dp(4)));
        button.setVisibility(GONE);
        button.setOnClickListener(v -> Guard.run("message action", press));
        readAsButton(button);
        return button;
    }

    /** No or Yes: one of YouTube's pills, 24 dp high in the chip, with the message's 48 dp touch band. */
    private TextView pill(Context context, int ground, int color, String label, Runnable press) {
        TextView button = new TextView(context);
        button.setText(label);
        button.setTextColor(color);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        button.setTypeface(MEDIUM);
        button.setGravity(Gravity.CENTER);
        button.setSingleLine(true);
        button.setPadding(dp(12), 0, dp(12), 0);
        button.setMinWidth(dp(40));
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(ground);
        shape.setCornerRadius(dp(12));
        GradientDrawable mask = new GradientDrawable();
        mask.setColor(0xFFFFFFFF);
        mask.setCornerRadius(dp(12));
        button.setBackground(new PillBackground(new RippleDrawable(ColorStateList.valueOf(PRESSED), shape, mask), dp(24)));
        button.setVisibility(GONE);
        button.setOnClickListener(v -> Guard.run("message answer", press));
        readAsButton(button);
        return button;
    }

    /** The press feedback of a text button or ×: confined to the chip's band, with {@code radius} corners. */
    private Drawable press(int radius) {
        GradientDrawable mask = new GradientDrawable();
        mask.setColor(0xFFFFFFFF);
        mask.setCornerRadius(radius);
        return new PillBackground(new RippleDrawable(ColorStateList.valueOf(PRESSED), null, mask), dp(32));
    }

    /** TalkBack reads {@code view} as a button. */
    private static void readAsButton(View view) {
        view.setAccessibilityDelegate(new AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName("android.widget.Button");
            }
        });
    }

    /** A drawable centred in its view at {@code height}, so a 48 dp button shows a smaller ground. */
    private static final class PillBackground extends InsetDrawable {
        private final int height;

        PillBackground(Drawable inner, int height) {
            super(inner, 0);
            this.height = height;
        }

        @Override
        protected void onBoundsChange(android.graphics.Rect bounds) {
            int inset = Math.max(0, (bounds.height() - height) / 2);
            Drawable inner = getDrawable();
            if (inner != null) inner.setBounds(bounds.left, bounds.top + inset, bounds.right, bounds.bottom - inset);
        }
    }

    /**
     * The chip: its 48 dp touch band, with the pill drawn in its middle 32 dp, which grows downward by
     * 6 dp to hold the bar under the words.
     */
    private final class Chip extends LinearLayout {
        final Bar bar = new Bar(dp(40));
        /** 4 dp after Yes, so its pill sits in the chip's round end; nothing after ×, whose target reaches the end. */
        int endPadding;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF band = new RectF();

        Chip(Context context) {
            super(context);
            setWillNotDraw(false);
            paint.setColor(GROUND);
        }

        /** The band's height: 32 dp, or more where the viewer's font size needs it. */
        private int bandHeight() {
            return Math.max(dp(32), text.getLineHeight() + dp(12));
        }

        int wantedHeight() {
            return bandHeight() + dp(16) + (bar.shown() ? dp(6) : 0);
        }

        /** The words 12 dp in, the end as the last button needs it, and room under the words for the bar. */
        void pad() {
            setPaddingRelative(dp(12), 0, endPadding, bar.shown() ? dp(6) : 0);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float top = dp(8);
            float bottom = getHeight() - dp(8);
            band.set(0, top, getWidth(), bottom);
            float radius = (bottom - top) / 2;
            canvas.drawRoundRect(band, radius, radius, paint);
            float barTop = bottom - dp(6) - dp(3);
            if (bar.draw(canvas, dp(12), barTop, getWidth() - dp(12), dp(3))) postInvalidateOnAnimation();
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
