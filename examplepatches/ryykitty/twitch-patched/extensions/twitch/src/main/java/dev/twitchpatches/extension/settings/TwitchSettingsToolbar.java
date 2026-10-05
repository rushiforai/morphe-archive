package dev.twitchpatches.extension.settings;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toolbar;

final class TwitchSettingsToolbar {
    private TwitchSettingsToolbar() { }

    static Toolbar create(Context context, Runnable close) {
        Toolbar toolbar = new Toolbar(context);
        int foreground = TwitchSettingsResources.color(context, "text_base");
        toolbar.setTitle("Patch settings");
        toolbar.setTitleTextAppearance(context, TwitchSettingsResources.resource(context, "style", "Theme.Twitch.ToolBarTitle"));
        toolbar.setTitleTextColor(foreground);
        toolbar.setBackgroundColor(TwitchSettingsResources.color(context, "background_body"));
        int height = Math.round(56 * context.getResources().getDisplayMetrics().density);
        int inset = TwitchSettingsResources.spacing(context, "space_16");
        toolbar.setMinimumHeight(height);
        toolbar.setContentInsetsRelative(inset, inset);
        toolbar.setContentInsetStartWithNavigation(height + inset);
        Drawable icon = context.getDrawable(TwitchSettingsResources.resource(context, "drawable", "ic_arrow_left"));
        if (icon != null) {
            icon = icon.mutate();
            icon.setTint(foreground);
            toolbar.setNavigationIcon(icon);
        }
        toolbar.setNavigationContentDescription("Back");
        toolbar.setNavigationOnClickListener(view -> close.run());
        for (int index = 0; index < toolbar.getChildCount(); index++) {
            View child = toolbar.getChildAt(index);
            if (child instanceof TextView) {
                ((TextView) child).setTypeface(context.getResources().getFont(
                        TwitchSettingsResources.resource(context, "font", "roobert_semibold")));
            }
            if (child instanceof ImageButton) {
                ViewGroup.LayoutParams params = child.getLayoutParams();
                params.width = height;
                params.height = params.width;
                child.setLayoutParams(params);
            }
        }
        return toolbar;
    }
}
