package app.ckzombies.extension;

import android.content.Context;

/**
 * Android 11 and later no longer let an app create Android/data/&lt;package&gt;/ with a plain
 * mkdirs(); only the framework may. Asking for the directories makes it create them. The
 * engine unpacks its sounds under files/.cache/.media/ there and looks for file.big below the
 * same directory, so without this the game is silent.
 */
@SuppressWarnings("unused")
public final class ExternalStorage {

    private ExternalStorage() {
    }

    /** Called at the top of ZombSniper.onCreate(), before the engine starts. */
    public static void prepare(Context context) {
        try {
            context.getExternalFilesDir(null);
            context.getExternalCacheDir();
        } catch (Throwable ignored) {
            // Best effort. The engine copes with a missing directory; it only loses its sounds.
        }
    }
}
