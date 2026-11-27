package dev.abotmaker.ramblerenhancements;

import android.app.AlertDialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.Locale;

/**
 * Renders the private, on-device Dictation Stats card in both compact Hub mode and full
 * subpage mode (with typing-speed baseline picker and reset control).
 */
final class RamblerStatsCardView {
    private static final int[] TYPING_BASELINE_PRESETS = {30, 35, 40, 45, 50, 60};
    private static final String[] TYPING_BASELINE_LABELS = {
            "30 WPM (relaxed)",
            "35 WPM",
            "40 WPM (mobile average)",
            "45 WPM",
            "50 WPM (fast thumb typer)",
            "60 WPM (very fast)"
    };

    private RamblerStatsCardView() {
    }

    /**
     * Builds the private local dictation stats card.
     *
     * @param compact  when {@code true}, renders the Hub summary card (tap card to open details);
     *                 when {@code false}, includes Today/Peak/Last details plus Typing speed &amp;
     *                 Reset controls.
     * @param onCardClick optional click listener for compact Hub card navigation.
     * @param onChanged   callback invoked after baseline change or stats reset.
     */
    static LinearLayout buildCard(
            Context context,
            boolean compact,
            Runnable onCardClick,
            Runnable onChanged) {
        RamblerWaveformDialogs.Palette pal = RamblerWaveformDialogs.palette(context);
        RamblerDictationStats.StatsSnapshot stats = RamblerDictationStats.readSnapshot(context);
        boolean trackingOn = RamblerEnhancementsSettings.readStatsEnabled(context);
        int baselineWpm = RamblerEnhancementsSettings.readTypingBaselineWpm(context);
        String todayKey = RamblerDictationStats.currentDayKey();

        long todayWords = stats.todayWordsFor(todayKey);
        long todaySessions = stats.todaySessionsFor(todayKey);
        int avgWpm = stats.averageWpm();
        long avgLatencyMs = stats.averageLatencyMs();
        long savedMs = stats.estimatedTimeSavedMs(baselineWpm);
        float multiplier = stats.speedMultiplier(baselineWpm);

        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(context, 16), dp(context, 14), dp(context, 16), dp(context, 14));
        card.setBackground(RamblerWaveformDialogs.tileBackground(context, false));
        if (compact && onCardClick != null) {
            card.setClickable(true);
            card.setFocusable(true);
            card.setOnClickListener(v -> onCardClick.run());
        }

        // Top header row: Title + privacy / speed badge
        LinearLayout headerRow = new LinearLayout(context);
        headerRow.setOrientation(LinearLayout.HORIZONTAL);
        headerRow.setGravity(Gravity.CENTER_VERTICAL);

