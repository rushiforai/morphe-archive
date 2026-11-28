package app.morphe.extension.sabp;

import android.app.Activity;
import android.app.Service;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;

import java.io.File;

/**
 * Opening SABP's library, and rebuilding it. SABP keeps its book list in BooksDatabase_v6; its player
 * service and its library screen each load their own copy. SABP's own player stops the service before
 * the library opens (so the library's changes aren't overwritten later), and eppy does the same.
 * A rebuild also deletes the saved list, so the library starts empty and its Full scan adds every book
 * as new: SABP then reads each book's position.sabp.dat, and bookmarks and characters are files in the
 * book folders, so those come back. Per-book settings, date added and finished marks don't.
 */
public final class LibraryRebuild {
    static final String EXTRA = "eppyRebuildLibrary";
    static final String[] DATABASE = {"BooksDatabase_v6", "BooksDatabase_copy_v6"};

    private LibraryRebuild() {
    }

    /** True when the patch found both SABP calls a rebuild needs. */
    public static boolean available() {
        return EppyBridge.has("exitService") && EppyBridge.has("fullScan");
    }

    /** Before SABP's library opens: pause, save the book list and stop the player service, as SABP's player does. */
    public static void stopPlayerService() {
        Service s = EppyBridge.getPlayerService();
        if (s == null || !EppyBridge.has("exitService")) return;
        try {
            EppyBridge.exitPlayerService(s);
        } catch (Throwable t) {
            EppyDiag.error("library", "stopping the player service failed: " + t);
        }
    }

    /** Clears SABP's book list and opens its library, which then runs its Full scan. */
    public static void start(Activity a) {
        stopPlayerService();
        int deleted = clearDatabase(a.getFilesDir());
        EppyDiag.log("library", "rebuild: cleared SABP's book list (" + deleted + " files), opening its Full scan");
        a.startActivity(EppyBridge.activityIntent(a, EppyBridge.LIBRARY_ACTIVITY).putExtra(EXTRA, true));
    }

    /** Deletes SABP's saved book list and its backup copy; returns how many files were deleted. */
    static int clearDatabase(File filesDir) {
        int n = 0;
        for (String name : DATABASE) if (new File(filesDir, name).delete()) n++;
        return n;
    }

    /**
     * Injected into SABP's folder lister: a folder whose name starts with a dot (Syncthing's .stversions and
     * .stfolder, a file manager's .trash) is skipped, so old copies kept there never show up as books.
     */
    public static boolean isHiddenFolder(String name) {
        return name != null && name.startsWith(".");
    }

    /** Injected at the start of SABP's LibraryActivity.onCreate: runs the Full scan a rebuild asked for. */
    public static void onLibraryCreated(Activity a, Bundle saved) {
        if (!wantsScan(a.getIntent(), saved)) return;
        // After onCreate/onStart/onResume, so the scan's progress dialog has a window.
        new Handler(Looper.getMainLooper()).post(() -> {
            if (a.isFinishing()) return;
            try {
                EppyBridge.fullScan(a);
            } catch (Throwable t) {
                EppyDiag.error("library", "Full scan failed to start: " + t);
            }
        });
    }

    /** Only the first creation: not again when the screen is recreated (rotation) or reopened from recents. */
    static boolean wantsScan(Intent i, Bundle saved) {
        return saved == null && i != null && i.getBooleanExtra(EXTRA, false)
                && (i.getFlags() & Intent.FLAG_ACTIVITY_LAUNCHED_FROM_HISTORY) == 0;
    }
}
