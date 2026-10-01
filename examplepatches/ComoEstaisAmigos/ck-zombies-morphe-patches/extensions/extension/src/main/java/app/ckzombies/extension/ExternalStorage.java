package app.ckzombies.extension;

import android.content.Context;
import android.os.Build;

/**
 * Android 11 and later no longer let an app create Android/data/&lt;package&gt;/ with a plain
 * mkdirs(); only the framework may. Asking for the directories makes it create them. The
 * engine unpacks its sounds under files/.cache/.media/ there and looks for file.big below the
 * same directory, so without this the game is silent.
 *
 * The same holds for Android/obb/&lt;package&gt;/, where the game looks for its OBB. The game never
 * asks for that directory, so it is only there if the player made it, usually with a file
 * manager, and then it belongs to the file manager and the game may not be allowed to read it.
 * Asking for it makes the framework create it for the game when it is missing, and hand it and
 * everything in it back to the game when the game cannot write to it (ContextImpl calls
 * StorageManager.fixupAppDir() in that case).
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
            if (Build.VERSION.SDK_INT >= 11) {
                context.getObbDir();
            }
        } catch (Throwable ignored) {
            // Best effort. The engine copes with a missing directory; it only loses its sounds.
        }
    }
}
