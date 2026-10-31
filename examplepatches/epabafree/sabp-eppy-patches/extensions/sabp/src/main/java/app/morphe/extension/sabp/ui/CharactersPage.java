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

    private boolean available() {
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
                ArrayList<?> raw = EppyBridge.loadCharacters(c, folder);
                if (raw != null) for (Object o : raw) loaded.add(new String[]{(String) get(o, "mName"), (String) get(o, "mDescription")});
            } catch (Throwable t) {
                EppyDiag.error("characters", "load failed: " + t);
            }
            main.post(() -> {
                items = loaded;
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
        EditText name = field(it[0], "Name", false);
        EditText desc = field(it[1], "Who they are (your note)", true);
        sh.content().addView(name);
        sh.content().addView(desc);
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

    private EditText field(String value, String hint, boolean multi) {
        EditText e = new EditText(c);
        e.setText(value);
        e.setHint(hint);
        e.setTextColor(t.onSurface);
        e.setHintTextColor(t.onSurfaceVariant);
        e.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES | (multi ? InputType.TYPE_TEXT_FLAG_MULTI_LINE : InputType.TYPE_TEXT_FLAG_CAP_WORDS));
        e.setPadding(Ui.dp(c, 24), Ui.dp(c, 12), Ui.dp(c, 24), Ui.dp(c, 12));
        return e;
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private void save(List<String[]> next) {
        items = next;
        show();
        String f = folder;
        new Thread(() -> {
            try {
                Class<?> cls = Class.forName(EppyBridge.SABP_PACKAGE + ".CharacterDescription");
                Constructor<?> ctor = cls.getDeclaredConstructor(String.class, String.class);
                ctor.setAccessible(true);
                ArrayList raw = new ArrayList();
                for (String[] it : next) raw.add(ctor.newInstance(it[0], it[1]));
                EppyBridge.saveCharacters(c, raw, f);
            } catch (Throwable t) {
                EppyDiag.error("characters", "save failed: " + t);
                main.post(() -> android.widget.Toast.makeText(c, "Couldn't save the characters", android.widget.Toast.LENGTH_SHORT).show());
            }
        }, "eppy-characters-save").start();
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
