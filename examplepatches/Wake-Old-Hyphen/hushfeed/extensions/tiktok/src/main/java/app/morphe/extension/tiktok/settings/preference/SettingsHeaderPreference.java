/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.extension.tiktok.settings.preference;

import app.morphe.extension.tiktok.settings.L10n;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.preference.Preference;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.shared.settings.HushfeedPause;
import app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment;

@SuppressWarnings("deprecation")
public final class SettingsHeaderPreference extends Preference {
    /** The product name, which reads the same in every language and is not translated. */
    private static final String BRAND_MARK = "HUSHFEED";

    private enum Kind {
        MASTER,
        SECTION,
        CAPTION
    }

    private final Kind kind;
    private final String heading;
    private final String detail;
    private final Runnable backAction;
    private Runnable statusAction;
    private TextView statusView;

    public static SettingsHeaderPreference master(Context context, Runnable backAction) {
        return master(context, backAction, null);
    }

    public static SettingsHeaderPreference master(Context context, Runnable backAction, Runnable statusAction) {
        SettingsHeaderPreference preference = new SettingsHeaderPreference(
                context,
                Kind.MASTER,
                "Settings",
                null,
                backAction
        );
        preference.statusAction = statusAction;
        return preference;
    }

    public static SettingsHeaderPreference section(Context context, String title, Runnable backAction) {
        return new SettingsHeaderPreference(context, Kind.SECTION, title, null, backAction);
    }

    public static SettingsHeaderPreference caption(Context context, String caption) {
        return new SettingsHeaderPreference(context, Kind.CAPTION, null, caption, null);
    }

    private SettingsHeaderPreference(
            Context context,
            Kind kind,
            String heading,
            String detail,
            Runnable backAction
    ) {
        super(context);
        this.kind = kind;
        this.heading = L10n.t(context, heading);
        this.detail = L10n.t(context, detail);
        this.backAction = backAction;
        setSelectable(false);
        setOrder(kind == Kind.CAPTION ? -900 : -1000);
    }

    @Override
    protected View onCreateView(ViewGroup parent) {
        if (kind == Kind.MASTER) {
            return createMasterHeader();
        }
        if (kind == Kind.CAPTION) {
            return createCaption();
        }
        return createSectionHeader();
    }

    private View createMasterHeader() {
        Context context = getContext();
        LinearLayout header = createHeader(context, heading, backAction, true);
        LinearLayout toolbar = header.findViewWithTag("hushfeed_toolbar");
        statusView = SettingsUi.text(context, "", SettingsUi.TEXT_CAPTION,
                SettingsUi.textSecondary(), 0);
        statusView.setTag("hushfeed_compact_status");
        statusView.setGravity(Gravity.CENTER_VERTICAL | Gravity.END);
        statusView.setMinimumHeight(SettingsUi.dp(context, 48));
        statusView.setMinimumWidth(SettingsUi.dp(context, 48));
        statusView.setPaddingRelative(SettingsUi.dp(context, 8), 0, 0, 0);
        if (statusAction != null) {
            SettingsUi.markAsButton(statusView);
            statusView.setFocusable(true);
            statusView.setBackground(SettingsUi.pressAndFocusOver(context,
                    SettingsUi.RADIUS_CONTROL, new android.graphics.drawable.ColorDrawable(
                            SettingsUi.background())));
            statusView.setOnClickListener(view -> statusAction.run());
        }
        if (context.getResources().getConfiguration().fontScale > 1.3f) {
            // Keep the product name whole when large text makes a single toolbar too narrow.
            View brand = toolbar.getChildAt(1);
            toolbar.removeView(brand);
            LinearLayout state = new LinearLayout(context);
            state.setOrientation(LinearLayout.VERTICAL);
            state.setGravity(Gravity.END);
            state.addView(brand, new LinearLayout.LayoutParams(-1, -2));
            state.addView(statusView, new LinearLayout.LayoutParams(-2, -2));
            toolbar.addView(state, new LinearLayout.LayoutParams(0, -2, 1));
        } else {
            toolbar.addView(statusView, new LinearLayout.LayoutParams(-2, -2));
        }
        refreshStatus();
        return header;
    }

