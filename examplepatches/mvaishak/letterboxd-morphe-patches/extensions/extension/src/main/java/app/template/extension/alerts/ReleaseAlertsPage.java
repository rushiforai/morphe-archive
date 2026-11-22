package app.template.extension.alerts;

import android.app.Activity;
import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import app.template.extension.settings.AccentPresets;
import app.template.extension.settings.Prefs;
import app.template.extension.settings.SurfaceColors;

import java.util.List;
import java.util.Map;

/** The locally saved release reminders in Letterboxd Mods. */
public final class ReleaseAlertsPage extends ScrollView {
    private final Activity activity;
    private final LinearLayout list;
    private final int accent;

    public ReleaseAlertsPage(Activity activity) {
        super(activity);
        this.activity = activity;
        Prefs.load(activity);
        accent = AccentPresets.previewColor(activity,
                Prefs.getString(Prefs.KEY_THEME_ACCENT, AccentPresets.defaultAccent(activity)),
                Prefs.getString(Prefs.KEY_THEME_ACCENT_HEX, ""));
        setFillViewport(true);
        setBackgroundColor(SurfaceColors.background(activity));
        list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setPadding(dp(20), dp(12), dp(20), dp(28));
        addView(list);
        refresh();
    }

    private void refresh() {
        list.removeAllViews();
        Button check = new Button(activity);
        check.setText("Check now");
        check.setAllCaps(false);
        check.setTextColor(AccentPresets.readableText(0xFFFFFFFF, accent));
        GradientDrawable fill = new GradientDrawable();
        fill.setColor(accent);
        fill.setCornerRadius(dp(12));
        check.setBackground(fill);
        check.setMinHeight(dp(48));
        check.setOnClickListener(view -> {
            int count = ReleaseAlertReceiver.checkNow(activity);
            if (count < 0) {
                ReleaseAlertReceiver.openSettings(activity);
                return;
            }
            Toast.makeText(activity, count == 0
                    ? "No release alerts are due today"
                    : count + (count == 1 ? " release alert sent" : " release alerts sent"),
                    Toast.LENGTH_SHORT).show();
            refresh();
        });
        list.addView(check, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(50)));

        TextView hint = text("Sends alerts for selected releases due today. Future dates stay scheduled.", 13,
                color("textColorSecondary"));
        hint.setPadding(0, dp(10), 0, dp(14));
        list.addView(hint);

        Map<String, List<ReleaseAlertReceiver.SavedAlert>> films = ReleaseAlertReceiver.all(activity);
        if (films.isEmpty()) {
            TextView empty = text("No release alerts saved", 16, color("textColorSecondary"));
            empty.setPadding(0, dp(24), 0, 0);
            list.addView(empty);
            return;
        }

        for (List<ReleaseAlertReceiver.SavedAlert> alerts : films.values()) {
            TextView title = text(alerts.get(0).title, 18, color("textColorPrimary"));
            title.setTypeface(title.getTypeface(), Typeface.BOLD);
            title.setPadding(0, dp(18), 0, dp(8));
            title.setAccessibilityHeading(true);
            list.addView(title);
            for (ReleaseAlertReceiver.SavedAlert alert : alerts) {
                LinearLayout row = new LinearLayout(activity);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setMinimumHeight(dp(56));
                row.setPadding(dp(12), dp(8), dp(4), dp(8));
                GradientDrawable surface = new GradientDrawable();
                surface.setColor(SurfaceColors.elevated(activity));
                surface.setCornerRadius(dp(10));
                row.setBackground(surface);
                LinearLayout.LayoutParams rowParams = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                rowParams.bottomMargin = dp(8);
                list.addView(row, rowParams);

                LinearLayout details = new LinearLayout(activity);
                details.setOrientation(LinearLayout.VERTICAL);
                TextView date = text(alert.date(), 14, color("textColorPrimary"));
                date.setTypeface(date.getTypeface(), Typeface.BOLD);
                details.addView(date);
                details.addView(text(alert.description(), 14, color("textColorSecondary")));
                row.addView(details, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));

                TextView remove = text("Remove", 14, accent);
                remove.setGravity(Gravity.CENTER);
                remove.setMinWidth(dp(64));
                remove.setMinHeight(dp(48));
                remove.setOnClickListener(v -> {
                    if (ReleaseAlertReceiver.remove(activity, alert.key)) refresh();
                    else Toast.makeText(activity, "Couldn’t remove alert", Toast.LENGTH_SHORT).show();
                });
                row.addView(remove);
            }
        }
    }

    private TextView text(String value, int size, int color) {
        TextView view = new TextView(activity);
        view.setText(value);
        view.setTextSize(size);
        view.setTextColor(color);
        return view;
    }

    private int color(String name) {
        int id = activity.getResources().getIdentifier(name, "color", activity.getPackageName());
        return activity.getColor(id);
    }

    private int dp(int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }
}
