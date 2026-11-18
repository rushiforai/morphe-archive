/*
 * Forked from https://github.com/SysAdminDoc/HushGram at 9aecf67 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtelegram.extension.telegram.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ReplacementSpan;
import android.view.View;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.settings.Setting;

/**
 * A small dot beside a switch this build added since the settings were last opened, and beside the
 * closed section heading it's under, so a long page shows what's new (#96).
 *
 * <p>There is no list of which release added what. The keys of the rows the person has already been
 * shown are kept in a file of their own, apart from the settings, so a backup neither exports nor
 * imports them. The first time the settings open with none stored, every row there now counts as
 * seen: a fresh install never shows a dot. A row whose key isn't in the set is new. Closing a
 * section (or the settings while it's open) adds its rows, so a dot shows for the visit that
 * reveals it and is gone by the next.
 *
 * <p>Only rows that are a saved setting in one of the sections count. A row that comes and goes on
 * its own would otherwise read as new each time it came back. Anything that goes wrong shows no dot.
 */
final class NewRowDots {
    static final String FILE = "hushtelegram_new_dots";
    static final String SEEN = "seen";
    /** Marks the dot's tag on a title, so a test can find it. */
    static final String TAG = "hushtelegram_new_dot";

    private final SharedPreferences store;
    private final Set<String> seen = new HashSet<>();
    /** Every key the sections hold, so a row listed nowhere else can't stay new for good. */
    private final Set<String> listed = new HashSet<>();
    /** Each section heading and the category it opens. */
    private final Map<Preference, PreferenceCategory> openers = new IdentityHashMap<>();
    private final Map<PreferenceCategory, List<Preference>> pages;
    /** A search lists rows from every section, so none of them is shown as new there. */
    private boolean searching;

    /** Reads what's been seen, or marks everything in [pages] seen when nothing is stored yet. */
    private NewRowDots(Context context, Map<PreferenceCategory, List<Preference>> pages) {
        this.pages = pages;
        for (List<Preference> rows : pages.values()) {
            for (Preference row : rows) if (counts(row)) listed.add(row.getKey());
        }
        store = context.getApplicationContext().getSharedPreferences(FILE, Context.MODE_PRIVATE);
        Set<String> stored = null;
        try {
            stored = store.getStringSet(SEEN, null);
        } catch (RuntimeException unreadable) {
            // A value of another kind is no set: start again, as on a first open.
        }
        if (stored != null) {
            seen.addAll(stored);
            return;
        }
        seen.addAll(listed);
        save();
    }

    /** The dots for a page built from [pages], or null when that can't be done. */
    @Nullable
    static NewRowDots start(Context context, Map<PreferenceCategory, List<Preference>> pages) {
        try {
            return new NewRowDots(context, pages);
        } catch (RuntimeException unavailable) {
            return null;
        }
    }

    /** Remembers which category [opener] opens, so it shows a dot while that category has a new row. */
    void opens(Preference opener, PreferenceCategory category) {
        openers.put(opener, category);
    }

    /** Whether a search is on, which shows no dots. */
    void searching(boolean on) {
        searching = on;
    }

    /** The person has had [category] open: its rows are no longer new. */
    void left(PreferenceCategory category) {
        try {
            List<Preference> rows = pages.get(category);
            if (rows != null) leave(rows);
        } catch (RuntimeException ignored) {
            // The dot stays a visit longer.
        }
    }

    private static boolean counts(Preference row) {
        String key = row.getKey();
        return key != null && Setting.getSettingFromPath(key) != null;
    }

    private void leave(List<Preference> rows) {
        int before = seen.size();
        for (Preference row : rows) if (counts(row)) seen.add(row.getKey());
        if (seen.size() != before) save();
    }

    private void save() {
        try {
            store.edit().putStringSet(SEEN, new HashSet<>(seen)).apply();
        } catch (RuntimeException ignored) {
            // The dot comes back next time.
        }
    }

    private boolean isNew(Preference row) {
        return counts(row) && listed.contains(row.getKey()) && !seen.contains(row.getKey());
    }

    private boolean fresh(Preference row, boolean open) {
        if (searching) return false;
        PreferenceCategory category = openers.get(row);
        if (category != null) {
            if (open) return false;
            List<Preference> rows = pages.get(category);
            if (rows == null) return false;
            for (Preference each : rows) if (isNew(each)) return true;
            return false;
        }
        return isNew(row);
    }

    /**
     * Paints [row]'s dot, or takes the old one off, as the page that is showing says. [open] is
     * whether [preference], when it's a section heading, has its section open, which moves the dot
     * from the heading to the new rows under it.
     */
    void paint(View row, Preference preference, boolean open, int accent) {
        boolean fresh = false;
        try {
            fresh = fresh(preference, open);
        } catch (RuntimeException failed) {
            // No dot.
        }
        dot(row, fresh, accent);
    }

    /**
     * Puts the dot right after [row]'s title text when [fresh], and takes any earlier one off. The
     * dot is a character of the title, so it follows the reading direction, wraps with the title at
     * a large text size and can't leave the row. A row's title spans the whole row up to its switch,
     * so a drawable at the title's end stood by the switch, far from a short title (S22, 2026-11-17).
     */
    private static void dot(View row, boolean fresh, int accent) {
        try {
            TextView title = row.findViewById(android.R.id.title);
            if (title == null) return;
            CharSequence text = plain(title.getText());
            if (!fresh) {
                if (TAG.equals(title.getTag())) {
                    if (text != title.getText()) title.setText(text);
                    title.setTag(null);
                    title.setContentDescription(null);
                }
                return;
            }
            float density = row.getResources().getDisplayMetrics().density;
            SpannableStringBuilder marked = new SpannableStringBuilder(text);
            int at = marked.length();
            marked.append(HOLDER);
            marked.setSpan(new Dot(accent, Math.round(8 * density), Math.round(6 * density)), at, at + 1,
                    Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            title.setText(marked);
            title.setTag(TAG);
            title.setContentDescription(text + ", " + L10n.t("New"));
        } catch (RuntimeException ignored) {
            // No dot.
        }
    }

    /** The object replacement character, which the dot draws over. */
    static final char HOLDER = (char) 0xFFFC;

    /** [text] without the dot an earlier paint put after it. */
    static CharSequence plain(CharSequence text) {
        if (!(text instanceof Spanned)) return text;
        Spanned spanned = (Spanned) text;
        Dot[] dots = spanned.getSpans(0, spanned.length(), Dot.class);
        if (dots.length == 0) return text;
        int end = spanned.length();
        for (Dot each : dots) end = Math.min(end, spanned.getSpanStart(each));
        return spanned.subSequence(0, end);
    }

    /** A filled circle [size] wide with [gap] on each side, centred on the text's middle. */
    static final class Dot extends ReplacementSpan {
        final int color;
        private final int size;
        private final int gap;

        Dot(int color, int size, int gap) {
            this.color = color;
            this.size = size;
            this.gap = gap;
        }

        @Override public int getSize(Paint paint, CharSequence text, int start, int end, @Nullable Paint.FontMetricsInt metrics) {
            return gap + size + gap;
        }

        @Override public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom, Paint paint) {
            int was = paint.getColor();
            Paint.Style style = paint.getStyle();
            paint.setColor(color);
            paint.setStyle(Paint.Style.FILL);
            Paint.FontMetrics metrics = paint.getFontMetrics();
            float radius = size / 2f;
            canvas.drawCircle(x + gap + radius, y + (metrics.ascent + metrics.descent) / 2f, radius, paint);
            paint.setColor(was);
            paint.setStyle(style);
        }
    }
}
