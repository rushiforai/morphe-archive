/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.captions;

import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.util.TypedValue;
import android.view.View;
import android.widget.TextView;
import app.morphe.extension.shared.ResourceIdCache;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.settings.Settings;
import java.util.Map;
import java.util.WeakHashMap;

public final class CaptionStyle {
    private static final Map<View, Drawable.ConstantState> BACKGROUNDS = new WeakHashMap<>();
    private static final Map<TextView, Float> SIZES = new WeakHashMap<>();

    private static final String APP_PACKAGE = "com.zhiliaoapp.musically";
    /**
     * The caption text view and the strip behind it, by their obfuscated names.
     *
     * <p>These used to be written here as the numbers they resolve to on 46.2.3, so a build that
     * reshuffled the resource table left both caption settings doing nothing and said nothing.
     * A name this build does not have is reported. So is a name it does have that names nothing
     * in the container, which is the likelier of the two: obfuscated entry names are assigned
     * by a counter, so a reshuffle moves a name onto a different view more often than it drops
     * one. That one cannot be reported on sight, though. The hook is installed on every way out
     * of TikTok's render method, including the ones that rendered nothing, and it runs before
     * the check that this renderer is the video on screen, so an empty container is an ordinary
     * outcome rather than a broken build. See {@link #noteLookup}.
     *
     * <p>That is what happened between 46.2.3 and 47.0.3. The caption layout the renderer
     * inflates has the same shape on both, a ConstraintLayout strip holding the caption text (a
     * TuxTextView subclass) and the view that draws its layout, but the strip went from dfn to
     * dlk and the text from dfu to dlr. On 47.0.3 dfu names nothing at all and dfn an icon in
     * another layout, so both settings did nothing on the target. Read off the renderer's render
     * method, which loads dlr, and CLACaptionAssemV2, which loads dlk.
     */
    private static final String TEXT_ID = "dlr";
    private static final String BACKGROUND_ID = "dlk";
    private static final ResourceIdCache RESOURCE_IDS = new ResourceIdCache();

    /**
     * The sizes a caption may be asked for, in points. The settings row says these numbers,
     * formatted in from here, and clamps a typed value the same way {@link #size()} does.
     */
    public static final int MIN_TEXT_SIZE = 12;
    public static final int MAX_TEXT_SIZE = 48;

    /** Zero is TikTok's own size; anything else lands between the two bounds. */
    public static int clampSize(int value) {
        return value <= 0 ? 0 : Math.max(MIN_TEXT_SIZE, Math.min(MAX_TEXT_SIZE, value));
    }

    static int size() {
        return clampSize(Settings.CAPTION_TEXT_SIZE.get());
    }

