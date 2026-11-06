package dev.twitchpatches.extension.settings;

import android.content.Context;
import android.view.View;

final class TwitchSettingsResources {
    private TwitchSettingsResources() { }

    static int resource(Context context, String type, String name) {
        int resource = context.getResources().getIdentifier(name, type, context.getPackageName());
        if (resource == 0) throw new IllegalStateException("Twitch settings resource missing: " + type + "/" + name);
        return resource;
    }

    static int color(Context context, String name) { return context.getColor(resource(context, "color", name)); }

    static int spacing(Context context, String name) {
        return context.getResources().getDimensionPixelSize(resource(context, "dimen", name));
    }

    static <T extends View> T view(View root, String name, Class<T> type) {
        View view = root.findViewById(resource(root.getContext(), "id", name));
        if (!type.isInstance(view)) throw new IllegalStateException("Twitch settings view has changed: " + name);
        return type.cast(view);
    }
}
