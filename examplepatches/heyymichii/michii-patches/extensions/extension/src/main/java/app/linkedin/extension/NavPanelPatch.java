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
 * Adds a "Michii Patches" entry to the native "Me" panel, right below "Saved posts".
 * It reuses the panel's own section view data, and its click is redirected to SettingsActivity.
 */
@SuppressWarnings("unused")
public final class NavPanelPatch {
    private static final String PACKAGE = "com.linkedin.android.home.navpanel.";
    static final String TITLE = "Michii Patches";

    /** Injected before every return of HomeNavPanelTransformer.transform(HomeNavPanelAggregateResponse). */
    public static AbstractList<Object> addSettingsItem(Object panel) {
        @SuppressWarnings("unchecked")
        AbstractList<Object> list = (AbstractList<Object>) panel;
        if (list == null) return null;
        try {
            Class<?> viewData = Class.forName(PACKAGE + "HomeNavPanelSectionV2ViewData");
            Class<?> sectionType = Class.forName(PACKAGE + "SectionType");
            Class<?> chevronType = Class.forName(PACKAGE + "HomeNavPanelSectionChevronType");
            Object savedPosts = sectionType.getField("SAVED_POSTS").get(null);
            Object chevronRight = chevronType.getField("RIGHT").get(null);

            ArrayList<Object> result = new ArrayList<>(list);
            if (Settings.hideGames()) removeGames(result, sectionType);

            for (Object item : result) {
                if (viewData.isInstance(item) && TITLE.equals(String.valueOf(Reflect.get(item, "title")))) {
                    return result;
                }
            }

            Object entry = newSection(viewData, savedPosts, chevronRight);

            // "Saved posts" is a section V2 in older builds and a plain section in 4.1.1261; both have a sectionType.
            int index = result.size();
            for (int i = 0; i < result.size(); i++) {
                Object item = result.get(i);
                if (Reflect.get(item, "sectionType") == savedPosts) {
                    index = i + 1;
                    break;
                }
            }
            result.add(index, entry);
            return result;
        } catch (Throwable t) {
            Diagnostics.error("addSettingsItem failed", t);
            return list;
        }
    }

    /**
     * Removes the "Games" section (any panel item whose sectionType is GAMES), for "Hide games". Builds without
     * it are left as they are.
     */
    private static void removeGames(List<Object> items, Class<?> sectionType) {
        Object games;
        try {
            games = sectionType.getField("GAMES").get(null);
        } catch (ReflectiveOperationException e) {
            return;
        }
        for (int i = items.size() - 1; i >= 0; i--) {
            Object item = items.get(i);
            if (Reflect.get(item, "sectionType") == games) {
                items.remove(i);
                Settings.debugLog("hide games section");
            }
        }
    }

    /**
     * Builds a section through whichever constructor this LinkedIn build has. Older builds take
     * (CharSequence, SectionType, ChevronType, List, AnalyticsWidgetViewData); newer ones take a String
     * title and append (List collapsedStackItems, int overflowCount, int defaultsMask).
     */
    private static Object newSection(Class<?> viewData, Object sectionType, Object chevron) throws Exception {
        for (Constructor<?> constructor : viewData.getConstructors()) {
            Class<?>[] types = constructor.getParameterTypes();
            if (types.length < 3 || !types[0].isAssignableFrom(String.class)
                    || !types[1].isInstance(sectionType) || !types[2].isInstance(chevron)) continue;
            Object[] args = new Object[types.length];
            args[0] = TITLE;
            args[1] = sectionType;
            args[2] = chevron;
            for (int i = 3; i < types.length; i++) {
                if (types[i] == List.class) args[i] = Collections.emptyList();
                else if (types[i] == int.class) args[i] = 0;
                else if (types[i] == boolean.class) args[i] = false;
            }
            return constructor.newInstance(args);
        }
        throw new NoSuchMethodException(viewData.getName() + ".<init>(title, SectionType, ChevronType, ...)");
    }

    /** Injected before every return of HomeNavPanelSectionV2Presenter.onBind(ViewDataBinding). */
    public static void onSectionBind(Object presenter) {
        try {
            Object viewData = Reflect.get(presenter, "viewData");
            if (!TITLE.equals(String.valueOf(Reflect.get(viewData, "title")))) return;
            View.OnClickListener open = v -> SettingsActivity.open(activityOf(v.getContext()));
            Field field = Reflect.field(presenter.getClass(), "sectionHeaderClickListener");
            if (field != null) field.set(presenter, open);
        } catch (Throwable t) {
            Diagnostics.error("onSectionBind failed", t);
        }
    }

    private static Context activityOf(Context context) {
        Context c = context;
        while (c instanceof ContextWrapper) {
            if (c instanceof Activity) return c;
            c = ((ContextWrapper) c).getBaseContext();
        }
        return context;
    }
}
