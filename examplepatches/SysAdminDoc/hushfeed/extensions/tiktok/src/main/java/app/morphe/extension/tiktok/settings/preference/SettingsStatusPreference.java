/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.settings.preference;

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
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.L10n;

/** A compact, readable proof that the injected settings runtime is alive. */
@SuppressWarnings("deprecation")
public final class SettingsStatusPreference extends Preference {
    public static final String KEY = "hushfeed_status";
    public static final String ROW_TAG = "hushfeed_status_card";
    public static final String ACTION_TAG = "hushfeed_status_diagnostics";
    private static final String TITLE_TAG = "hushfeed_status_title";
    private static final String SUMMARY_TAG = "hushfeed_status_summary";

    private final Runnable diagnosticsAction;

    public SettingsStatusPreference(Context context, Runnable diagnosticsAction) {
        this(context, Utils.getPatchesReleaseVersion(), Utils.getAppVersionName(), diagnosticsAction);
    }

    SettingsStatusPreference(
            Context context,
            String bundleVersion,
            String appVersion,
            Runnable diagnosticsAction
    ) {
        super(context);
        this.diagnosticsAction = diagnosticsAction;
        setKey(KEY);
        setPersistent(false);
        setSelectable(false);
        // The restart debt, when present, remains immediately under the page header at -950.
        setOrder(-940);
        setTitle(L10n.t(context, "Hushfeed is active"));
        setSummary(MorpheTikTokAboutPreference.versionSummary(
                context, bundleVersion, appVersion));
    }

    @Override
    protected View onCreateView(ViewGroup parent) {
        Context context = getContext();
        boolean stack = context.getResources().getConfiguration().fontScale > 1.3f
                || context.getResources().getConfiguration().screenWidthDp < 360;
        LinearLayout card = new LinearLayout(context);
        card.setTag(ROW_TAG);
        card.setOrientation(stack ? LinearLayout.VERTICAL : LinearLayout.HORIZONTAL);
        card.setGravity(stack ? Gravity.NO_GRAVITY : Gravity.CENTER_VERTICAL);
        card.setMinimumHeight(SettingsUi.dp(context, 84));
        card.setPadding(
                SettingsUi.dp(context, 16),
                SettingsUi.dp(context, 14),
                SettingsUi.dp(context, 12),
                SettingsUi.dp(context, 14));
        card.setBackground(SettingsUi.borderedSurface(context, SettingsUi.RADIUS_CARD, true));

        LinearLayout information = new LinearLayout(context);
        information.setOrientation(LinearLayout.HORIZONTAL);
        information.setGravity(Gravity.CENTER_VERTICAL);

        ImageView mark = new ImageView(context);
        mark.setImageDrawable(new ActiveDrawable(context));
        mark.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        information.addView(mark, new LinearLayout.LayoutParams(
                SettingsUi.dp(context, 48), SettingsUi.dp(context, 48)));

        LinearLayout labels = new LinearLayout(context);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.setGravity(Gravity.CENTER_VERTICAL);
        labels.setFocusable(true);

        TextView title = SettingsUi.text(
                context, String.valueOf(getTitle()), 17, SettingsUi.textPrimary(),
                android.graphics.Typeface.BOLD);
        title.setTag(TITLE_TAG);
        title.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        labels.addView(title, new LinearLayout.LayoutParams(-1, -2));

        TextView summary = SettingsUi.text(
                context, String.valueOf(getSummary()), 14, SettingsUi.textSecondary(), 0);
        summary.setTag(SUMMARY_TAG);
        summary.setSingleLine(false);
        summary.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        labels.addView(summary, new LinearLayout.LayoutParams(-1, -2));

        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(0, -2, 1);
        labelParams.setMarginStart(SettingsUi.dp(context, 14));
        labelParams.setMarginEnd(SettingsUi.dp(context, 8));
        information.addView(labels, labelParams);

        LinearLayout.LayoutParams informationParams = stack
                ? new LinearLayout.LayoutParams(-1, -2)
                : new LinearLayout.LayoutParams(0, -2, 1);
        card.addView(information, informationParams);

        if (diagnosticsAction != null) {
            TextView action = SettingsUi.text(
                    context, L10n.t(context, "Diagnostics"), 14, SettingsUi.accent(),
                    android.graphics.Typeface.BOLD);
            action.setTag(ACTION_TAG);
            action.setContentDescription(L10n.t(context, "Diagnostics"));
            action.setPadding(SettingsUi.dp(context, 10), 0, SettingsUi.dp(context, 10), 0);
            SettingsUi.styleTextAction(action, true);
            action.setBackground(SettingsUi.pressAndFocusOver(
                    context,
                    SettingsUi.RADIUS_CONTROL,
                    SettingsUi.borderedSurface(context, SettingsUi.RADIUS_CONTROL, false)));
            action.setOnClickListener(view -> diagnosticsAction.run());
            LinearLayout.LayoutParams actionParams = new LinearLayout.LayoutParams(
                    stack ? -1 : -2,
                    SettingsUi.dp(context, 48));
            if (stack) actionParams.topMargin = SettingsUi.dp(context, 8);
            card.addView(action, actionParams);
        }

        updateLabels(card);

        FrameLayout holder = new FrameLayout(context);
        holder.setBackgroundColor(SettingsUi.background());
        holder.setPadding(0, SettingsUi.dp(context, 4), 0, SettingsUi.dp(context, 8));
        holder.addView(card, new FrameLayout.LayoutParams(-1, -2));
        return holder;
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        updateLabels(view);
    }

    private void updateLabels(View root) {
        TextView title = root.findViewWithTag(TITLE_TAG);
        TextView summary = root.findViewWithTag(SUMMARY_TAG);
        if (title != null) title.setText(getTitle());
        if (summary != null) {
            CharSequence detail = getSummary();
            summary.setText(detail);
            summary.setVisibility(detail == null || detail.length() == 0 ? View.GONE : View.VISIBLE);
        }
        View labels = title == null ? null : (View) title.getParent();
        if (labels != null) {
            CharSequence detail = getSummary();
            labels.setContentDescription(detail == null || detail.length() == 0
                    ? getTitle()
                    : String.valueOf(getTitle()) + '.' + ' ' + detail);
        }
    }

    /** Accent status disc with a high-contrast check. */
    private static final class ActiveDrawable extends Drawable {
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint check = new Paint(Paint.ANTI_ALIAS_FLAG);

        ActiveDrawable(Context context) {
            fill.setColor(SettingsUi.badgeFill());
            fill.setStyle(Paint.Style.FILL);
            check.setColor(SettingsUi.badgeText());
            check.setStyle(Paint.Style.STROKE);
            check.setStrokeWidth(SettingsUi.strokePx(context, 2.7f));
            check.setStrokeCap(Paint.Cap.ROUND);
            check.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override public void draw(Canvas canvas) {
            float cx = getBounds().exactCenterX();
            float cy = getBounds().exactCenterY();
            float radius = Math.min(getBounds().width(), getBounds().height()) * 0.38f;
            canvas.drawCircle(cx, cy, radius, fill);
            canvas.drawLine(cx - radius * 0.48f, cy,
                    cx - radius * 0.12f, cy + radius * 0.34f, check);
            canvas.drawLine(cx - radius * 0.12f, cy + radius * 0.34f,
                    cx + radius * 0.52f, cy - radius * 0.38f, check);
        }

        @Override public void setAlpha(int alpha) {
            fill.setAlpha(alpha);
            check.setAlpha(alpha);
        }

        @Override public void setColorFilter(ColorFilter filter) {
            fill.setColorFilter(filter);
            check.setColorFilter(filter);
        }

        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
