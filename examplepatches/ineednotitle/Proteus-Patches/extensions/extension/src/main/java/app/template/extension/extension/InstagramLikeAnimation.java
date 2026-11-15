/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * Adapted from https://github.com/crimera/piko (GPL-3.0).
 * See META-INF/PROTEUS-NOTICE.txt for GPLv3 §7(b) terms.
 */

package app.template.extension.extension;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

/**
 * Runtime side of the "Change like animation" patch.
 *
 * <p>The patch replaces the class name below with Instagram's animation enum
 * and replaces {@link #mapAnimation(Object)} with Instagram's own
 * animation-to-renderable mapper. Without the patch the class lookup fails and
 * every hook returns the native default animation.</p>
 */
@SuppressWarnings("unused")
public final class InstagramLikeAnimation {
    private static volatile Class<?> animationClass;
    private static volatile String sessionRandomChoice;

    private InstagramLikeAnimation() {
    }

    /**
     * Replaced by the patch with Instagram's animation enum class name.
     */
    private static Class<?> animationClass() throws ClassNotFoundException {
        Class<?> cached = animationClass;
        if (cached != null) {
            return cached;
        }
        Class<?> resolved = Class.forName("className");
        animationClass = resolved;
        return resolved;
    }

    public static boolean isAvailable() {
        try {
            Class<?> clazz = animationClass();
            return clazz.isEnum() && clazz.getEnumConstants().length > 0;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * Injection point for the user-activation metadata constructor.
     *
     * <p>Returns {@code null} when the native animation should be kept. The
     * patch uses the null result to keep the constructor's "explicit choice"
     * flag false; the metadata contract treats a null animation as the native
     * default.</p>
     *
     * <p>On an unexpected error the incoming {@code defaultAnimation} is
     * returned instead of {@code null}, so a failure never clears the
     * animation the app already resolved.</p>
     */
    public static Object changeLikeAnimation(Object defaultAnimation) {
        try {
            return selectedAnimation();
        } catch (Throwable ignored) {
            return defaultAnimation;
        }
    }

    /**
     * Injection point for the render-animation configuration method.
     */
    public static Object changeRenderAnimation(Object defaultRenderAnimation) {
        try {
            Object animation = selectedAnimation();
            if (animation == null) {
                return defaultRenderAnimation;
            }
            Object mapped = mapAnimation(animation);
            return mapped != null ? mapped : defaultRenderAnimation;
        } catch (Throwable ignored) {
            return defaultRenderAnimation;
        }
    }

    /**
     * Replaced by the patch with a call to Instagram's animation-to-rendering
     * mapper. The safe fallback leaves the animation unchanged.
     */
    public static Object mapAnimation(Object animation) {
        return animation;
    }

    private static Object selectedAnimation() throws Exception {
        String selected = InstagramRuntimeFlags.getLikeAnimation();
        if (InstagramLikeAnimations.isDefaultOrRandom(selected)) {
            if (InstagramLikeAnimations.DEFAULT.equals(selected) || selected == null) {
                return null;
            }
            selected = randomAnimation();
            if (selected == null) {
                return null;
            }
        }

        Class<?> clazz = animationClass();
        @SuppressWarnings({"unchecked", "rawtypes"})
        Class<? extends Enum> enumClass = (Class<? extends Enum>) clazz;
        return Enum.valueOf(enumClass, selected);
    }

    private static String randomAnimation() {
        String cached = sessionRandomChoice;
        if (cached != null) {
            return cached;
        }
        try {
            Class<?> clazz = animationClass();
            List<String> available = new ArrayList<>();
            for (Object constant : clazz.getEnumConstants()) {
                available.add(((Enum<?>) constant).name());
            }
            List<String> candidates = new ArrayList<>();
            for (String value : InstagramLikeAnimations.values()) {
                if (!InstagramLikeAnimations.isDefaultOrRandom(value) && available.contains(value)) {
                    candidates.add(value);
                }
            }
            if (candidates.isEmpty()) {
                return null;
            }
            String choice = candidates.get(ThreadLocalRandom.current().nextInt(candidates.size()));
            sessionRandomChoice = choice;
            return choice;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Clears the per-process random choice, if any. */
    public static void resetSessionChoice() {
        sessionRandomChoice = null;
    }
}