    public static Layout layout(Layout original) {
        int size = size();
        if (original == null || size == 0) return original;
        // On the host's render path, so nothing here may throw. The context is set in
        // attachBaseContext, long before a caption is drawn, but a null answer costs one line.
        android.content.Context context = Utils.getContext();
        if (context == null) return original;
        TextPaint paint = new TextPaint(original.getPaint());
        android.util.DisplayMetrics metrics = context.getResources().getDisplayMetrics();
        paint.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, size, metrics));
        int cap = metrics.widthPixels
                - Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, TIKTOK_MARGINS_DP, metrics));
        int width = width(original.getWidth(), original.getPaint().getTextSize(), paint.getTextSize(), cap);
        Layout built = build(original, paint, width);
        // TikTok sizes the caption view to its layout and builds that layout as wide as its
        // longest line, so the strip behind it fits the text. A layout left wider than its text
        // left an empty band beside it (refutation review of ecf26b6c).
        int longest = longestLine(built);
        if (longest > 0 && longest < width) {
            Layout fitted = build(original, paint, longest);
            if (fitted.getLineCount() == built.getLineCount()) return fitted;
        }
        return built;
    }

    /**
     * TikTok's own limit on a caption's width is the screen less these: 12 or 16 dp of margin,
     * 72 dp for the rail of buttons and 6 dp either side ({@code X.0B1g} on 47.0.3), so a caption
     * no wider than the screen less 100 dp stays clear of the rail on every layout.
     */
    private static final float TIKTOK_MARGINS_DP = 100;

    private static Layout build(Layout original, TextPaint paint, int width) {
        return new StaticLayout(original.getText(), paint, width,
                original.getAlignment(), original.getSpacingMultiplier(), original.getSpacingAdd(), true);
    }

    /** The widest line's drawn width, trailing spaces left out. */
    static int longestLine(Layout layout) {
        float widest = 0;
        for (int line = 0; line < layout.getLineCount(); line++) widest = Math.max(widest, layout.getLineMax(line));
        return (int) Math.ceil(widest);
    }

    /**
     * The width a caption is laid out in at the chosen size. TikTok hands over the width it
     * measured for its own text, and kept as it was, a bigger size wrapped into that narrow column
     * and split words ("conditio" over "ns." at 28 on the S22). It grows with the text, so the
     * lines break where TikTok's did, up to TikTok's own limit ({@code cap}); past that, lines wrap
     * between words, and only a single word wider than the limit still breaks. Never narrower
     * than TikTok's own width.
     */
    static int width(int measured, float from, float to, int cap) {
        int base = Math.max(1, measured);
        if (from <= 0 || to <= from) return base;
        int grown = (int) Math.ceil(base * (double) to / from);
        return Math.min(grown, Math.max(base, cap));
    }

    static void apply(View root) {
        int textId = identifier(root, TEXT_ID);
        TextView text = textId == 0 ? null : root.findViewById(textId);
        if (text != null) {
            if (size() > 0) {
                // Not putIfAbsent: that is an API 24 default method on the Map interface, and
                // this runs on every caption render on a build whose floor is API 23.
                if (!SIZES.containsKey(text)) SIZES.put(text, text.getTextSize());
                text.setTextSize(TypedValue.COMPLEX_UNIT_SP, size());
            } else if (SIZES.containsKey(text)) text.setTextSize(TypedValue.COMPLEX_UNIT_PX, SIZES.remove(text));
        }
        int backgroundId = identifier(root, BACKGROUND_ID);
        View background = backgroundId == 0 ? null : root.findViewById(backgroundId);
        noteLookup(root, text != null, background != null, textId != 0, backgroundId != 0);
        if (background == null) return;
        String color = Settings.CAPTION_BACKGROUND.get();
        if (!"default".equals(color) && !BACKGROUNDS.containsKey(background)) {
            Drawable drawable = background.getBackground();
            BACKGROUNDS.put(background, drawable == null ? null : drawable.getConstantState());
        }
        if ("default".equals(color)) {
            if (!BACKGROUNDS.containsKey(background)) return;
            Drawable.ConstantState nativeState = BACKGROUNDS.remove(background);
            background.setBackground(nativeState == null ? null : nativeState.newDrawable(background.getResources()));
        } else background.setBackgroundColor(backgroundColor());
    }

    /**
     * How many renders of a container that has something in it have to miss before this says so.
     *
     * <p>One miss is not evidence of anything. The hook is injected at every return-void in the
     * host's render method, early bail-outs included, and HookStatus never forgets a miss, so a
     * single empty renderer would make the Hook status row read broken for the rest of the
     * process. Twenty consecutive renders of a container that is really a caption container is
     * not a bail-out; on a working build the first of them finds the view and the count is
     * dropped.
     */
    private static final int MISSES_BEFORE_REPORTING = 20;

    /**
     * Consecutive misses per name, and the names that have ever been found.
     *
     * <p>Only ever touched from apply, which runs on the thread that lays the caption out.
     */
    private static final Map<String, Integer> MISSES = new java.util.HashMap<>();
    private static final java.util.Set<String> FOUND = new java.util.HashSet<>();

    /**
     * Follows an id that resolved but found nothing under this container.
     *
     * <p>Silent while the container is empty, because that is what the early returns in TikTok's
     * own render method look like from here, and silent forever once the name has been found
     * once: a build where it works has nothing to report, and every later miss on it is another
     * bail-out.
     */
    private static void noteLookup(View root, boolean foundText, boolean foundBackground,
                                   boolean textResolved, boolean backgroundResolved) {
        if (foundText) FOUND.add(TEXT_ID);
        if (foundBackground) FOUND.add(BACKGROUND_ID);
        // Either one being found says this container really is a caption container, which is
        // what makes the other one's absence worth counting rather than a bail-out. Counting
        // the pair as one thing instead made a build where exactly one id had moved
        // unreportable for the life of the process: the working name cleared the count on
        // every render and the broken one never reached the threshold.
        boolean aCaptionContainer = foundText || foundBackground;
        if (!aCaptionContainer && !hasChildren(root)) return;
        note(TEXT_ID, textResolved, foundText, aCaptionContainer);
        note(BACKGROUND_ID, backgroundResolved, foundBackground, aCaptionContainer);
    }

    private static void note(String name, boolean resolved, boolean found,
                             boolean aCaptionContainer) {
        if (found) {
            MISSES.remove(name);
            return;
        }
        if (!resolved || FOUND.contains(name)) return;
        int misses = (MISSES.containsKey(name) ? MISSES.get(name) : 0) + 1;
        MISSES.put(name, misses);
        // A container with children but neither caption view in it might be somebody else's
        // view, so those count towards the same total but only report once the count is long
        // past anything a handful of stray renders could reach.
        int needed = aCaptionContainer ? MISSES_BEFORE_REPORTING : MISSES_BEFORE_REPORTING * 2;
        if (misses >= needed) {
            HookStatus.missingMember("captions", "view", "caption container", name);
        }
    }

    private static boolean hasChildren(View root) {
        return root instanceof android.view.ViewGroup
                && ((android.view.ViewGroup) root).getChildCount() > 0;
    }

    /** Lets a test stand in for a TikTok resource id, which only the real APK resolves. */
    static void resolveForTests(String name, int id) {
        RESOURCE_IDS.putForTests(APP_PACKAGE, name, id);
    }

    /** Forgets what has been looked up, between tests. */
    static void resetLookupsForTests() {
        MISSES.clear();
        FOUND.clear();
    }

    /** Resolves a caption view id, saying so once when this build does not have it. */
    private static int identifier(View view, String name) {
        int id = RESOURCE_IDS.resolve(
                view == null ? null : view.getResources(), APP_PACKAGE, name, false);
        if (id == 0) HookStatus.missingViewId("captions", name);
        else HookStatus.bound("captions", name);
        return id;
    }

    static int backgroundColor() {
        switch (Settings.CAPTION_BACKGROUND.get()) {
            case "transparent": return Color.TRANSPARENT;
            case "black": return Color.BLACK;
            default: return 0xB3000000;
        }
    }
}
