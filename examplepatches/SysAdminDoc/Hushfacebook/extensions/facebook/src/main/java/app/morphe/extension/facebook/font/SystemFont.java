/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.font;

import android.graphics.Typeface;

import androidx.annotation.Nullable;

import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Draws Facebook's own text in the phone's font (issue #1).
 *
 * <p>Facebook ships Meta's Optimistic family under assets/fonts and hands every interface
 * typeface out of one repository. Its static resolver takes a font family constant, a style and a
 * weight, and answers from its cache, from a downloaded font file or from an asset. The FDS text
 * styles, the Bloks font name lookup, the story text tools and the font prefetcher all go through
 * it. {@link #systemize} stands at its exit and, while the switch is on, answers the phone's
 * default font at the same weight and slant for the families Meta draws its interface in. The
 * other families the repository knows (Montserrat, Courier Prime, Old Standard, the story sticker
 * fonts) are a person's own choice for a story or a post, so they pass through as they are.
 *
 * <p>Bloks text with variable-font settings takes a second road: the repository hands out a
 * typeface builder (Meta's com.meta.foa.typefacebuilder) that reads the asset or the downloaded
 * file itself, with the weight in a font variation string. {@link #rememberVariation} keeps the
 * string each builder was given and {@link #systemizeBuilt} stands at the builder's exit,
 * answering the phone's font at the weight the string asked for. Only families with variable
 * axes reach a builder, and every one of those is Meta's.
 *
 * <p>The weight comes from what Facebook built, never from a register alone. A static asset
 * carries its own weight (Optimistic Text Bold is 700 whatever was asked for), and a variable
 * font carries its default instance's, so the larger of the built weight and the requested one
 * wins. A typeface already on screen keeps its font until the view is rebuilt, so the switch says
 * to restart Facebook.
 */
public final class SystemFont {
    /** The font variation strings each builder was given, by the builder, for as long as it lives. */
    private static final Map<Object, String> VARIATIONS = Collections.synchronizedMap(new WeakHashMap<>());

    /** A variation axis and its value, as Android writes them: 'wght' 700 or "wght" 700. */
    private static final Pattern AXIS = Pattern.compile("['\"]([a-zA-Z]{4})['\"]\\s*(-?\\d+(?:\\.\\d+)?)");

    private static final String REPOSITORY = "typeface repository";
    private static final String BUILDER = "variable font builder";

    private SystemFont() {
    }

    /**
     * Whether [name], a constant of Facebook's font family enum, is one Meta draws its interface
     * in: the Optimistic families and the variable Facebook Sans. The story sticker fonts and the
     * downloaded creative families keep their names off this list.
     */
    static boolean isInterfaceFamily(@Nullable String name) {
        if (name == null) return false;
        return name.startsWith("OPTIMISTIC") || name.equals("FACEBOOK_SANS_VARIABLE");
    }

    /**
     * The phone's font at [original]'s weight and slant when the switch is on and [family] is one
     * of Meta's interface families, otherwise [original] as it came. [weight] is what the caller
     * asked the repository for, or a negative number when it asked for none.
     */
    public static Typeface systemize(Typeface original, Enum<?> family, int weight) {
        try {
            HookStatus.invoked(FamilyNames.SYSTEM_FONT);
            if (original == null || family == null || !isInterfaceFamily(family.name())) return original;
            if (!Utils.settingsReady() || !Settings.USE_SYSTEM_FONT.get()) return original;
            HookStatus.bound(FamilyNames.SYSTEM_FONT, REPOSITORY);
            return systemTypeface(Math.max(weight, original.getWeight()), original.isItalic());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SYSTEM_FONT, REPOSITORY, failure);
            return original;
        }
    }

    /** Keeps the font variation string [builder] was handed, so its build can read the weight back. */
    public static void rememberVariation(Object builder, String settings) {
        try {
            if (builder == null) return;
            if (settings == null || settings.isEmpty()) VARIATIONS.remove(builder);
            else VARIATIONS.put(builder, settings);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SYSTEM_FONT, BUILDER, failure);
        }
    }

    /**
     * The phone's font at the weight and slant [builder]'s variation string asked for, or at
     * [built]'s own when it was given none, while the switch is on. Otherwise [built] as it came.
     */
    public static Typeface systemizeBuilt(Typeface built, Object builder) {
        try {
            HookStatus.invoked(FamilyNames.SYSTEM_FONT);
            if (built == null) return null;
            if (!Utils.settingsReady() || !Settings.USE_SYSTEM_FONT.get()) return built;
            String settings = builder == null ? null : VARIATIONS.get(builder);
            HookStatus.bound(FamilyNames.SYSTEM_FONT, BUILDER);
            return systemTypeface(weightOf(settings, built.getWeight()), italicOf(settings, built.isItalic()));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SYSTEM_FONT, BUILDER, failure);
            return built;
        }
    }

    /** The wght axis of [settings], or [fallback] when the string names none or one out of range. */
    static int weightOf(@Nullable String settings, int fallback) {
        if (settings == null) return fallback;
        Matcher axis = AXIS.matcher(settings);
        while (axis.find()) {
            if (!axis.group(1).equals("wght")) continue;
            int weight = Math.round(Float.parseFloat(axis.group(2)));
            return weight >= 1 && weight <= 1000 ? weight : fallback;
        }
        return fallback;
    }

    /** Whether [settings] asks for italics (an ital axis set, or a slant), else [fallback]. */
    static boolean italicOf(@Nullable String settings, boolean fallback) {
        if (settings == null) return fallback;
        Matcher axis = AXIS.matcher(settings);
        while (axis.find()) {
            String tag = axis.group(1);
            float value = Float.parseFloat(axis.group(2));
            if (tag.equals("ital")) return value >= 1;
            if (tag.equals("slnt")) return value != 0;
        }
        return fallback;
    }

    /** The phone's default font at [weight] (400 when out of range) and [italic]. */
    static Typeface systemTypeface(int weight, boolean italic) {
        int clamped = weight >= 1 && weight <= 1000 ? weight : 400;
        return Typeface.create(Typeface.DEFAULT, clamped, italic);
    }
}
