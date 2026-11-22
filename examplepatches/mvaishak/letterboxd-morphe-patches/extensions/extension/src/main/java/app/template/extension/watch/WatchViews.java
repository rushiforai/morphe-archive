package app.template.extension.watch;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import com.google.android.material.snackbar.Snackbar;
import androidx.fragment.app.Fragment;

import app.template.extension.settings.AccentPresets;
import app.template.extension.settings.Prefs;
import app.template.extension.settings.SurfaceColors;

final class WatchViews {
    private WatchViews() {}

    static int resource(Context context, String type, String name) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }

    static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    static <T extends View> T find(View root, String id) {
        return root.findViewById(resource(root.getContext(), "id", id));
    }

    static View inflate(ViewGroup parent, String layout) {
        return LayoutInflater.from(parent.getContext()).inflate(
                resource(parent.getContext(), "layout", layout), parent, false);
    }

    static View row(ViewGroup parent, String title, String detail, Runnable action) {
        View row = inflate(parent, "item_text_row");
        TextView label = find(row, "leftLabel");
        label.setText(title);
        TextView description = find(row, "rightLabel");
        description.setText(detail);
        description.setVisibility(detail == null ? View.GONE : View.VISIBLE);
        ImageView chevron = find(row, "right_chevron");
        chevron.setVisibility(action == null ? View.GONE : View.VISIBLE);
        if (action != null) {
            row.setOnClickListener(v -> action.run());
            row.setFocusable(true);
        }
        return row;
    }

    static void rowIcon(View row, String drawable, String color, int insetDp) {
        Context context = row.getContext();
        ImageView icon = find(row, "ic_start_imageview");
        int image = resource(context, "drawable", drawable);
        if (icon == null || image == 0) return;
        icon.setImageResource(image);
        int inset = dp(context, insetDp);
        icon.setPadding(inset, inset, inset, inset);
        icon.setVisibility(View.VISIBLE);
        icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        icon.setContentDescription(null);
        int tint = resource(context, "color", color);
        if (tint != 0) icon.setImageTintList(ColorStateList.valueOf(context.getColor(tint)));
    }

    static TextView status(Context context) {
        TextView status = new TextView(context);
        status.setTextAppearance(resource(context, "style", "TextAppearance.Letterboxd.BodyMedium"));
        int padding = dp(context, 16);
        status.setPadding(padding, padding, padding, padding);
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        return status;
    }

    static MaterialAlertDialogBuilder dialog(Context context) {
        int overlay = resource(context, "style", "ThemeOverlay.Letterboxd.MaterialAlertDialog");
        MaterialAlertDialogBuilder builder = new MaterialAlertDialogBuilder(context, overlay);
        if (builder.getBackground() != null) builder.getBackground().mutate().setTint(SurfaceColors.elevated(context));
        return builder;
    }

    static void feedback(Fragment fragment, String message, boolean error) {
        View view = fragment.getView();
        if (view == null || !view.isAttachedToWindow()) return;
        Context context = view.getContext();
        int surface = SurfaceColors.elevated(context);
        int accent = AccentPresets.previewColor(context,
                Prefs.getString(Prefs.KEY_THEME_ACCENT, AccentPresets.defaultAccent(context)),
                Prefs.getString(Prefs.KEY_THEME_ACCENT_HEX, ""));
        int text = resource(context, "color", "textColorPrimary");
        int primary = text == 0 ? Color.WHITE : context.getColor(text);
        Snackbar bar = Snackbar.make(view, message, Snackbar.LENGTH_SHORT)
                .setBackgroundTint(surface)
                .setTextColor(AccentPresets.readableText(error ? primary : accent, surface));
        View navigation = fragment.requireActivity().findViewById(resource(context, "id", "bottom_navigation"));
        if (navigation != null && navigation.isShown()) bar.setAnchorView(navigation);
        bar.show();
    }
}
