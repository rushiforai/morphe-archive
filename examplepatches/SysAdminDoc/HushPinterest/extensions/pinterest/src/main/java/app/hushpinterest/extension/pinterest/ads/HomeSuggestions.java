/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Pattern;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.DiagnosticCategory;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.preference.LogBufferManager;

/**
 * Hide Home suggestions: the rows Pinterest puts between pins on Home to point you at more of
 * its ideas, told apart by what the model itself carries.
 *
 * <p>"More ideas for your board" is a card of its own kind: a board's id, name and header text with
 * a strip of images and their colors, and no story type. No pin and no story has that set of
 * fields. "Inspired by your interests" is a story, known by its story type. Pins, boards you
 * follow and everything else stay.
 */
public final class HomeSuggestions {
    private HomeSuggestions() {}

    /** The removal's own name, counted under Filter feed like a muted pin. */
    static final String SUGGESTION = "Home suggestion";

    /** The fields only the "More ideas for your board" card carries together. */
    private static final String[] BOARD_IDEAS_CARD = {"board_id", "board_name", "header_text", "image_dominant_color_rgb"};

    // Story types of Home's own idea rows, as the String a story carries or the typed enum's
    // constant name. A board's own "More ideas" tab and search keep theirs.
    static final Set<String> STORIES = new HashSet<>(Arrays.asList(
            "homefeed_more_ideas_feed_story", "homefeed_more_ideas_header"));

