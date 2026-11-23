package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.os.Build;
import android.text.TextPaint;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Modern UI's own font settings.
 *
 * Joey keeps every font and size choice in one SharedPreferences file ("font_prefs"), read
 * through its FontGuy (ya.c). Every text view, the comment body, AMA view and the rest read
 * from there. In Modern UI that FontGuy is pointed at a second file with the same keys, so
 * Modern has its own choices and Classic keeps Joey's untouched.
 *
 * The corrected system fonts are stored under names that contain a dot. Joey treats such a
 * name as a font file and loads it through zd.o1.c, which hands it to this class.
 */
public final class ModernFonts {
    private static final String TAG = "MorpheFonts";

    static final String PREFS = "morphe_fonts";
    private static final String JOEY_PREFS = "font_prefs";

    // Joey's own keys, used in both files.
    private static final String TITLE_FACE = "PREF_TITLE_TYPEFACE";
    private static final String COMMENT_FACE = "PREF_COMMENT_TYPEFACE";
    private static final String COMMENT_INFO_FACE = "PREF_COMMENT_INFO_TYPEFACE";
    private static final String POST_INFO_FACE = "PREF_POST_INFO_TYPEFACE";
    private static final String QUESTION_FACE = "PREF_QUESTION_TYPEFACE";
    private static final String ANSWER_FACE = "PREF_ANSWER_TYPEFACE";
    private static final String TITLE_SIZE = "PREF_TITLE_FONT_SIZE";
    private static final String COMMENT_SIZE = "PREF_COMMENT_FONT_SIZE";
    private static final String COMMENT_INFO_SIZE = "PREF_COMMENT_INFO_FONT_SIZE";
    private static final String POST_INFO_SIZE = "PREF_POST_INFO_FONT_SIZE";
    private static final String QA_SIZE = "PREF_QA_FONT_SIZE";
    private static final String SAME_INFO = "PREF_POST_INFO_FONT_SAME_AS_COMMENT_INFO";

    // Modern only.
    private static final String KEY_LABELS = "morphe_label_fonts";
    private static final String KEY_PRESET = "morphe_font_preset";
    private static final String LABELS_MODERN = "modern";
    private static final String LABELS_JOEY = "joey";
    private static final String PRESET_MODERN = "modern";
    private static final String PRESET_CLASSIC = "classic";
    private static final String PRESET_CUSTOM = "custom";

    // The corrected system fonts. The dot makes Joey load them as a font file.
    static final String SYSTEM = "morphe.system";
    static final String SYSTEM_MEDIUM = "morphe.system.medium";
    static final String SYSTEM_CONDENSED = "morphe.system.condensed";

    // Joey's built-in fonts, as stored. The number is Joey's font id (zd.o1).
    private static final String[] JOEY_NAMES = {
            "System", "Regular", "Medium", "Condensed", "Slab", "Jost_regular", "Open_dyslexic"};
    private static final int[] JOEY_IDS = {-1, 2, 4, 1, 3, 8, 7};
    private static final String[] JOEY_LABELS = {
            "Joey system", "Roboto", "Roboto Medium", "Roboto Condensed", "Roboto Slab", "Jost", "OpenDyslexic"};

    /** Joey's text roles. Typeface tokens are the values of Joey's typeface_* integers. */
    private static final int ROLE_COMMENT_INFO = 1;
    private static final int ROLE_POST_INFO = 2;
    private static final int ROLE_COMMENT = 3;
    private static final int ROLE_TITLE = 4;
    private static final int ROLE_QUESTION = 5;
    private static final int ROLE_ANSWER = 6;

    private static final int SIZE_MIN = 8;
    private static final int SPACING = 0x4d4f0050;

    private static volatile SharedPreferences sModern;
    private static volatile SharedPreferences sJoey;
    private static Field sPrefsField;
    private static Method sJoeyFont;
    private static final ThreadLocal<Boolean> LOADING_CHOICE = new ThreadLocal<>();
    private static volatile Snapshot sSnapshot;
    private static final Map<String, Typeface> FILE_FACES = new HashMap<>();
    private static final TextPaint REFERENCE = new TextPaint(Paint.ANTI_ALIAS_FLAG);

