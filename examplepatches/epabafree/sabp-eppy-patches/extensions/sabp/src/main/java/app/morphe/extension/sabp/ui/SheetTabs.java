package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.sabp.EppyBook;
import app.morphe.extension.sabp.EppyBridge;
import app.morphe.extension.sabp.EppyPlayer;
import app.morphe.extension.sabp.EppyTheme;
import app.morphe.extension.sabp.read.BookText;
import app.morphe.extension.sabp.read.ReadAlong;
import app.morphe.extension.sabp.read.SpeechSync;

/** The Chapters, Bookmarks, Details and Up next tabs of the player sheet. */
public final class SheetTabs {
    private SheetTabs() {
    }

    static ListView list(Context c) {
        ListView lv = new ListView(c);
        lv.setDivider(null);
        lv.setSelector(new android.graphics.drawable.ColorDrawable(0));
        lv.setClipToPadding(false);
        lv.setPadding(Ui.dp(c, 12), 0, Ui.dp(c, 12), Ui.dp(c, 24));
        lv.setVerticalScrollBarEnabled(true);
        return lv;
    }

    static TextView emptyText(Context c, EppyTheme t, String s) {
        TextView tv = Ui.text(c, t, s, 15, 400, t.onSurfaceVariant);
        tv.setGravity(Gravity.CENTER);
        tv.setPadding(Ui.dp(c, 32), Ui.dp(c, 32), Ui.dp(c, 32), Ui.dp(c, 32));
        return tv;
    }

    static String clock(int seconds) {
        return seconds < 0 ? "–" : Ui.time(seconds * 1000L);
    }

    // ---- Chapters ---------------------------------------------------------------------------------

    /** Native chapter list: embedded chapters (m4b/cue) or one entry per file. */
    public static final class Chapters implements PlayerSheet.Tab {
        private final Host host;
        private final Context c;
        private final EppyTheme t;
        private final FrameLayout root;
        private final ListView list;
        private final TextView header;
        private EppyBook book;
        private int currentIndex = -1;
        private double bookPos = -1, filePos = -1;
        private boolean scrolled;

