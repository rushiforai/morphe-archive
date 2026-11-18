package app.ckzombies.extension;

import android.content.Context;
import android.util.Log;

import java.io.File;
import java.io.FileInputStream;

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
 *
 * The sound cache folder is made here as well. The engine makes it by walking the path from
 * the root and giving up at the first folder it can neither stat() nor create, which on some
 * devices is one of the shared folders above its own. With no folder there is no cached sound,
 * and the engine then never asks for one to be played.
 *
 * The engine also used to create its cached sounds without a file mode, so on storage that
 * keeps the mode some of them came out unreadable, and those sounds were silent. The native
 * patch gives new files a mode; the files already there are checked here, once per start. The
 * engine does not repair a file it cannot read, but it writes a missing one again, so the
 * unreadable ones are deleted.
 */
@SuppressWarnings("unused")
public final class ExternalStorage {

    static final String TAG = "CKZSTORAGE";
    static final String SOUND_CACHE = ".cache/.media";

    /** Whether this app can open a file for reading. */
    interface Probe {
        boolean opens(File file);
    }

    static final Probe OPEN_AND_CLOSE = new Probe() {
        public boolean opens(File file) {
            try {
                new FileInputStream(file).close();
                return true;
            } catch (Exception e) {
                return false;
            }
        }
    };

    private ExternalStorage() {
    }

    /** Called at the top of ZombSniper.onCreate(), before the engine starts. */
    public static void prepare(Context context) {
        try {
            File files = context.getExternalFilesDir(null);
            context.getExternalCacheDir();
            askForObbDir(context);
            if (files != null) {
                int removed = removeUnreadable(soundCache(files), OPEN_AND_CLOSE);
                if (removed > 0) {
                    Log.i(TAG, "removed " + removed + " cached sounds that could not be read");
                }
            }
        } catch (Throwable ignored) {
            // Best effort. The engine copes with a missing directory; it only loses its sounds.
        }
    }

    /**
     * Asks for Android/obb/&lt;package&gt;/, see above. Older Android has no Context.getObbDir(),
     * and the extension is built for a newer minimum, so R8 drops any SDK_INT check around the
     * call. There the call throws; it is caught here so that what comes after it still runs.
     */
    static void askForObbDir(Context context) {
        try {
            context.getObbDir();
        } catch (Throwable ignored) {
            // Older Android: there is nothing to ask for.
        }
    }

    /** The folder the engine caches its sounds in, created if it is not there. */
    static File soundCache(File files) {
        File folder = new File(files, SOUND_CACHE);
        folder.mkdirs();
        return folder;
    }

    /** Deletes the files in a folder that cannot be opened, and returns how many it deleted. */
    static int removeUnreadable(File folder, Probe probe) {
        File[] files = folder.listFiles();
        if (files == null) {
            return 0;
        }
        int removed = 0;
        for (File file : files) {
            if (file.isFile() && !probe.opens(file) && file.delete()) {
                removed++;
            }
        }
        return removed;
    }
}