    /** Whether the switch is on and the settings can be read; never throws. */
    static boolean active() {
        try {
            return Utils.settingsReady() && Settings.HIDE_HOME_SUGGESTIONS.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.FILTER_FEED, "switch read", t);
            return false;
        }
    }

    /** True when [item] is one of Home's suggestion rows. */
    static boolean isSuggestion(Object item) {
        if (item == null) return false;
        Map<String, Field> fields = ModelFields.of(item.getClass());
        if (isBoardIdeasCard(fields)) return true;
        Object story = ModelFields.read(fields, item, Ads.STORY_TYPE);
        String name = story instanceof Enum ? ((Enum<?>) story).name()
                : story instanceof String ? (String) story : null;
        return name != null && STORIES.contains(name.toLowerCase(Locale.ROOT));
    }

    /** The board ideas card's class: every one of its fields, and no story type. */
    static boolean isBoardIdeasCard(Map<String, Field> fields) {
        if (fields.containsKey(Ads.STORY_TYPE)) return false;
        for (String json : BOARD_IDEAS_CARD) {
            if (!fields.containsKey(json)) return false;
        }
        return true;
    }

    /** A story type prints only when it reads like a name, so a type carrying text never reaches the log. */
    private static final Pattern STORY_NAME = Pattern.compile("[A-Za-z0-9_]{1,64}");

    /** Past this many JSON names a class shows only its count, as a pin's couple of hundred would. */
    static final int SHAPE_NAMES_MAX = 40;

    /** Past this many runs a page line stops and counts the runs it left out. */
    static final int PAGE_RUNS_MAX = 40;

    /** Past this many kinds the shapes section takes no more, so a long session can't grow it without end. */
    static final int SHAPES_MAX = 64;

    /** Pinterest's model package, left off a name so a page line stays short. */
    private static final String MODEL_PACKAGE = "com.pinterest.api.model.";

    /** Each kept kind's JSON names by its {@link #name}, once each while the app runs. */
    private static final Map<String, String> SHAPES = new ConcurrentHashMap<>();

    /**
     * The report's [HOME ITEM SHAPES] section: one line of JSON names for each kind of item a Home
     * page kept, built when the report is, so it arrives whole however many events came after and
     * after Clear diagnostic data. Field names only, a fact about the build like the patch list.
     */
    static final LogBufferManager.ReportSection SHAPES_REPORT = new LogBufferManager.ReportSection() {
        @Override public String title() { return "HOME ITEM SHAPES"; }

        @Override public List<String> lines() {
            List<String> lines = new ArrayList<>();
            for (Map.Entry<String, String> shape : new TreeMap<>(SHAPES).entrySet()) {
                lines.add(shape.getKey() + ":" + shape.getValue());
            }
            return lines;
        }
    };

    /**
     * Debug logging with the switch on: what each page kept, so a report from a Home whose suggestion
     * rows got through says what those rows are (#30). One "Kept page" line names each kept item's
     * class, with the story type of a module, and counts a run of the same kind once. Each kind that
     * isn't a module gets its JSON names in {@link #SHAPES_REPORT} the first time it's kept. Names
     * only, never a title, a text value or an account field. Never throws.
     */
    static void logKept(List<?> kept) {
        try {
            if (kept == null) return;
            String page = page(kept);
            Logger.diagnosticDebug(DiagnosticCategory.FEED, "HomeSuggestions", () -> "Kept page: " + page);
            for (Object item : kept) {
                if (item == null || ModuleItems.isModule(item)) continue;
                String name = name(item.getClass());
                if (SHAPES.containsKey(name) || SHAPES.size() >= SHAPES_MAX) continue;
                if (SHAPES.putIfAbsent(name, names(item.getClass())) == null) {
                    LogBufferManager.registerReportSection(SHAPES_REPORT);
                }
            }
        } catch (Throwable t) {
            Logger.diagnosticDebug(DiagnosticCategory.FEED, "HomeSuggestions",
                    () -> "Kept page line failed: " + t.getClass().getSimpleName());
        }
    }

    /** "N items: a x3, b[story_type], a", each run of one label counted once; "0 items" for a page left empty. */
    static String page(List<?> kept) {
        List<String> labels = new ArrayList<>();
        List<Integer> counts = new ArrayList<>();
        for (Object item : kept) {
            String label = label(item);
            int last = labels.size() - 1;
            if (last >= 0 && labels.get(last).equals(label)) {
                counts.set(last, counts.get(last) + 1);
            } else {
                labels.add(label);
                counts.add(1);
            }
        }
        StringBuilder line = new StringBuilder().append(kept.size()).append(kept.size() == 1 ? " item" : " items");
        int runs = Math.min(labels.size(), PAGE_RUNS_MAX);
        for (int i = 0; i < runs; i++) {
            line.append(i == 0 ? ": " : ", ").append(labels.get(i));
            if (counts.get(i) > 1) line.append(" x").append(counts.get(i));
        }
        if (labels.size() > runs) line.append(", ").append(labels.size() - runs).append(" more runs");
        return line.toString();
    }

    /** An item's {@link #name}, with its story type when it's a module: "ll[ideas_for_you]". */
    private static String label(Object item) {
        if (item == null) return "null";
        String name = name(item.getClass());
        if (!ModuleItems.isModule(item)) return name;
        return name + "[" + storyName(ModelFields.read(ModelFields.of(item.getClass()), item, Ads.STORY_TYPE)) + "]";
    }

    /**
     * [type]'s full name, less Pinterest's model package. R8 gives classes in different packages the
     * same short name, so the full name is what ties a page line's kind to its shape.
     */
    static String name(Class<?> type) {
        String name = type.getName();
        return name.startsWith(MODEL_PACKAGE) ? name.substring(MODEL_PACKAGE.length()) : name;
    }

    /** A story type as it may be logged: its enum constant, a name-shaped String, or what it is instead. */
    static String storyName(Object story) {
        if (story == null) return "none";
        String name = story instanceof Enum ? ((Enum<?>) story).name() : story instanceof String ? (String) story : null;
        if (name == null) return "?";
        return STORY_NAME.matcher(name).matches() ? name : "text";
    }

    /** "name: a, b, c", [type]'s {@link #name} and its JSON names sorted, or their count past {@link #SHAPE_NAMES_MAX}. */
    static String shape(Class<?> type) {
        return name(type) + ":" + names(type);
    }

    private static String names(Class<?> type) {
        List<String> names = new ArrayList<>(ModelFields.of(type).keySet());
        if (names.isEmpty()) return " no JSON names";
        if (names.size() > SHAPE_NAMES_MAX) return " " + names.size() + " JSON names";
        Collections.sort(names);
        StringBuilder line = new StringBuilder();
        for (String name : names) line.append(line.length() == 0 ? " " : ", ").append(name);
        return line.toString();
    }

    static void clearForTests() {
        SHAPES.clear();
    }
}