        public Chapters(Host host, EppyTheme t) {
            this.host = host;
            this.c = host.activity();
            this.t = t;
            root = new FrameLayout(c);
            LinearLayout col = Ui.column(c);
            header = Ui.text(c, t, "", 13, 500, t.onSurfaceVariant);
            header.setPadding(Ui.dp(c, 24), Ui.dp(c, 4), Ui.dp(c, 24), Ui.dp(c, 8));
            col.addView(header);
            list = list(c);
            list.setAdapter(adapter);
            list.setOnItemClickListener((p, v, pos, id) -> {
                EppyBook.ChapterItem ch = book.chapters.get(pos);
                Ui.haptic(v, t);
                if (!host.player().jumpTo(ch.fileName, ch.positionInFile)) {
                    Toast.makeText(c, "Couldn't jump: player not ready", Toast.LENGTH_SHORT).show();
                }
            });
            col.addView(list, Ui.lp(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
            root.addView(col);
        }

        @Override
        public View view() {
            scrolled = false;
            return root;
        }

        @Override
        public void refresh(boolean full) {
            EppyPlayer p = host.player();
            if (full) p.invalidateBook();
            EppyBook b = p.book();
            filePos = p.filePositionSeconds();
            bookPos = p.bookPositionSeconds();
            if (b == null) {
                header.setText("Start a book to see its chapters.");
                book = null;
                adapter.notifyDataSetChanged();
                return;
            }
            boolean changed = book != b;
            book = b;
            int idx = b.chapterIndexAt((int) bookPos, (int) filePos);
            if (changed || idx != currentIndex || full) {
                currentIndex = idx;
                header.setText(b.chapters.size() + (b.embeddedChapters ? " chapters" : (b.chapters.size() == 1 ? " file" : " files"))
                        + (b.total > 0 ? " · " + Ui.duration(b.total) : ""));
                adapter.notifyDataSetChanged();
                if (!scrolled && idx >= 0) {
                    list.setSelectionFromTop(idx, Ui.dp(c, 96));
                    scrolled = true;
                }
            } else {
                // Progress bar of the current row only.
                int first = list.getFirstVisiblePosition();
                View row = list.getChildAt(currentIndex - first);
                if (row != null) bindProgress(row, b.chapters.get(currentIndex));
            }
        }

        private void bindProgress(View row, EppyBook.ChapterItem ch) {
            View bar = row.findViewWithTag("bar");
            if (bar == null) return;
            double into = ch.start >= 0 && bookPos >= 0 ? bookPos - ch.start : filePos - ch.positionInFile;
            float f = ch.length > 0 ? (float) Math.max(0, Math.min(1, into / ch.length)) : 0f;
            bar.setPivotX(0);
            bar.setScaleX(f);
        }

        private final BaseAdapter adapter = new BaseAdapter() {
            public int getCount() {
                return book != null ? book.chapters.size() : 0;
            }

            public Object getItem(int i) {
                return book.chapters.get(i);
            }

            public long getItemId(int i) {
                return i;
            }

            public View getView(int i, View convert, ViewGroup parent) {
                EppyBook.ChapterItem ch = book.chapters.get(i);
                boolean cur = i == currentIndex;
                FrameLayout cell = new FrameLayout(c);
                LinearLayout row = Ui.row(c);
                row.setMinimumHeight(Ui.dp(c, 60));
                row.setPadding(Ui.dp(c, 12), Ui.dp(c, 8), Ui.dp(c, 16), Ui.dp(c, 8));
                cell.setBackground(Ui.ripple(t, Ui.rounded(cur ? t.secondaryContainer : 0, Ui.dp(c, 16)), Ui.dp(c, 16)));
                FrameLayout lead = new FrameLayout(c);
                if (cur) {
                    ImageView iv = new ImageView(c);
                    iv.setImageDrawable(new EppyIcon(host.player().isPlaying() ? EppyIcon.PLAY : EppyIcon.PAUSE, t.onSecondaryContainer));
                    lead.addView(iv, new FrameLayout.LayoutParams(Ui.dp(c, 18), Ui.dp(c, 18), Gravity.CENTER));
                } else {
                    TextView num = Ui.text(c, t, String.valueOf(i + 1), 13, 500, t.onSurfaceVariant);
                    num.setGravity(Gravity.CENTER);
                    lead.addView(num, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
                }
                row.addView(lead, new LinearLayout.LayoutParams(Ui.dp(c, 36), Ui.dp(c, 36)));
                LinearLayout texts = Ui.column(c);
                texts.setPadding(Ui.dp(c, 12), 0, Ui.dp(c, 8), 0);
                TextView title = Ui.singleLine(Ui.text(c, t, ch.title != null ? ch.title : "", 15, cur ? 650 : 500,
                        cur ? t.onSecondaryContainer : t.onSurface));
                texts.addView(title);
                if (book.embeddedChapters && book.files.size() > 1) {
                    TextView sub = Ui.singleLine(Ui.text(c, t, EppyBook.lastSegment(ch.fileName), 12, 400, t.onSurfaceVariant));
                    sub.setPadding(0, Ui.dp(c, 3), 0, 0);
                    texts.addView(sub);
                }
                row.addView(texts, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
                TextView len = Ui.text(c, t, clock(ch.length), 13, 500, cur ? t.onSecondaryContainer : t.onSurfaceVariant);
                row.addView(len);
                cell.addView(row);
                if (cur) {
                    View bar = new View(c);
                    bar.setTag("bar");
                    bar.setBackgroundColor(t.progressColor);
                    FrameLayout.LayoutParams bl = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Ui.dp(c, 3), Gravity.BOTTOM);
                    bl.setMargins(Ui.dp(c, 16), 0, Ui.dp(c, 16), Ui.dp(c, 4));
                    cell.addView(bar, bl);
                    bindProgress(cell, ch);
                }
                cell.setContentDescription((cur ? "Now playing: " : "Chapter " + (i + 1) + ": ") + ch.title
                        + (ch.length > 0 ? ", " + Ui.duration(ch.length) : ""));
                return cell;
            }
        };
    }

    // ---- Bookmarks ------------------------------------------------------------------------------

    /** Bookmarks from SABP's bookmarks.sabp.xml, with jump, delete (undo) and add. */
    public static final class Bookmarks implements PlayerSheet.Tab, app.morphe.extension.sabp.EppyBookmarks.Listener {
        private final Host host;
        private final Context c;
        private final EppyTheme t;
        private final LinearLayout root;
        private final ListView list;
        private final TextView empty;
        private List<EppyBook.BookmarkItem> items = new ArrayList<>();
        private EppyBook book;

        public Bookmarks(Host host, EppyTheme t) {
            this.host = host;
            this.c = host.activity();
            this.t = t;
            root = Ui.column(c);
            LinearLayout actions = Ui.row(c);
            actions.setPadding(Ui.dp(c, 16), 0, Ui.dp(c, 16), Ui.dp(c, 8));
            actions.addView(Ui.chip(c, t, EppyIcon.BOOKMARK_ADD, "Bookmark this moment", false, v -> host.bookmarkAction(0)));
            actions.addView(Ui.space(c, 8, 1));
            actions.addView(Ui.chip(c, t, EppyIcon.LIST, "Bookmark chapter start", false, v -> host.bookmarkAction(1)));
            android.widget.HorizontalScrollView hs = new android.widget.HorizontalScrollView(c);
            hs.setHorizontalScrollBarEnabled(false);
            hs.addView(actions);
            root.addView(hs);
            empty = emptyText(c, t, "No bookmarks yet. Bookmarks added here or in the classic player show up in both.");
            root.addView(empty);
            list = list(c);
            list.setAdapter(adapter);
            list.setOnItemClickListener((p, v, pos, id) -> {
                EppyBook.BookmarkItem b = items.get(pos);
                Ui.haptic(v, t);
                host.player().jumpTo(b.fileName, b.position);
            });
            root.addView(list, Ui.lp(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
            app.morphe.extension.sabp.EppyBookmarks.get(c).addListener(this);
        }

        @Override
        public View view() {
            return root;
        }

        @Override
        public void onBookmarksChanged() {
            refresh(true);
        }

        @Override
        public void refresh(boolean full) {
            if (!full) return;
            book = host.player().book();
            app.morphe.extension.sabp.EppyBookmarks bm = app.morphe.extension.sabp.EppyBookmarks.get(c);
            if (book == null) {
                items = new ArrayList<>();
            } else {
                bm.sync(book.folderUri, false);
                items = new ArrayList<>(bm.items());
                final EppyBook b = book;
                java.util.Collections.sort(items, (x, y) -> Integer.compare(order(b, x), order(b, y)));
            }
            empty.setVisibility(items.isEmpty() ? View.VISIBLE : View.GONE);
            adapter.notifyDataSetChanged();
        }

        private static int order(EppyBook b, EppyBook.BookmarkItem x) {
            EppyBook.FileItem f = b.file(x.fileName);
            int idx = b.files.indexOf(f);
            return f != null && f.start >= 0 ? f.start + x.position : idx * 100000 + x.position;
        }

        private void delete(EppyBook.BookmarkItem target) {
            if (book == null) return;
            app.morphe.extension.sabp.EppyBookmarks bm = app.morphe.extension.sabp.EppyBookmarks.get(c);
            final List<EppyBook.BookmarkItem> before = new ArrayList<>(bm.items());
            final List<EppyBook.BookmarkItem> after = new ArrayList<>(before);
            after.remove(target);
            final String folder = book.folderUri;
            bm.save(folder, after, () -> host.showUndo("Bookmark removed", () -> bm.save(folder, before, null)));
        }

        private final BaseAdapter adapter = new BaseAdapter() {
            public int getCount() {
                return items.size();
            }

            public Object getItem(int i) {
                return items.get(i);
            }

            public long getItemId(int i) {
                return i;
            }

            public View getView(int i, View convert, ViewGroup parent) {
                EppyBook.BookmarkItem b = items.get(i);
                LinearLayout row = Ui.row(c);
                row.setMinimumHeight(Ui.dp(c, 64));
                row.setPadding(Ui.dp(c, 16), Ui.dp(c, 8), Ui.dp(c, 4), Ui.dp(c, 8));
                row.setBackground(Ui.ripple(t, null, Ui.dp(c, 16)));
                ImageView iv = new ImageView(c);
                iv.setImageDrawable(new EppyIcon(EppyIcon.BOOKMARK, t.primary));
                row.addView(iv, new LinearLayout.LayoutParams(Ui.dp(c, 22), Ui.dp(c, 22)));
                LinearLayout texts = Ui.column(c);
                texts.setPadding(Ui.dp(c, 16), 0, Ui.dp(c, 8), 0);
                String title = b.title != null && !b.title.trim().isEmpty() ? b.title.trim() : EppyBook.lastSegment(b.fileName);
                texts.addView(Ui.singleLine(Ui.text(c, t, title, 15, 550, t.onSurface)));
                String sub = Ui.time(b.position * 1000L) + " · " + EppyBook.lastSegment(b.fileName);
                if (b.description != null && !b.description.trim().isEmpty()) sub = b.description.trim() + "\n" + sub;
                TextView s = Ui.text(c, t, sub, 12, 400, t.onSurfaceVariant);
                s.setMaxLines(3);
                s.setPadding(0, Ui.dp(c, 4), 0, 0);
                texts.addView(s);
                row.addView(texts, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
                row.addView(Ui.iconButton(c, t, EppyIcon.CLOSE, t.onSurfaceVariant, 0, "Remove bookmark " + title, v -> delete(b)));
                row.setContentDescription("Bookmark " + title + " at " + Ui.time(b.position * 1000L) + ". Double-tap to jump.");
                return row;
            }
        };
    }

    // ---- Details ------------------------------------------------------------------------------

    /** What we know about the book, each item labelled with where it came from. */
    public static final class Details implements PlayerSheet.Tab {
        private final Host host;
        private final Context c;
        private final EppyTheme t;
        private final ScrollView root;
        private final LinearLayout col;
        private String loadedFor;

        public Details(Host host, EppyTheme t) {
            this.host = host;
            this.c = host.activity();
            this.t = t;
            root = new ScrollView(c);
            col = Ui.column(c);
            col.setPadding(Ui.dp(c, 24), Ui.dp(c, 4), Ui.dp(c, 24), Ui.dp(c, 32));
            root.addView(col);
        }

        @Override
        public View view() {
            return root;
        }

        @Override
        public void refresh(boolean full) {
            if (!full) return;
            EppyPlayer p = host.player();
            EppyBook b = p.book();
            col.removeAllViews();
            if (b == null) {
                col.addView(emptyText(c, t, "Start a book to see its details."));
                return;
            }
            TextView title = Ui.text(c, t, p.bookTitle() != null ? p.bookTitle() : b.folderName, 22, 650, t.onSurface);
            col.addView(title);
            ReadAlong ra = ReadAlong.get(c);
            BookText text = ra.text();
            if (text != null && text.author != null && !text.author.isEmpty()) {
                TextView by = Ui.text(c, t, "by " + text.author, 15, 500, t.onSurfaceVariant);
                by.setPadding(0, Ui.dp(c, 6), 0, 0);
                col.addView(by);
                col.addView(source("Author from the paired " + (ra.docName() != null ? ra.docName() : "document")));
            }
            LinearLayout stats = Ui.row(c);
            stats.setPadding(0, Ui.dp(c, 16), 0, 0);
            stat(stats, b.total > 0 ? Ui.duration(b.total) : "–", "LENGTH");
            stat(stats, String.valueOf(b.chapters.size()), b.embeddedChapters ? "CHAPTERS" : "FILES");
            float prog = p.bookProgress();
            stat(stats, prog >= 0 ? Math.round(prog * 100) + "%" : "–", "LISTENED");
            col.addView(stats);

            TextView descHead = Ui.text(c, t, "About this book", 16, 600, t.onSurface);
            descHead.setPadding(0, Ui.dp(c, 24), 0, Ui.dp(c, 8));
            col.addView(descHead);
            TextView desc = Ui.text(c, t, "Loading…", 15, 400, t.onSurfaceVariant);
            desc.setLineSpacing(Ui.dp(c, 4), 1f);
            col.addView(desc);
            TextView src = source("");
            col.addView(src);
            final String folder = b.folderUri;
            final String epubDesc = text != null ? text.description : null;
            new Thread(() -> {
                String info = readInfoTxt(c, folder);
                root.post(() -> {
                    if (info != null && !info.trim().isEmpty()) {
                        desc.setText(info.trim());
                        src.setText("From info.txt in the book folder");
                    } else if (epubDesc != null && !epubDesc.isEmpty()) {
                        desc.setText(epubDesc);
                        src.setText("From the paired document's metadata");
                    } else {
                        desc.setText("No description yet. Add one with \"Search description\" in the classic library, or pair the book's EPUB in Read along.");
                        src.setText("");
                    }
                });
            }).start();

            onlineSection(b, p.bookTitle() != null ? p.bookTitle() : b.folderName, text != null ? text.author : null);

            TextView chars = Ui.text(c, t, "Characters", 16, 600, t.onSurface);
            chars.setPadding(0, Ui.dp(c, 24), 0, Ui.dp(c, 4));
            col.addView(chars);
            col.addView(source("Spoiler protection is on: no provider eppy can use offers verified spoiler-free character descriptions, so none are shown. "
                    + "Your own notes are in Characters below."));

            TextView more = Ui.text(c, t, "More", 16, 600, t.onSurface);
            more.setPadding(0, Ui.dp(c, 24), 0, Ui.dp(c, 4));
            col.addView(more);
            col.addView(Ui.linkRow(c, t, EppyIcon.PERSON, "Characters", "Names and your notes", v -> host.pushPage(CharactersPage.KEY, null)));
            col.addView(Ui.linkRow(c, t, EppyIcon.CHART, "Listening statistics", "Time listened per month and book", v -> host.pushPage(StatisticsPage.KEY, null)));
            col.addView(Ui.linkRow(c, t, EppyIcon.HISTORY, "History", "Undo an accidental jump, recent books", v -> host.pushPage(HistoryPage.KEY, null)));
        }

        /** Online information: cached record, lookup with candidate review, removal. */
        private void onlineSection(EppyBook b, String title, String author) {
            TextView head = Ui.text(c, t, "Online information", 16, 600, t.onSurface);
            head.setPadding(0, Ui.dp(c, 24), 0, Ui.dp(c, 8));
            col.addView(head);
            final String folder = b.folderUri;
            app.morphe.extension.sabp.info.BookInfo.Record r = app.morphe.extension.sabp.info.BookInfo.cached(c, folder);
            if (r != null) {
                TextView tt = Ui.text(c, t, r.title + (r.subtitle != null && !r.subtitle.isEmpty() ? ": " + r.subtitle : ""), 15, 600, t.onSurface);
                col.addView(tt);
                String meta = (r.authors != null && !r.authors.isEmpty() ? "by " + r.authors : "") + (r.year != null && !r.year.isEmpty() ? " · " + r.year : "")
                        + (r.isbn != null && !r.isbn.isEmpty() ? " · ISBN " + r.isbn : "");
                if (!meta.isEmpty()) {
                    TextView m = Ui.text(c, t, meta, 13, 400, t.onSurfaceVariant);
                    m.setPadding(0, Ui.dp(c, 4), 0, 0);
                    col.addView(m);
                }
                if (r.description != null && !r.description.isEmpty()) {
                    TextView d = Ui.text(c, t, r.description, 14, 400, t.onSurfaceVariant);
                    d.setLineSpacing(Ui.dp(c, 3), 1f);
                    d.setPadding(0, Ui.dp(c, 8), 0, 0);
                    col.addView(d);
                }
                if (r.subjects != null && !r.subjects.isEmpty()) {
                    TextView sj = Ui.text(c, t, "Subjects: " + r.subjects, 12, 400, t.onSurfaceVariant);
                    sj.setPadding(0, Ui.dp(c, 6), 0, 0);
                    col.addView(sj);
                }
                col.addView(source("Source: " + r.providerName + (r.sourceUrl != null && !r.sourceUrl.isEmpty() ? " (" + r.sourceUrl + ")" : "")
                        + ". Bibliographic data as published by the provider; not reviewed for spoilers."));
                LinearLayout row = Ui.row(c);
                row.addView(Ui.textButton(c, t, "Look up again", v -> lookup(folder, title, author)));
                row.addView(Ui.textButton(c, t, "Remove", v -> {
                    app.morphe.extension.sabp.info.BookInfo.forget(c, folder);
                    refresh(true);
                }));
                col.addView(row);
                return;
            }
            if (!app.morphe.extension.sabp.info.BookInfo.onlineEnabled(c)) {
                col.addView(source("Online lookups are off. Turn them on in Settings → Book information sources (Open Library needs no account)."));
                return;
            }
            col.addView(Ui.textButton(c, t, "Look up \"" + title + "\"", v -> lookup(folder, title, author)));
            if (app.morphe.extension.sabp.info.BookInfo.automatic(c) && autoTried.add(folder)) {
                new Thread(() -> {
                    ArrayList<String> errors = new ArrayList<>();
                    List<app.morphe.extension.sabp.info.BookInfo.Record> found = app.morphe.extension.sabp.info.BookInfo.searchAll(c, cleanTitle(title), author, errors);
                    app.morphe.extension.sabp.info.BookInfo.Record only = null;
                    int exact = 0;
                    for (app.morphe.extension.sabp.info.BookInfo.Record cand : found) {
                        if (app.morphe.extension.sabp.info.BookInfo.sameTitle(cand.title, cleanTitle(title))) {
                            exact++;
                            only = cand;
                        }
                    }
                    if (exact != 1) return; // ambiguous or nothing: the user decides
                    final app.morphe.extension.sabp.info.BookInfo.Record pick = only;
                    try {
                        for (app.morphe.extension.sabp.info.BookInfo.Provider pr : app.morphe.extension.sabp.info.BookInfo.PROVIDERS)
                            if (pr.id().equals(pick.providerId)) pr.complete(c, pick);
                    } catch (Throwable ignored) {
                    }
                    pick.fetchedAt = System.currentTimeMillis();
                    app.morphe.extension.sabp.info.BookInfo.save(c, folder, pick);
                    root.post(() -> refresh(true));
                }, "eppy-bookinfo-auto").start();
            }
        }

        private final java.util.Set<String> autoTried = new java.util.HashSet<>();

        private void lookup(String folder, String title, String author) {
            android.widget.Toast.makeText(c, "Looking up…", android.widget.Toast.LENGTH_SHORT).show();
            new Thread(() -> {
                ArrayList<String> errors = new ArrayList<>();
                List<app.morphe.extension.sabp.info.BookInfo.Record> found = app.morphe.extension.sabp.info.BookInfo.searchAll(c, cleanTitle(title), author, errors);
                root.post(() -> showCandidates(folder, found, errors));
            }, "eppy-bookinfo").start();
        }

        private static String cleanTitle(String s) {
            // Folder names often carry extras: "Author - Title (Unabridged) [2019]".
            String x = s.replaceAll("\\(.*?\\)|\\[.*?]", " ").replaceAll("_", " ");
            int dash = x.indexOf(" - ");
            if (dash > 0 && dash < x.length() - 3) x = x.substring(dash + 3);
            return x.replaceAll("\\s+", " ").trim();
        }

        private void showCandidates(String folder, List<app.morphe.extension.sabp.info.BookInfo.Record> found, List<String> errors) {
            Sheet sh = new Sheet(host.overlayRoot(), t, found.isEmpty() ? "Nothing found" : "Which one is this book?");
            for (String e : errors) {
                TextView tv = Ui.text(c, t, e, 13, 400, t.onSurfaceVariant);
                tv.setPadding(Ui.dp(c, 24), 0, Ui.dp(c, 24), Ui.dp(c, 8));
                sh.content().addView(tv);
            }
            if (found.isEmpty() && errors.isEmpty()) {
                TextView tv = Ui.text(c, t, "No provider returned a match. Try renaming the book folder to its plain title.", 13, 400, t.onSurfaceVariant);
                tv.setPadding(Ui.dp(c, 24), 0, Ui.dp(c, 24), Ui.dp(c, 8));
                sh.content().addView(tv);
            }
            for (app.morphe.extension.sabp.info.BookInfo.Record r : found) {
                String sub = (r.authors != null && !r.authors.isEmpty() ? r.authors : "Unknown author") + (r.year != null && !r.year.isEmpty() ? " · " + r.year : "")
                        + " · " + r.providerName;
                sh.item(EppyIcon.LIBRARY, r.title, sub, () -> new Thread(() -> {
                    try {
                        for (app.morphe.extension.sabp.info.BookInfo.Provider pr : app.morphe.extension.sabp.info.BookInfo.PROVIDERS) {
                            if (pr.id().equals(r.providerId)) pr.complete(c, r);
                        }
                    } catch (Throwable ignored) {
                    }
                    r.fetchedAt = System.currentTimeMillis();
                    app.morphe.extension.sabp.info.BookInfo.save(c, folder, r);
                    root.post(() -> refresh(true));
                }).start());
            }
            sh.show();
        }

        private TextView source(String s) {
            TextView tv = Ui.text(c, t, s, 12, 400, t.outline);
            tv.setPadding(0, Ui.dp(c, 4), 0, 0);
            return tv;
        }

        private void stat(LinearLayout row, String value, String label) {
            LinearLayout box = Ui.column(c);
            box.setGravity(Gravity.CENTER);
            box.setBackground(Ui.rounded(t.surfaceContainerHigh, Ui.dp(c, 20)));
            box.setPadding(Ui.dp(c, 8), Ui.dp(c, 14), Ui.dp(c, 8), Ui.dp(c, 14));
            TextView v = Ui.text(c, t, value, 17, 650, t.onSurface);
            v.setGravity(Gravity.CENTER);
            TextView l = Ui.text(c, t, label, 11, 600, t.onSurfaceVariant);
            l.setLetterSpacing(0.08f);
            l.setPadding(0, Ui.dp(c, 4), 0, 0);
            box.addView(v);
            box.addView(l);
            LinearLayout.LayoutParams lp = Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1);
            if (row.getChildCount() > 0) lp.leftMargin = Ui.dp(c, 10);
            row.addView(box, lp);
        }

        private View link(int icon, String title, String sub, String activity) {
            LinearLayout row = Ui.row(c);
            row.setMinimumHeight(Ui.dp(c, 56));
            row.setBackground(Ui.ripple(t, null, Ui.dp(c, 12)));
            ImageView iv = new ImageView(c);
            iv.setImageDrawable(new EppyIcon(icon, t.onSurfaceVariant));
            LinearLayout.LayoutParams il = new LinearLayout.LayoutParams(Ui.dp(c, 22), Ui.dp(c, 22));
            il.rightMargin = Ui.dp(c, 16);
            row.addView(iv, il);
            LinearLayout texts = Ui.column(c);
            texts.addView(Ui.text(c, t, title, 15, 500, t.onSurface));
            TextView s = Ui.text(c, t, sub, 12, 400, t.onSurfaceVariant);
            s.setPadding(0, Ui.dp(c, 2), 0, 0);
            texts.addView(s);
            row.addView(texts, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            row.setClickable(true);
            row.setFocusable(true);
            row.setOnClickListener(v -> host.openSabp(activity));
            return row;
        }
    }

    /** SABP keeps book descriptions in info.txt inside the book folder. */
    static String readInfoTxt(Context c, String folderUri) {
        for (String name : new String[]{"info.txt", "Info.txt"}) {
            try (InputStream in = c.getContentResolver().openInputStream(SpeechSync.fileUri(folderUri, name))) {
                if (in == null) continue;
                BufferedReader r = new BufferedReader(new InputStreamReader(in, "UTF-8"));
                StringBuilder sb = new StringBuilder();
                String line;
                while ((line = r.readLine()) != null && sb.length() < 20000) sb.append(line).append('\n');
                return sb.toString();
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    // ---- Up next --------------------------------------------------------------------------------

    public static final class UpNext implements PlayerSheet.Tab {
        private final Host host;
        private final Context c;
        private final EppyTheme t;
        private final LinearLayout root;
        private final LinearLayout items;

        public UpNext(Host host, EppyTheme t) {
            this.host = host;
            this.c = host.activity();
            this.t = t;
            root = Ui.column(c);
            ScrollView sv = new ScrollView(c);
            items = Ui.column(c);
            items.setPadding(Ui.dp(c, 12), 0, Ui.dp(c, 12), Ui.dp(c, 24));
            sv.addView(items);
            root.addView(sv, Ui.lp(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        }

        @Override
        public View view() {
            return root;
        }

        @Override
        public void refresh(boolean full) {
            if (!full) return;
            items.removeAllViews();
            EppyPlayer p = host.player();
            EppyBook b = p.book();
            if (b == null) {
                items.addView(emptyText(c, t, "Nothing playing."));
                return;
            }
            double bookPos = p.bookPositionSeconds();
            int cur = b.chapterIndexAt((int) bookPos, (int) p.filePositionSeconds());
            TextView h = Ui.text(c, t, "Next in this book", 13, 600, t.primary);
            h.setPadding(Ui.dp(c, 12), Ui.dp(c, 4), 0, Ui.dp(c, 8));
            items.addView(h);
            int shown = 0;
            for (int i = cur + 1; i < b.chapters.size() && shown < 30; i++, shown++) {
                EppyBook.ChapterItem ch = b.chapters.get(i);
                LinearLayout row = Ui.row(c);
                row.setMinimumHeight(Ui.dp(c, 56));
                row.setPadding(Ui.dp(c, 12), Ui.dp(c, 6), Ui.dp(c, 12), Ui.dp(c, 6));
                row.setBackground(Ui.ripple(t, null, Ui.dp(c, 16)));
                LinearLayout texts = Ui.column(c);
                texts.addView(Ui.singleLine(Ui.text(c, t, ch.title, 15, 500, t.onSurface)));
                String when = ch.start >= 0 && bookPos >= 0 ? "in " + Ui.duration((long) Math.max(0, ch.start - bookPos)) : "";
                TextView s = Ui.text(c, t, when + (ch.length > 0 ? (when.isEmpty() ? "" : " · ") + Ui.duration(ch.length) : ""), 12, 400, t.onSurfaceVariant);
                s.setPadding(0, Ui.dp(c, 3), 0, 0);
                texts.addView(s);
                row.addView(texts, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
                row.setClickable(true);
                row.setOnClickListener(v -> host.player().jumpTo(ch.fileName, ch.positionInFile));
                items.addView(row);
            }
            if (shown == 0) items.addView(emptyText(c, t, "This is the last chapter."));
            TextView q = Ui.text(c, t, "Books queued after this one are managed in the classic Book queue.", 13, 400, t.onSurfaceVariant);
            q.setPadding(Ui.dp(c, 12), Ui.dp(c, 20), Ui.dp(c, 12), Ui.dp(c, 8));
            items.addView(q);
            LinearLayout chipRow = Ui.row(c);
            chipRow.setPadding(Ui.dp(c, 12), 0, 0, 0);
            chipRow.addView(Ui.chip(c, t, EppyIcon.QUEUE, "Book queue", false, v -> host.openSabp(EppyBridge.QUEUE_ACTIVITY)));
            items.addView(chipRow);
        }
    }
}