    private static Typeface sSystemMedium;
    private static Typeface sSystemCondensed;

    private static final String[] FACE_KEYS = {
            TITLE_FACE, COMMENT_FACE, COMMENT_INFO_FACE, POST_INFO_FACE, QUESTION_FACE, ANSWER_FACE};
    private static final String[] SIZE_KEYS = {TITLE_SIZE, COMMENT_SIZE, COMMENT_INFO_SIZE, POST_INFO_SIZE, QA_SIZE};

    /** Live listener for the Modern file. SharedPreferences only holds it weakly. */
    private static final SharedPreferences.OnSharedPreferenceChangeListener WATCH = (prefs, key) -> {
        sSnapshot = null;
        // Joey drops a font key when its file is missing, and a restore can clear the file.
        // Put Modern's own value back, so a missing font never falls to Joey's default.
        if (key == null || isFaceKey(key)) {
            SharedPreferences.Editor editor = null;
            for (String face : FACE_KEYS) {
                if (prefs.contains(face)) continue;
                if (editor == null) editor = prefs.edit();
                editor.putString(face, modernFace(face));
            }
            if (editor != null) editor.apply();
        }
    };

    private ModernFonts() {
    }

    // =========================================================================
    // Hooks
    // =========================================================================

    /**
     * End of ya.c.x(), the FontGuy every caller asks for. Points Joey's font settings at the
     * file for the current mode. Runs on every font lookup, so it only writes on a change.
     */
    public static void bind(Object guy) {
        if (guy == null) return;
        try {
            Context context = ModernUi.getContext();
            if (context == null) return;
            if (sPrefsField == null) {
                Field field = guy.getClass().getDeclaredField("a");
                field.setAccessible(true);
                sPrefsField = field;
            }
            Object current = sPrefsField.get(guy);
            SharedPreferences modern = modernPrefs(context);
            if (sJoey == null) {
                sJoey = current instanceof SharedPreferences && current != modern
                        ? (SharedPreferences) current
                        : context.getSharedPreferences(JOEY_PREFS, Context.MODE_PRIVATE);
            }
            SharedPreferences want = ModernUi.isModernUiEnabled(context) ? modern : sJoey;
            if (current != want) sPrefsField.set(guy, want);
        } catch (Throwable t) {
            Log.w(TAG, "bind", t);
        }
    }

    /**
     * Start of zd.o1.c(String), Joey's font-file loader. Serves the corrected system fonts.
     * Null leaves Joey to load a real file.
     */
    public static Typeface special(String name) {
        if (name == null || !name.startsWith(SYSTEM)) return null;
        return systemFace(name);
    }

    /**
     * Body of ya.c$a.c(), a built-in font the user picked. It must load the real font, so
     * the labels mapping in {@link #fixed} is skipped while it loads.
     */
    public static Typeface joey(int id) {
        Boolean before = LOADING_CHOICE.get();
        LOADING_CHOICE.set(Boolean.TRUE);
        try {
            return joeyFont(id);
        } finally {
            LOADING_CHOICE.set(before);
        }
    }

    /**
     * Start of zd.o1.a(int). Joey loads some fonts by number for labels, tags, flair, and a
     * few headings. In Modern those follow the "Labels and tags" setting, as they all used
     * the system font before. Fonts a user picked load through {@link #joey} and skip this.
     * Null leaves Joey's font.
     */
    public static Typeface fixed(int id) {
        // 5 is the icon font. 7 is OpenDyslexic, which Joey only uses when someone picks it.
        if (id == 5 || id == 7 || id < 1 || id > 8 || Boolean.TRUE.equals(LOADING_CHOICE.get())) return null;
        Context context = ModernUi.getContext();
        if (context == null || !ModernUi.isModernUiEnabled(context)) return null;
        if (!LABELS_MODERN.equals(snapshot(context).labels)) return null;
        switch (id) {
            case 1: return systemFace(SYSTEM_CONDENSED);
            case 4: return systemFace(SYSTEM_MEDIUM);
            default: return Typeface.DEFAULT;
        }
    }