    /** Keeps the compact state truthful after returning from a page with restart-gated settings. */
    public void refreshStatus() {
        if (statusView == null) return;
        boolean pending = !AbstractPreferenceFragment.restartPending.isEmpty();
        boolean paused = HushfeedPause.isPaused();
        String label = L10n.t(getContext(), pending ? "Restart pending" : paused ? "Paused" : "Active");
        statusView.setText(label);
        statusView.setTextColor(pending ? SettingsUi.accent() : SettingsUi.textSecondary());
        android.graphics.drawable.GradientDrawable dot = new android.graphics.drawable.GradientDrawable();
        dot.setShape(android.graphics.drawable.GradientDrawable.OVAL);
        dot.setColor(paused && !pending ? SettingsUi.textSecondary() : SettingsUi.accent());
        int dotSize = SettingsUi.dp(getContext(), 6);
        dot.setBounds(0, 0, dotSize, dotSize);
        statusView.setCompoundDrawablesRelative(dot, null, null, null);
        statusView.setCompoundDrawablePadding(SettingsUi.dp(getContext(), 6));
        String description = pending ? label
                : L10n.t(getContext(), paused ? "Hushfeed is paused" : "Hushfeed is active");
        statusView.setContentDescription(statusAction == null ? description
                : L10n.f(getContext(), "%1$s, %2$s", description,
                        L10n.t(getContext(), "App & advanced")));
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        if (kind == Kind.MASTER) {
            statusView = view.findViewWithTag("hushfeed_compact_status");
            refreshStatus();
        }
    }

    private View createSectionHeader() { return createHeader(getContext(), heading, backAction); }

    /**
     * Shared app-owned heading used by settings and the Lab. Parent supplies the 16 dp gutter.
     *
     * <p>The back control sits flush with the header's start edge, and everything else keeps an
     * 8 dp inset of its own. That puts the arrow where the 8 dp gutter wants it and still leaves the
     * whole 48 dp control inside the header. It used to get there with a negative 8 dp margin
     * inside the inset, which the toolbar clipped: the S25's accessibility tree read the control
     * as 40 by 48 dp, and the clipped strip took no touches.
     */
    public static LinearLayout createHeader(Context context, String title, Runnable onBack) {
        return createHeader(context, title, onBack, false);
    }

    private static LinearLayout createHeader(Context context, String title, Runnable onBack, boolean compact) {
        LinearLayout header = new LinearLayout(context);
        header.setTag("hushfeed_page_header");
        header.setOrientation(LinearLayout.VERTICAL);
        header.setPaddingRelative(0, SettingsUi.dp(context, compact ? 24 : 8), SettingsUi.dp(context, compact ? 0 : 8),
                SettingsUi.dp(context, compact ? 16 : 0));
        header.setBackgroundColor(SettingsUi.background());
        LinearLayout toolbar = new LinearLayout(context);
        toolbar.setTag("hushfeed_toolbar");
        toolbar.setGravity(Gravity.CENTER_VERTICAL);
        ImageView back = new ImageView(context);
        back.setContentDescription(L10n.t(context, "Back"));
        // An ImageView with a click listener is read as an image; this says it is a button.
        SettingsUi.markAsButton(back);
        back.setImageDrawable(new BackDrawable(context));
        back.setOnClickListener(view -> { if (onBack != null) onBack.run(); });
        back.setFocusable(true);
        // The same accent-at-15%-alpha the grouped rows use. divider() is 1.3:1 against the
        // dark surface, which is no press feedback at all. The ring under it is what a reader
        // moving by keyboard or d-pad sees: the ripple's own focus tint is fainter still.
        back.setBackground(new android.graphics.drawable.RippleDrawable(
                android.content.res.ColorStateList.valueOf(SettingsUi.rippleTint()),
                SettingsUi.focusRing(context, SettingsUi.RADIUS_CONTROL),
                SettingsUi.roundedSurface(context, SettingsUi.RADIUS_CONTROL, false)));
        toolbar.addView(back, new LinearLayout.LayoutParams(SettingsUi.dp(context, 48), SettingsUi.dp(context, 48)));
        TextView brand = SettingsUi.text(context, BRAND_MARK, SettingsUi.TEXT_CAPTION, SettingsUi.accent(), 1);
        brand.setLetterSpacing(0.12f);
        if (compact) brand.setGravity(Gravity.END);
        LinearLayout.LayoutParams brandParams = new LinearLayout.LayoutParams(0, -2, 1);
        brandParams.setMarginStart(SettingsUi.dp(context, 8));
        toolbar.addView(brand, brandParams);
        header.addView(toolbar, new LinearLayout.LayoutParams(-1, -2));
        TextView heading = SettingsUi.text(
                context, title, headingSizeSp(context, title),
                SettingsUi.textPrimary(), 1);
        heading.setTag("hushfeed_page_title");
        heading.setHyphenationFrequency(android.text.Layout.HYPHENATION_FREQUENCY_NONE);
        if (android.os.Build.VERSION.SDK_INT >= 28) heading.setAccessibilityHeading(true);
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(-1, -2);
        titleParams.topMargin = SettingsUi.dp(context, compact ? 12 : 24);
        titleParams.setMarginStart(SettingsUi.dp(context, compact ? 0 : 8));
        header.addView(heading, titleParams);
        return header;
    }

