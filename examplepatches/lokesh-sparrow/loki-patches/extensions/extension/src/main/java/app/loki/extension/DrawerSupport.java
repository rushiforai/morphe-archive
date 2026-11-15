/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.extension;

import android.content.Context;
import android.content.Intent;
import android.view.View;

/**
 * Wires a "Loki Patches" row into an app's own navigation drawer. The drawer item class of the host
 * app is obfuscated, so everything is done through reflection with names supplied at patch time.
 * Every failure is swallowed: a renamed host class only costs the row, never the app.
 */
public final class DrawerSupport {
    /** Filled in by the patch so the helper matches this build of the app. */
    public static String itemClass;      // the drawer item class, e.g. "bn7"
    public static String iconClass;      // e.g. "f00", its x(Icon2, int, int) builds a font icon
    public static String iconEnumClass;  // e.g. "...CommunityMaterial$Icon2"
    public static String iconEnumValue;  // e.g. "cmd_shield_outline"
    public static String stringRes;      // app resource name of the row label
    public static String iconRes1;       // app color resource for the icon
    public static String iconRes2;       // app color resource for the icon glyph
    public static long identifier = 7331L; // must stay in sync with the patch's click hook

    private DrawerSupport() {
    }

    /** Builds the drawer row, or null when anything is missing. Never throws. */
    public static Object item() {
        try {
            Context context = appContext();
            if (context == null || itemClass == null) {
                return null;
            }
            Class<?> item = Class.forName(itemClass);
            Object row = item.getDeclaredConstructor().newInstance();

            int name = id(context, stringRes, "string");
            if (name == 0) {
                return null;
            }
            // hi0.g(int): the row label.
            item.getMethod("g", int.class).invoke(row, name);

            if (iconClass != null && iconEnumClass != null && iconEnumValue != null) {
                try {
                    Class<?> enumClass = Class.forName(iconEnumClass);
                    Object icon = Enum.valueOf((Class<? extends Enum>) enumClass.asSubclass(Enum.class), iconEnumValue);
                    int color1 = id(context, iconRes1, "color");
                    int color2 = id(context, iconRes2, "color");
                    // f00.x takes the IIcon interface, not the enum class, so match by name and arity.
                    Object glyph = null;
                    for (java.lang.reflect.Method m : Class.forName(iconClass).getMethods()) {
                        if (m.getName().equals("x") && m.getParameterCount() == 3
                                && m.getParameterTypes()[0].isInstance(icon)) {
                            glyph = m.invoke(null, icon, color1, color2);
                            break;
                        }
                    }
                    // hi0.f(ro4): the row icon.
                    for (java.lang.reflect.Method m : item.getSuperclass().getMethods()) {
                        if (m.getName().equals("f") && m.getParameterCount() == 1
                                && m.getParameterTypes()[0].isInstance(glyph)) {
                            m.invoke(row, glyph);
                            break;
                        }
                    }
                } catch (Exception e) {
                    // A row without an icon is fine; log why for debugging.
                    android.util.Log.e("LokiDrawer", "icon", e);
                }
            }

            // f3.a: the row identifier; f3.c=false keeps it unselectable like the other rows.
            java.lang.reflect.Field idField = null;
            for (Class<?> c = item; c != null && idField == null; c = c.getSuperclass()) {
                try {
                    idField = c.getDeclaredField("a");
                } catch (NoSuchFieldException ignored) {
                }
            }
            if (idField != null) {
                idField.setAccessible(true);
                idField.setLong(row, identifier);
            }
            try {
                java.lang.reflect.Field sel = item.getSuperclass().getDeclaredField("c");
                sel.setAccessible(true);
                sel.setBoolean(row, false);
            } catch (NoSuchFieldException ignored) {
            }
            return row;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * Called at the top of the host's drawer click dispatch. Returns true when the click was
     * ours and the menu was opened, so the caller returns immediately.
     */
    public static boolean clicked(View view, Object drawerItem) {
        try {
            if (drawerItem == null || identifier == 0L) {
                return false;
            }
            long id = 0L;
            for (Class<?> c = drawerItem.getClass(); c != null && id == 0L; c = c.getSuperclass()) {
                try {
                    java.lang.reflect.Field f = c.getDeclaredField("a");
                    f.setAccessible(true);
                    id = f.getLong(drawerItem);
                } catch (NoSuchFieldException ignored) {
                }
            }
            if (id != identifier || view == null) {
                return false;
            }
            Context context = view.getContext();
            context.startActivity(new Intent(context, MenuActivity.class));
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    private static Context appContext() {
        try {
            Class<?> at = Class.forName("android.app.ActivityThread");
            java.lang.reflect.Method m = at.getDeclaredMethod("currentApplication");
            m.setAccessible(true);
            return (Context) m.invoke(null);
        } catch (Exception e) {
            return null;
        }
    }

    private static int id(Context context, String name, String type) {
        if (name == null || name.isEmpty()) {
            return 0;
        }
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }
}
