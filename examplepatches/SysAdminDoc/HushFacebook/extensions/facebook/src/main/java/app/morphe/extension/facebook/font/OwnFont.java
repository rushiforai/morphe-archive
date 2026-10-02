/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.font;

import android.content.Context;
import android.graphics.Typeface;
import android.view.View;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.io.File;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Draws Facebook's own text in a font of your choosing instead of Meta's Optimistic (issue #1):
 * the phone's own font, or a font file picked in Hushfacebook's settings and copied into
 * Facebook's files ({@link FontFile}).
 *
 * <p>Facebook ships Meta's Optimistic family under assets/fonts and hands every interface
 * typeface out of one repository. Its static resolver takes a font family constant, a style and a
 * weight, and answers from its cache, from a downloaded font file or from an asset. The FDS text
 * styles, the Bloks font name lookup, the story text tools and the font prefetcher all go through
 * it. {@link #replace} stands at its exit and, while the switch is on, answers the chosen font at
 * the same weight and slant for the families Meta draws its interface in. The other families the
 * repository knows (Montserrat, Courier Prime, Old Standard, the story sticker fonts) are a
 * person's own choice for a story or a post, so they pass through as they are.
 *
 * <p>Bloks text with variable-font settings takes a second road: the repository hands out a
 * typeface builder (Meta's com.meta.foa.typefacebuilder) that reads the asset or the downloaded
 * file itself, with the weight in a font variation string. {@link #rememberVariation} keeps the
 * string each builder was given and {@link #replaceBuilt} stands at the builder's exit, answering
 * the chosen font at the weight the string asked for. Only families with variable axes reach a
 * builder, and every one of those is Meta's.
 *
 * <p>React Native screens, parts of Marketplace among them, take a third: their script names a
 * family, and React Native's own font manager finds it. The font prefetcher registers Meta's
 * families there under names like "Optimistic VF App Lite 700", and the manager finds others among
 * the app's font assets by file name. {@link #replaceReactNative} stands at the exit of the
 * manager's resolver and swaps the families named for Meta's interface fonts.
 *
 * <p>Text that asks for none of Meta's fonts takes a fourth: Facebook's own text engine builds it
 * a Roboto, the phone's sans-serif at the weight its style names. That's where posts, comments and
 * menus get their font on accounts Facebook gives no Optimistic, and where Optimistic text lands
 * when the repository can't build it. It's the phone's font already, so {@link #replacePhoneFont}
 * swaps it only for a picked file.
 *
 * <p>The rest of Facebook's code reads Android's default typefaces itself, the spans that bold a
 * name in a post's header or a notification among it. Each read of Typeface.DEFAULT or
 * DEFAULT_BOLD, and each call of Typeface.defaultFromStyle, comes here instead
 * ({@link #defaultTypeface}, {@link #defaultBold}, {@link #defaultFromStyle}), and a picked file
 * takes those too.
 *
 * <p>The weight comes from what Facebook built, never from a register alone. A static asset
 * carries its own weight (Optimistic Text Bold is 700 whatever was asked for), and a variable
 * font carries its default instance's, so the larger of the built weight and the requested one
 * wins. A typeface already on screen keeps its font until the view is rebuilt, so the switch says
 * to restart Facebook.
 *
 * <p>A picked font is built once per weight and slant and kept. One with a 'wght' axis is built at
 * the weight asked for, and any other takes Android's bold and slant where it has none of its own.
 * When the copy won't load, the phone's font stands in, and while the switch is off, Facebook's
 * own does.
 */
public final class OwnFont {
    /** The font variation strings each builder was given, by the builder, for as long as it lives. */
    private static final Map<Object, String> VARIATIONS = Collections.synchronizedMap(new WeakHashMap<>());

    /** A variation axis and its value, as Android writes them: 'wght' 700 or "wght" 700. */
    private static final Pattern AXIS = Pattern.compile("['\"]([a-zA-Z]{4})['\"]\\s*(-?\\d+(?:\\.\\d+)?)");

    private static final String REPOSITORY = "typeface repository";
    private static final String BUILDER = "variable font builder";
    private static final String REACT_NATIVE = "React Native font manager";
    private static final String ROBOTO = "Roboto builder";
    private static final String DEFAULTS = "Android's default typefaces";
    private static final String VIEWS = "text views";

    /**
     * What each family name a React Native screen asked for came to: the weight it ends in, 0 for
     * none, or -1 for a family that isn't one of Meta's interface fonts. A screen asks on every
     * measure and draw of a span, and a handful of names cover them all.
     */
    private static final ConcurrentHashMap<String, Integer> REACT_FAMILIES = new ConcurrentHashMap<>();
    /** Past this many names, a new one is worked out each time rather than kept. */
    private static final int MAX_REACT_FAMILIES = 256;
    /** The weights Android and Facebook name after "sans-serif-" and "roboto-". */
    private static final Set<String> SANS_WEIGHTS = new HashSet<>(Arrays.asList(
            "thin", "light", "regular", "medium", "bold", "black"));

    /** The phone's sans-serif and its named weights, the families {@link #isPhoneTypeface} knows by name. */
    private static final String[] PHONE_SANS = {
            "sans-serif", "sans-serif-thin", "sans-serif-light", "sans-serif-medium", "sans-serif-black"};

    /** What {@link #isPhoneTypeface} compares with, built the first time it's asked. */
    @Nullable
    private static volatile Set<Typeface> phoneTypefaces;

    /** The roads {@link #ready} has logged an ask before the settings loaded on. */
    private static final Set<String> ASKED_EARLY = Collections.newSetFromMap(new ConcurrentHashMap<>());

    /** The picked font as last read, or null before the first read and after a change. */
    @Nullable
    private static volatile Picked picked;

    private OwnFont() {
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
     * The chosen font at [original]'s weight and slant when the switch is on and [family] is one
     * of Meta's interface families, otherwise [original] as it came. [weight] is what the caller
     * asked the repository for, or a negative number when it asked for none.
     */
    public static Typeface replace(Typeface original, Enum<?> family, int weight) {
        try {
            HookStatus.invoked(FamilyNames.SYSTEM_FONT);
            if (original == null || family == null || !isInterfaceFamily(family.name())) return original;
            if (!ready(REPOSITORY) || !Settings.USE_SYSTEM_FONT.get()) return original;
            HookStatus.bound(FamilyNames.SYSTEM_FONT, REPOSITORY);
            return typeface(Math.max(weight, original.getWeight()), original.isItalic());
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
     * The chosen font at the weight and slant [builder]'s variation string asked for, or at
     * [built]'s own when it was given none, while the switch is on. Otherwise [built] as it came.
     */
    public static Typeface replaceBuilt(Typeface built, Object builder) {
        try {
            HookStatus.invoked(FamilyNames.SYSTEM_FONT);
            if (built == null) return null;
            if (!ready(BUILDER) || !Settings.USE_SYSTEM_FONT.get()) return built;
            String settings = builder == null ? null : VARIATIONS.get(builder);
            HookStatus.bound(FamilyNames.SYSTEM_FONT, BUILDER);
            return typeface(weightOf(settings, built.getWeight()), italicOf(settings, built.isItalic()));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SYSTEM_FONT, BUILDER, failure);
            return built;
        }
    }

    /**
     * The chosen font for React Native text in [family], one of Meta's interface fonts by name,
     * while the switch is on, otherwise [answer], what React Native's font manager found. The
     * manager gives [answer] the weight and slant the text asked for, and a family name Facebook
     * registered ends in the weight it was built at, so the larger of the two wins, as it does at
     * the repository.
     */
    public static Typeface replaceReactNative(Typeface answer, String family) {
        try {
            HookStatus.invoked(FamilyNames.SYSTEM_FONT);
            if (answer == null || family == null) return answer;
            int named = reactNativeFamily(family);
            if (named < 0) return answer;
            if (!ready(REACT_NATIVE) || !Settings.USE_SYSTEM_FONT.get()) return answer;
            HookStatus.bound(FamilyNames.SYSTEM_FONT, REACT_NATIVE);
            return typeface(Math.max(named, answer.getWeight()), answer.isItalic());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SYSTEM_FONT, REACT_NATIVE, failure);
            return answer;
        }
    }

    /**
     * The picked font at [answer]'s weight and slant while the switch is on and a font file is
     * picked, otherwise [answer]: the Roboto Facebook's text engine built for text that asks for
     * none of Meta's fonts. With no file picked, or a copy that won't load, that Roboto is the
     * phone's font already, so it stands.
     */
    public static Typeface replacePhoneFont(Typeface answer) {
        return pickedInstead(answer, ROBOTO);
    }

    /** {@link Typeface#DEFAULT} for Facebook's own code: the picked font at 400 while one is picked. */
    public static Typeface defaultTypeface() {
        return pickedInstead(Typeface.DEFAULT, DEFAULTS);
    }

    /**
     * {@link Typeface#DEFAULT_BOLD} for Facebook's own code: the picked font at 700 while one is
     * picked. The spans that bold a name in a post's header or a notification read it.
     */
    public static Typeface defaultBold() {
        return pickedInstead(Typeface.DEFAULT_BOLD, DEFAULTS);
    }

    /** {@link Typeface#defaultFromStyle} for Facebook's own code: the picked font in [style] while one is picked. */
    public static Typeface defaultFromStyle(int style) {
        return pickedInstead(Typeface.defaultFromStyle(style), DEFAULTS);
    }

    /** {@link Typeface#SANS_SERIF} for Facebook's own code: the picked font at 400 while one is picked. */
    public static Typeface sansSerif() {
        return pickedInstead(Typeface.SANS_SERIF, DEFAULTS);
    }

    /**
     * {@link Typeface#create(String, int)} for Facebook's own code. Android answers first. For one
     * of the phone's sans-serif families, the picked font takes its place at the weight and slant
     * Android answered, so "sans-serif-medium" gets the file at 500. Any other family is Android's.
     */
    public static Typeface create(@Nullable String family, int style) {
        Typeface answer = Typeface.create(family, style);
        return isPhoneSans(family) ? pickedInstead(answer, DEFAULTS) : answer;
    }

    /**
     * {@link Typeface#create(Typeface, int)} for Facebook's own code: Android's answer, which the
     * picked font takes the place of when [family] is the phone's default, none at all, or the
     * picked font already. The spans that bold a word take the paint's typeface and a style.
     */
    public static Typeface create(@Nullable Typeface family, int style) {
        Typeface answer = Typeface.create(family, style);
        return isPhoneOrPicked(family) ? pickedInstead(answer, DEFAULTS) : answer;
    }

    /**
     * {@link Typeface#create(Typeface, int, boolean)} for Facebook's own code, the same way as the
     * style form, at the weight asked for.
     */
    public static Typeface create(@Nullable Typeface family, int weight, boolean italic) {
        Typeface answer = Typeface.create(family, weight, italic);
        return isPhoneOrPicked(family) ? pickedInstead(answer, DEFAULTS) : answer;
    }

    /**
     * Whether Android draws [family] in the phone's own sans-serif: no family, "sans-serif" and its
     * named weights, and Roboto under the names Facebook asks for it by. Android's condensed,
     * smallcaps and "sans-serif-monospace" are fonts of their own, and stay Android's.
     */
    static boolean isPhoneSans(@Nullable String family) {
        if (family == null || family.isEmpty()) return true;
        String name = family.toLowerCase(Locale.ROOT);
        for (String sans : new String[]{"sans-serif", "roboto"}) {
            if (name.equals(sans)) return true;
            if (name.startsWith(sans + "-")) return SANS_WEIGHTS.contains(name.substring(sans.length() + 1));
        }
        return false;
    }

    /** Whether [family] is none, one of the phone's sans-serif typefaces, or a typeface built from the picked file. */
    private static boolean isPhoneOrPicked(@Nullable Typeface family) {
        if (isPhoneTypeface(family)) return true;
        try {
            if (!Utils.settingsReady() || !Settings.USE_SYSTEM_FONT.get()) return false;
            Picked font = picked();
            return font != null && font.built(family);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SYSTEM_FONT, DEFAULTS, failure);
            return false;
        }
    }

    /**
     * Whether Android hands out [typeface] for the phone's sans-serif: none at all, the defaults,
     * defaultFromStyle's four, and "sans-serif" and each of its named weights in each style and at
     * each text weight, which is what a text view's layout gets for a style, one of those families
     * or a text weight. Compared by identity,
     * since Android keeps one typeface of each and hands the same one out every time.
     */
    static boolean isPhoneTypeface(@Nullable Typeface typeface) {
        if (typeface == null || typeface == Typeface.DEFAULT || typeface == Typeface.DEFAULT_BOLD
                || typeface == Typeface.SANS_SERIF) {
            return true;
        }
        Set<Typeface> known = phoneTypefaces;
        if (known == null) {
            Set<Typeface> built = Collections.newSetFromMap(new IdentityHashMap<>());
            for (int style = Typeface.NORMAL; style <= Typeface.BOLD_ITALIC; style++) {
                built.add(Typeface.defaultFromStyle(style));
            }
            // A layout's text weight is a weight of its family, or of the default with none.
            for (String name : PHONE_SANS) {
                Typeface base = Typeface.create(name, Typeface.NORMAL);
                for (int style = Typeface.NORMAL; style <= Typeface.BOLD_ITALIC; style++) {
                    built.add(Typeface.create(base, style));
                }
                for (int weight = 100; weight <= 900; weight += 100) {
                    built.add(Typeface.create(base, weight, false));
                    built.add(Typeface.create(base, weight, true));
                }
            }
            for (int weight = 100; weight <= 900; weight += 100) {
                built.add(Typeface.create(Typeface.DEFAULT, weight, false));
                built.add(Typeface.create(Typeface.DEFAULT, weight, true));
            }
            // Published only once it's full, and never changed after, so readers need no lock.
            phoneTypefaces = known = built;
        }
        return known.contains(typeface);
    }

    /**
     * One of Android's text views Facebook just built, with its typeface from the layout or none.
     * While a font file is picked, a view with none or with one of the phone's sans-serif
     * typefaces takes the file at that weight and slant. Android draws a view with none in the
     * phone's default, in its own code, so this is the one place to reach it. A view with any other
     * typeface keeps it. Called right after Android's constructor, on whichever thread built the
     * view: for a view of Facebook's own that's its super call, so a typeface its constructor sets
     * afterwards still wins, and for a view an inflater made it's after the whole constructor.
     */
    public static void textView(@Nullable TextView view) {
        if (view == null) return;
        try {
            Typeface current = view.getTypeface();
            if (!isPhoneTypeface(current)) return;
            Typeface base = current == null ? Typeface.DEFAULT : current;
            Typeface instead = pickedInstead(base, VIEWS);
            if (instead != base) view.setTypeface(instead);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SYSTEM_FONT, VIEWS, failure);
        }
    }

    /**
     * A view one of Facebook's layout inflaters just made from a layout's tag, which goes through
     * {@link #textView} when it's a text view.
     */
    public static void inflated(@Nullable View view) {
        if (view instanceof TextView) textView((TextView) view);
    }

    /**
     * Whether the settings can be read yet. When they can't, the typeface Facebook asked for through
     * [road] stays what it got, and the first such ask on each road is logged with the class that
     * made it. Facebook keeps some typefaces it gets while a class loads, and one kept that early
     * would never take the switch or the picked file. The context comes at the start of the
     * application's onCreate, and Facebook's text classes load after it.
     */
    private static boolean ready(String road) {
        if (Utils.settingsReady()) return true;
        if (!ASKED_EARLY.add(road)) return false;
        String caller = "";
        for (StackTraceElement frame : new Throwable().getStackTrace()) {
            if (!frame.getClassName().equals(OwnFont.class.getName())) {
                caller = frame.getClassName() + "." + frame.getMethodName();
                break;
            }
        }
        String from = caller;
        Logger.printInfo(() -> "A typeface was asked for through the " + road + " before the settings loaded, by "
                + from + ", so it stays as it came");
        return false;
    }

    /**
     * The picked font at [answer]'s weight and slant while the switch is on and a font file is
     * picked, otherwise [answer], a typeface of the phone's font that Facebook got from [road].
     */
    private static Typeface pickedInstead(Typeface answer, String road) {
        try {
            HookStatus.invoked(FamilyNames.SYSTEM_FONT);
            if (answer == null) return null;
            if (!ready(road) || !Settings.USE_SYSTEM_FONT.get()) return answer;
            HookStatus.bound(FamilyNames.SYSTEM_FONT, road);
            Picked font = picked();
            Typeface styled = font == null ? null : font.styled(clamped(answer.getWeight()), answer.isItalic());
            return styled != null ? styled : answer;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SYSTEM_FONT, road, failure);
            return answer;
        }
    }

    /**
     * What React Native family [family] is: the weight its name ends in, 0 for a name with none, or
     * -1 when it isn't one of Meta's interface fonts. Those are the Optimistic families, under any
     * of the names Facebook gives them ("Optimistic VF App Lite 500", "Optimistic Display App", the
     * asset "Optimistic_Text_A_Bd"), and the variable Facebook Sans ("Facebook Sans VF App 700").
     * The heavy italic Facebook Sans and Facebook Narrow are display fonts for stories, and stay.
     */
    static int reactNativeFamily(String family) {
        Integer known = REACT_FAMILIES.get(family);
        if (known != null) return known;
        int answer = isReactNativeInterfaceFamily(family) ? weightSuffix(family) : -1;
        if (REACT_FAMILIES.size() < MAX_REACT_FAMILIES) REACT_FAMILIES.put(family, answer);
        return answer;
    }

    /** Whether [family], a name a React Native screen asks for, is one of Meta's interface fonts. */
    static boolean isReactNativeInterfaceFamily(@Nullable String family) {
        if (family == null) return false;
        StringBuilder letters = new StringBuilder(family.length());
        for (int index = 0; index < family.length(); index++) {
            char at = family.charAt(index);
            if (at >= 'A' && at <= 'Z') letters.append((char) (at + ('a' - 'A')));
            else if ((at >= 'a' && at <= 'z') || (at >= '0' && at <= '9')) letters.append(at);
        }
        String name = letters.toString();
        return name.startsWith("optimistic") || name.startsWith("facebooksansvf")
                || name.startsWith("facebooksansvariable");
    }

    /** The weight [family] ends in after a space, 1 to 1000, or 0 when it ends in none. */
    static int weightSuffix(String family) {
        int end = family.length();
        int start = end;
        while (start > 0 && start > end - 4 && family.charAt(start - 1) >= '0' && family.charAt(start - 1) <= '9') {
            start--;
        }
        if (start == end || start == 0 || family.charAt(start - 1) != ' ') return 0;
        int weight = Integer.parseInt(family.substring(start, end));
        return weight >= 1 && weight <= 1000 ? weight : 0;
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

    /**
     * The chosen font at [weight] (400 when out of range) and [italic]: the picked file's when
     * there is one and it loads, else the phone's default font.
     */
    static Typeface typeface(int weight, boolean italic) {
        int clamped = clamped(weight);
        Picked font = picked();
        if (font != null) {
            Typeface styled = font.styled(clamped, italic);
            if (styled != null) return styled;
        }
        return Typeface.create(Typeface.DEFAULT, clamped, italic);
    }

    /** [weight] when it's one Android takes, 1 to 1000, and 400 otherwise. */
    private static int clamped(int weight) {
        return weight >= 1 && weight <= 1000 ? weight : 400;
    }

    /**
     * Whether Android builds a typeface from [file], at its own weight and slant: the last check a
     * picked font passes before its copy is kept.
     */
    public static boolean loads(File file) {
        try {
            return new Typeface.Builder(file).build() != null;
        } catch (RuntimeException failure) {
            return false;
        }
    }

    /**
     * Forgets the font read from the copy. The settings screen calls this after it writes a new
     * copy or removes one, so the next typeface is built from what's there now. It waits for a
     * read already under way, which could have begun on the old copy and would otherwise be kept
     * after this under a name that didn't change.
     */
    public static void fileChanged() {
        synchronized (OwnFont.class) {
            picked = null;
        }
    }

    /** The picked font, or null while the phone's font is chosen. Read from the copy the first time. */
    @Nullable
    private static Picked picked() {
        String source = Settings.FONT_SOURCE.get();
        if (source.isEmpty()) return null;
        Picked font = picked;
        if (font != null && font.source.equals(source)) return font;
        synchronized (OwnFont.class) {
            font = picked;
            if (font != null && font.source.equals(source)) return font;
            font = Picked.read(source);
            picked = font;
            return font;
        }
    }

    /** A picked font file, read once, and the typefaces built from it so far. */
    private static final class Picked {
        /** The name the file was picked under, which is what the saved setting holds. */
        final String source;
        /** The copy, or null when there's none to read. */
        @Nullable
        final File file;
        /** The copy at its own weight and slant, or null when it didn't load. */
        @Nullable
        final Typeface base;
        /** The least and greatest weight the copy's 'wght' axis takes, or null for a font without one. */
        @Nullable
        final float[] weights;
        /** Each weight and slant built so far, by weight times two plus one for italic. */
        final ConcurrentHashMap<Integer, Typeface> styles = new ConcurrentHashMap<>();

        private Picked(String source, @Nullable File file, @Nullable Typeface base, @Nullable float[] weights) {
            this.source = source;
            this.file = file;
            this.base = base;
            this.weights = weights;
        }

        /**
         * The copy as it is now. One that is missing or won't load reads as a font with nothing to
         * build, which draws in the phone's font, and says so once in the diagnostic log.
         */
        static Picked read(String source) {
            Context context = Utils.getContext();
            File file = context == null ? null : FontFile.file(context);
            if (file == null || !file.isFile()) {
                Logger.diagnosticInfo(DiagnosticCategory.SETTINGS, "OwnFont",
                        () -> "The picked font file's copy is missing, so Facebook's text is drawn in the phone's font");
                return new Picked(source, null, null, null);
            }
            Typeface base;
            try {
                base = new Typeface.Builder(file).build();
            } catch (RuntimeException failure) {
                base = null;
            }
            if (base == null) {
                Logger.diagnosticInfo(DiagnosticCategory.SETTINGS, "OwnFont",
                        () -> "The picked font file didn't load, so Facebook's text is drawn in the phone's font");
                return new Picked(source, file, null, null);
            }
            return new Picked(source, file, base, FontFile.weightAxis(file));
        }

        /** Whether [typeface] is the copy or one of the weights built from it. */
        boolean built(Typeface typeface) {
            return typeface == base || styles.containsValue(typeface);
        }

        /** The copy at [weight] and [italic], or null when it has nothing to build. */
        @Nullable
        Typeface styled(int weight, boolean italic) {
            if (base == null) return null;
            int key = weight * 2 + (italic ? 1 : 0);
            Typeface styled = styles.get(key);
            if (styled != null) return styled;
            styled = build(weight, italic);
            Typeface raced = styles.putIfAbsent(key, styled);
            return raced != null ? raced : styled;
        }

        /**
         * A variable font is built with its 'wght' axis at [weight], held inside the axis, and told
         * it is that weight, so Android doesn't embolden it again. A slant it has no axis for is
         * Android's. Any other font keeps its own outlines at the style asked for, and Android
         * draws a bold or a slant the font doesn't have, the way it does for a single-weight font
         * of its own.
         */
        private Typeface build(int weight, boolean italic) {
            if (weights != null && file != null) {
                int axis = Math.round(Math.max(weights[0], Math.min(weights[1], weight)));
                try {
                    Typeface built = new Typeface.Builder(file)
                            .setFontVariationSettings("'wght' " + axis)
                            .setWeight(weight)
                            .setItalic(false)
                            .build();
                    if (built != null) return italic ? Typeface.create(built, weight, true) : built;
                } catch (RuntimeException failure) {
                    // Falls back to the file at its own weight below.
                }
            }
            return Typeface.create(base, weight, italic);
        }
    }
}
