package app.noam.extension.blockblast;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;

import java.io.File;

/**
 * Ships with the mod loader. The game's hot updater downloads a new game version that the native
 * loader prefers from the writable patch folder at the next launch, which would replace the patched
 * boot script and silently remove every mod. This provider runs before Application.onCreate, so any
 * landed update is wiped before the engine reads its search paths; the patch folder itself and the
 * game's base-version markers in it stay, since the login checks them.
 */
public final class PatchGuardProvider extends ContentProvider {
    @Override
    public boolean onCreate() {
        Context context = getContext();
        if (context == null) return true;
        File files = context.getFilesDir();
        // Everything staged in patch/ goes, whatever its name (an update can ship files we have never
        // seen, like the second boot script main2.js); only the native side's install markers stay:
        // baseV and baseM, which the login checks, and baseTag, which the updater consumes to repair
        // data after an app install.
        File[] staged = new File(files, "patch").listFiles();
        if (staged != null) {
            for (File entry : staged) {
                String name = entry.getName();
                if (!name.equals("baseV") && !name.equals("baseM") && !name.equals("baseTag")) deleteRecursively(entry);
            }
        }
        deleteRecursively(new File(files, "patch_temp"));
        deleteRecursively(new File(files, "patch_check"));
        File[] entries = files.listFiles();
        if (entries != null) {
            for (File entry : entries) {
                if (entry.getName().startsWith("blockBlastHotUpdate_")) deleteRecursively(entry);
            }
        }
        return true;
    }

    private static void deleteRecursively(File file) {
        if (file == null || !file.exists()) return;
        File[] children = file.listFiles();
        if (children != null) {
            for (File child : children) deleteRecursively(child);
        }
        file.delete();
    }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
        return null;
    }

    @Override
    public String getType(Uri uri) {
        return null;
    }

    @Override
    public Uri insert(Uri uri, ContentValues values) {
        return null;
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        return 0;
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        return 0;
    }
}
