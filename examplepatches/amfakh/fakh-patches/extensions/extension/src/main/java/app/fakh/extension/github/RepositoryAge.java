/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.text.format.DateUtils;

import java.time.Instant;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.fakh.extension.shared.AppRuntime;
import app.fakh.extension.shared.Features;

/**
 * When a repository was created, shown on its screen. The app does not ask GitHub for the date, so the patch adds it to
 * the repository query, reads it while the app parses the answer and keeps it under the repository's id. It is saved
 * because the app can draw a repository from its own cache, which does not hold the date.
 */
@SuppressWarnings("unused")
public final class RepositoryAge {
    // The id read just before a date, on the thread that parses that answer.
    private static final ThreadLocal<String> ID = new ThreadLocal<>();

    // The model drawn last and its id, so that its long toString is read once.
    private static Object drawn;
    private static String drawnId;

    private RepositoryAge() {
    }

    /**
     * Adds the two fields of the patched query to the names a response parser looks for.
     *
     * @param names The app's field names.
     * @return Those names, then the id's alias and the date.
     */
    public static List<Object> names(List<?> names) {
        List<Object> all = new ArrayList<>(names);
        all.add("fakhKey");
        all.add("createdAt");
        return all;
    }

    /**
     * Takes the id of the repository whose date comes next.
     *
     * @param id The value of {@code fakhKey}.
     */
    public static void id(Object id) {
        ID.set(id instanceof String ? (String) id : null);
    }

    /**
     * Saves the date of the repository last given to {@link #id}.
     *
     * @param date The value of {@code createdAt}.
     */
    public static void created(Object date) {
        String id = ID.get();
        SharedPreferences saved = saved();
        if (id == null || saved == null || !(date instanceof String)) return;
        if (!date.equals(saved.getString(id, null))) saved.edit().putString(id, (String) date).apply();
    }

    /**
     * The line about a repository's creation: the date with Show exact time, otherwise the age.
     *
     * @param repository The app's model of the repository.
     * @return The text, or null while the date is unknown.
     */
    public static String text(Object repository) {
        String id = idOf(repository);
        SharedPreferences saved = saved();
        String date = saved == null || id == null ? null : saved.getString(id, null);
        if (date == null || !Features.on("fakh_repository_age")) return null;
        try {
            Instant created = Instant.parse(date);
            if (ExactTime.on()) {
                return "Created " + DateUtils.formatDateTime(AppRuntime.application(), created.toEpochMilli(),
                        DateUtils.FORMAT_SHOW_DATE | DateUtils.FORMAT_ABBREV_MONTH);
            }
            LocalDate day = created.atZone(ZoneId.systemDefault()).toLocalDate();
            return "Created " + ago(Period.between(day, LocalDate.now()));
        } catch (DateTimeParseException e) {
            return null;
        }
    }

    /**
     * The app's calendar icon.
     *
     * @return Its drawable id.
     */
    @SuppressWarnings("DiscouragedApi")
    public static int icon() {
        Application app = AppRuntime.application();
        return app.getResources().getIdentifier("ic_calendar_16", "drawable", app.getPackageName());
    }

    /**
     * The id of a repository model. R8 renames the model's fields, but its toString still names them, with the id right
     * before the database id.
     */
    private static String idOf(Object repository) {
        if (repository != drawn) {
            Matcher found = Pattern.compile(", id=([\\w=-]+), databaseId=").matcher(String.valueOf(repository));
            drawnId = found.find() ? found.group(1) : null;
            drawn = repository;
        }
        return drawnId;
    }

    /** An age in its largest unit, such as "9 years ago". */
    private static String ago(Period age) {
        if (age.getYears() > 0) return ago(age.getYears(), "year");
        if (age.getMonths() > 0) return ago(age.getMonths(), "month");
        if (age.getDays() > 0) return ago(age.getDays(), "day");
        return "today";
    }

    /** A count of one unit in the past. */
    private static String ago(int count, String unit) {
        return count + " " + unit + (count == 1 ? "" : "s") + " ago";
    }

    /** Where the dates are kept, or null before the app has started. */
    private static SharedPreferences saved() {
        Application app = AppRuntime.application();
        return app == null ? null : app.getSharedPreferences("fakh_repository_age", Context.MODE_PRIVATE);
    }
}
