package app.morphe.extension.sabp.ui;

import android.os.Handler;
import android.os.Looper;
import android.text.InputType;
import android.widget.EditText;
import android.widget.LinearLayout;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.sabp.EppyBook;
import app.morphe.extension.sabp.EppyBridge;
import app.morphe.extension.sabp.EppyDiag;

/**
 * The book's characters, stored by SABP in characters.sabp.xml in the book folder (the same list
 * as the classic Characters screen): add, edit and delete with Undo. These are your own notes;
 * nothing is fetched online here, so there's nothing to spoil.
 */
public final class CharactersPage extends Page {
    public static final String KEY = "characters";
    private final Handler main = new Handler(Looper.getMainLooper());
    private String folder;
    private List<String[]> items = new ArrayList<>();

    public CharactersPage(Host host) {
        super(host, KEY, null, "Characters", true);
        actions.addView(Ui.iconButton(c, t, EppyIcon.PLUS, t.onSurface, 0, "Add a character", v -> edit(-1)));
        load();
    }

    static boolean available() {
        return EppyBridge.has("charactersLoad") && EppyBridge.has("charactersSave");
    }

    private void load() {
        EppyBook b = host.player().book();
        body.removeAllViews();
        if (b == null) {
            body.addView(emptyState(EppyIcon.PERSON, "No book playing", "Characters belong to a book. Start one first.", null, null));
            return;
        }
        if (!available()) {
            body.addView(emptyState(EppyIcon.PERSON, "Not available", "The patch couldn't find SABP's character list (see Settings → Diagnostics).", null, null));
            return;
        }
        folder = b.folderUri;
        new Thread(() -> {
            List<String[]> loaded = new ArrayList<>();
            try {
                loaded = read(c, folder);
            } catch (Throwable t) {
                EppyDiag.error("characters", "load failed: " + t);
            }
            List<String[]> got = loaded;
            main.post(() -> {
                items = got;
                show();
            });
        }, "eppy-characters").start();
    }

    private void show() {
        body.removeAllViews();
        if (items.isEmpty()) {
            body.addView(emptyState(EppyIcon.PERSON, "No characters yet",
                    "Keep track of who's who: add a name and a short note. They're saved with the book and also appear in the classic player.",
                    "Add a character", v -> edit(-1)));
            return;
        }
        LinearLayout box = card();
        for (int i = 0; i < items.size(); i++) {
            final int idx = i;
            String[] it = items.get(i);
            LinearLayout r = Ui.linkRow(c, t, EppyIcon.PERSON, it[0], it[1], v -> edit(idx));
            r.setOnLongClickListener(v -> {
                options(idx);
                return true;
            });
            r.addView(Ui.iconButton(c, t, EppyIcon.MORE, t.onSurfaceVariant, 0, "Options for " + it[0], v -> options(idx)));
            box.addView(r);
        }
    }

    private void options(int idx) {
        String[] it = items.get(idx);
        new Sheet(host.overlayRoot(), t, it[0])
                .item(EppyIcon.EDIT, "Edit", null, () -> edit(idx))
                .item(EppyIcon.DELETE, "Delete", null, () -> {
                    List<String[]> before = new ArrayList<>(items);
                    List<String[]> next = new ArrayList<>(items);
                    next.remove(idx);
                    save(next);
                    host.showUndo(it[0] + " deleted", () -> save(before));
                })
                .show();
    }

    private void edit(int idx) {
        String[] it = idx >= 0 ? items.get(idx) : new String[]{"", ""};
        Sheet sh = new Sheet(host.overlayRoot(), t, idx >= 0 ? "Edit character" : "Add a character");
        EditText name = field(c, t, it[0], "Name", false);
        EditText desc = field(c, t, it[1], "Who they are (your note)", true);
        sh.content().addView(name);
        sh.content().addView(desc);
        addSuggest(host, t, sh.content(), name, desc);
        sh.item(EppyIcon.CHECK, "Save", null, () -> {
            String n = name.getText().toString().trim();
            if (n.isEmpty()) return;
            List<String[]> next = new ArrayList<>(items);
            String[] entry = {n, desc.getText().toString().trim()};
            if (idx >= 0) next.set(idx, entry);
            else next.add(entry);
            save(next);
        });
        sh.show();
        name.requestFocus();
    }

