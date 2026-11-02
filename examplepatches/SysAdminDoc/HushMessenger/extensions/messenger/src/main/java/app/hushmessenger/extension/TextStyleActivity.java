package app.hushmessenger.extension;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.PatternMatcher;
import android.text.Editable;
import android.text.Selection;
import android.view.ActionMode;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * Bold and Italic in the menu Android shows over selected text (#42). Messenger has no formatting in chats, so the
 * selection comes back in Unicode's sans-serif bold or italic letters, which every phone can show, and picking the
 * same one again turns them back. The chat box and Messenger's other Litho inputs get them as rows of their own menu
 * through {@link #textFieldSelected}. Fields with a view id get them from two aliases of this screen, which Android lists
 * in each such field, so those are enabled only while the switch is in effect.
 */
public final class TextStyleActivity extends Activity {
    static final String KEY = "text_style";
    static final String BOLD = "app.hushmessenger.extension.BoldText";
    static final String ITALIC = "app.hushmessenger.extension.ItalicText";
    static final int BOLD_STYLE = 1, ITALIC_STYLE = 2;
    /** Our own menu row ids, outside the ranges of android.R.id and of any app resource. */
    static final int BOLD_ROW = 0x48000001, ITALIC_ROW = 0x48000002;
    /** Right after Paste in Android's order for the selection menu. */
    private static final int ROW_ORDER = 6;
    /** Where each style's capitals and small letters start: plain, bold, italic, bold italic. */
    private static final int[] CAPITALS = {'A', 0x1D5D4, 0x1D608, 0x1D63C};
    private static final int[] SMALL = {'a', 0x1D5EE, 0x1D622, 0x1D656};
    /** Unicode has bold digits but no italic ones. */
    private static final int BOLD_DIGITS = 0x1D7EC;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        String styled = null, why = null;
        try {
            styled = styledFor(getIntent());
            if (styled == null) why = whyUnchanged(getIntent());
        } catch (RuntimeException error) {
            Settings.hookFailedPrivately(KEY, "Can't style the selected text", error);
        }
        if (styled != null) setResult(RESULT_OK, new Intent().putExtra(Intent.EXTRA_PROCESS_TEXT, styled));
        else {
            setResult(RESULT_CANCELED);
            if (why != null) Toast.makeText(getApplicationContext(), new SettingsText(this).get(why), Toast.LENGTH_SHORT).show();
        }
        finish();
    }

    static boolean readOnly(Intent intent) {
        return intent != null && intent.getBooleanExtra(Intent.EXTRA_PROCESS_TEXT_READONLY, false);
    }

    /** The style of the menu entry this intent came through, or 0 for any other entry. */
    private static int style(Intent intent) {
        ComponentName entry = intent == null ? null : intent.getComponent();
        return entry == null ? 0 : BOLD.equals(entry.getClassName()) ? BOLD_STYLE
            : ITALIC.equals(entry.getClassName()) ? ITALIC_STYLE : 0;
    }

    /** What the menu entry this intent came through makes of its selection, or null to leave the text as it is. */
    static String styledFor(Intent intent) {
        int style = style(intent);
        CharSequence selected = style == 0 ? null : intent.getCharSequenceExtra(Intent.EXTRA_PROCESS_TEXT);
        // A read-only selection has nowhere to put the result.
        if (selected == null || readOnly(intent)) return null;
        String styled = restyle(selected, style);
        return styled != null && Settings.enabled(KEY) ? styled : null;
    }

    /**
     * The tip that says why an entry left the selection as it was, or null to stay quiet: off, Pause, another entry and
     * an empty selection say nothing. wouldUse, since nothing was styled and this mustn't count as a use.
     */
    static String whyUnchanged(Intent intent) {
        if (intent == null || !Settings.wouldUse(KEY)) return null;
        // Android offers the entries over text you can't edit too, like a received message.
        if (readOnly(intent)) return "text_style_read_only";
        int style = style(intent);
        CharSequence selected = style == 0 ? null : intent.getCharSequenceExtra(Intent.EXTRA_PROCESS_TEXT);
        // Only letters A to Z, accented or not, and digits for Bold have styled forms, so other scripts stay as they are.
        if (selected == null || selected.length() == 0 || restyle(selected, style) != null) return null;
        return style == BOLD_STYLE ? "text_style_bold_none" : "text_style_italic_none";
    }

    /** One letter or digit with the combining marks after it, or anything else on its own. */
    private static final class Piece {
        final String original, marks;
        final int base, style;

        Piece(String original, int base, int style, String marks) {
            this.original = original;
            this.base = base;
            this.style = style;
            this.marks = marks;
        }
    }

    /**
     * The selection with [style] added to every letter, or taken off when every letter already has it. Digits take
     * bold only. An accented letter keeps its accent as a combining mark and gets it joined back once it's plain again.
     * Everything else stays as it was. Null when nothing in the selection can take the style.
     */
    static String restyle(CharSequence selected, int style) {
        String text = selected.toString();
        List<Piece> pieces = new ArrayList<>();
        for (int at = 0; at < text.length(); ) {
            int point = text.codePointAt(at);
            int next = at + Character.charCount(point);
            int[] found = letter(point);
            String marks = "";
            if (found == null) {
                // A precomposed letter like é: a plain letter and its marks once taken apart.
                String parts = Normalizer.normalize(text.substring(at, next), Normalizer.Form.NFD);
                int first = parts.codePointAt(0);
                int[] base = letter(first);
                String rest = parts.substring(Character.charCount(first));
                if (base != null && base[1] == 0 && !rest.isEmpty() && onlyMarks(rest)) {
                    found = base;
                    marks = rest;
                }
            }
            if (found != null) while (next < text.length() && isMark(text.codePointAt(next))) {
                int mark = text.codePointAt(next);
                marks += new String(Character.toChars(mark));
                next += Character.charCount(mark);
            }
            // A digit with the emoji selector or a keycap is an emoji like 1️⃣, and a styled digit would break it.
            if (marks.indexOf('\uFE0F') >= 0 || marks.indexOf('\u20E3') >= 0) found = null;
            pieces.add(found == null ? new Piece(text.substring(at, next), -1, 0, "")
                : new Piece(text.substring(at, next), found[0], found[1], marks));
            at = next;
        }
        boolean any = false, every = true;
        for (Piece piece : pieces) {
            if (!takes(piece, style)) continue;
            any = true;
            every &= (piece.style & style) != 0;
        }
        if (!any) return null;
        StringBuilder out = new StringBuilder(text.length() * 2);
        for (Piece piece : pieces) {
            if (!takes(piece, style)) {
                out.append(piece.original);
                continue;
            }
            int now = every ? piece.style & ~style : piece.style | style;
            String letter = new String(Character.toChars(encode(piece.base, now))) + piece.marks;
            out.append(now == 0 && !piece.marks.isEmpty() ? Normalizer.normalize(letter, Normalizer.Form.NFC) : letter);
        }
        return out.toString();
    }

    private static boolean takes(Piece piece, int style) {
        return piece.base >= 0 && (piece.base > '9' || style == BOLD_STYLE);
    }

    /** A plain or styled letter or digit as {plain character, style}, or null for anything else. */
    private static int[] letter(int point) {
        if (point >= 'A' && point <= 'Z' || point >= 'a' && point <= 'z' || point >= '0' && point <= '9') return new int[] {point, 0};
        for (int style = 1; style < CAPITALS.length; style++) {
            if (point >= CAPITALS[style] && point < CAPITALS[style] + 26) return new int[] {'A' + point - CAPITALS[style], style};
            if (point >= SMALL[style] && point < SMALL[style] + 26) return new int[] {'a' + point - SMALL[style], style};
        }
        if (point >= BOLD_DIGITS && point < BOLD_DIGITS + 10) return new int[] {'0' + point - BOLD_DIGITS, BOLD_STYLE};
        return null;
    }

    private static int encode(int base, int style) {
        if (base <= '9') return (style & BOLD_STYLE) != 0 ? BOLD_DIGITS + base - '0' : base;
        return base <= 'Z' ? CAPITALS[style] + base - 'A' : SMALL[style] + base - 'a';
    }

    private static boolean isMark(int point) {
        int type = Character.getType(point);
        return type == Character.NON_SPACING_MARK || type == Character.ENCLOSING_MARK || type == Character.COMBINING_SPACING_MARK;
    }

    private static boolean onlyMarks(String text) {
        for (int at = 0; at < text.length(); ) {
            int point = text.codePointAt(at);
            if (!isMark(point)) return false;
            at += Character.charCount(point);
        }
        return true;
    }

    /** Runs the menu entries' updates one at a time, so the newest state wins. Tests run it in place. */
    static Executor work = background();

    private static Executor background() {
        ThreadPoolExecutor pool = new ThreadPoolExecutor(1, 1, 5, TimeUnit.SECONDS, new LinkedBlockingQueue<>(), task -> {
            Thread thread = new Thread(task, "HushTextStyle");
            thread.setDaemon(true);
            return thread;
        });
        pool.allowCoreThreadTimeOut(true);
        return pool;
    }

    // Held here for good: SharedPreferences keeps its listeners only weakly.
    private static final SharedPreferences.OnSharedPreferenceChangeListener FOLLOW = (preferences, key) -> {
        if (key == null || KEY.equals(key) || "paused".equals(key)) refresh();
    };

    /**
     * Messenger's first start after an install enables every component in its manifest, these two included, and it
     * does that after this start's sync, so the entries showed with the switch off until the next start. Android tells
     * the app's own receivers about each change to its components, and the sync puts them back right away.
     */
    private static final BroadcastReceiver CHANGED = new BroadcastReceiver() {
        @Override public void onReceive(Context context, Intent intent) { refresh(); }
    };
    private static Context listening;

    /** Settings started in Messenger's main process: the menu entries follow the switch and Pause from now on. */
    static void watch() {
        SharedPreferences preferences = Settings.preferences;
        if (preferences != null) preferences.registerOnSharedPreferenceChangeListener(FOLLOW);
        Context context = Settings.appContext;
        if (context != null && context != listening) {
            IntentFilter filter = new IntentFilter(Intent.ACTION_PACKAGE_CHANGED);
            filter.addDataScheme("package");
            filter.addDataSchemeSpecificPart(context.getPackageName(), PatternMatcher.PATTERN_LITERAL);
            try {
                // A protected system broadcast, so no export flag is needed on any version.
                context.registerReceiver(CHANGED, filter);
                listening = context;
            } catch (RuntimeException error) {
                Settings.hookFailed(KEY, "Can't watch the Bold and Italic menu entries", error);
            }
        }
        refresh();
    }

    static void refresh() {
        Context context = Settings.appContext;
        if (context != null) work.execute(() -> sync(context));
    }

    /**
     * Enables both menu entries while the switch is in effect, and puts them back to the manifest's disabled state for
     * off, Pause and safe mode. Android checks the state each time it builds the selection menu.
     */
    static void sync(Context context) {
        try {
            set(context, Settings.wouldUse(KEY) ? PackageManager.COMPONENT_ENABLED_STATE_ENABLED
                : PackageManager.COMPONENT_ENABLED_STATE_DEFAULT);
        } catch (RuntimeException error) {
            Settings.hookFailed(KEY, "Can't update the Bold and Italic menu entries", error);
        }
    }

    /**
     * Settings couldn't start in this process, so the switch can't be read or followed. Entries an earlier run turned on
     * go back to the manifest's disabled state until a start works, the same as off.
     */
    static void turnOff(Context context) {
        work.execute(() -> {
            try {
                set(context, PackageManager.COMPONENT_ENABLED_STATE_DEFAULT);
            } catch (RuntimeException error) {
                android.util.Log.w("HushMessenger", "Can't take the Bold and Italic menu entries out", error);
            }
        });
    }

    private static void set(Context context, int wanted) {
        if (!present(context)) return;
        PackageManager packages = context.getPackageManager();
        for (String entry : new String[] {BOLD, ITALIC}) {
            ComponentName name = new ComponentName(context.getPackageName(), entry);
            if (packages.getComponentEnabledSetting(name) != wanted)
                packages.setComponentEnabledSetting(name, wanted, PackageManager.DONT_KILL_APP);
        }
    }

    /**
     * Messenger's text input, the chat box among them, calls this first on every selection change, which comes right
     * before Android builds its menu. Attaching any earlier doesn't last, since Litho sets the field's menu callback again
     * each time it binds the view.
     */
    public static void textFieldSelected(View field) {
        try {
            if (!(field instanceof TextView) || !Settings.wouldUse(KEY)) return;
            TextView text = (TextView) field;
            if (!text.hasSelection()) return;
            ActionMode.Callback current = text.getCustomSelectionActionModeCallback();
            if (!(current instanceof StyleRows)) text.setCustomSelectionActionModeCallback(new StyleRows(current, text));
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't add Bold and Italic to a text field", error);
        }
    }

    /**
     * Bold and Italic as rows of the field's own menu. PROCESS_TEXT entries can't do this job in the chat box: Android adds
     * them only to a field with a view id, a field given one also picks up every other app's entries, and some Samsung
     * phones label both of ours with the app's name or hide them until they're ticked under Manage apps (#125).
     */
    private static final class StyleRows implements ActionMode.Callback {
        private final ActionMode.Callback messengers;
        private final TextView field;

        StyleRows(ActionMode.Callback messengers, TextView field) {
            this.messengers = messengers;
            this.field = field;
        }

        @Override public boolean onCreateActionMode(ActionMode mode, Menu menu) {
            if (messengers != null && !messengers.onCreateActionMode(mode, menu)) return false;
            try {
                if (Settings.wouldUse(KEY) && field.getText() instanceof Editable) {
                    SettingsText text = new SettingsText(field.getContext());
                    addRow(menu, field, BOLD_ROW, text.get("text_style_bold"), BOLD_STYLE);
                    addRow(menu, field, ITALIC_ROW, text.get("text_style_italic"), ITALIC_STYLE);
                }
            } catch (RuntimeException error) {
                Settings.hookFailed(KEY, "Can't add the Bold and Italic rows", error);
            }
            return true;
        }

        /**
         * Android adds PROCESS_TEXT entries after the create call, so a field with its own id would list these two twice.
         * They all share id 0, so hiding is the way to drop only ours.
         */
        @Override public boolean onPrepareActionMode(ActionMode mode, Menu menu) {
            for (int at = menu.size() - 1; at >= 0; at--) {
                MenuItem item = menu.getItem(at);
                if (style(item.getIntent()) != 0) item.setVisible(false);
            }
            return messengers == null || messengers.onPrepareActionMode(mode, menu);
        }

        @Override public boolean onActionItemClicked(ActionMode mode, MenuItem item) {
            return messengers != null && messengers.onActionItemClicked(mode, item);
        }

        @Override public void onDestroyActionMode(ActionMode mode) {
            if (messengers != null) messengers.onDestroyActionMode(mode);
        }
    }

    /** The row answers its own tap, so it keeps working if a bind swaps the field's callback while the menu is open. */
    private static void addRow(Menu menu, TextView field, int id, String title, int style) {
        MenuItem row = menu.add(Menu.NONE, id, ROW_ORDER, title);
        row.setShowAsAction(MenuItem.SHOW_AS_ACTION_IF_ROOM);
        row.setOnMenuItemClickListener(tapped -> {
            styleSelection(field, style);
            return true;
        });
    }

    /** Swaps the selection for its styled form and puts the cursor after it, where typing carries on. */
    static void styleSelection(TextView field, int style) {
        try {
            CharSequence all = field.getText();
            int start = Math.min(field.getSelectionStart(), field.getSelectionEnd());
            int end = Math.max(field.getSelectionStart(), field.getSelectionEnd());
            if (!(all instanceof Editable) || start < 0 || start == end || !Settings.wouldUse(KEY)) return;
            String styled = restyle(all.subSequence(start, end), style);
            if (styled == null) {
                SettingsText text = new SettingsText(field.getContext());
                Toast.makeText(field.getContext().getApplicationContext(), text.get(style == BOLD_STYLE ? "text_style_bold_none" : "text_style_italic_none"), Toast.LENGTH_SHORT).show();
                return;
            }
            if (!Settings.enabled(KEY)) return;
            Editable editable = (Editable) all;
            editable.replace(start, end, styled);
            // An input filter can shorten what went in.
            Selection.setSelection(editable, Math.min(start + styled.length(), editable.length()));
        } catch (RuntimeException error) {
            Settings.hookFailedPrivately(KEY, "Can't style the selected text", error);
        }
    }

    /** A Root Mount install keeps Messenger's own manifest, which has no menu entries to enable. */
    static boolean present(Context context) {
        try {
            context.getPackageManager().getActivityInfo(new ComponentName(context.getPackageName(), BOLD),
                PackageManager.MATCH_DISABLED_COMPONENTS);
            return true;
        } catch (PackageManager.NameNotFoundException missing) {
            return false;
        }
    }
}
