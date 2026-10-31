/*
 * Approach adapted from HushGram (GPL-3, https://github.com/SysAdminDoc/HushGram).
 */
package com.feurstagram.extension;

import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;
import java.util.regex.Pattern;

/** Hooks of the "Hide Meta AI" patch. All of them are gated on {@link Config#isMetaAiBlocked()}. */
public final class MetaAi {
    private MetaAi() {}

    /** "Muse" or "Meta AI" as whole words, in any case; "museum" and "amused" do not count. */
    private static final Pattern MENTION = Pattern.compile(
            "(?<![\\p{L}\\p{N}])(muse|meta ai)(?![\\p{L}\\p{N}])",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);

    /**
     * Injected after the share sheet's {@code name.equals("hatch")}: Meta AI's target (Muse on some
     * accounts). A false answer makes the sheet skip it like an unknown name.
     */
    public static boolean shareTarget(boolean isMetaAi) {
        return isMetaAi && !Config.isMetaAiBlocked();
    }

    /**
     * Injected at the head of the method that turns a quick promotion into its card. True builds
     * no card, for a promotion whose text names Muse or Meta AI. Never throws.
     */
    public static boolean dropsPromotion(Object promotion) {
        try {
            if (promotion == null || !Config.isMetaAiBlocked()) return false;
            boolean drop = mentions(promotion, 3, Collections.newSetFromMap(new IdentityHashMap<>()));
            if (drop) Log.i("OxbowMetaAi", "dropped a promotion");
            return drop;
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * Whether a String reachable from [o] through its instance fields, [depth] levels deep, names
     * Muse or Meta AI. The promotion's classes are obfuscated, so it is read by reflection.
     */
    private static boolean mentions(Object o, int depth, Set<Object> seen) throws IllegalAccessException {
        if (o == null || !seen.add(o)) return false;
        if (o instanceof String) return MENTION.matcher((String) o).find();
        if (depth == 0 || o instanceof Enum || o instanceof Number || o instanceof Boolean) return false;
        String type = o.getClass().getName();
        if (type.startsWith("java.") || type.startsWith("android.") || type.startsWith("kotlin.")) return false;
        for (Class<?> c = o.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (Modifier.isStatic(f.getModifiers()) || f.getType().isPrimitive()) continue;
                f.setAccessible(true);
                if (mentions(f.get(o), depth - 1, seen)) return true;
            }
        }
        return false;
    }
}
