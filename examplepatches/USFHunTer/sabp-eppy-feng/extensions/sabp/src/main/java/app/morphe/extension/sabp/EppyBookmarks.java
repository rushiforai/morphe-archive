package app.morphe.extension.sabp;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Bookmark state for the playing book, always read from (and written to) SABP's own
 * bookmarks.sabp.xml so the Eppy UI and the classic screens agree.
 *
 * <p>"Bookmarked" means a saved bookmark exists in the current file within ±3 s of the current
 * position. Adding never creates a duplicate inside that window.
 */
public final class EppyBookmarks {
    public interface Listener {
        void onBookmarksChanged();
    }

    public static final int TOLERANCE_SECONDS = 3;
    private static EppyBookmarks instance;

    public static EppyBookmarks get(Context c) {
        if (instance == null) instance = new EppyBookmarks(c.getApplicationContext());
        return instance;
    }

    private final Context c;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Set<Listener> listeners = Collections.newSetFromMap(new WeakHashMap<>());
    private String folder;
    private List<EppyBook.BookmarkItem> items = new ArrayList<>();
    private boolean loading, saving;

    private EppyBookmarks(Context c) {
        this.c = c;
    }

    public void addListener(Listener l) {
        if (!listeners.contains(l)) listeners.add(l);
    }

    public void removeListener(Listener l) {
        listeners.remove(l);
    }

    private void changed() {
        main.post(() -> {
            for (Listener l : new ArrayList<>(listeners)) l.onBookmarksChanged();
        });
    }

    public List<EppyBook.BookmarkItem> items() {
        return items;
    }

    /** Loads bookmarks if the book changed (or force). */
    public void sync(String folderUri, boolean force) {
        if (folderUri == null) return;
        if (!force && folderUri.equals(folder)) return;
        if (loading) return;
        loading = true;
        final String f = folderUri;
        new Thread(() -> {
            List<EppyBook.BookmarkItem> loaded = EppyBook.bookmarks(c, f);
            main.post(() -> {
                loading = false;
                folder = f;
                items = loaded;
                changed();
            });
        }, "eppy-bookmarks").start();
    }

    /** The bookmark at this position, or null. */
    public EppyBook.BookmarkItem at(String folderUri, String file, double filePos) {
        if (folderUri == null || !folderUri.equals(folder) || file == null || filePos < 0) return null;
        for (EppyBook.BookmarkItem b : items) {
            if (file.equals(b.fileName) && Math.abs(b.position - filePos) <= TOLERANCE_SECONDS) return b;
        }
        return null;
    }

    public boolean isSaving() {
        return saving;
    }

    /**
     * Adds a bookmark at (file, position) unless one is already there, in which case it is
     * removed. Returns immediately; listeners fire when the file is saved.
     *
     * @return true if the result is "bookmarked"
     */
    public boolean toggle(String folderUri, String file, int position, String title, Runnable onSaved) {
        if (folderUri == null || file == null || position < 0) return false;
        if (!folderUri.equals(folder)) {
            // Never decide add-vs-remove from another book's (or no) data: read the file now.
            items = EppyBook.bookmarks(c, folderUri);
            folder = folderUri;
        }
        ArrayList<EppyBook.BookmarkItem> next = new ArrayList<>(items);
        EppyBook.BookmarkItem existing = at(folderUri, file, position);
        boolean adding = existing == null;
        if (adding) {
            EppyBook.BookmarkItem b = new EppyBook.BookmarkItem();
            b.title = title != null ? title : "";
            b.description = "";
            b.fileName = file;
            b.position = position;
            try {
                b.raw = EppyBook.newBookmark(b);
            } catch (Throwable t) {
                return false;
            }
            next.add(b);
        } else {
            ArrayList<EppyBook.BookmarkItem> drop = new ArrayList<>();
            for (EppyBook.BookmarkItem b : next) {
                if (file.equals(b.fileName) && Math.abs(b.position - position) <= TOLERANCE_SECONDS) drop.add(b);
            }
            next.removeAll(drop);
        }
        save(folderUri, next, onSaved);
        return adding;
    }

    public void save(String folderUri, List<EppyBook.BookmarkItem> next, Runnable onSaved) {
        items = next;
        folder = folderUri;
        saving = true;
        changed();
        new Thread(() -> {
            boolean ok = EppyBook.saveBookmarks(c, folderUri, next);
            List<EppyBook.BookmarkItem> reloaded = EppyBook.bookmarks(c, folderUri);
            main.post(() -> {
                saving = false;
                if (ok) items = reloaded;
                changed();
                if (onSaved != null) onSaved.run();
            });
        }, "eppy-bookmarks-save").start();
    }
}
