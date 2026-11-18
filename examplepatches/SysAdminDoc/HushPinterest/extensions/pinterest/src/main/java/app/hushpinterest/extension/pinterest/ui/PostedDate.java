/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.graphics.Typeface;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.text.DateFormat;
import java.util.Date;
import java.util.Map;
import java.util.WeakHashMap;

import app.hushpinterest.extension.pinterest.actions.PinFacts;
import app.hushpinterest.extension.pinterest.ads.ModelFields;
import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.ResourceType;
import app.hushpinterest.extension.shared.ResourceUtils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/**
 * Puts the day a pin was posted under its title when the pin is opened. Pinterest sends that date
 * with every pin and never shows it. The title module holds the title row alone, side by side, so
 * the line turns it into a column first; a module laid out any other way gets no line. Show image
 * size shares the line, so the two read side by side and each works without the other.
 */
public final class PostedDate {
    private PostedDate() {}

    /** Marks the one line this adds, so a module that takes another pin updates it instead of adding a second. */
    static final String LINE_TAG = "hushpinterest_posted_date";

    /** The id Pinterest gives the title row's chevron, the one that opens the pin's description. */
    static final String TITLE_CHEVRON = "closeup_metadata_expand_chevron";

    /** The pin's JSON name for the time it was posted. */
    static final String CREATED_AT = "created_at";

    /** 2009-01-01 UTC, before Pinterest's first pin. An earlier time is a placeholder, not a date. */
    static final long EARLIEST = 1_230_768_000_000L;

    /** Room for a phone clock that runs a little behind the server's. */
    private static final long CLOCK_SLACK = 24L * 60 * 60 * 1000;

    /** The line's two parts, in the order they read. */
    private static final int DATE = 0, SIZE = 1;

    /** What goes between the line's parts, and between a picture's width and height. */
    private static final char DOT = (char) 0xB7, TIMES = (char) 0xD7;

    /** Below this a picture's megapixels would read as nothing. */
    private static final double SMALLEST_MEGAPIXELS = 0.1;

    /** What each line holds now, so one part can change without losing the other. Main thread only. */
    private static final Map<TextView, String[]> PARTS = new WeakHashMap<>();

    /**
     * Called as the closeup's title module takes its pin, ahead of Pinterest's own update. Off,
     * paused or with no usable date, the date leaves the line and nothing else changes.
     */
    public static void show(View module, Object pin) {
        try {
            if (!(module instanceof LinearLayout)) return;
            Date posted = UiHooks.enabled(FamilyNames.SHOW_POSTED_DATE, Settings.SHOW_POSTED_DATE) ? posted(pin) : null;
            String text = posted == null ? null : text(posted);
            if (update((LinearLayout) module, DATE, text, FamilyNames.SHOW_POSTED_DATE, "posted date")) {
                HookStatus.counted(FamilyNames.SHOW_POSTED_DATE, "posted date shown");
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHOW_POSTED_DATE, "posted date line", failure);
        }
    }

    /**
     * Called at the same moment for the picture's size. Off, paused, for a video or for a pin that
     * came without sizes, the size leaves the line and nothing else changes.
     */
    public static void showSize(View module, Object pin) {
        try {
            if (!(module instanceof LinearLayout)) return;
            int[] size = UiHooks.enabled(FamilyNames.SHOW_IMAGE_SIZE, Settings.SHOW_IMAGE_SIZE) ? PinFacts.imageSize(pin) : null;
            String text = size == null ? null : sizeText(size);
            if (update((LinearLayout) module, SIZE, text, FamilyNames.SHOW_IMAGE_SIZE, "image size")) {
                HookStatus.counted(FamilyNames.SHOW_IMAGE_SIZE, "image size shown");
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHOW_IMAGE_SIZE, "image size line", failure);
        }
    }

    /** Sets one part of the line, adding the line when there's something to show. True when it shows. */
    private static boolean update(LinearLayout layout, int part, @Nullable String text, String family, String what) {
        TextView line = line(layout);
        if (text == null) {
            if (line != null) render(line, part, null);
            return false;
        }
        if (line == null) line = add(layout, family, what);
        if (line == null) return false;
        render(line, part, text);
        return true;
    }