    /** End of q9.b.a(), after Joey set a text view's font and size for one role. */
    public static void fit(TextView view, int role) {
        if (view == null) return;
        try {
            Context context = view.getContext();
            if (context == null || !ModernUi.isModernUiEnabled(context)) {
                restoreSpacing(view);
                return;
            }
            Snapshot snapshot = snapshot(context);
            String face = snapshot.face(role);
            if (face == null || !face.startsWith(SYSTEM)) {
                restoreSpacing(view);
                return;
            }
            matchSpacing(view, joeyReference(context, role));
        } catch (Throwable t) {
            Log.w(TAG, "fit", t);
        }
    }

    /**
     * End of HtmlDispaly.setStyle: comment and post bodies, and AMA questions and answers.
     * It sets the font without a style, so the font itself shows which role it came from.
     */
    public static void fitBody(TextView view) {
        if (view == null) return;
        try {
            Context context = view.getContext();
            if (context != null && ModernUi.isModernUiEnabled(context)) {
                Snapshot snapshot = snapshot(context);
                Typeface shown = view.getTypeface();
                for (int role : new int[]{ROLE_COMMENT, ROLE_ANSWER, ROLE_QUESTION}) {
                    String face = snapshot.face(role);
                    if (face != null && face.startsWith(SYSTEM) && systemFace(face) == shown) {
                        fit(view, role);
                        return;
                    }
                }
            }
            restoreSpacing(view);
        } catch (Throwable t) {
            Log.w(TAG, "fitBody", t);
        }
    }

    // =========================================================================
    // Fonts
    // =========================================================================

    private static Typeface systemFace(String name) {
        if (SYSTEM_MEDIUM.equals(name)) {
            if (sSystemMedium == null) {
                sSystemMedium = Build.VERSION.SDK_INT >= 28
                        ? Typeface.create(Typeface.DEFAULT, 500, false)
                        : Typeface.create("sans-serif-medium", Typeface.NORMAL);
            }
            return sSystemMedium;
        }
        if (SYSTEM_CONDENSED.equals(name)) {
            if (sSystemCondensed == null) sSystemCondensed = Typeface.create("sans-serif-condensed", Typeface.NORMAL);
            return sSystemCondensed;
        }
        return Typeface.DEFAULT;
    }

    /** Joey's own font for a number, without the labels mapping. */
    private static Typeface joeyFont(int id) {
        try {
            if (sJoeyFont == null) {
                sJoeyFont = Class.forName("zd.o1").getMethod("a", int.class);
            }
            Boolean before = LOADING_CHOICE.get();
            LOADING_CHOICE.set(Boolean.TRUE);
            try {
                Object face = sJoeyFont.invoke(null, id);
                return face instanceof Typeface ? (Typeface) face : Typeface.DEFAULT;
            } finally {
                LOADING_CHOICE.set(before);
            }
        } catch (Throwable t) {
            return Typeface.DEFAULT;
        }
    }

    /** The font a stored name stands for, in either file. */
    private static Typeface resolve(Context context, String name) {
        if (name == null) return null;
        if (name.startsWith(SYSTEM)) return systemFace(name);
        for (int i = 0; i < JOEY_NAMES.length; i++) {
            if (JOEY_NAMES[i].equals(name)) return joeyFont(JOEY_IDS[i]);
        }
        if (!name.contains(".")) return null;
        synchronized (FILE_FACES) {
            Typeface cached = FILE_FACES.get(name);
            if (cached != null) return cached;
            try {
                File file = new File(fontDir(context), name);
                if (!file.isFile()) return null;
                Typeface face = Typeface.createFromFile(file);
                FILE_FACES.put(name, face);
                return face;
            } catch (Throwable t) {
                return null;
            }
        }
    }

    /**
     * The font Classic would draw this role in: the one saved in Joey's own settings, or
     * Joey's default. Its line height is what the corrected system font keeps.
     */
    private static Typeface joeyReference(Context context, int role) {
        SharedPreferences joey = joeyPrefs(context);
        String key = faceKey(role);
        if (role == ROLE_POST_INFO && joey.getBoolean(SAME_INFO, false)) key = COMMENT_INFO_FACE;
        Typeface face = resolve(context, joey.getString(key, joeyDefaultFace(key)));
        return face != null ? face : resolve(context, joeyDefaultFace(key));
    }

