package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;
import android.content.DialogInterface;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.AbsListView;
import android.widget.Button;
import android.widget.CheckedTextView;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/**
 * Material 3 for the screens Maps Car adds: Maps' colors at night and by day, a dialog in place of
 * the framework's AlertDialog (a rounded surface, the title, the body, pill buttons and single-choice rows), and the parts
 * the Settings dialogs use: the M3 switch, filter chips, segmented buttons, cards, section labels and a level bar.
 * Plain views and drawables: no Compose and no Material Components (Maps has both only under renamed classes). The dialog
 * keeps AlertDialog.Builder's method names, so a dialog moves over by its first line.
 */
public final class M3 {
    private M3() {
    }

    /** One scheme: Google's Material 3 baseline (blue), night or day. */
    public static final class Colors {
        final boolean night;
        /** The dialog, and a container on it (cards, the switch's track when off). */
        final int surface, container;
        final int onSurface, onSurfaceVariant, outline, outlineVariant;
        final int primary, onPrimary, secondaryContainer, onSecondaryContainer, error, onError;
        /** A gray button's fill (Cancel): the surface container highest by day, a step lighter at night. */
        final int gray;

        Colors(boolean night, int surface, int container, int onSurface, int onSurfaceVariant, int outline, int outlineVariant,
               int primary, int onPrimary, int secondaryContainer, int onSecondaryContainer, int error, int onError, int gray) {
            this.night = night;
            this.surface = surface;
            this.container = container;
            this.onSurface = onSurface;
            this.onSurfaceVariant = onSurfaceVariant;
            this.outline = outline;
            this.outlineVariant = outlineVariant;
            this.primary = primary;
            this.onPrimary = onPrimary;
            this.secondaryContainer = secondaryContainer;
            this.onSecondaryContainer = onSecondaryContainer;
            this.error = error;
            this.onError = onError;
            this.gray = gray;
        }

        /** The theme of the framework widgets inside our dialogs (text fields, lists) for this scheme. */
        int theme() {
            return night ? android.R.style.Theme_DeviceDefault_Dialog_NoActionBar
                    : android.R.style.Theme_DeviceDefault_Light_Dialog_NoActionBar;
        }
    }

    static final Colors NIGHT = new Colors(true, 0xFF282A2C, 0xFF333537, 0xFFE3E3E3, 0xFFC4C7C5, 0xFF8E918F, 0xFF444746,
            0xFFA8C7FA, 0xFF062E6F, 0xFF004A77, 0xFFC2E7FF, 0xFFF2B8B5, 0xFF601410, 0xFF444746);
    static final Colors DAY = new Colors(false, 0xFFF8FAFD, 0xFFE9EEF6, 0xFF1F1F1F, 0xFF444746, 0xFF747775, 0xFFC4C7C5,
            0xFF0B57D0, 0xFFFFFFFF, 0xFFC2E7FF, 0xFF001D35, 0xFFB3261E, 0xFFFFFFFF, 0xFFDDE3EA);

    /** The colors Maps shows now (Day/night colors), so a dialog matches the map behind it. */
    static Colors colors(Context context) {
        return ColorScheme.nightColors(context) ? NIGHT : DAY;
    }

