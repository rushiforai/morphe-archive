package app.morphe.extension.sabp.ui;

import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.text.InputType;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.sabp.EppyBook;
import app.morphe.extension.sabp.EppyBookmarks;
import app.morphe.extension.sabp.EppyPlayer;

/**
 * Bookmarks of every book, from SABP's own bookmarks.sabp.xml files (shared with the classic
 * screens). The playing book first, with add, jump, rename, delete (with Undo) and share; then
 * other books with their bookmarks, which start that book at the bookmark.
 */
public final class BookmarksPage extends Page implements EppyBookmarks.Listener {
    public static final String KEY = "bookmarks";
    private final Handler main = new Handler(Looper.getMainLooper());
    private final LinearLayout current, others;
    private boolean loadingOthers;

    public BookmarksPage(Host host) {
        super(host, KEY, null, "Bookmarks", true);
        current = Ui.column(c);
        others = Ui.column(c);
        body.addView(current);
        body.addView(others);
        actions.addView(Ui.iconButton(c, t, EppyIcon.BOOKMARK_ADD, t.onSurface, 0, "Bookmark this moment", v -> host.bookmarkAction(0)));
        EppyBookmarks.get(c).addListener(this);
        build();
        loadOthers();
    }

    @Override
    public void onBookmarksChanged() {
        root.post(this::build);
    }

    @Override
    public void onRemoved() {
        EppyBookmarks.get(c).removeListener(this);
    }

    private void build() {
        current.removeAllViews();
        EppyPlayer p = host.player();
        EppyBook b = p.book();
        if (b == null) {
            current.addView(emptyState(EppyIcon.BOOKMARK, "No book playing", "Start a book to add bookmarks. Bookmarks of your other books are below.", null, null));
            return;
        }
        EppyBookmarks bm = EppyBookmarks.get(c);
        bm.sync(b.folderUri, false);
        List<EppyBook.BookmarkItem> items = new ArrayList<>(bm.items());
        TextView h = Ui.text(c, t, p.bookTitle() != null ? p.bookTitle() : "This book", 16, 650, t.onSurface);
        h.setPadding(Ui.dp(c, 4), Ui.dp(c, 12), 0, Ui.dp(c, 8));
        current.addView(h);
        LinearLayout box = Ui.column(c);
        box.setBackground(Ui.rounded(t.surfaceContainer, Ui.dp(c, 24)));
        box.setPadding(0, Ui.dp(c, 4), 0, Ui.dp(c, 4));
        current.addView(box);
        if (items.isEmpty()) {
            note(box, "No bookmarks in this book yet. Tap the bookmark button above, or Add bookmark in the player.");
        }
        for (EppyBook.BookmarkItem it : items) box.addView(row(b, it, items));
        LinearLayout acts = Ui.row(c);
        acts.setPadding(Ui.dp(c, 4), Ui.dp(c, 8), 0, 0);
        acts.addView(Ui.chip(c, t, EppyIcon.BOOKMARK_ADD, "Bookmark this moment", false, v -> host.bookmarkAction(0)));
        acts.addView(Ui.space(c, 8, 1));
        if (!items.isEmpty()) acts.addView(Ui.chip(c, t, EppyIcon.SHARE, "Share list", false, v -> share(b, items)));
        current.addView(acts);
    }

    private View row(EppyBook book, EppyBook.BookmarkItem it, List<EppyBook.BookmarkItem> all) {
        String title = it.title != null && !it.title.trim().isEmpty() ? it.title.trim() : "Bookmark";
        String sub = Ui.time(it.position * 1000L) + (it.fileName != null && book.files.size() > 1 ? " · " + it.fileName : "")
                + (it.description != null && !it.description.trim().isEmpty() ? "\n" + it.description.trim() : "");
        LinearLayout r = Ui.linkRow(c, t, EppyIcon.BOOKMARK, title, sub, v -> {
            Ui.haptic(v, t);
            host.player().jumpTo(it.fileName, it.position);
            Toast.makeText(c, "Playing from " + Ui.time(it.position * 1000L), Toast.LENGTH_SHORT).show();
        });
        r.addView(Ui.iconButton(c, t, EppyIcon.MORE, t.onSurfaceVariant, 0, "Options for " + title, v -> options(book, it, all)));
        r.setOnLongClickListener(v -> {
            options(book, it, all);
            return true;
        });
        return r;
    }

    private void options(EppyBook book, EppyBook.BookmarkItem it, List<EppyBook.BookmarkItem> all) {
        new Sheet(host.overlayRoot(), t, it.title != null && !it.title.isEmpty() ? it.title : "Bookmark")
                .item(EppyIcon.PLAY, "Play from here", Ui.time(it.position * 1000L), () -> host.player().jumpTo(it.fileName, it.position))
                .item(EppyIcon.EDIT, "Rename or add a note", null, () -> rename(book, it, all))
                .item(EppyIcon.DELETE, "Delete", null, () -> {
                    ArrayList<EppyBook.BookmarkItem> next = new ArrayList<>(all);
                    next.remove(it);
                    EppyBookmarks.get(c).save(book.folderUri, next, null);
                    host.showUndo("Bookmark deleted", () -> EppyBookmarks.get(c).save(book.folderUri, new ArrayList<>(all), null));
                })
                .show();
    }

