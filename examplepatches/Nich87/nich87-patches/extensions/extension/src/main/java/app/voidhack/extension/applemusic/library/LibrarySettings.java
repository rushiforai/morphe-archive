package app.voidhack.extension.applemusic.library;

import android.app.Activity;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

public final class LibrarySettings {
    private static WeakReference<Activity> owner = new WeakReference<>(null);

    private LibrarySettings() {}

    public static void attach(Object fragment) {
        try { owner = new WeakReference<>((Activity) MusicReflection.call(fragment, "getActivity")); }
        catch (ReflectiveOperationException | RuntimeException exception) {
            Log.w("AppleMusicLibraryTools", "Could not attach library settings", exception);
        }
    }

    public static List<?> withTools(List<?> items) {
        WeakReference<Activity> reference = owner;
        Activity activity = reference.get();
        if (activity == null || activity.isFinishing()) return items;
        try {
            List<Object> actions = new ArrayList<>();
            String[] labels = {"export_all", "export_playlists", "import_backup"};
            for (int i = 0; i < labels.length; i++) {
                final int index = i;
                Object callback = MusicReflection.action(() -> {
                    Activity current = reference.get();
                    if (current != null && !current.isFinishing()) LibraryTools.open(current, index);
                });
                actions.add(MusicReflection.create("com.apple.android.music.settings2.model.b$b$b",
                        LibraryStrings.text(activity, labels[i]), null, false, null, null, callback, 382));
            }
            Object category = MusicReflection.create("com.apple.android.music.settings2.model.b$a",
                    LibraryStrings.text(activity, "title"), actions, null, 58);
            List<Object> result = new ArrayList<>(items);
            result.add(Math.min(1, result.size()), category);
            return result;
        } catch (ReflectiveOperationException | RuntimeException exception) {
            Log.w("AppleMusicLibraryTools", "Could not create library settings", exception);
            return items;
        }
    }
}
