package app.voidhack.extension.applemusic.library;

import android.app.Activity;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public final class MetadataRepairSettings {
    private static WeakReference<Activity> owner = new WeakReference<>(null);

    private MetadataRepairSettings() {}

    public static void attach(Object fragment) {
        try { owner = new WeakReference<>((Activity) MusicReflection.call(fragment, "getActivity")); }
        catch (ReflectiveOperationException | RuntimeException exception) {
            Log.w("AppleMusicMetadata", "Could not attach metadata settings", exception);
        }
    }

    public static List<?> withRepair(List<?> items) {
        WeakReference<Activity> reference = owner;
        Activity activity = reference.get();
        if (activity == null || activity.isFinishing()) return items;
        try {
            Object callback = MusicReflection.action(() -> {
                Activity current = reference.get();
                if (current != null && !current.isFinishing()) MetadataRepair.open(current);
            });
            Object action = MusicReflection.create("com.apple.android.music.settings2.model.b$b$b",
                    MetadataStrings.text(activity, "scan_action"), null, false, null, null, callback, 382);
            Object category = MusicReflection.create("com.apple.android.music.settings2.model.b$a",
                    MetadataStrings.text(activity, "title"), Collections.singletonList(action), null, 58);
            List<Object> result = new ArrayList<>(items);
            result.add(Math.min(1, result.size()), category);
            return result;
        } catch (ReflectiveOperationException | RuntimeException exception) {
            Log.w("AppleMusicMetadata", "Could not create metadata settings", exception);
            return items;
        }
    }
}
