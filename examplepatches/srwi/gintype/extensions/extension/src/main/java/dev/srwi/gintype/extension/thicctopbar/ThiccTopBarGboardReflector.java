package dev.srwi.gintype.extension.thicctopbar;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.inputmethodservice.InputMethodService;
import android.os.Build;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputConnection;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.Locale;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Encapsulates Gboard internal reflection for candidate extraction,
 * SoftKeyView invocation, and slot view inspection.
 * Uses resilient signature- and type-based fallbacks so future Gboard version
 * updates with renamed obfuscated fields/methods do not break functionality.
 */
public final class ThiccTopBarGboardReflector {
    /** Identify whether a SoftKeyboardView belongs to Gboard's top header strip. */
    public static boolean isHeaderSoftKeyboardView(View view) {
        if (view == null) {
            return false;
        }
        Object tag = view.getTag();
        if (tag instanceof CharSequence) {
            String tagText = tag.toString();
            if (tagText.contains("keyboard-header-area")) {
                return true;
            }
            if (tagText.contains("keyboard-body-area")) {
                return false;
            }
        }
        if (view.getParent() instanceof View) {
            String parentName = getResourceEntryNameOrNull((View) view.getParent());
            if ("keyboard_header_view_holder".equals(parentName)) {
                return true;
            }
            if ("keyboard_body_view_holder".equals(parentName)) {
                return false;
            }
        }
        return hasDescendantSimpleName(view, "LatinFixedCountCandidatesHolderView", 6);
    }

