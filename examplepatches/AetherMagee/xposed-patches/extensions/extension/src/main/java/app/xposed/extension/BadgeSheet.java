package app.xposed.extension;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.text.format.DateUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.HashSet;
import java.util.Set;

/** The account sheet shown when a badge is tapped, after the extension's hovercard. */
final class BadgeSheet implements Lookup.Listener {
    private final Context context;
    private final String handle;
    private final Ui ui;
    private final Dialog dialog;
    private final LinearLayout content;

    private BadgeSheet(Context context, String handle) {
        this.context = context;
        this.handle = handle;
        this.ui = new Ui(context);
        dialog = new Dialog(context);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(ui.dp(20), ui.dp(8), ui.dp(20), ui.dp(20));
        GradientDrawable sheet = new GradientDrawable();
        sheet.setColor(ui.background);
        float r = ui.dp(16);
        sheet.setCornerRadii(new float[]{r, r, r, r, 0, 0, 0, 0});
        content.setBackground(sheet);
        dialog.setContentView(content);
        // Keep the buttons clear of the gesture bar.
        int bottom = ui.dp(20);
        content.setOnApplyWindowInsetsListener((v, insets) -> {
            v.setPadding(v.getPaddingLeft(), v.getPaddingTop(), v.getPaddingRight(), bottom + insets.getSystemWindowInsetBottom());
            return insets;
        });

        Window window = dialog.getWindow();
        window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        window.setGravity(Gravity.BOTTOM);
        window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        window.setDimAmount(0.4f);

        dialog.setOnDismissListener(d -> Lookup.removeListener(this));
        Lookup.addListener(this);
    }

    static void show(Context context, String handle) {
        if (Lookup.peek(handle) == null) return;
        BadgeSheet sheet = new BadgeSheet(context, handle);
        sheet.render();
        sheet.dialog.show();
    }

    @Override
    public void onAccountUpdated(String updated) {
        if (handle.equals(updated) && dialog.isShowing()) render();
    }

    private void render() {
        AccountInfo info = Lookup.peek(handle);
        if (info == null) return;
        content.removeAllViews();

        View grabber = new View(context);
        GradientDrawable bar = new GradientDrawable();
        bar.setColor(ui.divider);
        bar.setCornerRadius(ui.dp(2));
        grabber.setBackground(bar);
        LinearLayout.LayoutParams grabberLp = new LinearLayout.LayoutParams(ui.dp(36), ui.dp(4));
        grabberLp.gravity = Gravity.CENTER_HORIZONTAL;
        grabberLp.bottomMargin = ui.dp(16);
        content.addView(grabber, grabberLp);

        content.addView(ui.text("@" + handle, 20, true, ui.text));

        if (info.location != null) {
            String flag = Countries.flagFor(info.location);
            content.addView(row(emoji(flag != null ? flag : Countries.UNKNOWN_FLAG), "Account based in", info.location, ui.text));
        }
        if (info.source != null) {
            content.addView(row(icon(Glyphs.forSource(info.source), ui.secondary), "Connected via", info.source, ui.text));
        }
        if (info.affiliation != null) {
            // X gives the affiliate's handle; the community cache only has its name.
            String name = AccountInfo.ORIGIN_X.equals(info.origin) ? "@" + info.affiliation : info.affiliation;
            content.addView(row(icon(Glyphs.INFO, ui.secondary), "Affiliated with", name, ui.text));
        }
        if (info.hasLocationWarning()) {
            content.addView(row(icon(Glyphs.VPN, ui.alert), null,
                    "X reports that this account's location may not be accurate. This is not proof of VPN use.", ui.alert));
        }
        if (info.isEmpty()) {
            content.addView(row(icon(Glyphs.UNKNOWN_DEVICE, ui.secondary), null, "X has no location for this account.", ui.secondary));
        }

        long now = System.currentTimeMillis();
        CharSequence age = now - info.observedAt < DateUtils.MINUTE_IN_MILLIS
                ? "just now"
                : DateUtils.getRelativeTimeSpanString(info.observedAt, now, DateUtils.MINUTE_IN_MILLIS);
        String origin = AccountInfo.ORIGIN_CLOUD.equals(info.origin) ? "X-Posed community cache" : "X";
        TextView footer = ui.text("Source: " + origin + " · " + age + "\nThis is what X reports, not a live location.",
                13, false, ui.secondary);
        footer.setPadding(0, ui.dp(16), 0, ui.dp(16));
        content.addView(footer);

        if (info.location != null) {
            boolean filtered = Filters.isFiltered(info.location);
            String verb = Settings.highlightMode() ? "Highlight" : "Hide";
            String label = filtered
                    ? (Settings.highlightMode() ? "Stop highlighting " : "Stop hiding ") + info.location
                    : verb + " posts from " + info.location;
            TextView toggle = ui.pill(label, !filtered, v -> {
                Set<String> locations = new HashSet<>(Filters.locations());
                if (filtered) {
                    locations.removeIf(l -> Countries.canonicalKey(l).equals(Countries.canonicalKey(info.location)));
                } else {
                    locations.add(info.location);
                }
                Filters.save(locations, Settings.highlightMode());
                HeaderBadges.refreshAll();
                render();
            });
            content.addView(toggle, Ui.matchWidth());
        }

        LinearLayout actions = new LinearLayout(context);
        actions.setPadding(0, ui.dp(12), 0, 0);
        TextView refresh = ui.pill("Refresh from X", false, v -> {
            ((TextView) v).setText("Refreshing…");
            v.setEnabled(false);
            Lookup.refresh(handle);
            // A refresh that finds nothing new doesn't notify; restore the sheet anyway.
            v.postDelayed(() -> {
                if (dialog.isShowing()) render();
            }, 8000);
        });
        TextView settings = ui.pill("Settings", false, v -> {
            dialog.dismiss();
            SettingsScreen.show(context);
        });
        LinearLayout.LayoutParams half = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1);
        actions.addView(refresh, half);
        LinearLayout.LayoutParams half2 = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1);
        half2.leftMargin = ui.dp(12);
        actions.addView(settings, half2);
        content.addView(actions, Ui.matchWidth());
    }

    /** Icon on the left, then a small label over the value. */
    private View row(View icon, String label, String value, int valueColor) {
        LinearLayout row = new LinearLayout(context);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, ui.dp(14), 0, 0);
        FrameLayout iconBox = new FrameLayout(context);
        iconBox.addView(icon, new FrameLayout.LayoutParams(ui.dp(24), ui.dp(24), Gravity.CENTER));
        row.addView(iconBox, new LinearLayout.LayoutParams(ui.dp(28), ui.dp(28)));

        LinearLayout texts = new LinearLayout(context);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.setPadding(ui.dp(14), 0, 0, 0);
        if (label != null) texts.addView(ui.text(label, 13, false, ui.secondary));
        texts.addView(ui.text(value, 16, false, valueColor));
        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        return row;
    }

    private View emoji(String emoji) {
        TextView t = ui.text(emoji, 20, false, ui.text);
        t.setGravity(Gravity.CENTER);
        t.setIncludeFontPadding(false);
        return t;
    }

    private View icon(Glyphs.Glyph glyph, int color) {
        ImageView v = new ImageView(context);
        v.setImageDrawable(glyph.asDrawable(color));
        return v;
    }
}
