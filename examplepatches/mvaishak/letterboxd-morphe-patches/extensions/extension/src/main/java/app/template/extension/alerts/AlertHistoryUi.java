package app.template.extension.alerts;

import android.app.PendingIntent;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import com.google.android.material.appbar.MaterialToolbar;
import com.google.android.material.snackbar.Snackbar;

import app.template.extension.settings.AccentPresets;
import app.template.extension.settings.Prefs;
import app.template.extension.ui.ThemedDialogPanel;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

public final class AlertHistoryUi {
    private static final int ACTION = View.generateViewId();

    private AlertHistoryUi() {}

    public static void attach(MaterialToolbar toolbar) {
        Menu menu = toolbar.getMenu();
        if (menu.findItem(ACTION) != null) return;
        MenuItem item = menu.add(Menu.NONE, ACTION, Menu.NONE, "Notifications");
        item.setShowAsAction(MenuItem.SHOW_AS_ACTION_ALWAYS);
        item.setActionView(new Bell(toolbar.getContext()));
    }

    private static final class Bell extends FrameLayout
            implements SharedPreferences.OnSharedPreferenceChangeListener {
        private final TextView badge;
        private final Runnable refresh = this::update;
        private int unread;

        Bell(Context context) {
            super(context);
            int size = dp(context, 48);
            setLayoutParams(new ViewGroup.LayoutParams(size, size));
            setFocusable(true);
            setOnClickListener(v -> show(context));
            TypedValue ripple = new TypedValue();
            if (context.getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, ripple, true)
                    && ripple.resourceId != 0) setBackgroundResource(ripple.resourceId);

            ImageView icon = new ImageView(context);
            int image = resource(context, "morphe_stream_alert_bell", "drawable");
            if (image == 0) image = resource(context, "morphe_release_alert_bell", "drawable");
            if (image != 0) icon.setImageResource(image);
            int tint = color(context, "grayAABBCC", 0xFFAABBCC);
            icon.setImageTintList(ColorStateList.valueOf(tint));
            addView(icon, new LayoutParams(dp(context, 24), dp(context, 24), Gravity.CENTER));

            badge = label(context, "LabelSmall");
            badge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10);
            badge.setGravity(Gravity.CENTER);
            badge.setPadding(dp(context, 3), 0, dp(context, 3), 0);
            badge.setMinWidth(dp(context, 16));
            badge.setMinimumHeight(dp(context, 16));
            int accent = AccentPresets.previewColor(context,
                    Prefs.getString(Prefs.KEY_THEME_ACCENT, AccentPresets.defaultAccent(context)),
                    Prefs.getString(Prefs.KEY_THEME_ACCENT_HEX, ""));
            badge.setTextColor(AccentPresets.readableText(Color.WHITE, accent));
            GradientDrawable background = new GradientDrawable();
            background.setColor(accent);
            background.setCornerRadius(dp(context, 12));
            badge.setBackground(background);
            LayoutParams placement = new LayoutParams(-2, -2, Gravity.TOP | Gravity.END);
            placement.topMargin = dp(context, 3);
            placement.setMarginEnd(dp(context, 2));
            addView(badge, placement);
            icon.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
            badge.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
            update();
        }

        @Override protected void onAttachedToWindow() {
            super.onAttachedToWindow();
            AlertHistory.prefs(getContext()).registerOnSharedPreferenceChangeListener(this);
            update();
        }

        @Override protected void onDetachedFromWindow() {
            AlertHistory.prefs(getContext()).unregisterOnSharedPreferenceChangeListener(this);
            removeCallbacks(refresh);
            super.onDetachedFromWindow();
        }

        @Override public void onSharedPreferenceChanged(SharedPreferences prefs, String key) {
            removeCallbacks(refresh);
            post(refresh);
        }

        @Override public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
            super.onInitializeAccessibilityNodeInfo(info);
            info.setClassName(android.widget.Button.class.getName());
        }

        private void update() {
            int count = AlertHistoryEntry.unreadCount(AlertHistory.entries(getContext()));
            if (count != unread || getContentDescription() == null) {
                unread = count;
                badge.setText(count > 99 ? "99+" : Integer.toString(count));
                badge.setVisibility(count == 0 ? GONE : VISIBLE);
                setContentDescription(count == 0 ? "Notifications" : "Notifications, " + count + " unread");
            }
        }
    }

    private static void show(Context context) {
        List<AlertHistoryEntry> entries = AlertHistory.entries(context);
        ThemedDialogPanel panel = new ThemedDialogPanel(context, "Notifications");
        TextView empty = panel.text("BodyMedium", panel.secondary);
        empty.setText("No notifications yet.");
        empty.setPadding(panel.dp(8), panel.dp(12), panel.dp(8), panel.dp(16));
        panel.body.addView(empty);
        ListView list = new ListView(context) {
            @Override protected void onMeasure(int widthSpec, int heightSpec) {
                int height = Math.min(panel.dp(460), panel.availableHeight() / 2);
                int limit = MeasureSpec.getMode(heightSpec) == MeasureSpec.UNSPECIFIED ? height
                        : Math.min(height, MeasureSpec.getSize(heightSpec));
                super.onMeasure(widthSpec, MeasureSpec.makeMeasureSpec(limit, MeasureSpec.AT_MOST));
            }
        };
        DateFormat format = DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.SHORT);
        BaseAdapter adapter = new BaseAdapter() {
            @Override public int getCount() { return entries.size(); }
            @Override public AlertHistoryEntry getItem(int position) { return entries.get(position); }
            @Override public long getItemId(int position) { return position; }
            @Override public View getView(int position, View recycled, ViewGroup parent) {
                HistoryRow row = recycled instanceof HistoryRow
                        ? (HistoryRow) recycled : new HistoryRow(parent.getContext(), panel);
                row.bind(getItem(position), format);
                return row;
            }
        };
        list.setAdapter(adapter);
        panel.body.addView(list, new LinearLayout.LayoutParams(-1, -2));
        list.setOnItemClickListener((parent, row, position, id) ->
                openNotification(context, panel, entries.get(position)));
        TextView clear = panel.action("Clear notifications", false, null);
        clear.setOnClickListener(v -> {
            List<AlertHistoryEntry> shown = List.copyOf(entries);
            ReleaseAlerts.showDialog(ReleaseAlerts.dialog(context).setTitle("Clear notifications?")
                    .setMessage("Remove the notifications shown in this history.")
                    .setNegativeButton("Cancel", null)
                    .setPositiveButton("Clear", (confirmation, which) -> {
                        AlertHistory.clear(context, shown);
                        entries.clear();
                        entries.addAll(AlertHistory.entries(context));
                        renderHistory(entries, list, empty, clear, adapter);
                    }));
        });
        LinearLayout.LayoutParams footer = new LinearLayout.LayoutParams(-2, -2);
        footer.gravity = Gravity.END;
        footer.topMargin = panel.dp(12);
        panel.body.addView(clear, footer);
        renderHistory(entries, list, empty, clear, adapter);
        panel.show(0);
        AlertHistory.markRead(context, entries);
    }

    private static void renderHistory(List<AlertHistoryEntry> entries, View list,
                                      View empty, View clear, BaseAdapter adapter) {
        boolean hasEntries = !entries.isEmpty();
        list.setVisibility(hasEntries ? View.VISIBLE : View.GONE);
        empty.setVisibility(hasEntries ? View.GONE : View.VISIBLE);
        clear.setVisibility(hasEntries ? View.VISIBLE : View.GONE);
        adapter.notifyDataSetChanged();
    }

    private static final class HistoryRow extends LinearLayout {
        final TextView title, message, time;

        HistoryRow(Context context, ThemedDialogPanel panel) {
            super(context);
            setOrientation(VERTICAL);
            setMinimumHeight(dp(context, 56));
            setPaddingRelative(panel.dp(8), panel.dp(10), panel.dp(8), panel.dp(10));
            title = panel.text("TitleMedium", panel.primary);
            message = panel.text("BodyMedium", panel.secondary);
            time = panel.text("LabelSmall", panel.secondary);
            addView(title);
            addView(message);
            addView(time);
        }

        void bind(AlertHistoryEntry entry, DateFormat format) {
            title.setText(entry.title);
            message.setText(entry.message);
            message.setVisibility(entry.message.isEmpty() ? GONE : VISIBLE);
            time.setText(format.format(new Date(entry.receivedAt)));
        }
    }

    private static void openNotification(Context context, ThemedDialogPanel panel, AlertHistoryEntry entry) {
        try {
            if (entry.url.isEmpty()) {
                PendingIntent action = NativeAlertHistory.action(context, entry.id);
                if (action == null) {
                    linkUnavailable(panel);
                    return;
                }
                action.send();
            } else {
                context.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(entry.url))
                        .setPackage(context.getPackageName()));
            }
            panel.dialog.dismiss();
        } catch (ActivityNotFoundException | PendingIntent.CanceledException ignored) {
            linkUnavailable(panel);
        }
    }

    private static void linkUnavailable(ThemedDialogPanel panel) {
        Snackbar.make(panel.body, "This notification’s link is unavailable.", Snackbar.LENGTH_SHORT)
                .setBackgroundTint(panel.surface)
                .setTextColor(panel.primary)
                .show();
    }

    private static TextView label(Context context, String style) {
        TextView label = new TextView(context);
        int id = resource(context, "TextAppearance.Letterboxd." + style, "style");
        if (id != 0) label.setTextAppearance(id);
        return label;
    }

    private static int color(Context context, String name, int fallback) {
        int id = resource(context, name, "color");
        return id == 0 ? fallback : context.getColor(id);
    }

    private static int resource(Context context, String name, String type) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
}
