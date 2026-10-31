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
import android.view.View;
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
 * same one again turns them back. The two menu entries are aliases of this screen. Android lists every enabled one in
 * each of Messenger's text fields that has a view id, so they're enabled only while the switch is in effect, and
 * {@link #textFieldFocused} gives the chat box an id then.
 */
public final class TextStyleActivity extends Activity {
    static final String KEY = "text_style";
    static final String BOLD = "app.hushmessenger.extension.BoldText";
    static final String ITALIC = "app.hushmessenger.extension.ItalicText";
    static final int BOLD_STYLE = 1, ITALIC_STYLE = 2;
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

    /** Whether this install has the menu entries. A manifest can't change while Messenger runs, so it's asked once. */
    static volatile Boolean entries;

    /**
     * Messenger's text input, the chat box among them, calls this first on every focus change. Android adds PROCESS_TEXT
     * entries, these two and every other app's, only to a field with a view id, and the chat box has none, so while the
     * switch is in effect a field without one gets one. Its saving goes off first: without an id it never saved its
     * state, so the draft stays out of saved state as before. A field that already has an id keeps it.
     */
    public static void textFieldFocused(View field) {
        try {
            if (field == null || !Settings.wouldUse(KEY) || field.getId() != View.NO_ID) return;
            Boolean known = entries;
            if (known == null) entries = known = present(field.getContext());
            if (!known) return;
            field.setSaveEnabled(false);
            field.setId(View.generateViewId());
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't give a text field an id", error);
        }
    }

    /**
     * Samsung's text menu shows another app's entries only once they're ticked under its More options, Manage apps, and
     * entries that were just enabled start unticked there (S22, One UI, 2026-10-30), so the row says where to turn them on.
     */
    static boolean hiddenByPhone() {
        return "samsung".equalsIgnoreCase(android.os.Build.MANUFACTURER);
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