        TextView titleView = new TextView(context);
        titleView.setText("On-device dictation stats");
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setTextColor(pal.primary);
        headerRow.addView(titleView, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        TextView badgeView = new TextView(context);
        String badgeText = !trackingOn
                ? "Paused"
                : (stats.isEmpty()
                        ? "Private · Local"
                        : RamblerDictationStats.formatSpeedBadge(multiplier));
        badgeView.setText(badgeText);
        badgeView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        badgeView.setTypeface(Typeface.DEFAULT_BOLD);
        badgeView.setTextColor(trackingOn ? pal.accent : pal.secondary);
        badgeView.setPadding(dp(context, 8), dp(context, 3), dp(context, 8), dp(context, 3));
        badgeView.setBackground(pillBackground(context, pal));
        headerRow.addView(badgeView);
        card.addView(headerRow);

        // Hero highlight: Estimated time saved vs. typing
        LinearLayout heroBox = new LinearLayout(context);
        heroBox.setOrientation(LinearLayout.HORIZONTAL);
        heroBox.setGravity(Gravity.CENTER_VERTICAL);
        heroBox.setPadding(dp(context, 12), dp(context, 10), dp(context, 12), dp(context, 10));
        heroBox.setBackground(subTileBackground(context, pal));

        LinearLayout heroLeft = new LinearLayout(context);
        heroLeft.setOrientation(LinearLayout.VERTICAL);

        TextView heroLabel = new TextView(context);
        heroLabel.setText("Estimated time saved");
        heroLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        heroLabel.setTypeface(Typeface.DEFAULT_BOLD);
        heroLabel.setTextColor(pal.secondary);
        heroLeft.addView(heroLabel);

        TextView heroSub = new TextView(context);
        heroSub.setText(stats.isEmpty()
                ? "Dictate with Rambler to start measuring locally"
                : ("vs " + baselineWpm + " WPM typing · includes cloud wait"));
        heroSub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        heroSub.setTextColor(pal.secondary);
        heroLeft.addView(heroSub);
        heroBox.addView(heroLeft, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        TextView heroValue = new TextView(context);
        heroValue.setText(RamblerDictationStats.formatTimeSaved(savedMs, !stats.isEmpty()));
        heroValue.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        heroValue.setTypeface(Typeface.DEFAULT_BOLD);
        heroValue.setTextColor(stats.isEmpty() ? pal.secondary : pal.accent);
        LinearLayout.LayoutParams heroValParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        heroValParams.leftMargin = dp(context, 10);
        heroBox.addView(heroValue, heroValParams);

        LinearLayout.LayoutParams heroParams = matchWrap();
        heroParams.topMargin = dp(context, 10);
        card.addView(heroBox, heroParams);

        // 2x2 metric grid: Words | Sessions  /  Avg WPM | Avg latency
        LinearLayout row1 = new LinearLayout(context);
        row1.setOrientation(LinearLayout.HORIZONTAL);
        row1.addView(
                metricTile(
                        context,
                        pal,
                        "Words dictated",
                        stats.isEmpty() ? "0" : RamblerDictationStats.formatCount(stats.totalWords)),
                gridTileParams(context, 0, dp(context, 6)));
        row1.addView(
                metricTile(
                        context,
                        pal,
                        "Sessions",
                        stats.isEmpty() ? "0" : RamblerDictationStats.formatCount(stats.totalSessions)),
                gridTileParams(context, dp(context, 6), 0));
        LinearLayout.LayoutParams row1Params = matchWrap();
        row1Params.topMargin = dp(context, 8);
        card.addView(row1, row1Params);

        LinearLayout row2 = new LinearLayout(context);
        row2.setOrientation(LinearLayout.HORIZONTAL);
        row2.addView(
                metricTile(
                        context,
                        pal,
                        "Average WPM",
                        RamblerDictationStats.formatWpm(avgWpm)),
                gridTileParams(context, 0, dp(context, 6)));
        row2.addView(
                metricTile(
                        context,
                        pal,
                        "Avg cloud latency",
                        RamblerDictationStats.formatLatency(avgLatencyMs)),
                gridTileParams(context, dp(context, 6), 0));
        LinearLayout.LayoutParams row2Params = matchWrap();
        row2Params.topMargin = dp(context, 8);
        card.addView(row2, row2Params);

        // Footer detail line (Today / Peak / Last latency)
        StringBuilder footer = new StringBuilder();
        if (todaySessions > 0L) {
            footer.append("Today: ")
                    .append(RamblerDictationStats.formatCount(todayWords))
                    .append(todayWords == 1L ? " word" : " words")
                    .append(" (")
                    .append(RamblerDictationStats.formatCount(todaySessions))
                    .append(todaySessions == 1L ? " session)" : " sessions)");
        } else {
            footer.append("Stored privately on device · excluded from backups");
        }
        if (!compact) {
            if (stats.bestWpm > 0) {
                footer.append(" · Peak ").append(stats.bestWpm).append(" WPM");
            }
            if (stats.lastLatencyMs > 0L) {
                footer.append(" · Last ")
                        .append(RamblerDictationStats.formatLatency(stats.lastLatencyMs));
            }
        } else {
            footer.append(" · Tap for details");
        }

        TextView footerView = new TextView(context);
        footerView.setText(footer.toString());
        footerView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        footerView.setTextColor(pal.secondary);
        LinearLayout.LayoutParams footerParams = matchWrap();
        footerParams.topMargin = dp(context, 9);
        card.addView(footerView, footerParams);

        // Full subpage action chips: Typing baseline + Reset stats
        if (!compact) {
            LinearLayout actions = new LinearLayout(context);
            actions.setOrientation(LinearLayout.HORIZONTAL);

            actions.addView(
                    chipButton(
                            context,
                            pal,
                            String.format(Locale.US, "Typing speed: %d WPM", baselineWpm),
                            true,
                            () -> showTypingBaselineDialog(context, baselineWpm, chosen -> {
                                RamblerEnhancementsSettings.writeTypingBaselineWpm(context, chosen);
                                if (onChanged != null) {
                                    onChanged.run();
                                }
                            })),
                    gridTileParams(context, 0, dp(context, 6)));

            boolean canReset = !stats.isEmpty();
            actions.addView(
                    chipButton(
                            context,
                            pal,
                            "Reset stats",
                            canReset,
                            () -> new AlertDialog.Builder(context)
                                    .setTitle("Reset dictation stats?")
                                    .setMessage("Clear all local word, WPM, latency, and time-saved counters? Your saved dictation history is unaffected.")
                                    .setPositiveButton("Reset", (ignored, which) -> {
                                        RamblerDictationStats.resetStats(context);
                                        if (onChanged != null) {
                                            onChanged.run();
                                        }
                                    })
                                    .setNegativeButton("Cancel", null)
                                    .show()),
                    gridTileParams(context, dp(context, 6), 0));

            LinearLayout.LayoutParams actionsParams = matchWrap();
            actionsParams.topMargin = dp(context, 10);
            card.addView(actions, actionsParams);
        }

        return card;
    }

    static void showTypingBaselineDialog(
            Context context, int currentWpm, RamblerProductivityDialogs.IntConsumer onSelect) {
        int checked = 2; // 40 WPM default
        for (int i = 0; i < TYPING_BASELINE_PRESETS.length; i++) {
            if (TYPING_BASELINE_PRESETS[i] == currentWpm) {
                checked = i;
                break;
            }
        }
        new AlertDialog.Builder(context)
                .setTitle("Typing speed baseline")
                .setSingleChoiceItems(TYPING_BASELINE_LABELS, checked, (dialog, which) -> {
                    dialog.dismiss();
                    onSelect.accept(TYPING_BASELINE_PRESETS[which]);
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private static LinearLayout metricTile(
            Context context,
            RamblerWaveformDialogs.Palette pal,
            String label,
            String value) {
        LinearLayout tile = new LinearLayout(context);
        tile.setOrientation(LinearLayout.VERTICAL);
        tile.setPadding(dp(context, 12), dp(context, 9), dp(context, 12), dp(context, 9));
        tile.setBackground(subTileBackground(context, pal));

        TextView valView = new TextView(context);
        valView.setText(value);
        valView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        valView.setTypeface(Typeface.DEFAULT_BOLD);
        valView.setTextColor(pal.primary);
        tile.addView(valView);

        TextView labelView = new TextView(context);
        labelView.setText(label);
        labelView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        labelView.setTextColor(pal.secondary);
        LinearLayout.LayoutParams labelParams = matchWrap();
        labelParams.topMargin = dp(context, 2);
        tile.addView(labelView, labelParams);
        return tile;
    }

    private static TextView chipButton(
            Context context,
            RamblerWaveformDialogs.Palette pal,
            String label,
            boolean enabled,
            Runnable onClick) {
        TextView btn = new TextView(context);
        btn.setText(label);
        btn.setGravity(Gravity.CENTER);
        btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        btn.setTypeface(Typeface.DEFAULT_BOLD);
        btn.setTextColor(enabled ? pal.accent : pal.secondary);
        btn.setPadding(dp(context, 10), dp(context, 9), dp(context, 10), dp(context, 9));
        btn.setBackground(chipBackground(context, pal));
        btn.setAlpha(enabled ? 1.0f : 0.45f);
        btn.setEnabled(enabled);
        btn.setClickable(enabled);
        btn.setFocusable(enabled);
        if (enabled && onClick != null) {
            btn.setOnClickListener(v -> onClick.run());
        }
        return btn;
    }

    private static Drawable subTileBackground(
            Context context, RamblerWaveformDialogs.Palette pal) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(pal.surfaceAlt);
        d.setCornerRadius(dp(context, 12));
        return d;
    }

    private static Drawable pillBackground(
            Context context, RamblerWaveformDialogs.Palette pal) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(pal.selected);
        d.setCornerRadius(dp(context, 999));
        return d;
    }

    private static Drawable chipBackground(
            Context context, RamblerWaveformDialogs.Palette pal) {
        GradientDrawable content = new GradientDrawable();
        content.setColor(pal.surfaceAlt);
        content.setCornerRadius(dp(context, 12));
        content.setStroke(dp(context, 1), pal.stroke);
        GradientDrawable mask = new GradientDrawable();
        mask.setColor(Color.WHITE);
        mask.setCornerRadius(dp(context, 12));
        return new RippleDrawable(ColorStateList.valueOf(pal.pressed), content, mask);
    }

    private static LinearLayout.LayoutParams gridTileParams(
            Context context, int leftMargin, int rightMargin) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
        params.leftMargin = leftMargin;
        params.rightMargin = rightMargin;
        return params;
    }

    private static LinearLayout.LayoutParams matchWrap() {
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private static int dp(Context context, int value) {
        return RamblerWaveformDialogs.dp(context, value);
    }
}
