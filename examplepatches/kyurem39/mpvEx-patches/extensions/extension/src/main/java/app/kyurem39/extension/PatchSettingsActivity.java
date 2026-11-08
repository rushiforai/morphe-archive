package app.kyurem39.extension;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.animation.DecelerateInterpolator;
import android.widget.ArrayAdapter;
import android.widget.CheckedTextView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/**
 * Full-page settings screen for kyurem39's patches.
 * Uses a fixed Material Design monochrome palette.
 */
public class PatchSettingsActivity extends Activity {

    private static final int HEADER_BOTTOM_DP = 24;

    private View targetLangRow;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        super.onCreate(savedInstanceState);
        MorpheLocale.overrideConfiguration(this);

        final PanelColors colors = PanelColors.from(this);
        final int dialogTheme = colors.isDark
                ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;

        final boolean vietnamese = MorpheHook.isVietnameseUi(this);

        // System bars styling
        Window window = getWindow();
        window.setStatusBarColor(colors.background);
        window.setNavigationBarColor(colors.background);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            View decor = window.getDecorView();
            int flags = decor.getSystemUiVisibility();
            if (!colors.isDark) {
                flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    flags |= View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                }
            } else {
                flags &= ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    flags &= ~View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                }
            }
            decor.setSystemUiVisibility(flags);
        }

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(colors.background);

        // Top App Bar
        LinearLayout topBar = new LinearLayout(this);
        topBar.setOrientation(LinearLayout.HORIZONTAL);
        topBar.setGravity(Gravity.CENTER_VERTICAL);
        topBar.setPadding(dp(this, 8), dp(this, 12), dp(this, 16), dp(this, 12));

        ImageView backButton = new ImageView(this);
        TypedValue rippleTv = new TypedValue();
        if (getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, rippleTv, true)) {
            backButton.setBackgroundResource(rippleTv.resourceId);
        }
        TypedValue arrowTv = new TypedValue();
        if (getTheme().resolveAttribute(android.R.attr.homeAsUpIndicator, arrowTv, true)) {
            backButton.setImageResource(arrowTv.resourceId);
        }
        backButton.setImageTintList(ColorStateList.valueOf(colors.heading));
        backButton.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        backButton.setContentDescription(vietnamese ? "Quay lại" : "Back");
        LinearLayout.LayoutParams backLp = new LinearLayout.LayoutParams(dp(this, 44), dp(this, 44));
        backButton.setLayoutParams(backLp);
        backButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
        topBar.addView(backButton);

        TextView titleView = new TextView(this);
        titleView.setText(vietnamese ? "Bản vá kyurem39" : "kyurem39's patches");
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20f);
        titleView.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        titleView.setTextColor(colors.heading);
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT,
            ViewGroup.LayoutParams.WRAP_CONTENT
        );
        titleLp.leftMargin = dp(this, 8);
        topBar.addView(titleView, titleLp);

        root.addView(topBar);

        // Scrollable content
        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);

        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(this, 16), dp(this, 8), dp(this, 16), dp(this, 24));

        // Section header (sub-heading)
        TextView sectionHeader = new TextView(this);
        sectionHeader.setText(vietnamese ? "Tính năng bản vá" : "Patch Features");
        sectionHeader.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        sectionHeader.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        sectionHeader.setTextColor(colors.subHeading);
        sectionHeader.setPadding(dp(this, 16), dp(this, 12), dp(this, 16), dp(this, HEADER_BOTTOM_DP));
        content.addView(sectionHeader);

        // Settings Card
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);

        GradientDrawable cardDrawable = new GradientDrawable();
        cardDrawable.setShape(GradientDrawable.RECTANGLE);
        cardDrawable.setCornerRadius(dp(this, 16));
        cardDrawable.setColor(colors.card);
        cardDrawable.setStroke(dp(this, 1), colors.divider);
        card.setBackground(cardDrawable);

        final boolean vietnameseAvailable = MorpheHook.isVietnameseInterfaceAvailable();
        if (vietnameseAvailable) {
            final boolean enabled = MorphePrefs.isVietnameseEnabled(this);
            addVietnameseRow(card, enabled, vietnamese, colors);
        }

        if (MorpheHook.isSubtitleTranslationAvailable()) {
            if (card.getChildCount() > 0) {
                addCardDivider(card, colors.divider);
            }
            final boolean subEnabled = MorphePrefs.isSubtitleTranslationEnabled(this);
            addSubtitleTranslationRow(card, subEnabled, vietnamese, colors);
            addCardDivider(card, colors.divider);
            addTargetLanguageRow(card, subEnabled, vietnamese, dialogTheme, colors);
        }

        if (MorpheHook.isIndependentAudioAvailable()) {
            if (card.getChildCount() > 0) {
                addCardDivider(card, colors.divider);
            }
            final boolean audioEnabled = MorphePrefs.isIndependent(this);
            addIndependentAudioRow(card, audioEnabled, vietnamese, colors);
        }

        content.addView(card);

        // Footer / Version
        TextView footer = new TextView(this);
        footer.setText("mpvEx \u2022 kyurem39's patches " + BuildConfig.PATCH_VERSION);
        footer.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        footer.setTextColor(colors.secondaryText);
        footer.setAlpha(0.6f);
        footer.setGravity(Gravity.CENTER_HORIZONTAL);
        footer.setPadding(0, dp(this, 28), 0, dp(this, 16));
        content.addView(footer);

        scroll.addView(content);
        root.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        setContentView(root);
    }

    private void addVietnameseRow(
        LinearLayout card,
        final boolean enabled,
        boolean vietnamese,
        final PanelColors colors
    ) {
        LinearLayout row = createSelectableRow();

        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);

        TextView title = new TextView(this);
        title.setText(vietnamese ? "Giao diện tiếng Việt" : "Vietnamese interface");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        title.setTextColor(colors.heading);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        labels.addView(title);

        TextView description = new TextView(this);
        description.setText(
            vietnamese
                ? "Dịch toàn bộ giao diện mpvEx sang tiếng Việt. Tắt để sử dụng giao diện tiếng Anh gốc."
                : "Translate the entire mpvEx interface into Vietnamese. Turn off for the original English interface."
        );
        description.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        description.setTextColor(colors.bodyText);
        description.setLineSpacing(0, 1.15f);
        description.setPadding(0, dp(this, 3), dp(this, 8), 0);
        labels.addView(description);

        row.addView(labels, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        final Material3Switch toggle = new Material3Switch(this, colors);
        toggle.setChecked(enabled, false);
        toggle.setOnCheckedChangeListener(new Material3Switch.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(Material3Switch switchView, boolean checked) {
                if (checked == enabled) return;
                MorphePrefs.setVietnameseEnabled(PatchSettingsActivity.this, checked);
                MorpheLocale.overrideConfiguration(PatchSettingsActivity.this);
                MorpheHook.restart(PatchSettingsActivity.this);
            }
        });

        LinearLayout.LayoutParams toggleLp = new LinearLayout.LayoutParams(
            dp(this, 52),
            dp(this, 32)
        );
        toggleLp.gravity = Gravity.CENTER_VERTICAL;
        row.addView(toggle, toggleLp);

        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                toggle.toggle();
            }
        });

        card.addView(row);
    }

    private void addSubtitleTranslationRow(
        LinearLayout card,
        boolean enabled,
        boolean vietnamese,
        final PanelColors colors
    ) {
        LinearLayout row = createSelectableRow();

        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);

        TextView title = new TextView(this);
        title.setText(vietnamese ? "Dịch phụ đề video" : "Subtitle translation");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        title.setTextColor(colors.heading);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        labels.addView(title);

        TextView description = new TextView(this);
        description.setText(
            vietnamese
                ? "Tự động dịch phụ đề sang ngôn ngữ đích bằng Google Translate (kể cả phụ đề nhúng, cần kết nối mạng)."
                : "Automatically translate subtitles into the target language using Google Translate (requires internet)."
        );
        description.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        description.setTextColor(colors.bodyText);
        description.setLineSpacing(0, 1.15f);
        description.setPadding(0, dp(this, 3), dp(this, 8), 0);
        labels.addView(description);

        row.addView(labels, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        final Material3Switch toggle = new Material3Switch(this, colors);
        toggle.setChecked(enabled, false);
        toggle.setOnCheckedChangeListener(new Material3Switch.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(Material3Switch switchView, boolean checked) {
                MorphePrefs.setSubtitleTranslationEnabled(PatchSettingsActivity.this, checked);
                if (!checked) MorpheSubtitles.selectEmbeddedSubtitleLater(PatchSettingsActivity.this);
                if (targetLangRow != null) {
                    targetLangRow.setEnabled(checked);
                    targetLangRow.setAlpha(checked ? 1.0f : 0.38f);
                }
            }
        });

        LinearLayout.LayoutParams toggleLp = new LinearLayout.LayoutParams(
            dp(this, 52),
            dp(this, 32)
        );
        toggleLp.gravity = Gravity.CENTER_VERTICAL;
        row.addView(toggle, toggleLp);

        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                toggle.toggle();
            }
        });

        card.addView(row);
    }

    private void addIndependentAudioRow(
        LinearLayout card,
        final boolean enabled,
        boolean vietnamese,
        final PanelColors colors
    ) {
        LinearLayout row = createSelectableRow();

        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);

        TextView title = new TextView(this);
        title.setText(vietnamese ? "Âm thanh độc lập" : "Independent audio");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        title.setTextColor(colors.heading);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        labels.addView(title);

        TextView description = new TextView(this);
        description.setText(
            vietnamese
                ? "Phát video không làm dừng âm thanh của ứng dụng khác và ngược lại."
                : "Play video without pausing other apps' audio, and keep playing when other apps start audio."
        );
        description.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        description.setTextColor(colors.bodyText);
        description.setLineSpacing(0, 1.15f);
        description.setPadding(0, dp(this, 3), dp(this, 8), 0);
        labels.addView(description);

        row.addView(labels, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        final Material3Switch toggle = new Material3Switch(this, colors);
        toggle.setChecked(enabled, false);
        toggle.setOnCheckedChangeListener(new Material3Switch.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(Material3Switch switchView, boolean checked) {
                MorphePrefs.setIndependentAudioEnabled(PatchSettingsActivity.this, checked);
            }
        });

        LinearLayout.LayoutParams toggleLp = new LinearLayout.LayoutParams(
            dp(this, 52),
            dp(this, 32)
        );
        toggleLp.gravity = Gravity.CENTER_VERTICAL;
        row.addView(toggle, toggleLp);

        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                toggle.toggle();
            }
        });

        card.addView(row);
    }

    private void addTargetLanguageRow(
        LinearLayout card,
        boolean subEnabled,
        final boolean vietnamese,
        final int dialogTheme,
        final PanelColors colors
    ) {
        final LinearLayout row = createSelectableRow();
        targetLangRow = row;

        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);

        TextView title = new TextView(this);
        title.setText(vietnamese ? "Ngôn ngữ đích phụ đề" : "Target subtitle language");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        title.setTextColor(colors.heading);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        labels.addView(title);

        final TextView summary = new TextView(this);
        summary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        summary.setTextColor(colors.bodyText);
        summary.setPadding(0, dp(this, 3), dp(this, 8), 0);
        summary.setText(
            MorpheSubtitles.displayName(
                MorphePrefs.subtitleTargetLanguage(this),
                vietnamese
            )
        );
        labels.addView(summary);

        row.addView(labels, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView chevron = new TextView(this);
        chevron.setText("\u203A");
        chevron.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22f);
        chevron.setTextColor(colors.secondaryText);
        chevron.setPadding(dp(this, 4), 0, dp(this, 4), 0);
        row.addView(chevron);

        row.setEnabled(subEnabled);
        row.setAlpha(subEnabled ? 1.0f : 0.38f);

        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (!row.isEnabled()) return;
                showLanguageDialog(vietnamese, dialogTheme, colors, summary);
            }
        });

        card.addView(row);
    }

    private LinearLayout createSelectableRow() {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(this, 16), dp(this, 14), dp(this, 16), dp(this, 14));

        TypedValue rippleTv = new TypedValue();
        if (getTheme().resolveAttribute(android.R.attr.selectableItemBackground, rippleTv, true)) {
            row.setBackgroundResource(rippleTv.resourceId);
        }
        return row;
    }

    private void showLanguageDialog(
        final boolean vietnamese,
        int dialogTheme,
        final PanelColors colors,
        final TextView summary
    ) {
        final String[] codes = MorpheSubtitles.languageCodes();
        final String[] names = MorpheSubtitles.languageNames(vietnamese);
        String current = MorphePrefs.subtitleTargetLanguage(this);

        int selected = 0;
        for (int index = 0; index < codes.length; index++) {
            if (codes[index].equalsIgnoreCase(current)) {
                selected = index;
                break;
            }
        }

        AlertDialog.Builder builder = new AlertDialog.Builder(this, dialogTheme);
        builder.setTitle(vietnamese ? "Chọn ngôn ngữ đích" : "Select target language");

        ArrayAdapter<String> adapter = new ArrayAdapter<String>(
            this,
            android.R.layout.simple_list_item_single_choice,
            names
        ) {
            @Override
            public View getView(int position, View convertView, ViewGroup parent) {
                View view = super.getView(position, convertView, parent);
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                    if (view instanceof CheckedTextView) {
                        ((CheckedTextView) view).setCheckMarkTintList(
                            ColorStateList.valueOf(colors.accent)
                        );
                    }
                }
                if (view instanceof TextView) {
                    ((TextView) view).setTextColor(colors.heading);
                }
                return view;
            }
        };

        builder.setSingleChoiceItems(
            adapter,
            selected,
            new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    MorphePrefs.setSubtitleTargetLanguage(PatchSettingsActivity.this, codes[which]);
                    summary.setText(names[which]);
                    dialog.dismiss();
                }
            }
        );
        builder.setNegativeButton(vietnamese ? "Hủy" : "Cancel", null);
        AlertDialog dialog = builder.create();
        dialog.show();
        if (dialog.getButton(DialogInterface.BUTTON_NEGATIVE) != null) {
            dialog.getButton(DialogInterface.BUTTON_NEGATIVE).setTextColor(colors.accent);
        }
    }

    private void addCardDivider(LinearLayout card, int dividerColor) {
        View divider = new View(this);
        divider.setBackgroundColor(dividerColor);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            dp(this, 1)
        );
        lp.leftMargin = dp(this, 16);
        lp.rightMargin = dp(this, 16);
        card.addView(divider, lp);
    }

    private static int dp(Context context, int value) {
        return (int) (value * context.getResources().getDisplayMetrics().density);
    }

    /**
     * Exact Material Design 3 Switch implementation with fixed monochrome palette.
     * Dimensions: 52dp x 32dp pill track.
     * Thumb: 16dp unselected -> 24dp selected.
     * Smooth 200ms transition.
     */
    public static class Material3Switch extends View {
        private final Paint trackPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint borderPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint thumbPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

        private final RectF trackRect = new RectF();
        private final RectF borderRect = new RectF();

        private final int checkedTrackColor;
        private final int checkedThumbColor;
        private final int uncheckedTrackColor;
        private final int uncheckedBorderColor;
        private final int uncheckedThumbColor;

        private boolean checked;
        private float progress;
        private ValueAnimator animator;
        private OnCheckedChangeListener listener;

        public Material3Switch(Context context, PanelColors colors) {
            super(context);
            this.checkedTrackColor = colors.accent;
            this.checkedThumbColor = colors.background;
            this.uncheckedTrackColor = colors.divider;
            this.uncheckedBorderColor = colors.secondaryText;
            this.uncheckedThumbColor = colors.secondaryText;
            setClickable(false);
            setFocusable(false);
        }

        public void setChecked(boolean checked) {
            setChecked(checked, true);
        }

        public void setChecked(boolean checked, boolean animate) {
            if (this.checked == checked && (progress == (checked ? 1f : 0f))) return;
            this.checked = checked;
            if (animate && isAttachedToWindow()) {
                animateTo(checked ? 1.0f : 0.0f);
            } else {
                if (animator != null && animator.isRunning()) {
                    animator.cancel();
                }
                progress = checked ? 1.0f : 0.0f;
                invalidate();
            }
            if (listener != null) {
                listener.onCheckedChanged(this, checked);
            }
        }

        public boolean isChecked() {
            return checked;
        }

        public void toggle() {
            setChecked(!checked, true);
        }

        @Override
        public boolean performClick() {
            toggle();
            return super.performClick();
        }

        private void animateTo(float target) {
            if (animator != null && animator.isRunning()) {
                animator.cancel();
            }
            animator = ValueAnimator.ofFloat(progress, target);
            animator.setDuration(200);
            animator.setInterpolator(new DecelerateInterpolator());
            animator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
                @Override
                public void onAnimationUpdate(ValueAnimator animation) {
                    progress = (Float) animation.getAnimatedValue();
                    invalidate();
                }
            });
            animator.start();
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            float density = getResources().getDisplayMetrics().density;
            int desiredWidth = (int) (52f * density);
            int desiredHeight = (int) (32f * density);
            setMeasuredDimension(
                resolveSize(desiredWidth, widthMeasureSpec),
                resolveSize(desiredHeight, heightMeasureSpec)
            );
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            float density = getResources().getDisplayMetrics().density;

            float trackWidth = 52f * density;
            float trackHeight = 32f * density;
            float cornerRadius = 16f * density;

            float left = (getWidth() - trackWidth) / 2f;
            float top = (getHeight() - trackHeight) / 2f;
            float right = left + trackWidth;
            float bottom = top + trackHeight;

            trackRect.set(left, top, right, bottom);

            // 1. Draw track fill
            int currentTrackColor = blendColors(uncheckedTrackColor, checkedTrackColor, progress);
            trackPaint.setStyle(Paint.Style.FILL);
            trackPaint.setColor(currentTrackColor);
            canvas.drawRoundRect(trackRect, cornerRadius, cornerRadius, trackPaint);

            // 2. Draw unchecked track border (2dp outline that fades out as checked)
            if (progress < 1.0f) {
                float strokeWidth = 2f * density;
                borderRect.set(
                    left + strokeWidth / 2f,
                    top + strokeWidth / 2f,
                    right - strokeWidth / 2f,
                    bottom - strokeWidth / 2f
                );
                borderPaint.setStyle(Paint.Style.STROKE);
                borderPaint.setStrokeWidth(strokeWidth);
                int borderAlpha = (int) ((1f - progress) * Color.alpha(uncheckedBorderColor));
                borderPaint.setColor(uncheckedBorderColor);
                borderPaint.setAlpha(borderAlpha);
                canvas.drawRoundRect(borderRect, cornerRadius - strokeWidth / 2f, cornerRadius - strokeWidth / 2f, borderPaint);
            }

            // 3. Draw thumb
            float thumbDiameter = (16f + 8f * progress) * density;
            float thumbRadius = thumbDiameter / 2f;

            float thumbCenterX = left + (16f + 20f * progress) * density;
            float thumbCenterY = top + (16f * density);

            int currentThumbColor = blendColors(uncheckedThumbColor, checkedThumbColor, progress);
            thumbPaint.setStyle(Paint.Style.FILL);
            thumbPaint.setColor(currentThumbColor);
            canvas.drawCircle(thumbCenterX, thumbCenterY, thumbRadius, thumbPaint);
        }

        private static int blendColors(int from, int to, float ratio) {
            float inverseRatio = 1f - ratio;
            float a = (Color.alpha(from) * inverseRatio) + (Color.alpha(to) * ratio);
            float r = (Color.red(from) * inverseRatio) + (Color.red(to) * ratio);
            float g = (Color.green(from) * inverseRatio) + (Color.green(to) * ratio);
            float b = (Color.blue(from) * inverseRatio) + (Color.blue(to) * ratio);
            return Color.argb((int) a, (int) r, (int) g, (int) b);
        }

        @Override
        protected void onDetachedFromWindow() {
            super.onDetachedFromWindow();
            if (animator != null && animator.isRunning()) {
                animator.cancel();
            }
        }

        public interface OnCheckedChangeListener {
            void onCheckedChanged(Material3Switch switchView, boolean isChecked);
        }

        public void setOnCheckedChangeListener(OnCheckedChangeListener listener) {
            this.listener = listener;
        }

        @Override
        public CharSequence getAccessibilityClassName() {
            return "android.widget.Switch";
        }
    }
}
