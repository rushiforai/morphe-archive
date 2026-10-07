package app.linkedin.extension;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.util.Log;
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
            Class<?> widget = Class.forName(PACKAGE + "HomeNavPanelAnalyticsWidgetViewData");
            Object savedPosts = sectionType.getField("SAVED_POSTS").get(null);
            Object chevronRight = chevronType.getField("RIGHT").get(null);

            for (Object item : list) {
                if (viewData.isInstance(item) && TITLE.equals(String.valueOf(Reflect.get(item, "title")))) {
                    return list;
                }
            }

            Constructor<?> constructor = viewData.getConstructor(
                    CharSequence.class, sectionType, chevronType, List.class, widget);
            Object entry = constructor.newInstance(TITLE, savedPosts, chevronRight, Collections.emptyList(), null);

            ArrayList<Object> result = new ArrayList<>(list);
            int index = result.size();
            for (int i = 0; i < result.size(); i++) {
                Object item = result.get(i);
                if (viewData.isInstance(item) && Reflect.get(item, "sectionType") == savedPosts) {
                    index = i + 1;
                    break;
                }
            }
            result.add(index, entry);
            return result;
        } catch (Throwable t) {
            Log.e(Settings.TAG, "addSettingsItem failed", t);
            return list;
        }
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
            Log.e(Settings.TAG, "onSectionBind failed", t);
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
