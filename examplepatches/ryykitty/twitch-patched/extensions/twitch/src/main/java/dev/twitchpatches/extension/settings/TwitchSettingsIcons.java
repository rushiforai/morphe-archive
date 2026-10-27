package dev.twitchpatches.extension.settings;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;

final class TwitchSettingsIcons {
    private TwitchSettingsIcons() { }

    static Drawable drawable(Context context, String name) {
        int id = context.getResources().getIdentifier(name, "drawable", context.getPackageName());
        if (id == 0) id = TwitchSettingsResources.resource(context, "drawable", "ic_settings");
        Drawable drawable = context.getDrawable(id);
        if (drawable != null) {
            drawable = drawable.mutate();
            drawable.setTint(TwitchSettingsResources.color(context, "text_alt_2"));
        }
        return drawable;
    }

    static void decorate(View row, SettingEntry option, boolean navigation) {
        Context context = row.getContext();
        row.setMinimumHeight(Math.round(56 * context.getResources().getDisplayMetrics().density));
        if (!navigation) return;
        ViewGroup root = TwitchSettingsResources.view(row, "menu_item_root_view", ViewGroup.class);
        int size = Math.round(24 * context.getResources().getDisplayMetrics().density);
        int gap = TwitchSettingsResources.spacing(context, "space_16");
        ImageView leading = icon(context, option.icon());
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(size, size);
        params.gravity = android.view.Gravity.CENTER_VERTICAL;
        params.setMarginEnd(gap);
        root.addView(leading, 0, params);
        ImageView arrow = icon(context, "ic_arrow_right");
        LinearLayout.LayoutParams arrowParams = new LinearLayout.LayoutParams(size, size);
        arrowParams.gravity = android.view.Gravity.CENTER_VERTICAL;
        arrowParams.setMarginStart(gap);
        root.addView(arrow, arrowParams);
    }

    private static ImageView icon(Context context, String name) {
        ImageView image = new ImageView(context);
        image.setImageDrawable(drawable(context, name));
        image.setScaleType(ImageView.ScaleType.FIT_CENTER);
        image.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        return image;
    }
}