    static int px(Context context, float dp) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, dp, context.getResources().getDisplayMetrics()));
    }

    static int alpha(int color, int alpha) {
        return color & 0x00FFFFFF | alpha << 24;
    }

    private static final Typeface MEDIUM = Typeface.create("sans-serif-medium", Typeface.NORMAL);

    static TextView text(Context context, float sp, int color, boolean medium) {
        TextView view = new TextView(context);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        if (medium) view.setTypeface(MEDIUM);
        return view;
    }

    static GradientDrawable shape(int fill, float radius) {
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadius(radius);
        shape.setColor(fill);
        return shape;
    }

    /** A press ripple over [content] (null for none), clipped to [radius]: a solid mask, so it shows on clear rows. */
    static Drawable ripple(Colors colors, Drawable content, float radius) {
        return new RippleDrawable(ColorStateList.valueOf(alpha(colors.onSurface, 0x1F)), content, shape(Color.WHITE, radius));
    }

    /** A full-width touch row: the ripple only. */
    static void selectable(View view, Colors colors) {
        view.setBackground(ripple(colors, null, 0));
    }

    /** A section's label: primary, medium. */
    static TextView label(Context context, Colors colors, CharSequence text) {
        TextView label = text(context, 14, colors.primary, true);
        label.setText(text);
        return label;
    }

    static View divider(Context context, Colors colors) {
        View divider = new View(context);
        divider.setBackgroundColor(colors.outlineVariant);
        return divider;
    }

    /** A button's look: the action (filled primary), one that deletes or resets (filled red), the way out (gray), a side action (outlined). */
    static final int FILLED = 0, DANGER = 1, GRAY = 2, OUTLINED = 3;

    /**
     * A button of [kind] (the dialogs' buttons look like buttons, Cancel gray): a pill 48 dp high, medium 16 sp, a press
     * ripple of its text color; disabled, M3's onSurface at 12% (no fill for an outlined one) with the text at 38%.
     */
    static Button button(Context context, Colors colors, CharSequence text, int kind) {
        Button button = new Button(context, null, 0, 0);
        button.setText(text);
        button.setAllCaps(false);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        button.setTypeface(MEDIUM);
        int fill = kind == FILLED ? colors.primary : kind == DANGER ? colors.error : kind == GRAY ? colors.gray : Color.TRANSPARENT;
        int content = kind == FILLED ? colors.onPrimary : kind == DANGER ? colors.onError : kind == GRAY ? colors.onSurface
                : colors.primary;
        button.setTextColor(new ColorStateList(new int[][]{{-android.R.attr.state_enabled}, {}},
                new int[]{alpha(colors.onSurface, 0x61), content}));
        button.setGravity(Gravity.CENTER);
        button.setMinWidth(px(context, 64));
        button.setMinHeight(px(context, 48));
        button.setPadding(px(context, 24), 0, px(context, 24), 0);
        float radius = px(context, 24);
        GradientDrawable enabled = shape(fill, radius);
        GradientDrawable disabled = shape(kind == OUTLINED ? Color.TRANSPARENT : alpha(colors.onSurface, 0x1F), radius);
        if (kind == OUTLINED) {
            enabled.setStroke(Math.max(1, px(context, 1)), colors.outline);
            disabled.setStroke(Math.max(1, px(context, 1)), alpha(colors.onSurface, 0x1F));
        }
        StateListDrawable box = new StateListDrawable();
        box.addState(new int[]{-android.R.attr.state_enabled}, disabled);
        box.addState(new int[]{}, enabled);
        button.setBackground(new RippleDrawable(ColorStateList.valueOf(alpha(content, 0x1F)), box, shape(Color.WHITE, radius)));
        return button;
    }

    /** An outlined text field (M3): a 4 dp box, the outline 1 dp, the primary at 2 dp while focused; 18 sp text. */
    static void field(EditText field, Colors colors) {
        Context context = field.getContext();
        float radius = px(context, 4);
        GradientDrawable focused = shape(Color.TRANSPARENT, radius);
        focused.setStroke(px(context, 2), colors.primary);
        GradientDrawable normal = shape(Color.TRANSPARENT, radius);
        normal.setStroke(Math.max(1, px(context, 1)), colors.outline);
        StateListDrawable box = new StateListDrawable();
        box.addState(new int[]{android.R.attr.state_focused}, focused);
        box.addState(new int[]{}, normal);
        field.setBackground(box);
        field.setTextColor(colors.onSurface);
        field.setHintTextColor(colors.onSurfaceVariant);
        field.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
        field.setMinHeight(px(context, 56));
        field.setPadding(px(context, 16), px(context, 8), px(context, 16), px(context, 8));
    }

    /** A card: the container color, 16 dp corners. */
    static void card(View view, Colors colors) {
        view.setBackground(shape(colors.container, px(view.getContext(), 16)));
    }

    /** A filter chip (8 dp corners): selected = secondary container with a check, else an outline. */
    static void chip(TextView chip, Colors colors, boolean selected) {
        Context context = chip.getContext();
        float radius = px(context, 8);
        GradientDrawable shape = shape(selected ? colors.secondaryContainer : Color.TRANSPARENT, radius);
        if (!selected) shape.setStroke(Math.max(1, px(context, 1)), colors.outline);
        chip.setBackground(ripple(colors, shape, radius));
        mark(chip, colors, selected);
        chip.setSelected(selected);
    }

    /**
     * One segment of a segmented button: the outer corners rounded (24 dp) on the [first] and [last] segment; neighbours
     * overlap by the stroke (the row's margins), so one line divides them.
     */
    static void segment(TextView segment, Colors colors, boolean selected, boolean first, boolean last) {
        Context context = segment.getContext();
        float r = px(context, 24);
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadii(new float[]{first ? r : 0, first ? r : 0, last ? r : 0, last ? r : 0,
                last ? r : 0, last ? r : 0, first ? r : 0, first ? r : 0});
        shape.setColor(selected ? colors.secondaryContainer : Color.TRANSPARENT);
        shape.setStroke(Math.max(1, px(context, 1)), colors.outline);
        GradientDrawable mask = new GradientDrawable();
        mask.setCornerRadii(shape.getCornerRadii());
        mask.setColor(Color.WHITE);
        segment.setBackground(new RippleDrawable(ColorStateList.valueOf(alpha(colors.onSurface, 0x1F)), shape, mask));
        mark(segment, colors, selected);
        segment.setSelected(selected);
    }

    // The check before a selected chip or segment, and its text color.
    private static void mark(TextView view, Colors colors, boolean selected) {
        int color = selected ? colors.onSecondaryContainer : colors.onSurfaceVariant;
        view.setTextColor(color);
        view.setTypeface(MEDIUM);
        Drawable check = selected ? new Check(px(view.getContext(), 18), color) : null;
        view.setCompoundDrawablesRelativeWithIntrinsicBounds(check, null, null, null);
        view.setCompoundDrawablePadding(selected ? px(view.getContext(), 4) : 0);
    }

    /** A check mark ([size] square, 2 dp stroke). */
    static final class Check extends Drawable {
        private final int size;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();

        Check(int size, int color) {
            this.size = size;
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(size / 9f);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        public void draw(Canvas canvas) {
            float s = getBounds().width(), x = getBounds().left, y = getBounds().top;
            path.reset();
            path.moveTo(x + s * 0.20f, y + s * 0.52f);
            path.lineTo(x + s * 0.42f, y + s * 0.73f);
            path.lineTo(x + s * 0.80f, y + s * 0.30f);
            canvas.drawPath(path, paint);
        }

        @Override
        public int getIntrinsicWidth() {
            return size;
        }

        @Override
        public int getIntrinsicHeight() {
            return size;
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter filter) {
            paint.setColorFilter(filter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** A chevron ([size] square): down to open, up to close. */
    static final class Chevron extends Drawable {
        private final int size;
        private final boolean up;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();

        Chevron(int size, int color, boolean up) {
            this.size = size;
            this.up = up;
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(size / 12f);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        public void draw(Canvas canvas) {
            float s = getBounds().width(), x = getBounds().left, y = getBounds().top;
            float near = up ? 0.62f : 0.38f, far = up ? 0.38f : 0.62f;
            path.reset();
            path.moveTo(x + s * 0.27f, y + s * near);
            path.lineTo(x + s * 0.50f, y + s * far);
            path.lineTo(x + s * 0.73f, y + s * near);
            canvas.drawPath(path, paint);
        }

        @Override
        public int getIntrinsicWidth() {
            return size;
        }

        @Override
        public int getIntrinsicHeight() {
            return size;
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter filter) {
            paint.setColorFilter(filter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** A radio button's circle: a 2 dp ring, the dot when selected ([size] square). */
    static final class Radio extends Drawable {
        private final int size;
        private final boolean selected;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        Radio(int size, int color, boolean selected) {
            this.size = size;
            this.selected = selected;
            paint.setColor(color);
        }

        @Override
        public void draw(Canvas canvas) {
            float s = getBounds().width(), cx = getBounds().exactCenterX(), cy = getBounds().exactCenterY();
            float stroke = s / 10f;
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(stroke);
            canvas.drawCircle(cx, cy, s / 2 - stroke / 2, paint);
            if (selected) {
                paint.setStyle(Paint.Style.FILL);
                canvas.drawCircle(cx, cy, s / 4, paint);
            }
        }

        @Override
        public int getIntrinsicWidth() {
            return size;
        }

        @Override
        public int getIntrinsicHeight() {
            return size;
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter filter) {
            paint.setColorFilter(filter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /**
     * The Material 3 switch: a 52 x 32 dp track; on, the primary track and a 24 dp thumb with a check; off, an outlined
     * track and a 16 dp thumb. A CompoundButton, so setChecked, toggle and the change listener work as on Switch.
     */
    static final class Switch extends CompoundButton {
        private Colors colors;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF track = new RectF();
        private final Path check = new Path();

        Switch(Context context, Colors colors) {
            super(context, null, 0, 0);
            this.colors = colors;
            setBackground(null);
            setButtonDrawable(null);
            setMinWidth(0);
            setMinHeight(0);
            setPadding(0, 0, 0, 0);
        }

        /** The scheme to draw with (a dialog left open over a change of Maps' colors keeps its own). */
        void setColors(Colors colors) {
            this.colors = colors;
            invalidate();
        }

        @Override
        public void setChecked(boolean checked) {
            super.setChecked(checked);
            invalidate();
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            setMeasuredDimension(px(getContext(), 52), px(getContext(), 32));
        }

        @Override
        protected void onDraw(Canvas canvas) {
            if (colors == null) return;
            float w = getWidth(), h = getHeight(), stroke = px(getContext(), 2);
            int alpha = isEnabled() ? 0xFF : 0x61;
            boolean on = isChecked();
            track.set(stroke / 2, stroke / 2, w - stroke / 2, h - stroke / 2);
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(alpha(on ? colors.primary : colors.container, alpha));
            canvas.drawRoundRect(track, h / 2, h / 2, paint);
            if (!on) {
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(stroke);
                paint.setColor(alpha(colors.outline, alpha));
                canvas.drawRoundRect(track, h / 2, h / 2, paint);
            }
            float radius = px(getContext(), on ? 12 : 8), cx = on ? w - h / 2 : h / 2, cy = h / 2;
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(alpha(on ? colors.onPrimary : colors.outline, alpha));
            canvas.drawCircle(cx, cy, radius, paint);
            if (on) {
                float s = px(getContext(), 16);
                check.reset();
                check.moveTo(cx - s * 0.30f, cy + s * 0.02f);
                check.lineTo(cx - s * 0.08f, cy + s * 0.23f);
                check.lineTo(cx + s * 0.30f, cy - s * 0.20f);
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(px(getContext(), 2));
                paint.setStrokeCap(Paint.Cap.ROUND);
                paint.setStrokeJoin(Paint.Join.ROUND);
                paint.setColor(alpha(colors.primary, alpha));
                canvas.drawPath(check, paint);
            }
        }

        @Override
        public CharSequence getAccessibilityClassName() {
            return android.widget.Switch.class.getName();
        }
    }

    /** The battery level: an 8 dp rounded track with the [fraction] filled. */
    static final class LevelBar extends View {
        private Colors colors;
        private float fraction = Float.NaN;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();

        LevelBar(Context context, Colors colors) {
            super(context);
            this.colors = colors;
        }

        void setLevel(float fraction, Colors colors) {
            this.colors = colors;
            this.fraction = fraction;
            invalidate();
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            setMeasuredDimension(MeasureSpec.getSize(widthMeasureSpec), px(getContext(), 8));
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float w = getWidth(), h = getHeight();
            paint.setColor(colors.outlineVariant);
            rect.set(0, 0, w, h);
            canvas.drawRoundRect(rect, h / 2, h / 2, paint);
            if (Float.isNaN(fraction)) return;
            float filled = Math.max(h, w * Math.max(0, Math.min(1, fraction)));
            paint.setColor(colors.primary);
            rect.set(0, 0, filled, h);
            canvas.drawRoundRect(rect, h / 2, h / 2, paint);
        }
    }

    /**
     * The dialog: a rounded surface (28 dp) with the title, the body (message, single-choice rows and the view; scrolled
     * when taller than the screen) and the buttons at the end: positive filled (red when it deletes or resets), negative
     * gray, neutral outlined. Buttons dismiss after their listener, as AlertDialog's.
     */
    public static final class Dialog extends android.app.Dialog {
        final Colors colors;
        private final LinearLayout root;
        private final Actions buttons;
        private final Button[] actions = new Button[3];
        private final FrameLayout body;

        private Dialog(Context themed, Colors colors) {
            super(themed, colors.theme());
            this.colors = colors;
            Context context = getContext();
            root = new Root(context);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setPadding(0, px(context, 24), 0, px(context, 8));
            body = new FrameLayout(context);
            buttons = new Actions(context);
            // 24 dp from the sides and the bottom (with the root's 8 dp), as the body's text.
            buttons.setPadding(px(context, 24), px(context, 16), px(context, 24), px(context, 16));
            root.addView(body, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
            root.addView(buttons, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            setContentView(root);
            Window window = getWindow();
            if (window != null) window.setBackgroundDrawable(shape(colors.surface, px(context, 28)));
        }

        /** The button of [which] (DialogInterface.BUTTON_POSITIVE, _NEGATIVE, _NEUTRAL), or null without one. */
        public Button getButton(int which) {
            int index = which == BUTTON_POSITIVE ? 0 : which == BUTTON_NEGATIVE ? 1 : which == BUTTON_NEUTRAL ? 2 : -1;
            return index < 0 ? null : actions[index];
        }
    }

    /**
     * The dialog's content. Its width at each measure, so it follows the window (Maps keeps its activity through split
     * screen): 560 dp, or the framework's minimum dialog width when that is larger (its windowMinWidthMajor, 45% of a
     * large screen in landscape), within the window less 16 dp a side. The text does not stretch it.
     */
    private static final class Root extends LinearLayout {
        Root(Context context) {
            super(context);
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            if (MeasureSpec.getMode(widthMeasureSpec) == MeasureSpec.AT_MOST) {
                int available = MeasureSpec.getSize(widthMeasureSpec);
                int width = Math.min(available - px(getContext(), 32), Math.max(px(getContext(), 560), frameworkMinWidth()));
                widthMeasureSpec = MeasureSpec.makeMeasureSpec(Math.max(0, Math.min(available, width)), MeasureSpec.EXACTLY);
            }
            super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        }

        // As the framework's dialog window computes its minimum width (DecorView), from the dialog theme now.
        private int frameworkMinWidth() {
            try {
                DisplayMetrics metrics = getResources().getDisplayMetrics();
                boolean portrait = getResources().getConfiguration().orientation == Configuration.ORIENTATION_PORTRAIT;
                TypedValue value = new TypedValue();
                if (!getContext().getTheme().resolveAttribute(portrait ? android.R.attr.windowMinWidthMinor
                        : android.R.attr.windowMinWidthMajor, value, true)) return 0;
                if (value.type == TypedValue.TYPE_FRACTION) {
                    return (int) value.getFraction(metrics.widthPixels, metrics.widthPixels);
                }
                if (value.type == TypedValue.TYPE_DIMENSION) return (int) value.getDimension(metrics);
            } catch (RuntimeException ignored) {
                // 560 dp alone.
            }
            return 0;
        }
    }

    /**
     * The buttons: side by side at the end, 8 dp apart (neutral apart at the start); stacked full width, positive on top,
     * when they do not fit side by side (AlertDialog's button bar does the same).
     */
    private static final class Actions extends LinearLayout {
        private View spacer;
        private int lastWidth;

        Actions(Context context) {
            super(context);
            setStacked(false);
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int widthSize = MeasureSpec.getSize(widthMeasureSpec);
            // Wider than last time: try side by side again.
            if (widthSize > lastWidth && getOrientation() == VERTICAL) setStacked(false);
            lastWidth = widthSize;
            boolean again = false;
            int first = widthMeasureSpec;
            // AT_MOST, so a row that does not fit says so (MEASURED_STATE_TOO_SMALL).
            if (getOrientation() == HORIZONTAL && MeasureSpec.getMode(widthMeasureSpec) == MeasureSpec.EXACTLY) {
                first = MeasureSpec.makeMeasureSpec(widthSize, MeasureSpec.AT_MOST);
                again = true;
            }
            super.onMeasure(first, heightMeasureSpec);
            if (getOrientation() == HORIZONTAL && (getMeasuredWidthAndState() & MEASURED_STATE_MASK) == MEASURED_STATE_TOO_SMALL) {
                setStacked(true);
                again = true;
            }
            if (again) super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        }

        void setSpacer(View spacer) {
            this.spacer = spacer;
        }

        private void setStacked(boolean stacked) {
            if (getChildCount() > 0 && stacked == (getOrientation() == VERTICAL)) return;
            setOrientation(stacked ? VERTICAL : HORIZONTAL);
            setGravity(stacked ? Gravity.END : Gravity.CENTER_VERTICAL | Gravity.END);
            if (spacer != null) spacer.setVisibility(stacked ? View.GONE : View.INVISIBLE);
            // Positive first when stacked, last side by side.
            for (int i = getChildCount() - 2; i >= 0; i--) bringChildToFront(getChildAt(i));
            arrange();
        }

        // The buttons' widths and gaps for the orientation now (fields only: a measure follows).
        void arrange() {
            boolean stacked = getOrientation() == VERTICAL;
            int gap = px(getContext(), 8);
            boolean first = true;
            for (int i = 0; i < getChildCount(); i++) {
                View child = getChildAt(i);
                if (child == spacer || !(child.getLayoutParams() instanceof LayoutParams)) continue;
                LayoutParams params = (LayoutParams) child.getLayoutParams();
                params.width = stacked ? LayoutParams.MATCH_PARENT : LayoutParams.WRAP_CONTENT;
                params.setMarginStart(stacked || first ? 0 : gap);
                params.topMargin = stacked && !first ? gap : 0;
                first = false;
            }
        }
    }

    /** AlertDialog.Builder's methods that Maps Car uses, for the M3 dialog. */
    public static final class Builder {
        private final Colors colors;
        private final Context themed;
        private CharSequence title, message;
        private View view;
        private CharSequence[] items;
        private int checkedItem = -1;
        private boolean singleChoice;
        private DialogInterface.OnClickListener itemListener;
        private final CharSequence[] texts = new CharSequence[3];
        private final DialogInterface.OnClickListener[] listeners = new DialogInterface.OnClickListener[3];
        private boolean cancelable = true, destructive;
        private DialogInterface.OnDismissListener dismissListener;
        private DialogInterface.OnCancelListener cancelListener;

        public Builder(Context context) {
            colors = M3.colors(context);
            themed = new ContextThemeWrapper(context, colors.theme());
        }

        /** The dialog's themed context, for the views of [setView]. */
        public Context getContext() {
            return themed;
        }

        public Colors colors() {
            return colors;
        }

        public Builder setTitle(CharSequence title) {
            this.title = title;
            return this;
        }

        public Builder setMessage(CharSequence message) {
            this.message = message;
            return this;
        }

        public Builder setView(View view) {
            this.view = view;
            return this;
        }

        /** Radio rows; a tap selects the row and calls [listener] (which may dismiss), as AlertDialog's. */
        public Builder setSingleChoiceItems(CharSequence[] items, int checkedItem, DialogInterface.OnClickListener listener) {
            this.items = items;
            this.checkedItem = checkedItem;
            this.itemListener = listener;
            singleChoice = true;
            return this;
        }

        /** Plain rows; a tap calls [listener], then the dialog closes, as AlertDialog's. */
        public Builder setItems(CharSequence[] items, DialogInterface.OnClickListener listener) {
            this.items = items;
            this.itemListener = listener;
            singleChoice = false;
            return this;
        }

        public Builder setPositiveButton(CharSequence text, DialogInterface.OnClickListener listener) {
            texts[0] = text;
            listeners[0] = listener;
            return this;
        }

        public Builder setNegativeButton(CharSequence text, DialogInterface.OnClickListener listener) {
            texts[1] = text;
            listeners[1] = listener;
            return this;
        }

        public Builder setNeutralButton(CharSequence text, DialogInterface.OnClickListener listener) {
            texts[2] = text;
            listeners[2] = listener;
            return this;
        }

        /** The positive button deletes or resets something: red instead of the primary color. Not AlertDialog's. */
        public Builder setDestructive() {
            destructive = true;
            return this;
        }

        public Builder setCancelable(boolean cancelable) {
            this.cancelable = cancelable;
            return this;
        }

        public Builder setOnDismissListener(DialogInterface.OnDismissListener listener) {
            dismissListener = listener;
            return this;
        }

        public Builder setOnCancelListener(DialogInterface.OnCancelListener listener) {
            cancelListener = listener;
            return this;
        }

        public Dialog create() {
            Dialog dialog = new Dialog(themed, colors);
            Context context = dialog.getContext();
            // As AlertDialog: cancelable also closes on a tap outside.
            dialog.setCancelable(cancelable);
            if (cancelable) dialog.setCanceledOnTouchOutside(true);
            if (dismissListener != null) dialog.setOnDismissListener(dismissListener);
            if (cancelListener != null) dialog.setOnCancelListener(cancelListener);
            // The window title, for accessibility services.
            if (title != null) dialog.setTitle(title);
            // As AlertDialog: without a text field the dialog does not take the keyboard from Maps.
            Window window = dialog.getWindow();
            if (window != null && (view == null || !textInput(view))) {
                window.setFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM, WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
            }

            // The title stays above the body; the body scrolls when the dialog is taller than the window.
            if (title != null) {
                TextView heading = text(context, 24, colors.onSurface, false);
                heading.setText(title);
                heading.setPadding(px(context, 24), 0, px(context, 24), px(context, 16));
                dialog.root.addView(heading, 0);
            }
            if ((view instanceof ScrollView || view instanceof AbsListView) && message == null && items == null) {
                // A view that scrolls itself takes the body as it is (a list inside a ScrollView would show one row).
                dialog.body.addView(view);
            } else {
                LinearLayout scrolled = new LinearLayout(context);
                scrolled.setOrientation(LinearLayout.VERTICAL);
                if (message != null) {
                    TextView text = text(context, 16, colors.onSurfaceVariant, false);
                    text.setText(message);
                    text.setLineSpacing(0, 1.2f);
                    text.setPadding(px(context, 24), 0, px(context, 24), px(context, 8));
                    scrolled.addView(text);
                }
                ScrollView scroll = new ScrollView(context);
                if (items != null) addItems(dialog, scrolled, scroll);
                if (view != null) scrolled.addView(view);
                scroll.addView(scrolled);
                dialog.body.addView(scroll);
            }
            // Neutral first and apart, then negative and positive at the end, as Material dialogs.
            addButton(dialog, 2);
            if (texts[2] != null) {
                View spacer = new View(context);
                dialog.buttons.addView(spacer, new LinearLayout.LayoutParams(0, 1, 1));
                dialog.buttons.setSpacer(spacer);
            }
            addButton(dialog, 1);
            addButton(dialog, 0);
            dialog.buttons.arrange();
            if (dialog.buttons.getChildCount() == 0) dialog.buttons.setVisibility(View.GONE);
            return dialog;
        }

        // Whether [view] or a view in it takes text (AlertDialog's check).
        private static boolean textInput(View view) {
            if (view.onCheckIsTextEditor()) return true;
            if (!(view instanceof ViewGroup)) return false;
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                if (textInput(group.getChildAt(i))) return true;
            }
            return false;
        }

        public Dialog show() {
            Dialog dialog = create();
            dialog.show();
            return dialog;
        }

        // The rows in [column]; a single choice opens with its checked row in view of [scroll].
        private void addItems(Dialog dialog, LinearLayout column, ScrollView scroll) {
            Context context = dialog.getContext();
            CheckedTextView[] rows = new CheckedTextView[items.length];
            for (int i = 0; i < items.length; i++) {
                int which = i;
                // Checkable, so accessibility services read which choice is checked; no theme style, no check mark.
                CheckedTextView row = new CheckedTextView(context, null, 0, 0);
                row.setCheckMarkDrawable(null);
                row.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
                row.setTextColor(colors.onSurface);
                row.setText(items[i]);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setMinHeight(px(context, 56));
                row.setPadding(px(context, 24), px(context, 8), px(context, 24), px(context, 8));
                selectable(row, colors);
                rows[i] = row;
                row.setOnClickListener(clicked -> {
                    if (singleChoice) {
                        checkedItem = which;
                        paintRadios(rows);
                        if (itemListener != null) itemListener.onClick(dialog, which);
                    } else {
                        if (itemListener != null) itemListener.onClick(dialog, which);
                        dialog.dismiss();
                    }
                });
                column.addView(row, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT));
            }
            if (!singleChoice) return;
            paintRadios(rows);
            // As AlertDialog: the checked row in view when the dialog opens (the 24 hours list, say), centred.
            if (checkedItem > 0 && checkedItem < rows.length) {
                View checked = rows[checkedItem];
                scroll.post(() -> scroll.scrollTo(0, Math.max(0, checked.getTop() - (scroll.getHeight() - checked.getHeight()) / 2)));
            }
        }

        private void paintRadios(CheckedTextView[] rows) {
            for (int i = 0; i < rows.length; i++) {
                Context context = rows[i].getContext();
                boolean selected = i == checkedItem;
                rows[i].setCompoundDrawablesRelativeWithIntrinsicBounds(
                        new Radio(px(context, 20), selected ? colors.primary : colors.onSurfaceVariant, selected), null, null, null);
                rows[i].setCompoundDrawablePadding(px(context, 16));
                rows[i].setChecked(selected);
            }
        }

        private void addButton(Dialog dialog, int index) {
            if (texts[index] == null) return;
            Context context = dialog.getContext();
            int which = index == 0 ? DialogInterface.BUTTON_POSITIVE : index == 1 ? DialogInterface.BUTTON_NEGATIVE
                    : DialogInterface.BUTTON_NEUTRAL;
            Button button = button(context, colors, texts[index], index == 0 ? (destructive ? DANGER : FILLED)
                    : index == 1 ? GRAY : OUTLINED);
            DialogInterface.OnClickListener listener = listeners[index];
            button.setOnClickListener(clicked -> {
                if (listener != null) listener.onClick(dialog, which);
                dialog.dismiss();
            });
            // Gaps and widths: Actions.arrange.
            dialog.buttons.addView(button, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            dialog.actions[index] = button;
        }
    }
}