    private void rename(EppyBook book, EppyBook.BookmarkItem it, List<EppyBook.BookmarkItem> all) {
        Sheet sh = new Sheet(host.overlayRoot(), t, "Rename bookmark");
        EditText name = field(it.title, "Title", false);
        EditText desc = field(it.description, "Note (optional)", true);
        sh.content().addView(name);
        sh.content().addView(desc);
        sh.item(EppyIcon.CHECK, "Save", null, () -> {
            ArrayList<EppyBook.BookmarkItem> next = new ArrayList<>();
            for (EppyBook.BookmarkItem b : all) {
                if (b != it) {
                    next.add(b);
                    continue;
                }
                EppyBook.BookmarkItem n = new EppyBook.BookmarkItem();
                n.title = name.getText().toString().trim();
                n.description = desc.getText().toString().trim();
                n.fileName = b.fileName;
                n.position = b.position;
                n.raw = null; // rebuilt as a new SABP Bookmark on save
                next.add(n);
            }
            EppyBookmarks.get(c).save(book.folderUri, next, null);
        });
        sh.show();
    }

    private EditText field(String value, String hint, boolean multi) {
        EditText e = new EditText(c);
        e.setText(value != null ? value : "");
        e.setHint(hint);
        e.setTextColor(t.onSurface);
        e.setHintTextColor(t.onSurfaceVariant);
        e.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES | (multi ? InputType.TYPE_TEXT_FLAG_MULTI_LINE : 0));
        e.setPadding(Ui.dp(c, 24), Ui.dp(c, 12), Ui.dp(c, 24), Ui.dp(c, 12));
        return e;
    }

    private void share(EppyBook book, List<EppyBook.BookmarkItem> items) {
        StringBuilder s = new StringBuilder();
        s.append(host.player().bookTitle() != null ? host.player().bookTitle() : book.folderName).append(" — bookmarks\n\n");
        for (EppyBook.BookmarkItem b : items) {
            s.append(Ui.time(b.position * 1000L));
            if (book.files.size() > 1 && b.fileName != null) s.append(" (").append(b.fileName).append(')');
            if (b.title != null && !b.title.isEmpty()) s.append("  ").append(b.title);
            if (b.description != null && !b.description.isEmpty()) s.append("\n    ").append(b.description);
            s.append('\n');
        }
        Intent i = new Intent(Intent.ACTION_SEND);
        i.setType("text/plain");
        i.putExtra(Intent.EXTRA_TEXT, s.toString());
        try {
            c.startActivity(Intent.createChooser(i, "Share bookmarks"));
        } catch (Throwable ignored) {
        }
    }

    /** Other books' bookmarks, read in the background from each book folder. */
    private void loadOthers() {
        if (loadingOthers) return;
        loadingOthers = true;
        EppyPlayer p = host.player();
        List<EppyPlayer.Book> books = p.allBooks();
        String cur = p.currentFolderUri();
        new Thread(() -> {
            ArrayList<Object[]> found = new ArrayList<>();
            for (EppyPlayer.Book b : books) {
                if (b.folderUri.equals(cur)) continue;
                List<EppyBook.BookmarkItem> l = EppyBook.bookmarks(c, b.folderUri);
                if (!l.isEmpty()) found.add(new Object[]{b, l});
            }
            main.post(() -> {
                loadingOthers = false;
                others.removeAllViews();
                if (found.isEmpty()) return;
                TextView h = Ui.text(c, t, "Other books", 14, 600, t.primary);
                h.setPadding(Ui.dp(c, 4), Ui.dp(c, 24), 0, Ui.dp(c, 8));
                others.addView(h);
                for (Object[] f : found) {
                    EppyPlayer.Book b = (EppyPlayer.Book) f[0];
                    @SuppressWarnings("unchecked") List<EppyBook.BookmarkItem> l = (List<EppyBook.BookmarkItem>) f[1];
                    LinearLayout box = Ui.column(c);
                    box.setBackground(Ui.rounded(t.surfaceContainer, Ui.dp(c, 24)));
                    box.setPadding(0, Ui.dp(c, 4), 0, Ui.dp(c, 4));
                    TextView bt = Ui.text(c, t, b.title, 15, 600, t.onSurface);
                    bt.setPadding(Ui.dp(c, 16), Ui.dp(c, 8), Ui.dp(c, 16), Ui.dp(c, 4));
                    box.addView(bt);
                    for (EppyBook.BookmarkItem it : l) {
                        String title = it.title != null && !it.title.trim().isEmpty() ? it.title.trim() : "Bookmark";
                        box.addView(Ui.linkRow(c, t, EppyIcon.BOOKMARK, title, Ui.time(it.position * 1000L), v -> playAt(b, it)));
                    }
                    LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    lp.bottomMargin = Ui.dp(c, 12);
                    others.addView(box, lp);
                }
            });
        }, "eppy-all-bookmarks").start();
    }

    /** Starts another book and jumps to the bookmark once SABP has switched to it. */
    private void playAt(EppyPlayer.Book b, EppyBook.BookmarkItem it) {
        EppyPlayer p = host.player();
        p.playBook(b);
        Toast.makeText(c, "Opening " + b.title + "…", Toast.LENGTH_SHORT).show();
        final long until = android.os.SystemClock.elapsedRealtime() + 8000;
        main.postDelayed(new Runnable() {
            @Override
            public void run() {
                if (b.folderUri.equals(p.currentFolderUri())) {
                    p.jumpTo(it.fileName, it.position);
                    build();
                    loadOthers();
                } else if (android.os.SystemClock.elapsedRealtime() < until) {
                    main.postDelayed(this, 300);
                }
            }
        }, 600);
    }
}