    private static void render(TextView line, int part, @Nullable String text) {
        String[] parts = PARTS.get(line);
        if (parts == null) {
            parts = new String[2];
            PARTS.put(line, parts);
        }
        parts[part] = text;
        String date = parts[DATE], size = parts[SIZE];
        if (date == null && size == null) {
            line.setVisibility(View.GONE);
            return;
        }
        line.setText(date == null ? size : size == null ? date : date + " " + DOT + " " + size);
        line.setVisibility(View.VISIBLE);
    }

    /** Width by height, then the megapixels unless the picture is too small for them to mean anything. */
    static String sizeText(int[] size) {
        String text = String.format(L10n.locale(), "%d %c %d", size[0], TIMES, size[1]);
        double megapixels = size[0] * (double) size[1] / 1_000_000d;
        if (megapixels >= SMALLEST_MEGAPIXELS) text += " " + DOT + " " + String.format(L10n.locale(), "%.1f MP", megapixels);
        return L10n.isolate(text);
    }

    /** When [pin] was posted, or null when it carries no date or one that can't be right. */
    @Nullable
    static Date posted(@Nullable Object pin) {
        if (pin == null) return null;
        Object value = ModelFields.read(ModelFields.of(pin.getClass()), pin, CREATED_AT);
        if (!(value instanceof Date)) return null;
        long at = ((Date) value).getTime();
        return at < EARLIEST || at > System.currentTimeMillis() + CLOCK_SLACK ? null : (Date) value;
    }

    /** "Posted" and the day, in the language HushPinterest shows and the phone's time zone. */
    static String text(Date posted) {
        String day = DateFormat.getDateInstance(DateFormat.MEDIUM, L10n.locale()).format(posted);
        return L10n.f("Posted %1$s", L10n.isolate(day));
    }

    @Nullable
    static TextView line(ViewGroup layout) {
        for (int i = 0; i < layout.getChildCount(); i++) {
            View child = layout.getChildAt(i);
            if (child instanceof TextView && LINE_TAG.equals(child.getTag())) return (TextView) child;
        }
        return null;
    }

    /**
     * Adds the line under the title row, in the row's text color and font at a smaller size, lined
     * up with the row's padding. Null when the module holds anything besides the row.
     */
    @Nullable
    private static TextView add(LinearLayout layout, String family, String what) {
        if (layout.getChildCount() != 1) {
            HookStatus.counted(family, what + " skipped: title module holds more than its row");
            return null;
        }
        View row = layout.getChildAt(0);
        // 14.43.0 merged the title module with the translation toggle's module, so the same update
        // runs for both. Only the title row carries the chevron that opens the description.
        if (!holdsTitleChevron(row)) {
            HookStatus.counted(family, what + " skipped: module holds no title row");
            return null;
        }
        TextView line = new TextView(layout.getContext());
        line.setTag(LINE_TAG);
        line.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        line.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        TextView title = firstText(row);
        if (title != null) {
            line.setTextColor(title.getTextColors());
            line.setTypeface(Typeface.create(title.getTypeface(), Typeface.NORMAL));
        }
        line.setAlpha(0.7f);
        float density = layout.getResources().getDisplayMetrics().density;
        line.setPaddingRelative(row.getPaddingStart(), 0, row.getPaddingEnd(), Math.round(8 * density));
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.addView(line, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return line;
    }

    private static boolean holdsTitleChevron(View row) {
        int id = ResourceUtils.getIdentifier(row.getContext(), ResourceType.ID, TITLE_CHEVRON);
        return id != 0 && row.findViewById(id) != null;
    }

    /** The first text view in [view], depth first: the pin's title in the title row. */
    @Nullable
    private static TextView firstText(View view) {
        if (view instanceof TextView) return (TextView) view;
        if (!(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            TextView found = firstText(group.getChildAt(i));
            if (found != null) return found;
        }
        return null;
    }
}