    /**
     * Gives the view the line height its Joey font would have had at this size. Joey's own
     * spacing on the view is kept and only the font's difference is added.
     */
    private static void matchSpacing(TextView view, Typeface reference) {
        float size = view.getTextSize();
        if (reference == null || size <= 0) return;
        Spacing original = spacing(view);
        REFERENCE.setTypeface(reference);
        REFERENCE.setTextSize(size);
        int wanted = REFERENCE.getFontMetricsInt(null);
        int actual = view.getPaint().getFontMetricsInt(null);
        float extra = original.extra + (wanted - actual) * original.multiplier;
        if (view.getLineSpacingExtra() != extra || view.getLineSpacingMultiplier() != original.multiplier) {
            view.setLineSpacing(extra, original.multiplier);
        }
    }

    private static void restoreSpacing(TextView view) {
        Object saved = view.getTag(SPACING);
        if (!(saved instanceof Spacing)) return;
        Spacing original = (Spacing) saved;
        if (view.getLineSpacingExtra() != original.extra || view.getLineSpacingMultiplier() != original.multiplier) {
            view.setLineSpacing(original.extra, original.multiplier);
        }
    }

    private static Spacing spacing(TextView view) {
        Object saved = view.getTag(SPACING);
        if (saved instanceof Spacing) return (Spacing) saved;
        Spacing original = new Spacing(view.getLineSpacingExtra(), view.getLineSpacingMultiplier());
        view.setTag(SPACING, original);
        return original;
    }

    private static final class Spacing {
        final float extra;
        final float multiplier;

        Spacing(float extra, float multiplier) {
            this.extra = extra;
            this.multiplier = multiplier;
        }
    }

    // =========================================================================
    // Settings
    // =========================================================================

    static SharedPreferences modernPrefs(Context context) {
        SharedPreferences prefs = sModern;
        if (prefs != null) return prefs;
        synchronized (ModernFonts.class) {
            if (sModern != null) return sModern;
            prefs = context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            if (!prefs.contains(KEY_PRESET)) seedModern(prefs);
            prefs.registerOnSharedPreferenceChangeListener(WATCH);
            sModern = prefs;
            return prefs;
        }
    }

    private static SharedPreferences joeyPrefs(Context context) {
        SharedPreferences prefs = sJoey;
        if (prefs != null) return prefs;
        prefs = context.getApplicationContext().getSharedPreferences(JOEY_PREFS, Context.MODE_PRIVATE);
        sJoey = prefs;
        return prefs;
    }

    private static SharedPreferences.Editor prefsEdit(Context context) {
        return modernPrefs(context).edit();
    }

    /** Close to the system font Modern used before, with weight, width, and spacing kept. */
    private static void seedModern(SharedPreferences prefs) {
        SharedPreferences.Editor editor = prefs.edit();
        for (String key : FACE_KEYS) editor.putString(key, modernFace(key));
        editor.putInt(TITLE_SIZE, 16)
                .putInt(COMMENT_SIZE, 14)
                .putInt(COMMENT_INFO_SIZE, 10)
                .putInt(POST_INFO_SIZE, 12)
                .putInt(QA_SIZE, 14)
                .putBoolean(SAME_INFO, false)
                .putString(KEY_LABELS, LABELS_MODERN)
                .putString(KEY_PRESET, PRESET_MODERN)
                .commit();
    }

    private static boolean isFaceKey(String key) {
        for (String face : FACE_KEYS) if (face.equals(key)) return true;
        return false;
    }

    /** The Modern preset. Joey's condensed info line keeps a condensed system font. */
    private static String modernFace(String key) {
        return COMMENT_INFO_FACE.equals(key) ? SYSTEM_CONDENSED : SYSTEM;
    }