    private View createCaption() {
        Context context = getContext();
        TextView caption = SettingsUi.text(context, detail, SettingsUi.TEXT_BODY, SettingsUi.textSecondary(), 0);
        caption.setLineSpacing(SettingsUi.dp(context, 3), 1f);
        caption.setPadding(SettingsUi.dp(context, 8), SettingsUi.dp(context, 12),
                SettingsUi.dp(context, 8), SettingsUi.dp(context, 32));
        caption.setBackgroundColor(SettingsUi.background());
        return caption;
    }

    /**
     * How large the page title may be at the reader's text scale.
     *
     * <p>40sp against a 2x scale is 80sp of page title: "Kommentare und Uebersetzung" took five
     * lines and 85% of the screen, with the first card of the page below the fold. The title is
     * allowed to grow to about a third again of its own size and no further, so an ordinary
     * scale is unchanged and a large one still leaves the page underneath it.
     */
    public static int headingSizeSp(Context context) {
        float scale = context.getResources().getConfiguration().fontScale;
        if (scale <= 1.3f) return 40;
        return Math.max(24, Math.round(40 * 1.3f / scale));
    }

    /**
     * Keeps the longest word whole when a translated title meets large text on a narrow phone.
     * Android otherwise breaks an unhyphenated word at an arbitrary character, which made the
     * German "wiederherstellen" end with a two-line fragment even though a modestly smaller
     * display heading could keep the word intact. Body text and the system font scale are left
     * untouched; only this oversized display title adapts, with 20sp as its floor.
     */
    static int headingSizeSp(Context context, String title) {
        int preferred = headingSizeSp(context);
        if (title == null || title.trim().isEmpty()) return preferred;

        android.content.res.Resources resources = context.getResources();
        android.util.DisplayMetrics metrics = resources.getDisplayMetrics();
        int screenWidthDp = resources.getConfiguration().screenWidthDp;
        float windowWidth = screenWidthDp > 0
                ? screenWidthDp * metrics.density
                : metrics.widthPixels;
        // The list contributes a 16dp gutter and this header contributes another 8dp per side.
        float available = Math.max(SettingsUi.dp(context, 160),
                windowWidth - SettingsUi.dp(context, 48));

        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        paint.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        paint.setTextSize(android.util.TypedValue.applyDimension(
                android.util.TypedValue.COMPLEX_UNIT_SP, preferred, metrics));
        float longest = 0;
        for (String word : title.trim().split("\\s+")) {
            longest = Math.max(longest, paint.measureText(word));
        }
        if (longest <= available || longest <= 0) return preferred;
        int fitted = (int) Math.floor(preferred * available / longest);
        return Math.max(20, Math.min(preferred, fitted));
    }

    public static final class BackDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        public BackDrawable(Context context) {
            paint.setColor(SettingsUi.textPrimary());
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(SettingsUi.strokePx(context, 2.1f));
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        /**
         * The header row mirrors, by margin and gravity, and the glyph inside it did not, so an
         * Arabic or Hebrew reader got a left pointing back arrow parked at the right edge.
         */
        @Override
        public boolean isAutoMirrored() {
            return true;
        }

        @Override
        public void draw(Canvas canvas) {
            float centerX = getBounds().exactCenterX();
            float centerY = getBounds().exactCenterY();
            float size = Math.min(getBounds().width(), getBounds().height()) * 0.18f;
            float offset = getLayoutDirection() == View.LAYOUT_DIRECTION_RTL ? -size : size;
            float pointX = centerX - offset;
            canvas.drawLine(pointX, centerY, centerX + offset, centerY, paint);
            canvas.drawLine(pointX, centerY, centerX - offset * 0.1f, centerY - size * 0.9f, paint);
            canvas.drawLine(pointX, centerY, centerX - offset * 0.1f, centerY + size * 0.9f, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
