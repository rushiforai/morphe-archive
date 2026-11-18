/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/**
 * Decides which of an opened pin's sections stay. Every section is a closeup module that asks itself
 * whether to show for the pin it just took, and these hooks get the last word on that answer. A
 * module tells what it is through its component type, whose constant names survive every build.
 */
public final class PinPageSections {
    private PinPageSections() {}

    static final String TITLE = "PIN_CLOSEUP_TITLE";
    static final String TRANSLATION = "PIN_CLOSEUP_MACHINE_TRANSLATIONS";
    static final String DESCRIPTION = "PIN_CLOSEUP_SOURCE_DESCRIPTION";
    static final String LINK = "PIN_CLOSEUP_LINK";

    /** The two rows a link module can hold that show who made the pin. An ad's label is neither. */
    private static final Set<String> CREATOR_ROWS = Collections.unmodifiableSet(new HashSet<>(
            Arrays.asList("PinCloseupCreatorAttributionView", "AvatarWithTitleAndSubtitleView")));

    private static final Object NO_GETTER = new Object();
    private static final Map<Class<?>, Object> GETTERS = new WeakHashMap<>();
    private static final Map<Class<?>, Boolean> CREATOR_MODULES = new WeakHashMap<>();

    /** Nothing was hidden yet, so a switch that's off has nothing to put back. */
    private static volatile boolean descriptionTouched, authorTouched;

    /**
     * A module answered whether it shows for its pin. With Hide pin title and description on, the
     * title, description and translation modules answer no. A title module carrying a visible
     * posted date or image size line stays and keeps only that line. Never throws.
     */
    public static int description(View module, int shown) {
        try {
            boolean on = UiHooks.enabled(FamilyNames.HIDE_PIN_DESCRIPTION, Settings.HIDE_PIN_DESCRIPTION);
            if (module == null || (!on && !descriptionTouched)) return shown;
            String type = component(module);
            boolean title = TITLE.equals(type);
            if (!title && !DESCRIPTION.equals(type) && !TRANSLATION.equals(type)) return shown;
            if (!on || shown == 0) {
                restore(module);
                return shown;
            }
            descriptionTouched = true;
            HookStatus.counted(FamilyNames.HIDE_PIN_DESCRIPTION, "pin description hidden");
            if (title && keepOnlyLine(module)) return shown;
            InterfaceControls.collapse(module, true);
            return 0;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_PIN_DESCRIPTION, "pin description", failure);
            return shown;
        }
    }

    /**
     * A module answered whether it shows for its pin. With Hide pin author on, the link module
     * holding the creator's row answers no, which takes the picture and the name together. Never throws.
     */
    public static int author(View module, int shown) {
        try {
            boolean on = UiHooks.enabled(FamilyNames.HIDE_PIN_AUTHOR, Settings.HIDE_PIN_AUTHOR);
            if (module == null || (!on && !authorTouched)) return shown;
            if (!LINK.equals(component(module)) || !holdsCreatorRow(module.getClass())) return shown;
            if (!on || shown == 0) {
                InterfaceControls.collapse(module, false);
                return shown;
            }
            authorTouched = true;
            HookStatus.counted(FamilyNames.HIDE_PIN_AUTHOR, "pin author hidden");
            InterfaceControls.collapse(module, true);
            return 0;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_PIN_AUTHOR, "pin author", failure);
            return shown;
        }
    }

    /** Collapses everything in the title module but its added line. False when no line is showing. */
    private static boolean keepOnlyLine(View module) {
        if (!(module instanceof ViewGroup)) return false;
        ViewGroup group = (ViewGroup) module;
        TextView line = PostedDate.line(group);
        boolean keep = line != null && line.getVisibility() == View.VISIBLE;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child != line) InterfaceControls.collapse(child, keep);
        }
        if (keep) InterfaceControls.collapse(module, false);
        return keep;
    }

    private static void restore(View module) {
        InterfaceControls.collapse(module, false);
        if (!(module instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) module;
        for (int i = 0; i < group.getChildCount(); i++) InterfaceControls.collapse(group.getChildAt(i), false);
    }

    /** The name of the module's component type, or null when it has none. */
    private static String component(View module) throws ReflectiveOperationException {
        Class<?> owner = module.getClass();
        Object getter;
        synchronized (GETTERS) {
            getter = GETTERS.get(owner);
            if (getter == null) {
                try {
                    Method found = owner.getMethod("getComponentType");
                    found.setAccessible(true);
                    getter = found;
                } catch (NoSuchMethodException none) {
                    getter = NO_GETTER;
                }
                GETTERS.put(owner, getter);
            }
        }
        if (getter == NO_GETTER) return null;
        Object type = ((Method) getter).invoke(module);
        return type instanceof Enum ? ((Enum<?>) type).name() : null;
    }

    private static boolean holdsCreatorRow(Class<?> owner) {
        synchronized (CREATOR_MODULES) {
            Boolean known = CREATOR_MODULES.get(owner);
            if (known != null) return known;
            boolean found = false;
            for (Class<?> at = owner; at != null && !at.getName().startsWith("android."); at = at.getSuperclass()) {
                for (Field field : at.getDeclaredFields()) found |= CREATOR_ROWS.contains(field.getType().getSimpleName());
            }
            CREATOR_MODULES.put(owner, found);
            return found;
        }
    }
}
