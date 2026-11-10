/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.view.View;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * The "Loki Patches" row in LinkedIn's native "Me" panel, directly under "Saved posts".
 *
 * <p>The row is a copy of the panel's own section view data, so it looks like the rows around it,
 * and its header click is redirected to the extension's settings activity.
 */
@SuppressWarnings("unused")
public final class NavPanelPatch {
    private static final String PANEL_TYPES = "com.linkedin.android.home.navpanel.";
    static final String TITLE = "Loki Patches";

    /** Injected before every return of HomeNavPanelTransformer.transform(...). */
    public static AbstractList<Object> addSettingsItem(Object panel) {
        @SuppressWarnings("unchecked")
        AbstractList<Object> sections = (AbstractList<Object>) panel;
        if (sections == null) return null;
        try {
            return withSettingsRow(sections);
        } catch (Throwable failure) {
            Diagnostics.error("addSettingsItem failed", failure);
            return sections;
        }
    }

    private static AbstractList<Object> withSettingsRow(AbstractList<Object> sections) throws Exception {
        Class<?> sectionData = Class.forName(PANEL_TYPES + "HomeNavPanelSectionV2ViewData");
        Class<?> sectionTypes = Class.forName(PANEL_TYPES + "SectionType");
        Class<?> chevronTypes = Class.forName(PANEL_TYPES + "HomeNavPanelSectionChevronType");
        Object savedPostsType = sectionTypes.getField("SAVED_POSTS").get(null);
        Object chevronRight = chevronTypes.getField("RIGHT").get(null);

        ArrayList<Object> rows = new ArrayList<>(sections);
        if (Settings.hideGames()) removeGamesRows(rows, sectionTypes);
        // The panel is rebuilt on every visit; never end up with two of our rows.
        if (alreadyHasSettingsRow(rows, sectionData)) return rows;

        Object settingsRow = buildRow(sectionData, savedPostsType, chevronRight);
        rows.add(indexAfter(rows, savedPostsType), settingsRow);
        return rows;
    }

    private static boolean alreadyHasSettingsRow(List<Object> rows, Class<?> sectionData) {
        for (int i = 0; i < rows.size(); i++) {
            Object row = rows.get(i);
            if (!sectionData.isInstance(row)) continue;
            String title = String.valueOf(Reflect.get(row, "title"));
            if (TITLE.equals(title)) return true;
        }
        return false;
    }

    /**
     * Where the new row goes: right after "Saved posts". Both section shapes (V2 section data on
     * older builds, a plain section on 4.1.1261) carry a sectionType, so that is what is compared.
     */
    private static int indexAfter(List<Object> rows, Object sectionType) {
        for (int i = 0; i < rows.size(); i++) {
            Object row = rows.get(i);
            Object rowType = Reflect.get(row, "sectionType");
            if (rowType == sectionType) return i + 1;
        }
        return rows.size();
    }

    /**
     * Removes every "Games" row for "Hide games". A build without a GAMES section type keeps its
     * panel exactly as it was.
     */
    private static void removeGamesRows(List<Object> rows, Class<?> sectionTypes) {
        Object gamesType;
        try {
            gamesType = sectionTypes.getField("GAMES").get(null);
        } catch (ReflectiveOperationException noGamesHere) {
            return;
        }
        for (int i = rows.size() - 1; i >= 0; i--) {
            Object rowType = Reflect.get(rows.get(i), "sectionType");
            if (rowType != gamesType) continue;
            rows.remove(i);
            Settings.debugLog("hide games section");
        }
    }

    /**
     * Builds the row with whichever constructor this build offers. Up to 4.1.1261 it takes
     * (CharSequence, SectionType, ChevronType, List, AnalyticsWidgetViewData); newer builds take a
     * String title and append (List collapsedStackItems, int overflowCount, int defaultsMask).
     * Arguments past the third get a harmless default: empty list, 0, false.
     */
    private static Object buildRow(Class<?> sectionData, Object sectionType, Object chevron) throws Exception {
        Constructor<?>[] available = sectionData.getConstructors();
        for (int c = 0; c < available.length; c++) {
            Constructor<?> candidate = available[c];
            Class<?>[] parameters = candidate.getParameterTypes();
            if (parameters.length < 3) continue;
            if (!parameters[0].isAssignableFrom(String.class)) continue;
            if (!parameters[1].isInstance(sectionType)) continue;
            if (!parameters[2].isInstance(chevron)) continue;
            return candidate.newInstance(argumentsFor(parameters, sectionType, chevron));
        }
        throw new NoSuchMethodException(sectionData.getName() + ".<init>(title, SectionType, ChevronType, ...)");
    }

    private static Object[] argumentsFor(Class<?>[] parameters, Object sectionType, Object chevron) {
        Object[] arguments = new Object[parameters.length];
        arguments[0] = TITLE;
        arguments[1] = sectionType;
        arguments[2] = chevron;
        for (int i = 3; i < parameters.length; i++) {
            Class<?> type = parameters[i];
            if (type == List.class) arguments[i] = Collections.emptyList();
            else if (type == int.class) arguments[i] = 0;
            else if (type == boolean.class) arguments[i] = false;
        }
        return arguments;
    }

    /** Injected before every return of HomeNavPanelSectionV2Presenter.onBind(ViewDataBinding). */
    public static void onSectionBind(Object presenter) {
        try {
            Object sectionData = Reflect.get(presenter, "viewData");
            String title = String.valueOf(Reflect.get(sectionData, "title"));
            if (!TITLE.equals(title)) return;
            View.OnClickListener openSettings = clicked -> SettingsActivity.open(activityBehind(clicked.getContext()));
            Field clickField = Reflect.field(presenter.getClass(), "sectionHeaderClickListener");
            if (clickField == null) return;
            clickField.set(presenter, openSettings);
        } catch (Throwable failure) {
            Diagnostics.error("onSectionBind failed", failure);
        }
    }

    /** The Activity behind a (possibly wrapped) view context, or the context itself if there is none. */
    private static Context activityBehind(Context context) {
        Context current = context;
        while (current instanceof ContextWrapper) {
            if (current instanceof Activity) return current;
            ContextWrapper wrapper = (ContextWrapper) current;
            current = wrapper.getBaseContext();
        }
        return context;
    }
}