    /** Joey's own defaults, from FontGuy. */
    private static String joeyDefaultFace(String key) {
        switch (key) {
            case COMMENT_FACE:
            case ANSWER_FACE: return "Slab";
            case COMMENT_INFO_FACE: return "Condensed";
            case QUESTION_FACE: return "System";
            default: return "Jost_regular";
        }
    }

    private static int joeyDefaultSize(String key) {
        switch (key) {
            case TITLE_SIZE: return 16;
            case COMMENT_INFO_SIZE: return 10;
            case POST_INFO_SIZE: return 12;
            default: return 14;
        }
    }

    private static String faceKey(int role) {
        switch (role) {
            case ROLE_COMMENT_INFO: return COMMENT_INFO_FACE;
            case ROLE_POST_INFO: return POST_INFO_FACE;
            case ROLE_TITLE: return TITLE_FACE;
            case ROLE_QUESTION: return QUESTION_FACE;
            case ROLE_ANSWER: return ANSWER_FACE;
            default: return COMMENT_FACE;
        }
    }

    /** Copies Joey's own saved fonts and sizes into Modern. */
    private static void applyClassic(Context context) {
        SharedPreferences joey = joeyPrefs(context);
        SharedPreferences.Editor editor = prefsEdit(context);
        for (String key : FACE_KEYS) {
            String value = joey.getString(key, joeyDefaultFace(key));
            if (resolve(context, value) == null) value = joeyDefaultFace(key);
            editor.putString(key, value);
        }
        for (String key : SIZE_KEYS) editor.putInt(key, joey.getInt(key, joeyDefaultSize(key)));
        editor.putBoolean(SAME_INFO, joey.getBoolean(SAME_INFO, false))
                .putString(KEY_LABELS, LABELS_JOEY)
                .putString(KEY_PRESET, PRESET_CLASSIC)
                .apply();
    }

    private static void applyModern(Context context) {
        SharedPreferences.Editor editor = prefsEdit(context);
        for (String key : FACE_KEYS) editor.putString(key, modernFace(key));
        editor.putInt(TITLE_SIZE, 16)
                .putInt(COMMENT_SIZE, 14)
                .putInt(COMMENT_INFO_SIZE, 10)
                .putInt(POST_INFO_SIZE, 12)
                .putInt(QA_SIZE, 14)
                .putBoolean(SAME_INFO, false)
                .putString(KEY_LABELS, LABELS_MODERN)
                .putString(KEY_PRESET, PRESET_MODERN)
                .apply();
    }

    /** What the font hooks read, kept until the Modern file changes. */
    private static Snapshot snapshot(Context context) {
        Snapshot snapshot = sSnapshot;
        if (snapshot != null) return snapshot;
        SharedPreferences prefs = modernPrefs(context);
        snapshot = new Snapshot();
        snapshot.labels = prefs.getString(KEY_LABELS, LABELS_MODERN);
        snapshot.same = prefs.getBoolean(SAME_INFO, false);
        for (int role = ROLE_COMMENT_INFO; role <= ROLE_ANSWER; role++) {
            String key = faceKey(role);
            snapshot.faces[role] = prefs.getString(key, modernFace(key));
        }
        sSnapshot = snapshot;
        return snapshot;
    }

    private static final class Snapshot {
        String labels;
        boolean same;
        final String[] faces = new String[ROLE_ANSWER + 1];

        String face(int role) {
            if (role < ROLE_COMMENT_INFO || role > ROLE_ANSWER) return null;
            if (role == ROLE_POST_INFO && same) return faces[ROLE_COMMENT_INFO];
            return faces[role];
        }
    }

    // =========================================================================
    // Font files
    // =========================================================================

    private static File fontDir(Context context) {
        return new File(context.getApplicationContext().getFilesDir(), "d_fonts");
    }

    /** Fonts already in Joey's font folder, downloaded through Joey's own font settings. */
    private static List<String> fileFonts(Context context) {
        List<String> names = new ArrayList<>();
        File[] files = fontDir(context).listFiles();
        if (files == null) return names;
        for (File file : files) {
            if (file.isFile() && file.getName().contains(".") && usable(file)) names.add(file.getName());
        }
        java.util.Collections.sort(names, String.CASE_INSENSITIVE_ORDER);
        return names;
    }

