package app.sqzass.patches.protonvpn;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.View;
import app.sqzass.extension.proton.AccentColor;
import app.sqzass.extension.proton.PatchesTheme;
import app.sqzass.extension.proton.SwitchStyle;

@SuppressWarnings("unused")
public final class ViewSwitchStyle {
    private ViewSwitchStyle() {}
    public static Drawable thumb(View view) {
        final Context context = view.getContext();
        return SwitchStyle.thumb(context, AccentColor.getAccentColor(PatchesTheme.isAppNightMode(context)));
    }
    public static Drawable track(View view) {
        final Context context = view.getContext();
        return SwitchStyle.track(context, AccentColor.getAccentColor(PatchesTheme.isAppNightMode(context)));
    }
}