    private static String getResourceEntryNameOrNull(View view) {
        int id = view.getId();
        if (id == View.NO_ID) {
            return null;
        }
        try {
            return view.getResources().getResourceEntryName(id);
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Finds Gboard's LatinFixedCountCandidatesHolderView inside the given view subtree. */
    public static ViewGroup findCandidatesHolderView(View view) {
        View found = findDescendantBySimpleName(view, "LatinFixedCountCandidatesHolderView", 6);
        return found instanceof ViewGroup ? (ViewGroup) found : null;
    }

    private static boolean hasDescendantSimpleName(View view, String simpleName, int maxDepth) {
        return findDescendantBySimpleName(view, simpleName, maxDepth) != null;
    }

    private static View findDescendantBySimpleName(View view, String simpleName, int maxDepth) {
        if (view == null || maxDepth < 0) {
            return null;
        }
        if (simpleName.equals(view.getClass().getSimpleName())) {
            return view;
        }
        if (maxDepth == 0 || !(view instanceof ViewGroup)) {
            return null;
        }
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            View match = findDescendantBySimpleName(group.getChildAt(i), simpleName, maxDepth - 1);
            if (match != null) {
                return match;
            }
        }
        return null;
    }
    private static final String TAG = "ThiccTopBarGboardReflector";

    private static boolean candidateFieldsLookupAttempted = false;
    private static Field candidateTextField = null;
    private static Field candidateTypeField = null;
    private static Field candidateAutoCorrectField = null;

    private static volatile int stockTrailAccentRgb = -1;
    private static volatile int stockTrailNightMask = -1;
    private static volatile int cachedKeyboardThemeAccentRgb = -1;
    private static volatile int imeActionKeyId = 0;
    private static volatile Boolean lastDetectedKeyboardDark = null;

    private ThiccTopBarGboardReflector() {}

    /**
     * Records the native Stock Gboard gesture trail RGB so the Matrix bar can match
     * the normal keyboard accent rather than falling back to hardcoded blue.
     */
    public static void recordStockTrailAccent(Context context, int rgb) {
        if (rgb < 0) return;
        stockTrailNightMask = context != null
                ? (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                : -1;
        stockTrailAccentRgb = rgb & 0x00ffffff;
    }

    /**
     * Determines whether the active Gboard keyboard theme is dark by sampling the actual
     * keyboard surface drawable when available, falling back to cached surface state or
     * system night mode.
     */
    public static boolean isKeyboardDark(View view) {
        View cur = view;
        while (cur != null) {
            Drawable bg = cur.getBackground();
            if (bg != null) {
                int rgb = sampleDrawableCenterRgb(bg);
                if (rgb >= 0) {
                    boolean dark = perceivedLuminance(rgb) < 140f;
                    lastDetectedKeyboardDark = dark;
                    return dark;
                }
            }
            cur = (cur.getParent() instanceof View) ? (View) cur.getParent() : null;
        }
        Boolean cachedDark = lastDetectedKeyboardDark;
        if (cachedDark != null) return cachedDark;
        if (view != null && view.getContext() != null) {
            return (view.getContext().getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        }
        return false;
    }

    /**
     * Records a live keyboard theme accent RGB (e.g. from the Enter key or popup highlight)
     * so views without direct keyboard hierarchy access can still match the active theme.
     */
    public static void recordKeyboardThemeAccent(int rgb) {
        if (rgb < 0) return;
        cachedKeyboardThemeAccentRgb = rgb & 0x00ffffff;
    }

    private static final java.util.Map<View, Integer> ORIGINAL_TARGET_WIDTHS =
            java.util.Collections.synchronizedMap(new java.util.WeakHashMap<>());

    public static void invalidateThemeCaches() {
        cachedKeyboardThemeAccentRgb = -1;
        stockTrailAccentRgb = -1;
        stockTrailNightMask = -1;
        lastDetectedKeyboardDark = null;
    }

    static void resetAccentCacheForTesting() {
        invalidateThemeCaches();
    }

    /**
     * Returns an appropriate shading RGB (0xRRGGBB) for the spacebar timer indicator:
     * pure white on dark/colored spacebars (to lighten them in their own hue), or the
     * active theme accent color on bright/light-theme spacebars.
     */
    public static int resolveSpacebarShadingColor(View spacebarView, Context context) {
        if (spacebarView != null && spacebarView.getBackground() != null) {
            int bgRgb = sampleDrawableCenterRgb(spacebarView.getBackground());
            if (bgRgb >= 0) {
                boolean lightSpacebar = perceivedLuminance(bgRgb) >= 150f;
                return lightSpacebar
                        ? (resolveNormalAccentColor(spacebarView, context, false) & 0x00ffffff)
                        : 0xFFFFFF;
            }
        }
        boolean dark = isKeyboardDark(spacebarView);
        return dark ? 0xFFFFFF : (resolveNormalAccentColor(spacebarView, context, false) & 0x00ffffff);
    }

    private static final Object SAMPLE_LOCK = new Object();
    private static final int SAMPLE_SCRATCH_SIZE = 8;
    private static Bitmap sampleScratchBitmap;
    private static Canvas sampleScratchCanvas;

    static int sampleDrawableCenterRgb(Drawable d) {
        if (d == null) return -1;
        try {
            if (d instanceof ColorDrawable cd) {
                int color = cd.getColor();
                if (((color >>> 24) & 0xff) >= 128) {
                    return color & 0x00ffffff;
                }
                return -1;
            }
            int w = Math.max(1, Math.min(SAMPLE_SCRATCH_SIZE,
                    d.getBounds().width() > 0 ? d.getBounds().width() : d.getIntrinsicWidth()));
            int h = Math.max(1, Math.min(SAMPLE_SCRATCH_SIZE,
                    d.getBounds().height() > 0 ? d.getBounds().height() : d.getIntrinsicHeight()));
            int pixel;
            synchronized (SAMPLE_LOCK) {
                if (sampleScratchBitmap == null || sampleScratchBitmap.isRecycled()) {
                    sampleScratchBitmap = Bitmap.createBitmap(
                            SAMPLE_SCRATCH_SIZE, SAMPLE_SCRATCH_SIZE, Bitmap.Config.ARGB_8888);
                    sampleScratchCanvas = new Canvas(sampleScratchBitmap);
                }
                sampleScratchCanvas.drawColor(0, android.graphics.PorterDuff.Mode.CLEAR);
                int origL = d.getBounds().left;
                int origT = d.getBounds().top;
                int origR = d.getBounds().right;
                int origB = d.getBounds().bottom;
                d.setBounds(0, 0, w, h);
                d.draw(sampleScratchCanvas);
                d.setBounds(origL, origT, origR, origB);
                pixel = sampleScratchBitmap.getPixel(w / 2, h / 2);
            }
            if (((pixel >>> 24) & 0xff) >= 128) {
                return pixel & 0x00ffffff;
            }
        } catch (Throwable ignored) {
        }
        return -1;
    }

    public static int resolveNormalAccentColor(Context context, boolean dark) {
        return resolveNormalAccentColor(null, context, dark);
    }

    public static int resolveNormalAccentColor(View anchorView, Context context, boolean dark) {
        int liveThemeRgb = sampleKeyboardThemeAccentRgb(anchorView);
        if (liveThemeRgb >= 0) {
            return 0xFF000000 | ensureReadableAccentRgb(liveThemeRgb, dark);
        }

        int cachedThemeRgb = cachedKeyboardThemeAccentRgb;
        if (cachedThemeRgb >= 0) {
            return 0xFF000000 | ensureReadableAccentRgb(cachedThemeRgb, dark);
        }

        int usableStockRgb = -1;
        int cachedRgb = stockTrailAccentRgb;
        if (cachedRgb >= 0) {
            boolean brightTrail = perceivedLuminance(cachedRgb) >= 140f;
            if (brightTrail == dark) {
                usableStockRgb = cachedRgb;
            }
        }
        int dynamicPrimaryRgb = -1;
        if (context != null) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                dynamicPrimaryRgb = resolveAndroidColorRgb(
                        context,
                        dark ? android.R.color.system_accent1_200 : android.R.color.system_accent1_600);
            }
            if (dynamicPrimaryRgb < 0) {
                TypedValue tv = new TypedValue();
                if (context.getTheme() != null
                        && context.getTheme().resolveAttribute(android.R.attr.colorAccent, tv, true)
                        && tv.type >= TypedValue.TYPE_FIRST_COLOR_INT
                        && tv.type <= TypedValue.TYPE_LAST_COLOR_INT
                        && tv.data != 0) {
                    dynamicPrimaryRgb = tv.data & 0x00ffffff;
                }
            }
        }
        return chooseNormalAccentColor(usableStockRgb, dynamicPrimaryRgb, dark);
    }

    /**
     * Samples the active Gboard theme accent color from the keyboard's IME action (Enter) key
     * in the view hierarchy and caches it for fallback callers.
     */
    static int sampleKeyboardThemeAccentRgb(View anchorView) {
        if (anchorView == null) return -1;
        try {
            View root = anchorView.getRootView();
            if (root == null) return -1;
            Context ctx = anchorView.getContext();
            if (ctx == null) return -1;
            int id = imeActionKeyId;
            if (id == 0) {
                id = ctx.getResources().getIdentifier("key_pos_ime_action", "id", ctx.getPackageName());
                imeActionKeyId = id != 0 ? id : -1;
            }
            if (id <= 0) return -1;
            View imeActionView = root.findViewById(id);
            if (imeActionView == null || imeActionView.getVisibility() != View.VISIBLE) {
                return -1;
            }
            int rgb = sampleKeyBackgroundRgb(imeActionView, 3);
            if (rgb >= 0) {
                recordKeyboardThemeAccent(rgb);
            }
            return rgb;
        } catch (Throwable ignored) {
            return -1;
        }
    }

    /**
     * Samples the background drawable of a view or its nested background children.
     */
    private static int sampleKeyBackgroundRgb(View view, int maxDepth) {
        if (view == null || view.getVisibility() != View.VISIBLE) return -1;
        Drawable bg = view.getBackground();
        if (bg != null) {
            int rgb = sampleDrawableCenterRgb(bg);
            if (rgb >= 0) return rgb;
        }
        if (maxDepth > 0 && view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            for (int i = 0; i < vg.getChildCount(); i++) {
                int rgb = sampleKeyBackgroundRgb(vg.getChildAt(i), maxDepth - 1);
                if (rgb >= 0) return rgb;
            }
        }
        return -1;
    }

    /**
     * Samples a view's background or ImageView drawable center RGB.
     */
    public static int sampleViewDrawableRgb(View view) {
        if (view == null) return -1;
        int bgRgb = sampleDrawableCenterRgb(view.getBackground());
        if (bgRgb >= 0) return bgRgb;
        if (view instanceof ImageView) {
            return sampleDrawableCenterRgb(((ImageView) view).getDrawable());
        }
        return -1;
    }

    /**
     * Adjusts an RGB theme color's luminance while preserving hue when needed so it remains
     * legible against a dark or light keyboard surface.
     */
    static int ensureReadableAccentRgb(int rgb, boolean dark) {
        rgb &= 0x00ffffff;
        float lum = perceivedLuminance(rgb);
        int r = (rgb >> 16) & 0xff;
        int g = (rgb >> 8) & 0xff;
        int b = rgb & 0xff;
        if (dark) {
            if (lum >= 115f) return rgb;
            float denom = Math.max(1f, 255f - lum);
            float t = Math.min(1f, (130f - lum) / denom);
            int nr = Math.min(255, Math.round(r + (255 - r) * t));
            int ng = Math.min(255, Math.round(g + (255 - g) * t));
            int nb = Math.min(255, Math.round(b + (255 - b) * t));
            return (nr << 16) | (ng << 8) | nb;
        } else {
            if (lum <= 155f) return rgb;
            float scale = 135f / Math.max(1f, lum);
            int nr = Math.max(0, Math.min(255, Math.round(r * scale)));
            int ng = Math.max(0, Math.min(255, Math.round(g * scale)));
            int nb = Math.max(0, Math.min(255, Math.round(b * scale)));
            return (nr << 16) | (ng << 8) | nb;
        }
    }

    static int chooseNormalAccentColor(int stockTrailRgb, int dynamicPrimaryRgb, boolean dark) {
        if (stockTrailRgb >= 0) {
            return 0xFF000000 | (stockTrailRgb & 0x00ffffff);
        }
        if (dynamicPrimaryRgb >= 0) {
            return 0xFF000000 | (dynamicPrimaryRgb & 0x00ffffff);
        }
        return dark ? 0xFF8AB4F8 : 0xFF1A73E8;
    }

    public static int resolveAndroidColorRgb(Context context, int resId) {
        if (context == null) return -1;
        try {
            return context.getColor(resId) & 0x00ffffff;
        } catch (Throwable ignored) {
            return -1;
        }
    }

    public static float perceivedLuminance(int rgb) {
        int r = (rgb >> 16) & 0xff;
        int g = (rgb >> 8) & 0xff;
        int b = rgb & 0xff;
        return 0.299f * r + 0.587f * g + 0.114f * b;
    }

    private static final class HolderMethodCache {
        final Class<?> holderClass;
        final Method slotCountMethod;
        final Method softKeyAtSlotMethod;
        final Method candidateAtSlotMethod;
        final Method extractFromKeyMethod;
        final Method declaredCountMethodA;

        HolderMethodCache(
                Class<?> holderClass,
                Method slotCountMethod,
                Method softKeyAtSlotMethod,
                Method candidateAtSlotMethod,
                Method extractFromKeyMethod,
                Method declaredCountMethodA
        ) {
            this.holderClass = holderClass;
            this.slotCountMethod = slotCountMethod;
            this.softKeyAtSlotMethod = softKeyAtSlotMethod;
            this.candidateAtSlotMethod = candidateAtSlotMethod;
            this.extractFromKeyMethod = extractFromKeyMethod;
            this.declaredCountMethodA = declaredCountMethodA;
        }
    }

    private static volatile HolderMethodCache cachedHolderMethods;

    private static HolderMethodCache resolveHolderMethods(Class<?> holderClass) {
        HolderMethodCache cached = cachedHolderMethods;
        if (cached != null && cached.holderClass == holderClass) {
            return cached;
        }
        Method slotCountMethod = null;
        Method softKeyAtSlotMethod = null;
        Method candidateAtSlotMethod = null;
        Method extractFromKeyMethod = null;
        Method declaredCountMethodA = null;

        // Search declared methods on holderClass to avoid matching inherited Object/View/ViewGroup methods
        for (Method m : holderClass.getDeclaredMethods()) {
            boolean isStatic = Modifier.isStatic(m.getModifiers());
            if (!isStatic && m.getParameterCount() == 0 && m.getReturnType() == int.class
                    && ("a".equals(m.getName()) || slotCountMethod == null)) {
                m.setAccessible(true);
                slotCountMethod = m;
            } else if (!isStatic && m.getParameterCount() == 1 && m.getParameterTypes()[0] == int.class
                    && View.class.isAssignableFrom(m.getReturnType())
                    && softKeyAtSlotMethod == null) {
                m.setAccessible(true);
                softKeyAtSlotMethod = m;
            } else if (m.getParameterCount() == 1 && "z".equals(m.getName())) {
                m.setAccessible(true);
                extractFromKeyMethod = m;
            }
        }

        try {
            // Gboard slot candidate getter (often named 'R' taking int)
            candidateAtSlotMethod = holderClass.getDeclaredMethod("R", int.class);
            candidateAtSlotMethod.setAccessible(true);
        } catch (Throwable ignored) {
            for (Method m : holderClass.getDeclaredMethods()) {
                if (m.getParameterCount() == 1 && m.getParameterTypes()[0] == int.class
                        && m.getReturnType() != void.class && !View.class.isAssignableFrom(m.getReturnType())) {
                    m.setAccessible(true);
                    candidateAtSlotMethod = m;
                    break;
                }
            }
        }

        try {
            Method mA = holderClass.getDeclaredMethod("a");
            if (mA.getReturnType() == int.class) {
                mA.setAccessible(true);
                declaredCountMethodA = mA;
            }
        } catch (Throwable ignored) {
        }

        HolderMethodCache created = new HolderMethodCache(
                holderClass,
                slotCountMethod,
                softKeyAtSlotMethod,
                candidateAtSlotMethod,
                extractFromKeyMethod,
                declaredCountMethodA);
        cachedHolderMethods = created;
        StringBuilder missing = new StringBuilder();
        if (slotCountMethod == null) missing.append("slotCount");
        if (softKeyAtSlotMethod == null) {
            if (missing.length() > 0) missing.append(", ");
            missing.append("softKeyAtSlot");
        }
        if (candidateAtSlotMethod == null) {
            if (missing.length() > 0) missing.append(", ");
            missing.append("candidateAtSlot");
        }
        if (extractFromKeyMethod == null) {
            if (missing.length() > 0) missing.append(", ");
            missing.append("extractFromKey(z)");
        }
        if (declaredCountMethodA == null) {
            if (missing.length() > 0) missing.append(", ");
            missing.append("declaredCount(a)");
        }
        if (missing.length() > 0) {
            Log.w(TAG, "resolveHolderMethods(" + holderClass.getSimpleName()
                    + ") missing methods: " + missing);
        }
        return created;
    }

    /**
     * Extracts candidates directly from the holder view's slots (0, 1, 2) where
     * Gboard has assigned them. Falls back to candidateListObj if slots are empty.
     */
    public static List<GboardThiccTopBarRuntime.CandidateItem> extractSlotCandidatesFromHolder(
            ViewGroup holderView, Object fallbackListObj) {
        List<GboardThiccTopBarRuntime.CandidateItem> listItems =
                fallbackListObj != null ? extractCandidatesFromIterable(fallbackListObj) : Collections.emptyList();
        if (listItems.size() == 1) {
            // Single-candidate updates (such as 1-finger live glide previews) are placed by Gboard
            // in the center slot (slot 1) while slot 0 can retain a stale view from the prior update.
            // Trust the live candidate list directly and attach the matching SoftKeyView if present.
            GboardThiccTopBarRuntime.CandidateItem only = listItems.get(0);
            View matchedSoftKey = only.softKey;
            int matchedSlot = only.slotIndex;
            try {
                HolderMethodCache methods = resolveHolderMethods(holderView.getClass());
                Method softKeyAtSlotMethod = methods.softKeyAtSlotMethod;
                Method candidateAtSlotMethod = methods.candidateAtSlotMethod;
                Method extractFromKeyMethod = methods.extractFromKeyMethod;
                for (int slot = 0; slot < 3; slot++) {
                    Object cand = null;
                    if (candidateAtSlotMethod != null) {
                        try {
                            cand = candidateAtSlotMethod.invoke(holderView, slot);
                        } catch (Throwable ignored) {
                        }
                    }
                    View softKey = (softKeyAtSlotMethod != null) ? (View) softKeyAtSlotMethod.invoke(holderView, slot) : null;
                    if (cand == null && softKey != null && extractFromKeyMethod != null) {
                        try {
                            cand = extractFromKeyMethod.invoke(null, softKey);
                        } catch (Throwable ignored) {
                        }
                    }
                    if (cand != null && only.text.equals(extractCandidateText(cand))) {
                        matchedSoftKey = softKey;
                        matchedSlot = slot;
                        break;
                    }
                }
            } catch (Throwable ignored) {
            }
            return Collections.singletonList(new GboardThiccTopBarRuntime.CandidateItem(
                    only.text, matchedSlot, only.isRaw, only.isAutoCorrect, only.isPrediction,
                    only.candidateType, only.rawCandidateObj, matchedSoftKey));
        }

        List<GboardThiccTopBarRuntime.CandidateItem> items = new ArrayList<>();

        try {
            HolderMethodCache methods = resolveHolderMethods(holderView.getClass());
            Method slotCountMethod = methods.slotCountMethod;
            Method softKeyAtSlotMethod = methods.softKeyAtSlotMethod;
            Method candidateAtSlotMethod = methods.candidateAtSlotMethod;
            Method extractFromKeyMethod = methods.extractFromKeyMethod;

            int count = 0;
            if (slotCountMethod != null) {
                count = (Integer) slotCountMethod.invoke(holderView);
            }

            if (count > 0) {
                int safeCount = Math.min(count, 32);
                for (int slot = 0; slot < safeCount; slot++) {
                    Object cand = null;
                    if (candidateAtSlotMethod != null) {
                        try {
                            cand = candidateAtSlotMethod.invoke(holderView, slot);
                        } catch (Throwable ignored) {
                        }
                    }
                    View softKey = (softKeyAtSlotMethod != null) ? (View) softKeyAtSlotMethod.invoke(holderView, slot) : null;
                    if (cand == null && softKey != null && extractFromKeyMethod != null) {
                        try {
                            cand = extractFromKeyMethod.invoke(null, softKey);
                        } catch (Throwable ignored) {
                        }
                    }

                    if (cand != null) {
                        String text = extractCandidateText(cand);
                        if (text != null && !text.trim().isEmpty()) {
                            boolean isRaw = extractCandidateIsRaw(cand);
                            boolean isAuto = extractCandidateIsAutoCorrect(cand);
                            boolean isPred = extractCandidateIsPrediction(cand);
                            String type = extractCandidateType(cand);
                            items.add(new GboardThiccTopBarRuntime.CandidateItem(
                                    text, slot, isRaw, isAuto, isPred, type, cand, softKey));
                        }
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "extractSlotCandidatesFromHolder error: " + t.getMessage());
        }

        // Fallback: parse raw list if slot views are not populated yet
        if (items.isEmpty() && fallbackListObj != null) {
            items = extractCandidatesFromIterable(fallbackListObj);
        }

        return items;
    }

    /**
     * Commits a candidate via Gboard's native SoftKeyboardView.a(softKey).
     * Returns true if native invocation succeeded.
     */
    public static boolean commitCandidateNative(ViewGroup holderView, GboardThiccTopBarRuntime.CandidateItem selectedItem) {
        try {
            ViewGroup softKeyboardView = findSoftKeyboardView(holderView);

            View softKey = selectedItem.softKey;
            if (softKey == null && selectedItem.slotIndex >= 0) {
                try {
                    for (Method m : holderView.getClass().getMethods()) {
                        if (m.getParameterCount() == 1 && m.getParameterTypes()[0] == int.class && View.class.isAssignableFrom(m.getReturnType())) {
                            softKey = (View) m.invoke(holderView, selectedItem.slotIndex);
                            break;
                        }
                    }
                } catch (Throwable ignored) {
                }
            }

            if (softKeyboardView != null && softKey != null && softKey.isAttachedToWindow()) {
                for (Method m : softKeyboardView.getClass().getMethods()) {
                    if (m.getParameterCount() == 1 && m.getParameterTypes()[0].isAssignableFrom(softKey.getClass())) {
                        m.setAccessible(true);
                        m.invoke(softKeyboardView, softKey);
                        Log.i(TAG, "commitCandidateNative: successfully invoked " + m.getName() + " on SoftKeyboardView");
                        return true;
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "commitCandidateNative error: " + t.getMessage());
        }
        return false;
    }

    /**
     * Checks if a candidate item represents an Undo or Delete recovery candidate.
     */
    public static boolean isUndoCandidate(GboardThiccTopBarRuntime.CandidateItem ci) {
        if (ci == null) return false;
        String type = ci.candidateType != null ? ci.candidateType.toUpperCase() : "";
        if (type.contains("UNDO") || type.contains("DELETE") || type.contains("RESTORE") || type.contains("REVERT")) {
            return true;
        }
        if (ci.text != null) {
            String t = ci.text.trim();
            if (t.equalsIgnoreCase("Undo") || t.equalsIgnoreCase("Rückgängig")
                    || t.equalsIgnoreCase("Deshacer") || t.equalsIgnoreCase("Annuler")
                    || t.equalsIgnoreCase("Annulla") || t.equalsIgnoreCase("Desfazer")
                    || t.equalsIgnoreCase("Отменить") || t.equals("復原") || t.equals("撤销") || t.equals("元に戻す")) {
                return true;
            }
        }
        return false;
    }

    /**
     * Returns true if any candidate in items is an Undo / recovery candidate.
     */
    public static boolean hasUndoCandidate(List<GboardThiccTopBarRuntime.CandidateItem> items) {
        if (items == null || items.isEmpty()) return false;
        for (GboardThiccTopBarRuntime.CandidateItem ci : items) {
            if (isUndoCandidate(ci)) return true;
        }
        return false;
    }

    /**
     * Checks if a view represents the Undo action (button, chip, or banner).
     */
    public static boolean isUndoView(View view) {
        if (view == null) return false;
        try {
            CharSequence cd = view.getContentDescription();
            if (cd != null) {
                String s = cd.toString().toLowerCase();
                if (s.contains("undo") || s.contains("rückgängig") || s.contains("deshacer")
                        || s.contains("annuler") || s.contains("annulla") || s.contains("desfazer")
                        || s.contains("отменить") || s.contains("復原") || s.contains("撤销") || s.contains("元に戻す")) {
                    return true;
                }
            }
            Object tag = view.getTag();
            if (tag instanceof String t) {
                String s = t.toLowerCase();
                if (s.contains("undo")) {
                    return true;
                }
            }
            int id = view.getId();
            if (id != View.NO_ID && id != 0) {
                try {
                    String resName = view.getResources().getResourceEntryName(id);
                    if (resName != null && resName.toLowerCase().contains("undo")) {
                        return true;
                    }
                } catch (Throwable ignored) {
                }
            }
            String className = view.getClass().getName().toLowerCase();
            if (className.contains("undo") && !className.contains("undoredoaccesspoint")) {
                return true;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    /**
     * Returns true if view is an Undo view or contains an Undo view among its descendants.
     */
    public static boolean containsUndoView(View view) {
        if (view == null) return false;
        if (isUndoView(view)) return true;
        if (view instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                if (containsUndoView(vg.getChildAt(i))) {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * Scans the view hierarchy to determine if an Undo button, Undo chip, or Undo banner
     * is actively visible (e.g. after swipe-delete/glide-delete).
     */
    public static boolean isUndoViewActive(View root) {
        if (root == null) return false;
        try {
            if (findUndoViewInHierarchy(root)) {
                return true;
            }
            if (root instanceof ViewGroup vg) {
                ViewGroup softKeyboard = findSoftKeyboardView(vg);
                if (softKeyboard != null && softKeyboard != root && findUndoViewInHierarchy(softKeyboard)) {
                    return true;
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static boolean findUndoViewInHierarchy(View view) {
        if (view == null || view.getVisibility() != View.VISIBLE) return false;
        try {
            if (isUndoView(view)) {
                return true;
            }
            if (view instanceof ViewGroup vg) {
                for (int i = 0; i < vg.getChildCount(); i++) {
                    if (findUndoViewInHierarchy(vg.getChildAt(i))) {
                        return true;
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    /**
     * Comprehensive check for Undo state: either by candidate types or active view presence.
     */
    public static boolean isUndoActive(ViewGroup holderView, List<GboardThiccTopBarRuntime.CandidateItem> items) {
        if (hasUndoCandidate(items)) return true;
        return isUndoViewActive(holderView);
    }

    /**
     * Returns true when Gboard's dictation / voice-typing UI is actively running so
     * Thicc Top Bar steps aside and leaves Gboard's native top bar untouched.
     */
    public static boolean isDictationActive(View root) {
        if (root == null) return false;
        try {
            if (findDictationViewInHierarchy(root)) {
                return true;
            }
            if (root instanceof ViewGroup vg) {
                ViewGroup softKeyboard = findSoftKeyboardView(vg);
                if (softKeyboard != null && softKeyboard != root && findDictationViewInHierarchy(softKeyboard)) {
                    return true;
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    static boolean isDictationHintText(CharSequence rawText) {
        if (rawText == null) return false;
        String s = rawText.toString().trim().toLowerCase(Locale.ROOT);
        if (s.isEmpty()) return false;
        return s.contains("speak now")
                || s.contains("sprich jetzt")
                || s.contains("listening")
                || s.contains("zuhören")
                || s.contains("hört zu")
                || s.contains("dictating")
                || s.contains("diktieren")
                || s.contains("diktat")
                || s.contains("stop voice")
                || s.contains("spracheingabe beenden")
                || s.contains("spracheingabe stoppen")
                || s.contains("tap to stop")
                || s.contains("tap to pause")
                || s.contains("zum beenden tippen")
                || s.contains("zum pausieren tippen");
    }

    static boolean isDictationViewName(String rawName) {
        if (rawName == null || rawName.isEmpty()) return false;
        String s = rawName.toLowerCase(Locale.ROOT);
        if (s.contains("key_pos_header_voice") || s.contains("setting")
                || s.contains("thicctopbar") || s.contains("jumptoend")) {
            return false;
        }
        return s.contains("dictat")
                || s.contains("listening")
                || s.contains("voice_ime")
                || s.contains("voiceime")
                || s.contains("voice_chip")
                || s.contains("voice_header")
                || s.contains("speech")
                || s.contains("waveform")
                || s.contains("audio_level");
    }

    static boolean isHeaderActionOverlayName(String resName) {
        if (resName == null || resName.isEmpty()) return false;
        String s = resName.toLowerCase(Locale.ROOT);
        return "key_pos_header_notice".equals(s)
                || "key_pos_header_action_overlay".equals(s);
    }

    private static boolean findDictationViewInHierarchy(View view) {
        if (view == null || view.getVisibility() != View.VISIBLE) {
            return false;
        }
        if (view instanceof ThiccTopBarView || view instanceof JumpToEndArrowView) {
            return false;
        }
        if (isDictationViewName(view.getClass().getName())) {
            return true;
        }
        Object tag = view.getTag();
        if (tag instanceof CharSequence && isDictationViewName(tag.toString())) {
            return true;
        }
        String resName = getResourceEntryNameOrNull(view);
        if (isDictationViewName(resName)) {
            return true;
        }
        if (isHeaderActionOverlayName(resName)
                && view.getWidth() > 0
                && view.getHeight() > 0
                && hasVisibleChildWithSize(view)) {
            return true;
        }
        if (isVoiceButton(view) && (view.isSelected() || view.isActivated())) {
            return true;
        }
        if (isDictationHintText(view.getContentDescription())) {
            return true;
        }
        if (view instanceof TextView tv && isDictationHintText(tv.getText())) {
            return true;
        }
        if (view instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                if (findDictationViewInHierarchy(vg.getChildAt(i))) {
                    return true;
                }
            }
        }
        return false;
    }

    private static boolean hasVisibleChildWithSize(View view) {
        if (!(view instanceof ViewGroup vg)) {
            return false;
        }
        for (int i = 0; i < vg.getChildCount(); i++) {
            View child = vg.getChildAt(i);
            if (child != null && child.getVisibility() == View.VISIBLE
                    && child.getWidth() > 0 && child.getHeight() > 0) {
                return true;
            }
        }
        return false;
    }

    /**
     * Applies an opaque background to ThiccTopBarView matching the keyboard surface.
     * Prevents any underlying views or text from bleeding or showing through.
     */
    public static void applyKeyboardBackground(View barView, ViewGroup holderView) {
        if (barView == null) return;
        boolean isDark = (barView.getContext().getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        try {
            // 1. Try to copy background from holderView or attachTarget
            if (holderView != null) {
                Drawable holderBg = holderView.getBackground();
                if (holderBg != null) {
                    if (holderBg instanceof ColorDrawable cd) {
                        barView.setBackgroundColor(cd.getColor());
                        return;
                    }
                    Drawable.ConstantState cs = holderBg.getConstantState();
                    if (cs != null) {
                        barView.setBackground(cs.newDrawable().mutate());
                        return;
                    }
                }
                if (holderView.getParent() instanceof View parent) {
                    Drawable parentBg = parent.getBackground();
                    if (parentBg != null) {
                        if (parentBg instanceof ColorDrawable cd) {
                            barView.setBackgroundColor(cd.getColor());
                            return;
                        }
                        Drawable.ConstantState cs = parentBg.getConstantState();
                        if (cs != null) {
                            barView.setBackground(cs.newDrawable().mutate());
                            return;
                        }
                    }
                }
            }

            // 2. Try SoftKeyboardView
            ViewGroup softKeyboard = findSoftKeyboardView(holderView);
            if (softKeyboard != null && softKeyboard.getBackground() != null) {
                Drawable bg = softKeyboard.getBackground();
                if (bg instanceof ColorDrawable cd) {
                    barView.setBackgroundColor(cd.getColor());
                    return;
                }
                Drawable.ConstantState cs = bg.getConstantState();
                if (cs != null) {
                    barView.setBackground(cs.newDrawable().mutate());
                    return;
                }
            }

            // 3. Resolve theme surface color
            Context context = barView.getContext();
            TypedValue tv = new TypedValue();
            if (context.getTheme().resolveAttribute(android.R.attr.colorBackground, tv, true)) {
                if (tv.type >= TypedValue.TYPE_FIRST_COLOR_INT && tv.type <= TypedValue.TYPE_LAST_COLOR_INT && tv.data != 0) {
                    barView.setBackgroundColor(tv.data);
                    return;
                }
            }

            // 4. Default adaptive surface colors (Google dark grey / light grey)
            barView.setBackgroundColor(isDark ? 0xFF202124 : 0xFFF8F9FA);
        } catch (Throwable t) {
            Log.w(TAG, "applyKeyboardBackground error: " + t.getMessage());
            barView.setBackgroundColor(isDark ? 0xFF202124 : 0xFFF8F9FA);
        } finally {
            isKeyboardDark(barView);
        }
    }

    public static ViewGroup findHeaderContainer(View view) {
        if (view == null) return null;
        View cur = view;
        while (cur != null) {
            String name = cur.getClass().getName();
            if (name.contains("ConstraintHeaderView") || name.contains("HeaderView") || name.contains("header")) {
                if (cur instanceof ViewGroup vg) return vg;
            }
            if (cur.getParent() instanceof View parentView) {
                String parentName = parentView.getClass().getName();
                if (parentName.contains("SoftKeyboardView") || parentName.contains("KeyboardViewHolder")
                        || parentName.contains("InputView") || parentName.contains("MainKeyboardView")) {
                    if (cur instanceof ViewGroup vg) return vg;
                }
                cur = parentView;
            } else {
                break;
            }
        }
        return (view.getParent() instanceof ViewGroup vg) ? vg : null;
    }

    public static boolean isVoiceButton(View view) {
        if (view == null) return false;
        try {
            CharSequence cd = view.getContentDescription();
            if (cd != null) {
                String s = cd.toString().toLowerCase();
                if (s.contains("voice") || s.contains("sprache") || s.contains("mic")
                        || s.contains("diktier") || s.contains("vocal") || s.contains("voix")
                        || s.contains("голос") || s.contains("語音") || s.contains("语音") || s.contains("音声")) {
                    return true;
                }
            }
            int id = view.getId();
            if (id != View.NO_ID && id != 0) {
                try {
                    String resName = view.getResources().getResourceEntryName(id).toLowerCase();
                    if (resName.contains("voice") || resName.contains("mic")) {
                        return true;
                    }
                } catch (Throwable ignored) {
                }
            }
            Object tag = view.getTag();
            if (tag instanceof String t && t.toLowerCase().contains("voice")) {
                return true;
            }
            String className = view.getClass().getName().toLowerCase();
            if ((className.contains("voice") || className.contains("mic")) && !className.contains("setting")) {
                return true;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    public static View findVoiceButton(View headerRoot) {
        return findVoiceButton(headerRoot, null);
    }

    public static View findVoiceButton(View headerRoot, View excludedView) {
        if (headerRoot == null) return null;
        try {
            int headerWidth = headerRoot.getWidth();

            // 1. Recursive search for a visible voice button by characteristics
            View match = findVoiceButtonRecursive(headerRoot, excludedView);
            if (match != null) {
                // If match is a nested descendant inside a direct child of headerRoot,
                // return the direct child so LayoutParams match headerRoot.
                View cur = match;
                while (cur.getParent() instanceof View p && p != headerRoot) {
                    cur = p;
                }
                if (cur.getVisibility() == View.VISIBLE
                        && !isExcludedVoiceSlotCandidate(cur, excludedView)
                        && (headerWidth <= 0 || cur.getWidth() <= 0
                                || isValidRightSideVoiceSlot(cur.getLeft(), cur.getRight(), headerWidth))) {
                    return cur;
                }
            }

            // 2. Structural search: In ConstraintHeaderViewImpl, find the rightmost narrow clickable child
            // strictly on the right side of the header, never selecting the candidates/top-bar container.
            if (headerRoot instanceof ViewGroup vg && headerWidth > 0) {
                View rightmost = null;
                int maxRight = -1;
                for (int i = 0; i < vg.getChildCount(); i++) {
                    View child = vg.getChildAt(i);
                    if (child.getVisibility() != View.VISIBLE) {
                        continue;
                    }
                    if (isExcludedVoiceSlotCandidate(child, excludedView)) {
                        continue;
                    }
                    if (!isValidRightSideVoiceSlot(child.getLeft(), child.getRight(), headerWidth)) {
                        continue;
                    }
                    if (!hasVisibleClickableTarget(child)) {
                        continue;
                    }
                    if (child.getRight() > maxRight) {
                        maxRight = child.getRight();
                        rightmost = child;
                    }
                }
                if (rightmost != null && maxRight > 0) {
                    return rightmost;
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "findVoiceButton error: " + t.getMessage());
        }
        return null;
    }

    /**
     * Pure-JVM geometric guard ensuring a candidate header child is a narrow right-side action slot
     * (like the voice button) rather than the full-width center candidates strip or left-side toolbar.
     */
    static boolean isValidRightSideVoiceSlot(int childLeft, int childRight, int headerWidth) {
        if (headerWidth <= 0) {
            return false;
        }
        int childWidth = childRight - childLeft;
        if (childWidth <= 0) {
            return false;
        }
        if (childWidth > headerWidth / 3) {
            return false;
        }
        return childLeft >= headerWidth / 2;
    }

    static boolean isExcludedVoiceSlotClassName(String className) {
        if (className == null || className.isEmpty()) {
            return false;
        }
        return className.contains("CandidatesHolder")
                || className.contains("ThiccTopBar")
                || className.contains("JumpToEndArrow")
                || className.contains("Matrix")
                || className.contains("FixedCount");
    }

    private static boolean isExcludedVoiceSlotCandidate(View candidate, View excludedView) {
        if (candidate == null) {
            return true;
        }
        if (candidate instanceof ThiccTopBarView || candidate instanceof JumpToEndArrowView) {
            return true;
        }
        if (isExcludedVoiceSlotClassName(candidate.getClass().getName())) {
            return true;
        }
        if (excludedView != null) {
            View cur = excludedView;
            while (cur != null) {
                if (cur == candidate) {
                    return true;
                }
                cur = (cur.getParent() instanceof View p) ? p : null;
            }
        }
        return false;
    }

    private static boolean hasVisibleClickableTarget(View view) {
        if (view == null || view.getVisibility() != View.VISIBLE) {
            return false;
        }
        if (view.isClickable()) {
            return true;
        }
        if (view instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                if (hasVisibleClickableTarget(vg.getChildAt(i))) {
                    return true;
                }
            }
        }
        return false;
    }

    private static View findVoiceButtonRecursive(View view, View excludedView) {
        if (view == null || view.getVisibility() != View.VISIBLE) return null;
        if (isExcludedVoiceSlotCandidate(view, excludedView)) return null;
        if (isVoiceButton(view)) return view;
        if (view instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                View found = findVoiceButtonRecursive(vg.getChildAt(i), excludedView);
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }

    /**
     * Returns the active candidate count stored by LatinFixedCountCandidatesHolderView, or -1 if unknown.
     */
    public static int getHolderCandidateCount(ViewGroup holderView) {
        if (holderView == null) {
            return -1;
        }
        try {
            Method countMethod = resolveHolderMethods(holderView.getClass()).declaredCountMethodA;
            if (countMethod != null) {
                Object result = countMethod.invoke(holderView);
                if (result instanceof Integer count) {
                    return count;
                }
            }
        } catch (Throwable ignored) {
        }
        return -1;
    }

    /**
     * Hides pooled candidate slot views inside holderView when Gboard's resize handler (onSizeChanged)
     * re-displays stale previous candidates despite candidate count being zero.
     */
    public static void hideStaleCandidateSlots(ViewGroup holderView) {
        if (holderView == null) {
            return;
        }
        for (int i = 0; i < holderView.getChildCount(); i++) {
            View child = holderView.getChildAt(i);
            if (child instanceof LinearLayout || child.getClass().getName().contains("SoftKeyView")) {
                if (child.getVisibility() == View.VISIBLE) {
                    child.setVisibility(View.GONE);
                }
            }
        }
    }

    /**
     * Manages header views visibility cleanly without tampering with parent ConstraintLayout.
     * When showMatrixBar is true:
     *   - holderView is set to INVISIBLE (preserves layout measurement while hiding native text and touch)
     *   - attachTarget is brought to front with its opaque MatrixBar covering siblings
     *   - sibling quick toggles inside attachTarget's direct container are set to GONE
     * When showMatrixBar is false:
     *   - if Undo is active: holderView is GONE (hides deleted text under Undo button)
     *   - if Undo is NOT active: holderView is restored to VISIBLE
     *   - sibling quick toggles in container are restored to VISIBLE
     * Crucially, we NEVER touch views in the top-level ConstraintLayout (parent's parent),
     * allowing Gboard to natively manage full topbar width without right-shift or layout distortion.
     */
    public static void updateHeaderViewsVisibility(ViewGroup attachTarget, ViewGroup holderView, boolean showMatrixBar) {
        if (attachTarget == null) return;
        try {
            ViewGroup.LayoutParams lpTarget = attachTarget.getLayoutParams();
            if (showMatrixBar) {
                // Ensure attachTarget fills full available width in container while remembering original width
                if (lpTarget != null && lpTarget.width != ViewGroup.LayoutParams.MATCH_PARENT) {
                    if (!ORIGINAL_TARGET_WIDTHS.containsKey(attachTarget)) {
                        ORIGINAL_TARGET_WIDTHS.put(attachTarget, lpTarget.width);
                    }
                    lpTarget.width = ViewGroup.LayoutParams.MATCH_PARENT;
                    attachTarget.setLayoutParams(lpTarget);
                }
                if (holderView != null) {
                    holderView.setAlpha(0.0f);
                    holderView.setVisibility(View.INVISIBLE);
                }

                ViewGroup parent = (attachTarget.getParent() instanceof ViewGroup p) ? p : null;
                if (parent != null) {
                    if (parent.getChildCount() > 0 && parent.getChildAt(parent.getChildCount() - 1) != attachTarget) {
                        attachTarget.bringToFront();
                    }
                    for (int i = 0; i < parent.getChildCount(); i++) {
                        View sibling = parent.getChildAt(i);
                        if (sibling != attachTarget && !(sibling instanceof ThiccTopBarView)) {
                            String name = sibling.getClass().getName();
                            if (name.contains("AccessPoint") || name.contains("accesspoint")
                                    || name.contains("Header") || name.contains("Strip") || name.contains("Toolbar")) {
                                sibling.setVisibility(View.GONE);
                            }
                        }
                    }
                }
            } else {
                Integer origWidth = ORIGINAL_TARGET_WIDTHS.remove(attachTarget);
                if (origWidth != null && lpTarget != null && lpTarget.width != origWidth) {
                    lpTarget.width = origWidth;
                    attachTarget.setLayoutParams(lpTarget);
                }
                boolean undoActive = isUndoViewActive(attachTarget);
                boolean dictationActive = isDictationActive(attachTarget);
                if (holderView != null) {
                    if (undoActive) {
                        holderView.setAlpha(0.0f);
                        holderView.setVisibility(View.GONE);
                    } else if (!(dictationActive && holderView.getVisibility() == View.GONE)) {
                        if (getHolderCandidateCount(holderView) == 0) {
                            hideStaleCandidateSlots(holderView);
                        }
                        holderView.setAlpha(1.0f);
                        holderView.setVisibility(View.VISIBLE);
                    }
                }

                ViewGroup parent = (attachTarget.getParent() instanceof ViewGroup p) ? p : null;
                if (parent != null) {
                    for (int i = 0; i < parent.getChildCount(); i++) {
                        View sibling = parent.getChildAt(i);
                        if (sibling != attachTarget && !(sibling instanceof ThiccTopBarView)) {
                            String name = sibling.getClass().getName();
                            if (name.contains("AccessPoint") || name.contains("accesspoint")
                                    || name.contains("Header") || name.contains("Strip") || name.contains("Toolbar")) {
                                sibling.setAlpha(1.0f);
                                if (sibling.getVisibility() == View.GONE) {
                                    sibling.setVisibility(View.VISIBLE);
                                }
                            }
                        }
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "updateHeaderViewsVisibility error: " + t.getMessage());
        }
    }

    /**
     * Convenience delegate for updateHeaderViewsVisibility.
     */
    public static void suppressQuickToggles(ViewGroup attachTarget, boolean suppress) {
        ViewGroup holder = null;
        if (attachTarget != null) {
            for (int i = 0; i < attachTarget.getChildCount(); i++) {
                View child = attachTarget.getChildAt(i);
                if (child.getClass().getName().contains("CandidatesHolderView") || child.getClass().getName().contains("FixedCount")) {
                    holder = (ViewGroup) child;
                    break;
                }
            }
        }
        updateHeaderViewsVisibility(attachTarget, holder, suppress);
    }

    public static ViewGroup findSoftKeyboardView(ViewGroup holderView) {
        View p = holderView;
        while (p != null) {
            if (p.getClass().getName().contains("SoftKeyboardView")) {
                return (ViewGroup) p;
            }
            if (p.getParent() instanceof View) {
                p = (View) p.getParent();
            } else {
                break;
            }
        }
        return null;
    }

    public static InputConnection resolveInputConnectionViaHierarchy(View view) {
        try {
            if (view instanceof ViewGroup vg) {
                Object keyboard = findKeyboardController(vg);
                if (keyboard != null) {
                    for (Class<?> c = keyboard.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                        for (Field f : c.getDeclaredFields()) {
                            if (Context.class.isAssignableFrom(f.getType())) {
                                f.setAccessible(true);
                                Object zContext = f.get(keyboard);
                                if (zContext instanceof Context) {
                                    Context kCtx = (Context) zContext;
                                    while (kCtx instanceof ContextWrapper && !(kCtx instanceof InputMethodService)) {
                                        kCtx = ((ContextWrapper) kCtx).getBaseContext();
                                    }
                                    if (kCtx instanceof InputMethodService ims) {
                                        InputConnection ic = ims.getCurrentInputConnection();
                                        if (ic != null) return ic;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static Object findKeyboardController(ViewGroup holderView) {
        try {
            for (Field f : holderView.getClass().getDeclaredFields()) {
                f.setAccessible(true);
                Object obj = f.get(holderView);
                if (obj != null && obj.getClass().getName().contains("keyboard")) {
                    return obj;
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    public static String extractCandidateText(Object item) {
        if (item == null) return null;
        ensureCandidateFields(item);
        if (candidateTextField != null) {
            try {
                Object textObj = candidateTextField.get(item);
                if (textObj instanceof CharSequence cs && cs.length() > 0) {
                    return cs.toString();
                }
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    public static String extractCandidateType(Object item) {
        if (item == null) return "";
        ensureCandidateFields(item);
        if (candidateTypeField != null) {
            try {
                Object typeObj = candidateTypeField.get(item);
                if (typeObj instanceof Enum<?> e) {
                    return e.name();
                } else if (typeObj != null) {
                    return typeObj.toString();
                }
            } catch (Throwable ignored) {
            }
        }
        return "";
    }

    public static boolean extractCandidateIsPrediction(Object item) {
        if (item == null) return false;
        ensureCandidateFields(item);
        if (candidateTypeField != null) {
            try {
                Object typeObj = candidateTypeField.get(item);
                if (typeObj instanceof Enum<?> e) {
                    return e.ordinal() == 2 || "PREDICTION".equalsIgnoreCase(e.name()) || e.name().contains("PREDICTION");
                } else if (typeObj != null) {
                    String name = typeObj.toString();
                    return "PREDICTION".equalsIgnoreCase(name) || name.contains("PREDICTION");
                }
            } catch (Throwable ignored) {
            }
        }
        return false;
    }

    public static boolean extractCandidateIsRaw(Object item) {
        if (item == null) return false;
        ensureCandidateFields(item);
        if (candidateTypeField != null) {
            try {
                Object typeObj = candidateTypeField.get(item);
                if (typeObj instanceof Enum<?> e) {
                    return e.ordinal() == 1 || "RAW".equalsIgnoreCase(e.name()) || e.name().contains("RAW");
                } else if (typeObj != null) {
                    String name = typeObj.toString();
                    return "RAW".equalsIgnoreCase(name) || name.contains("RAW");
                }
            } catch (Throwable ignored) {
            }
        }
        return false;
    }

    public static boolean extractCandidateIsAutoCorrect(Object item) {
        if (item == null) return false;
        ensureCandidateFields(item);
        if (candidateAutoCorrectField != null) {
            try {
                return candidateAutoCorrectField.getBoolean(item);
            } catch (Throwable ignored) {
            }
        }
        return false;
    }

    private static void ensureCandidateFields(Object item) {
        if (candidateFieldsLookupAttempted) return;
        candidateFieldsLookupAttempted = true;

        // 1. Text field lookup (starts with 'a', falls back to CharSequence field)
        try {
            candidateTextField = item.getClass().getDeclaredField("a");
            candidateTextField.setAccessible(true);
        } catch (Throwable ignored) {
            for (Field f : item.getClass().getDeclaredFields()) {
                if (CharSequence.class.isAssignableFrom(f.getType())) {
                    candidateTextField = f;
                    candidateTextField.setAccessible(true);
                    break;
                }
            }
        }

        // 2. Candidate type enum lookup (starts with 'e', falls back to Enum field)
        try {
            candidateTypeField = item.getClass().getDeclaredField("e");
            candidateTypeField.setAccessible(true);
        } catch (Throwable ignored) {
            for (Field f : item.getClass().getDeclaredFields()) {
                if (f.getType().isEnum()) {
                    candidateTypeField = f;
                    candidateTypeField.setAccessible(true);
                    break;
                }
            }
        }

        // 3. AutoCorrect flag lookup (starts with 'g', falls back to boolean field)
        try {
            candidateAutoCorrectField = item.getClass().getDeclaredField("g");
            candidateAutoCorrectField.setAccessible(true);
        } catch (Throwable ignored) {
            for (Field f : item.getClass().getDeclaredFields()) {
                if (f.getType() == boolean.class) {
                    candidateAutoCorrectField = f;
                    candidateAutoCorrectField.setAccessible(true);
                    break;
                }
            }
        }
    }

    public static List<GboardThiccTopBarRuntime.CandidateItem> extractCandidatesFromIterable(Object candidateListObj) {
        if (!(candidateListObj instanceof Iterable<?> iterable)) {
            return Collections.emptyList();
        }

        List<GboardThiccTopBarRuntime.CandidateItem> result = new ArrayList<>();
        int slotIndex = 0;

        for (Object item : iterable) {
            if (item == null) continue;
            String text = extractCandidateText(item);
            if (text == null || text.trim().isEmpty()) {
                slotIndex++;
                continue;
            }
            boolean isRaw = extractCandidateIsRaw(item);
            boolean isAutoCorrect = extractCandidateIsAutoCorrect(item);
            boolean isPred = extractCandidateIsPrediction(item);
            String type = extractCandidateType(item);
            result.add(new GboardThiccTopBarRuntime.CandidateItem(
                    text, slotIndex, isRaw, isAutoCorrect, isPred, type, item, null));
            slotIndex++;
        }

        return result;
    }
}
