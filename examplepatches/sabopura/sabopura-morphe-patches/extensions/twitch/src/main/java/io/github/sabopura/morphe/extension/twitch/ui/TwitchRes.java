package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.content.res.Resources;

import java.util.HashMap;
import java.util.Map;

/** Twitch's resources keep the original package even when another patch renames the app. */
public final class TwitchRes {
    private static final Map<String, Integer> IDS = new HashMap<>();

    private TwitchRes() {
    }

    public static int id(Context context, String name, String type) {
        String key = type + '/' + name;
        synchronized (IDS) {
            Integer cached = IDS.get(key);
            if (cached != null) return cached;
        }
        Resources resources = context.getResources();
        int found = resources.getIdentifier(name, type, "tv.twitch.android.app");
        if (found == 0) found = resources.getIdentifier(name, type, context.getPackageName());
        synchronized (IDS) {
            IDS.put(key, found);
        }
        return found;
    }
}
