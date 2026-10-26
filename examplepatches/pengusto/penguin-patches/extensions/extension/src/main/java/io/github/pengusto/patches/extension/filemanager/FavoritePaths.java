/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.extension.filemanager;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Proxy;
import java.util.HashSet;
import java.util.Set;

/** Only favorite metadata changes. Files and the app's rename/delete operations stay with Fossify. */
public final class FavoritePaths {
    private static String path(String value) {
        if (value == null) return "";
        int end = value.length();
        while (end > 1 && value.charAt(end - 1) == '/') end--;
        return value.substring(0, end);
    }

    private static boolean contains(String parent, String candidate) {
        return candidate.equals(parent) || candidate.startsWith(parent + "/");
    }

    public static Set<String> move(Set<String> favorites, String oldPath, String newPath) {
        String old = path(oldPath), next = path(newPath);
        Set<String> result = new HashSet<>();
        for (String favorite : favorites) {
            result.add(old.length() > 1 && next.length() > 1 && contains(old, favorite)
                ? next + favorite.substring(old.length()) : favorite);
        }
        return result;
    }

    public static Set<String> remove(Set<String> favorites, String deletedPath) {
        String deleted = path(deletedPath);
        Set<String> result = new HashSet<>();
        for (String favorite : favorites) {
            if (deleted.length() <= 1 || !contains(deleted, favorite)) result.add(favorite);
        }
        return result;
    }

    /** Same point in deletion selection as Fossify's existing exact-favorite cleanup. */
    public static void removeSelected(Context context, String deletedPath) {
        synchronized (FavoritePaths.class) {
            SharedPreferences prefs = context.getSharedPreferences("Prefs", Context.MODE_PRIVATE);
            Set<String> original = new HashSet<>(prefs.getStringSet("favorites", new HashSet<>()));
            Set<String> updated = remove(original, deletedPath);
            if (!original.equals(updated)) prefs.edit().putStringSet("favorites", updated).apply();
        }
    }

    /** The app's Kotlin Function2 interface is renamed by R8. Proxy preserves that exact runtime interface. */
    public static Object wrapRename(Context context, String oldPath, String newPath, boolean multiple, Object callback) {
        if (callback == null) return null;
        return Proxy.newProxyInstance(callback.getClass().getClassLoader(), callback.getClass().getInterfaces(),
            (proxy, method, args) -> {
                if (args != null && args.length == 2 && Boolean.TRUE.equals(args[0])) {
                    try {
                        synchronized (FavoritePaths.class) {
                            SharedPreferences prefs = context.getSharedPreferences("Prefs", Context.MODE_PRIVATE);
                            Set<String> original = new HashSet<>(prefs.getStringSet("favorites", new HashSet<>()));
                            Set<String> updated = move(original, oldPath, newPath);
                            if (!original.equals(updated)) prefs.edit().putStringSet("favorites", updated).apply();
                        }
                    } catch (RuntimeException failure) {
                        Log.e("PenguinFavorites", "Could not update favorites after successful rename", failure);
                    }
                }
                try {
                    return method.invoke(callback, args);
                } catch (InvocationTargetException failure) {
                    throw failure.getCause();
                }
            });
    }
}