    private static EditText field(android.content.Context c, app.morphe.extension.sabp.EppyTheme t, String value, String hint, boolean multi) {
        EditText e = new EditText(c);
        e.setText(value);
        e.setHint(hint);
        e.setTextColor(t.onSurface);
        e.setHintTextColor(t.onSurfaceVariant);
        e.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES | (multi ? InputType.TYPE_TEXT_FLAG_MULTI_LINE : InputType.TYPE_TEXT_FLAG_CAP_WORDS));
        e.setPadding(Ui.dp(c, 24), Ui.dp(c, 12), Ui.dp(c, 24), Ui.dp(c, 12));
        return e;
    }

    private void save(List<String[]> next) {
        items = next;
        show();
        String f = folder;
        new Thread(() -> {
            try {
                write(c, f, next);
            } catch (Throwable t) {
                EppyDiag.error("characters", "save failed: " + t);
                main.post(() -> android.widget.Toast.makeText(c, "Couldn't save the characters", android.widget.Toast.LENGTH_SHORT).show());
            }
        }, "eppy-characters-save").start();
    }

    static List<String[]> read(android.content.Context c, String folder) throws Throwable {
        List<String[]> out = new ArrayList<>();
        ArrayList<?> raw = EppyBridge.loadCharacters(c, folder);
        if (raw != null) for (Object o : raw) out.add(new String[]{(String) get(o, "mName"), (String) get(o, "mDescription")});
        return out;
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    static void write(android.content.Context c, String folder, List<String[]> next) throws Throwable {
        Class<?> cls = Class.forName(EppyBridge.SABP_PACKAGE + ".CharacterDescription");
        Constructor<?> ctor = cls.getDeclaredConstructor(String.class, String.class);
        ctor.setAccessible(true);
        ArrayList raw = new ArrayList();
        for (String[] it : next) raw.add(ctor.newInstance(it[0], it[1]));
        EppyBridge.saveCharacters(c, raw, folder);
    }

    // ---- the same list as a sheet over the player, so reading isn't left ----------------------------

    /** The playing book's characters in a sheet: tap one to edit it, or add one. The player stays open. */
    public static void showSheet(Host host, app.morphe.extension.sabp.EppyTheme t) {
        android.content.Context c = host.activity();
        EppyBook b = host.player().book();
        if (b == null) {
            toast(c, "Start a book first");
            return;
        }
        if (!available()) {
            toast(c, "The character list isn't available (see Settings → Diagnostics)");
            return;
        }
        String folder = b.folderUri;
        Handler main = new Handler(Looper.getMainLooper());
        new Thread(() -> {
            List<String[]> list = null;
            try {
                list = read(c, folder);
            } catch (Throwable e) {
                EppyDiag.error("characters", "load failed: " + e);
            }
            List<String[]> got = list;
            main.post(() -> {
                if (got == null) toast(c, "Couldn't read the characters");
                else listSheet(host, t, folder, got);
            });
        }, "eppy-characters-sheet").start();
    }

    private static void listSheet(Host host, app.morphe.extension.sabp.EppyTheme t, String folder, List<String[]> list) {
        android.content.Context c = host.activity();
        Sheet sh = new Sheet(host.overlayRoot(), t, "Characters");
        if (list.isEmpty()) {
            android.widget.TextView empty = Ui.text(c, t, "No characters yet. Add a name and a short note; they're saved with the book "
                    + "and also appear in the classic player.", 14, 400, t.onSurfaceVariant);
            empty.setPadding(Ui.dp(c, 24), 0, Ui.dp(c, 24), Ui.dp(c, 8));
            sh.content().addView(empty);
        }
        sh.item(EppyIcon.PLUS, "Add a character", null, () -> add(host, t, "", () -> showSheet(host, t)));
        for (int i = 0; i < list.size(); i++) {
            final int idx = i;
            String[] it = list.get(i);
            sh.item(EppyIcon.PERSON, it[0], it[1] == null || it[1].isEmpty() ? null : it[1], () -> editSheet(host, t, folder, list, idx));
        }
        sh.show();
    }

    private static void editSheet(Host host, app.morphe.extension.sabp.EppyTheme t, String folder, List<String[]> list, int idx) {
        android.content.Context c = host.activity();
        String[] it = list.get(idx);
        Sheet sh = new Sheet(host.overlayRoot(), t, "Edit character");
        EditText n = field(c, t, it[0], "Name", false);
        EditText d = field(c, t, it[1] != null ? it[1] : "", "Who they are (your note)", true);
        sh.content().addView(n);
        sh.content().addView(d);
        addSuggest(host, t, sh.content(), n, d);
        sh.item(EppyIcon.CHECK, "Save", null, () -> {
            String nm = n.getText().toString().trim();
            if (nm.isEmpty()) return;
            List<String[]> next = new ArrayList<>(list);
            next.set(idx, new String[]{nm, d.getText().toString().trim()});
            saveThen(host, t, folder, next, "Saved", null);
        });
        sh.item(EppyIcon.DELETE, "Delete", null, () -> {
            List<String[]> next = new ArrayList<>(list);
            next.remove(idx);
            saveThen(host, t, folder, next, null, () -> host.showUndo(it[0] + " deleted", () -> saveThen(host, t, folder, list, null, null)));
        });
        sh.show();
    }

    /** Saves in the background, then shows the list again (and a message, or runs {@code after}). */
    private static void saveThen(Host host, app.morphe.extension.sabp.EppyTheme t, String folder, List<String[]> next, String msg, Runnable after) {
        android.content.Context c = host.activity();
        Handler main = new Handler(Looper.getMainLooper());
        new Thread(() -> {
            boolean ok = true;
            try {
                write(c, folder, next);
            } catch (Throwable e) {
                EppyDiag.error("characters", "save failed: " + e);
                ok = false;
            }
            boolean saved = ok;
            main.post(() -> {
                if (!saved) {
                    toast(c, "Couldn't save the characters");
                    return;
                }
                if (msg != null) toast(c, msg);
                if (after != null) after.run();
                listSheet(host, t, folder, next);
            });
        }, "eppy-characters-save").start();
    }

    /** "Add to characters" from the Read tab: the editor with the name filled in, saved with the playing book. */
    static void add(Host host, app.morphe.extension.sabp.EppyTheme t, String name) {
        add(host, t, name, null);
    }

    static void add(Host host, app.morphe.extension.sabp.EppyTheme t, String name, Runnable afterSave) {
        EppyBook b = host.player().book();
        if (b == null) return;
        android.content.Context c = host.activity();
        String folder = b.folderUri;
        Handler main = new Handler(Looper.getMainLooper());
        Sheet sh = new Sheet(host.overlayRoot(), t, "Add a character");
        EditText n = field(c, t, name, "Name", false);
        EditText d = field(c, t, "", "Who they are (your note)", true);
        sh.content().addView(n);
        sh.content().addView(d);
        addSuggest(host, t, sh.content(), n, d);
        sh.item(EppyIcon.CHECK, "Save", "Saved with the book; also in the classic player", () -> {
            String nm = n.getText().toString().trim();
            String note = d.getText().toString().trim();
            if (nm.isEmpty()) return;
            new Thread(() -> {
                String msg;
                try {
                    List<String[]> next = read(c, folder);
                    next.add(new String[]{nm, note});
                    write(c, folder, next);
                    msg = "Added " + nm + " to characters";
                } catch (Throwable e) {
                    EppyDiag.error("characters", "add failed: " + e);
                    msg = "Couldn't save the characters";
                }
                String m = msg;
                main.post(() -> {
                    android.widget.Toast.makeText(c, m, android.widget.Toast.LENGTH_SHORT).show();
                    if (afterSave != null) afterSave.run();
                });
            }, "eppy-characters-add").start();
        });
        sh.show();
        n.requestFocus();
    }

    private interface Ask {
        String run() throws Exception;
    }

    /**
     * "Suggest from the book" and "Search the web (may spoil)" under the note field, when Settings →
     * AI character notes is on. A suggestion fills an empty note, or goes on a new line under the user's.
     */
    static void addSuggest(Host host, app.morphe.extension.sabp.EppyTheme t, LinearLayout box, EditText name, EditText note) {
        android.content.Context c = host.activity();
        if (!app.morphe.extension.sabp.info.Gemini.ready(c)) return;
        app.morphe.extension.sabp.read.ReadAlong ra = app.morphe.extension.sabp.read.ReadAlong.get(c);
        app.morphe.extension.sabp.read.BookText text = ra.text();
        boolean[] busy = {false};
        LinearLayout row = Ui.row(c);
        row.setPadding(Ui.dp(c, 24), Ui.dp(c, 4), Ui.dp(c, 24), Ui.dp(c, 8));
        if (text != null && !text.pagesOnly) {
            row.addView(Ui.chip(c, t, EppyIcon.BOOK, "Suggest from the book", false, v -> {
                String nm = name.getText().toString().trim();
                double pos = host.player().bookPositionSeconds();
                if (nm.isEmpty()) toast(c, "Type the character's name first");
                else if (pos < 0) toast(c, "Start listening first: the note only uses what you've heard");
                else {
                    int heard = ra.unitAt(pos);
                    String title = host.player().bookTitle();
                    ask(c, note, busy, () -> {
                        List<String> ex = app.morphe.extension.sabp.read.CharacterExcerpts.pick(text, nm, heard);
                        if (ex.isEmpty()) throw new app.morphe.extension.sabp.info.Gemini.Failure("No mention of " + nm + " yet in what you've heard");
                        return app.morphe.extension.sabp.info.Gemini.fromBook(c, title, nm, ex);
                    });
                }
            }));
            row.addView(Ui.space(c, 8, 1));
        }
        row.addView(Ui.chip(c, t, EppyIcon.WEB_SEARCH, "Search the web (may spoil)", false, v -> {
            String nm = name.getText().toString().trim();
            if (nm.isEmpty()) {
                toast(c, "Type the character's name first");
                return;
            }
            String title = host.player().bookTitle();
            String author = text != null ? text.author : null;
            ask(c, note, busy, () -> app.morphe.extension.sabp.info.Gemini.fromWeb(c, title, author, nm));
        }));
        android.widget.HorizontalScrollView hs = new android.widget.HorizontalScrollView(c);
        hs.setHorizontalScrollBarEnabled(false);
        hs.addView(row);
        box.addView(hs);
    }

    private static void ask(android.content.Context c, EditText note, boolean[] busy, Ask a) {
        if (busy[0]) return;
        busy[0] = true;
        CharSequence hint = note.getHint();
        note.setHint("Asking Gemini…");
        Handler main = new Handler(Looper.getMainLooper());
        new Thread(() -> {
            String got = null, err = null;
            try {
                got = a.run();
            } catch (app.morphe.extension.sabp.info.Gemini.Failure f) {
                err = f.getMessage();
            } catch (Throwable e) {
                EppyDiag.log("ai", "suggest failed: " + e);
                err = "Couldn't get a suggestion: " + e.getMessage();
            }
            String g = got, m = err;
            main.post(() -> {
                busy[0] = false;
                note.setHint(hint);
                if (g == null) {
                    toast(c, m);
                    return;
                }
                String cur = note.getText().toString().trim();
                note.setText(cur.isEmpty() ? g : cur + "\n" + g);
                note.setSelection(note.getText().length());
            });
        }, "eppy-ai-suggest").start();
    }

    private static void toast(android.content.Context c, String m) {
        android.widget.Toast.makeText(c, m, android.widget.Toast.LENGTH_LONG).show();
    }

    private static Object get(Object o, String name) {
        try {
            Field f = o.getClass().getDeclaredField(name);
            f.setAccessible(true);
            return f.get(o);
        } catch (Throwable t) {
            return null;
        }
    }
}