    /** Joey's own check: the font must draw letters and digits, or Joey deletes it. */
    private static boolean usable(File file) {
        try {
            Typeface face = Typeface.createFromFile(file);
            Paint paint = new Paint();
            paint.setTypeface(face);
            Rect bounds = new Rect();
            for (String sample : new String[]{"a,", "z", "0", "9"}) {
                paint.getTextBounds(sample, 0, 1, bounds);
                if (bounds.width() == 0) return false;
            }
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    // =========================================================================
    // Popup
    // =========================================================================

    /** Settings row summary. */
    public static String summary(Context context) {
        String preset = modernPrefs(context).getString(KEY_PRESET, PRESET_MODERN);
        if (PRESET_CLASSIC.equals(preset)) return "Classic Joey";
        if (PRESET_CUSTOM.equals(preset)) return "Custom";
        return "Modern";
    }

    private static final String[][] ROWS = {
            {"Post titles", TITLE_FACE, TITLE_SIZE},
            {"Post info", POST_INFO_FACE, POST_INFO_SIZE},
            {"Comments", COMMENT_FACE, COMMENT_SIZE},
            {"Comment info", COMMENT_INFO_FACE, COMMENT_INFO_SIZE},
            {"AMA questions", QUESTION_FACE, null},
            {"AMA answers", ANSWER_FACE, null},
            {"AMA text size", null, QA_SIZE},
    };

    public static void show(Activity activity, Runnable done) {
        SharedPreferences prefs = modernPrefs(activity);
        Map<String, ?> before = new HashMap<>(prefs.getAll());
        LinearLayout page = MorpheDialog.page(activity, "Fonts",
                "Fonts and sizes in Modern. Classic keeps Joey's own font settings.");
        float density = activity.getResources().getDisplayMetrics().density;

        View modern = MorpheDialog.mode(activity, "Modern");
        View classic = MorpheDialog.mode(activity, "Classic Joey");
        LinearLayout presets = new LinearLayout(activity);
        presets.setOrientation(LinearLayout.VERTICAL);
        presets.addView(modern, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        presets.addView(classic, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        page.addView(presets);
        TextView note = new TextView(activity);
        note.setText("Classic Joey copies the fonts and sizes saved in Joey's own font settings.");
        note.setTypeface(Typeface.DEFAULT, Typeface.ITALIC);
        note.setTextColor(MorpheDialog.sub(activity));
        note.setTextSize(12);
        note.setPadding(0, Math.round(6 * density), 0, Math.round(4 * density));
        page.addView(note);

        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        Runnable[] paint = new Runnable[1];
        paint[0] = () -> {
            list.removeAllViews();
            String preset = prefs.getString(KEY_PRESET, PRESET_MODERN);
            MorpheDialog.setFilled(activity, modern, PRESET_MODERN.equals(preset));
            MorpheDialog.setFilled(activity, classic, PRESET_CLASSIC.equals(preset));
            for (String[] row : ROWS) list.addView(fontRow(activity, prefs, row, paint));
            CheckBox same = MorpheDialog.check(activity, "Post info uses comment info's font and size",
                    prefs.getBoolean(SAME_INFO, false), null);
            same.setOnCheckedChangeListener((b, checked) -> {
                prefs.edit().putBoolean(SAME_INFO, checked).putString(KEY_PRESET, PRESET_CUSTOM).apply();
                paint[0].run();
            });
            list.addView(same);
            list.addView(labelsRow(activity, prefs, paint));
        };
        paint[0].run();
        page.addView(MorpheDialog.scroller(activity, list));

        TextView doneButton = MorpheDialog.action(activity, "Done", MorpheDialog.GOLD);
        TextView resetButton = MorpheDialog.action(activity, "Reset", MorpheDialog.SUB);
        page.addView(MorpheDialog.actions(activity, resetButton, doneButton));
        AlertDialog dialog = MorpheDialog.show(activity, page, 460);
        // Back to the Modern fonts and sizes, which is what a fresh install starts with.
        resetButton.setOnClickListener(v -> {
            applyModern(activity);
            paint[0].run();
        });
        modern.setOnClickListener(v -> {
            applyModern(activity);
            paint[0].run();
        });
        classic.setOnClickListener(v -> {
            applyClassic(activity);
            paint[0].run();
        });
        doneButton.setOnClickListener(v -> dialog.dismiss());
        // MorpheDialog keeps its own dismiss listener, so closing is caught on the window.
        if (dialog.getWindow() != null) {
            dialog.getWindow().getDecorView().addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                @Override
                public void onViewAttachedToWindow(View v) {
                }

                @Override
                public void onViewDetachedFromWindow(View v) {
                    v.removeOnAttachStateChangeListener(this);
                    // Rebuilding the open screens is slow, so only when something changed.
                    if (!before.equals(new HashMap<>(prefs.getAll()))) changed(activity);
                    if (done != null) done.run();
                }
            });
        }
    }

    /** One kind of text: its font on the left, its size on the right. */
    private static View fontRow(Activity activity, SharedPreferences prefs, String[] row, Runnable[] paint) {
        float density = activity.getResources().getDisplayMetrics().density;
        String faceKey = row[1];
        String sizeKey = row[2];
        boolean follows = POST_INFO_FACE.equals(faceKey) && prefs.getBoolean(SAME_INFO, false);

        LinearLayout line = new LinearLayout(activity);
        line.setOrientation(LinearLayout.HORIZONTAL);
        line.setGravity(Gravity.CENTER_VERTICAL);
        line.setPadding(0, Math.round(6 * density), 0, Math.round(6 * density));

        LinearLayout text = new LinearLayout(activity);
        text.setOrientation(LinearLayout.VERTICAL);
        TextView title = new TextView(activity);
        title.setText(row[0]);
        title.setTextSize(15);
        title.setTextColor(MorpheDialog.text(activity));
        text.addView(title);
        if (faceKey != null) {
            String face = prefs.getString(faceKey, modernFace(faceKey));
            TextView value = new TextView(activity);
            value.setText(follows ? "Same as comment info" : label(activity, face));
            value.setTextSize(13);
            value.setTextColor(MorpheDialog.accent(activity));
            Typeface preview = follows ? null : resolve(activity, face);
            if (preview != null) value.setTypeface(preview);
            text.addView(value);
            if (!follows) {
                text.setOnClickListener(v -> chooseFont(activity, prefs, faceKey, paint));
            }
        }
        line.addView(text, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        if (sizeKey != null && !follows) {
            int size = prefs.getInt(sizeKey, joeyDefaultSize(sizeKey));
            TextView minus = MorpheDialog.action(activity, "−", MorpheDialog.TEXT);
            TextView value = new TextView(activity);
            value.setText(size + " sp");
            value.setTextColor(MorpheDialog.text(activity));
            value.setTextSize(14);
            value.setGravity(Gravity.CENTER);
            value.setMinWidth(Math.round(52 * density));
            TextView plus = MorpheDialog.action(activity, "+", MorpheDialog.TEXT);
            minus.setOnClickListener(v -> stepSize(prefs, sizeKey, -1, paint));
            plus.setOnClickListener(v -> stepSize(prefs, sizeKey, 1, paint));
            line.addView(minus);
            line.addView(value);
            line.addView(plus);
        }
        return line;
    }

    /** Joey's own limits from its Font settings. */
    private static int sizeMax(String key) {
        switch (key) {
            case TITLE_SIZE: return 24;
            case COMMENT_INFO_SIZE:
            case POST_INFO_SIZE: return 16;
            default: return 20;
        }
    }

    private static void stepSize(SharedPreferences prefs, String key, int step, Runnable[] paint) {
        int size = prefs.getInt(key, joeyDefaultSize(key)) + step;
        if (size < SIZE_MIN || size > sizeMax(key)) return;
        prefs.edit().putInt(key, size).putString(KEY_PRESET, PRESET_CUSTOM).apply();
        paint[0].run();
    }

    /** Joey's fixed labels, tags and flair: the Modern system font, or Joey's own. */
    private static View labelsRow(Activity activity, SharedPreferences prefs, Runnable[] paint) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout line = new LinearLayout(activity);
        line.setOrientation(LinearLayout.HORIZONTAL);
        line.setGravity(Gravity.CENTER_VERTICAL);
        line.setPadding(0, Math.round(10 * density), 0, Math.round(6 * density));
        LinearLayout text = new LinearLayout(activity);
        text.setOrientation(LinearLayout.VERTICAL);
        TextView title = new TextView(activity);
        title.setText("Labels and tags");
        title.setTextSize(15);
        title.setTextColor(MorpheDialog.text(activity));
        TextView sub = new TextView(activity);
        sub.setText("Flair, tags, and the small labels Joey draws in a fixed font.");
        sub.setTextSize(12);
        sub.setTextColor(MorpheDialog.sub(activity));
        text.addView(title);
        text.addView(sub);
        line.addView(text, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        boolean modernLabels = LABELS_MODERN.equals(prefs.getString(KEY_LABELS, LABELS_MODERN));
        TextView value = MorpheDialog.action(activity, modernLabels ? "System" : "Joey", MorpheDialog.TEXT);
        value.setOnClickListener(v -> {
            prefs.edit().putString(KEY_LABELS, modernLabels ? LABELS_JOEY : LABELS_MODERN)
                    .putString(KEY_PRESET, PRESET_CUSTOM).apply();
            paint[0].run();
        });
        line.addView(value);
        return line;
    }

    private static void chooseFont(Activity activity, SharedPreferences prefs, String key, Runnable[] paint) {
        List<String> names = new ArrayList<>(Arrays.asList(SYSTEM, SYSTEM_MEDIUM, SYSTEM_CONDENSED));
        names.addAll(Arrays.asList(JOEY_NAMES));
        names.addAll(fileFonts(activity));
        String current = prefs.getString(key, modernFace(key));

        LinearLayout page = MorpheDialog.page(activity, "Font", null);
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        AlertDialog[] shown = new AlertDialog[1];
        for (String name : names) {
            TextView option = MorpheDialog.action(activity, label(activity, name),
                    name.equals(current) ? MorpheDialog.GOLD : MorpheDialog.TEXT);
            option.setGravity(Gravity.CENTER_VERTICAL);
            Typeface preview = resolve(activity, name);
            if (preview != null) option.setTypeface(preview);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.bottomMargin = Math.round(8 * density);
            option.setOnClickListener(v -> {
                prefs.edit().putString(key, name).putString(KEY_PRESET, PRESET_CUSTOM).apply();
                if (shown[0] != null) shown[0].dismiss();
                paint[0].run();
            });
            list.addView(option, lp);
        }
        page.addView(MorpheDialog.scroller(activity, list));
        TextView cancel = MorpheDialog.action(activity, "Cancel", MorpheDialog.SUB);
        cancel.setOnClickListener(v -> {
            if (shown[0] != null) shown[0].dismiss();
        });
        page.addView(MorpheDialog.actions(activity, cancel));
        shown[0] = MorpheDialog.show(activity, page);
    }

    /** A readable name for a stored font. */
    private static String label(Context context, String name) {
        if (SYSTEM.equals(name)) return "System";
        if (SYSTEM_MEDIUM.equals(name)) return "System medium";
        if (SYSTEM_CONDENSED.equals(name)) return "System condensed";
        for (int i = 0; i < JOEY_NAMES.length; i++) {
            if (JOEY_NAMES[i].equals(name)) return JOEY_LABELS[i];
        }
        if (name == null) return "";
        String stem = name.replaceAll("(?i)\\.(ttf|otf)$", "").replace('_', ' ');
        return stem.replaceAll("(?<=[a-z])(?=[A-Z])", " ").replace('-', ' ').trim();
    }

    /** Joey reads fonts as views are drawn, so the open screens are rebuilt once. */
    private static void changed(Activity activity) {
        sSnapshot = null;
        try {
            ModernUi.refreshLive(activity);
        } catch (Throwable t) {
            Log.w(TAG, "refresh", t);
        }
    }
}
