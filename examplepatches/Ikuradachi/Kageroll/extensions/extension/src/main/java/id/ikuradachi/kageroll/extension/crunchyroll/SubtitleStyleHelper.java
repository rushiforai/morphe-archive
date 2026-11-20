package id.ikuradachi.kageroll.extension.crunchyroll;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Rewrites ASS subtitle tracks ([V4+ Styles] and non-positioned [Events] Dialogue lines)
 * and computes resize-mode-aware (FIT / FILL / ZOOM) viewport margins for SubtitlesRenderer.
 */
public final class SubtitleStyleHelper {

    public static final int RESIZE_MODE_FIT = 0;
    public static final int RESIZE_MODE_FILL = 3;
    public static final int RESIZE_MODE_ZOOM = 4;

    private static final float DEFAULT_ASPECT_RATIO = 16f / 9f;
    private static final int FALLBACK_EXO_CONTENT_FRAME_ID = 0x7f0b03ad;
    private static final int FALLBACK_SUBTITLES_RENDERER_ID = 0x7f0b0a58;

    private static final String PREFS_NAME = "kageroll_player_prefs";
    private static final String KEY_FONT_SCALE = "subtitles_font_scale";
    private static final String KEY_SCALE_INLINE_FS = "subtitles_scale_inline_fs";
    private static final String KEY_MARGIN_V_OFFSET = "subtitles_margin_v_offset";
    private static final String KEY_BOTTOM_SAFE_DP = "subtitles_bottom_safe_dp";
    private static final String KEY_OUTLINE_WIDTH = "subtitles_outline_width";
    private static final String KEY_SHADOW_DEPTH = "subtitles_shadow_depth";
    private static final String KEY_PRIMARY_COLOR = "subtitles_primary_color";
    private static final String KEY_OUTLINE_COLOR = "subtitles_outline_color";
    private static final String KEY_ADAPT_RESIZE_MODE = "subtitles_adapt_resize_mode";

    private static final int SECTION_NONE = 0;
    private static final int SECTION_SCRIPT_INFO = 1;
    private static final int SECTION_STYLES = 2;
    private static final int SECTION_EVENTS = 3;
    private static final int SECTION_OTHER = 4;

    private static volatile int cachedExoContentFrameId = 0;
    private static volatile int cachedSubtitlesRendererId = 0;

    private static volatile Class<?> cachedPlayerViewClass;
    private static volatile Method cachedGetResizeMode;
    private static volatile Field cachedAspectRatioField;
    private static volatile Method cachedSetMargins;
    private static volatile Method cachedSetFrameSize;
    private static volatile Method cachedOnSizeChanged;

    private SubtitleStyleHelper() {
    }

    /**
     * Default ASS font size multiplier. Patched at build time by AssSubtitleStylePatch.
     */
    public static float getDefaultFontScale() {
        return 1.0f;
    }

    /**
     * Whether inline {\fsN} override tags on non-positioned Dialogue lines are scaled.
     * Patched at build time by AssSubtitleStylePatch.
     */
    public static boolean isScaleInlineFsTagsDefault() {
        return true;
    }

    /**
     * Default ASS PlayRes-normalized MarginV offset (720p reference). Patched at build time.
     */
    public static int getDefaultAssMarginVOffset() {
        return 0;
    }

    /**
     * Default extra bottom screen safe-margin in dp. Patched at build time.
     */
    public static int getDefaultBottomSafeMarginDp() {
        return 0;
    }

    /**
     * Default ASS border/outline width (< 0 preserves script). Patched at build time.
     */
    public static float getDefaultOutlineWidth() {
        return -1.0f;
    }

    /**
     * Default ASS drop-shadow depth (< 0 preserves script). Patched at build time.
     */
    public static float getDefaultShadowDepth() {
        return -1.0f;
    }

    /**
     * Default ASS PrimaryColour (&HAABBGGRR, empty preserves script). Patched at build time.
     */
    public static String getDefaultPrimaryColor() {
        return "";
    }

    /**
     * Default ASS OutlineColour (&HAABBGGRR, empty preserves script). Patched at build time.
     */
    public static String getDefaultOutlineColor() {
        return "";
    }

    /**
     * Whether subtitle margins adapt to PlayerView resize mode and video aspect ratio.
     * Patched at build time by AssSubtitleStylePatch.
     */
    public static boolean isAdaptMarginsToResizeModeDefault() {
        return true;
    }

    /**
     * Rewrites [V4+ Styles] and non-positioned [Events] Dialogue lines before libass loads the track.
     */
    public static String rewriteAssScript(Context context, String subtitlesText) {
        if (subtitlesText == null || subtitlesText.isEmpty()) {
            return subtitlesText;
        }

        SharedPreferences prefs = getPrefs(context);
        float fontScale = prefs != null
                ? prefs.getFloat(KEY_FONT_SCALE, getDefaultFontScale())
                : getDefaultFontScale();
        boolean scaleInlineFs = prefs != null
                ? prefs.getBoolean(KEY_SCALE_INLINE_FS, isScaleInlineFsTagsDefault())
                : isScaleInlineFsTagsDefault();
        int marginVOffset = prefs != null
                ? prefs.getInt(KEY_MARGIN_V_OFFSET, getDefaultAssMarginVOffset())
                : getDefaultAssMarginVOffset();
        float outlineWidth = prefs != null
                ? prefs.getFloat(KEY_OUTLINE_WIDTH, getDefaultOutlineWidth())
                : getDefaultOutlineWidth();
        float shadowDepth = prefs != null
                ? prefs.getFloat(KEY_SHADOW_DEPTH, getDefaultShadowDepth())
                : getDefaultShadowDepth();
        String primaryColor = normalizeAssColor(prefs != null
                ? prefs.getString(KEY_PRIMARY_COLOR, getDefaultPrimaryColor())
                : getDefaultPrimaryColor());
        String outlineColor = normalizeAssColor(prefs != null
                ? prefs.getString(KEY_OUTLINE_COLOR, getDefaultOutlineColor())
                : getDefaultOutlineColor());

        boolean hasFontScale = fontScale > 0f && Math.abs(fontScale - 1.0f) > 0.001f;
        boolean hasMarginOffset = marginVOffset != 0;
        boolean hasOutline = outlineWidth >= 0f;
        boolean hasShadow = shadowDepth >= 0f;
        boolean hasPrimaryColor = !primaryColor.isEmpty();
        boolean hasOutlineColor = !outlineColor.isEmpty();

        if (!hasFontScale && !hasMarginOffset && !hasOutline
                && !hasShadow && !hasPrimaryColor && !hasOutlineColor) {
            return subtitlesText;
        }

        StringBuilder out = new StringBuilder(subtitlesText.length() + 256);
        int len = subtitlesText.length();
        int pos = 0;

        int section = SECTION_NONE;
        float playResY = 720f;
        int scaledMarginVDelta = marginVOffset;

        int styleColCount = 0;
        int styleNameIdx = -1;
        int styleFontsizeIdx = -1;
        int stylePrimaryColorIdx = -1;
        int styleOutlineColorIdx = -1;
        int styleOutlineIdx = -1;
        int styleShadowIdx = -1;
        int styleAlignmentIdx = -1;
        int styleMarginVIdx = -1;
        Map<String, Boolean> styleBottomAligned = new HashMap<>();

        int evStyleIdx = -1;
        int evMarginVIdx = -1;
        int evTextIdx = -1;

        while (pos < len) {
            int nl = subtitlesText.indexOf('\n', pos);
            int lineEnd = nl >= 0 ? nl : len;
            boolean hasCr = lineEnd > pos && subtitlesText.charAt(lineEnd - 1) == '\r';
            int contentEnd = hasCr ? lineEnd - 1 : lineEnd;
            String line = subtitlesText.substring(pos, contentEnd);

            String checkLine = pos == 0 && !line.isEmpty() && line.charAt(0) == '\uFEFF'
                    ? line.substring(1)
                    : line;
            String trimmed = checkLine.trim();

            if (trimmed.startsWith("[") && trimmed.endsWith("]")) {
                if (trimmed.equalsIgnoreCase("[Script Info]")) {
                    section = SECTION_SCRIPT_INFO;
                } else if (trimmed.equalsIgnoreCase("[V4+ Styles]")
                        || trimmed.equalsIgnoreCase("[V4 Styles]")) {
                    section = SECTION_STYLES;
                } else if (trimmed.equalsIgnoreCase("[Events]")) {
                    section = SECTION_EVENTS;
                } else {
                    section = SECTION_OTHER;
                }
                out.append(line);
            } else if (section == SECTION_SCRIPT_INFO && startsWithIgnoreCase(trimmed, "PlayResY:")) {
                float parsedResY = parseFloatSafe(trimmed.substring("PlayResY:".length()).trim(), -1f);
                if (parsedResY > 0f) {
                    playResY = parsedResY;
                    if (hasMarginOffset) {
                        scaledMarginVDelta = Math.round(marginVOffset * (playResY / 720f));
                        if (scaledMarginVDelta == 0) {
                            scaledMarginVDelta = marginVOffset > 0 ? 1 : -1;
                        }
                    }
                }
                out.append(line);
            } else if (section == SECTION_STYLES && startsWithIgnoreCase(trimmed, "Format:")) {
                String[] cols = trimmed.substring("Format:".length()).split(",", -1);
                styleColCount = cols.length;
                styleNameIdx = -1;
                styleFontsizeIdx = -1;
                stylePrimaryColorIdx = -1;
                styleOutlineColorIdx = -1;
                styleOutlineIdx = -1;
                styleShadowIdx = -1;
                styleAlignmentIdx = -1;
                styleMarginVIdx = -1;
                for (int i = 0; i < cols.length; i++) {
                    String col = cols[i].trim().toLowerCase(Locale.US);
                    switch (col) {
                        case "name":
                            styleNameIdx = i;
                            break;
                        case "fontsize":
                            styleFontsizeIdx = i;
                            break;
                        case "primarycolour":
                            stylePrimaryColorIdx = i;
                            break;
                        case "outlinecolour":
                            styleOutlineColorIdx = i;
                            break;
                        case "outline":
                            styleOutlineIdx = i;
                            break;
                        case "shadow":
                            styleShadowIdx = i;
                            break;
                        case "alignment":
                            styleAlignmentIdx = i;
                            break;
                        case "marginv":
                            styleMarginVIdx = i;
                            break;
                    }
                }
                out.append(line);
            } else if (section == SECTION_STYLES
                    && styleColCount > 0
                    && startsWithIgnoreCase(trimmed, "Style:")) {
                int colonIdx = line.indexOf(':');
                String prefix = line.substring(0, colonIdx + 1);
                String rawPayload = line.substring(colonIdx + 1);
                String leadingWs = extractLeadingSpace(rawPayload);
                String payload = rawPayload.substring(leadingWs.length());

                String[] fields = splitBounded(payload, ',', styleColCount);
                String styleName = (styleNameIdx >= 0 && styleNameIdx < fields.length)
                        ? fields[styleNameIdx].trim()
                        : "";
                int alignment = (styleAlignmentIdx >= 0 && styleAlignmentIdx < fields.length)
                        ? parseIntSafe(fields[styleAlignmentIdx].trim(), 2)
                        : 2;
                boolean isBottom = alignment >= 1 && alignment <= 3;
                if (!styleName.isEmpty()) {
                    styleBottomAligned.put(styleName, isBottom);
                }

                if (hasFontScale && styleFontsizeIdx >= 0 && styleFontsizeIdx < fields.length) {
                    float fs = parseFloatSafe(fields[styleFontsizeIdx].trim(), -1f);
                    if (fs > 0f) {
                        fields[styleFontsizeIdx] = formatAssNumber(fs * fontScale);
                    }
                }
                if (hasMarginOffset && isBottom && styleMarginVIdx >= 0 && styleMarginVIdx < fields.length) {
                    int mv = parseIntSafe(fields[styleMarginVIdx].trim(), -1);
                    if (mv >= 0) {
                        fields[styleMarginVIdx] = String.valueOf(Math.max(0, mv + scaledMarginVDelta));
                    }
                }
                if (hasOutline && styleOutlineIdx >= 0 && styleOutlineIdx < fields.length) {
                    fields[styleOutlineIdx] = formatAssNumber(outlineWidth);
                }
                if (hasShadow && styleShadowIdx >= 0 && styleShadowIdx < fields.length) {
                    fields[styleShadowIdx] = formatAssNumber(shadowDepth);
                }
                if (hasPrimaryColor && stylePrimaryColorIdx >= 0 && stylePrimaryColorIdx < fields.length) {
                    fields[stylePrimaryColorIdx] = primaryColor;
                }
                if (hasOutlineColor && styleOutlineColorIdx >= 0 && styleOutlineColorIdx < fields.length) {
                    fields[styleOutlineColorIdx] = outlineColor;
                }

                out.append(prefix).append(leadingWs);
                appendJoined(out, fields, ',');
            } else if (section == SECTION_EVENTS && startsWithIgnoreCase(trimmed, "Format:")) {
                String[] cols = trimmed.substring("Format:".length()).split(",", -1);
                evStyleIdx = -1;
                evMarginVIdx = -1;
                evTextIdx = cols.length > 0 ? cols.length - 1 : -1;
                for (int i = 0; i < cols.length; i++) {
                    String col = cols[i].trim().toLowerCase(Locale.US);
                    if ("style".equals(col)) {
                        evStyleIdx = i;
                    } else if ("marginv".equals(col)) {
                        evMarginVIdx = i;
                    } else if ("text".equals(col)) {
                        evTextIdx = i;
                    }
                }
                out.append(line);
            } else if (section == SECTION_EVENTS
                    && evTextIdx >= 0
                    && (hasMarginOffset || (hasFontScale && scaleInlineFs))
                    && startsWithIgnoreCase(trimmed, "Dialogue:")) {
                int colonIdx = line.indexOf(':');
                String prefix = line.substring(0, colonIdx + 1);
                String rawPayload = line.substring(colonIdx + 1);
                String leadingWs = extractLeadingSpace(rawPayload);
                String payload = rawPayload.substring(leadingWs.length());

                String[] fields = splitBounded(payload, ',', evTextIdx + 1);
                if (fields.length > evTextIdx) {
                    String text = fields[evTextIdx];
                    if (!hasPositioningTag(text)) {
                        if (hasMarginOffset && evMarginVIdx >= 0 && evMarginVIdx < fields.length) {
                            int evMv = parseIntSafe(fields[evMarginVIdx].trim(), 0);
                            if (evMv > 0) {
                                String evStyle = (evStyleIdx >= 0 && evStyleIdx < fields.length)
                                        ? fields[evStyleIdx].trim()
                                        : "";
                                int inlineAn = findInlineAlignment(text);
                                boolean isBottom = inlineAn >= 1
                                        ? (inlineAn <= 3)
                                        : !Boolean.FALSE.equals(styleBottomAligned.get(evStyle));
                                if (isBottom) {
                                    int updatedMv = Math.max(0, evMv + scaledMarginVDelta);
                                    fields[evMarginVIdx] = formatEventMarginV(updatedMv, fields[evMarginVIdx].trim());
                                }
                            }
                        }
                        if (hasFontScale && scaleInlineFs) {
                            fields[evTextIdx] = scaleInlineFsTags(text, fontScale);
                        }
                    }
                }
                out.append(prefix).append(leadingWs);
                appendJoined(out, fields, ',');
            } else {
                out.append(line);
            }

            if (hasCr) {
                out.append('\r');
            }
            if (nl >= 0) {
                out.append('\n');
                pos = nl + 1;
            } else {
                pos = len;
            }
        }

        return out.toString();
    }

    /**
     * Replaces SubtitlesControllerImpl.setFrameSize(II)V with resize-mode and video-aspect-aware
     * margin calculation, plus optional bottom safe-margin offset.
     */
    public static void applyFrameSizeAndMargins(
            Object renderer,
            Object rendererView,
            int width,
            int height
    ) {
        if (renderer == null || width <= 0 || height <= 0) {
            return;
        }

        View view = rendererView instanceof View ? (View) rendererView : null;
        Context context = view != null ? view.getContext() : null;
        boolean adaptResizeMode = isAdaptMarginsToResizeMode(context);
        int extraBottomDp = getBottomSafeMarginDp(context);

        int resizeMode = RESIZE_MODE_FIT;
        float videoAspect = DEFAULT_ASPECT_RATIO;

        if (adaptResizeMode && view != null) {
            View playerView = findAncestorPlayerView(view);
            if (playerView != null) {
                resizeMode = readResizeMode(playerView);
                float detectedAspect = readVideoAspectRatio(playerView, context);
                if (detectedAspect > 0.05f && detectedAspect < 20f) {
                    videoAspect = detectedAspect;
                }
            }
        }

        int top = 0;
        int bottom = 0;
        int left = 0;
        int right = 0;

        if (resizeMode != RESIZE_MODE_FILL && resizeMode != RESIZE_MODE_ZOOM) {
            float viewAspect = (float) width / (float) height;
            if (viewAspect > videoAspect) {
                int lr = (width - (int) (height * videoAspect)) / 2;
                left = lr;
                right = lr;
            } else {
                int tb = (height - (int) (width / videoAspect)) / 2;
                top = tb;
                bottom = tb;
            }
        }

        if (extraBottomDp != 0 && view != null) {
            int extraBottomPx = Math.round(TypedValue.applyDimension(
                    TypedValue.COMPLEX_UNIT_DIP,
                    extraBottomDp,
                    view.getResources().getDisplayMetrics()
            ));
            bottom += extraBottomPx;
        }

        invokeSetMargins(renderer, top, bottom, left, right);
        invokeSetFrameSize(renderer, width, height);
    }

    /**
     * Forces SubtitlesView to recompute frame margins and re-render the active subtitle frame
     * immediately after PlayerView.setResizeMode(int) changes.
     */
    public static void refreshSubtitlesLayout(View playerView) {
        if (playerView == null || !isAdaptMarginsToResizeMode(playerView.getContext())) {
            return;
        }

        View subtitlesView = findSubtitlesView(playerView);
        if (subtitlesView == null) {
            return;
        }

        int w = subtitlesView.getWidth();
        int h = subtitlesView.getHeight();
        if (w <= 0 || h <= 0) {
            return;
        }

        try {
            Method m = cachedOnSizeChanged;
            if (m == null || !m.getDeclaringClass().isInstance(subtitlesView)) {
                m = subtitlesView.getClass().getMethod("onSizeChanged", int.class, int.class, int.class, int.class);
                cachedOnSizeChanged = m;
            }
            m.invoke(subtitlesView, w, h, w, h);
        } catch (Exception ignored) {
        }
    }

    private static SharedPreferences getPrefs(Context context) {
        if (context == null) {
            return null;
        }
        return context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    private static boolean isAdaptMarginsToResizeMode(Context context) {
        SharedPreferences prefs = getPrefs(context);
        return prefs != null
                ? prefs.getBoolean(KEY_ADAPT_RESIZE_MODE, isAdaptMarginsToResizeModeDefault())
                : isAdaptMarginsToResizeModeDefault();
    }

    private static int getBottomSafeMarginDp(Context context) {
        SharedPreferences prefs = getPrefs(context);
        return prefs != null
                ? prefs.getInt(KEY_BOTTOM_SAFE_DP, getDefaultBottomSafeMarginDp())
                : getDefaultBottomSafeMarginDp();
    }

    private static View findAncestorPlayerView(View view) {
        Class<?> playerViewClass = resolvePlayerViewClass(view.getContext());
        ViewParent parent = view.getParent();
        while (parent instanceof View) {
            View parentView = (View) parent;
            if (playerViewClass != null) {
                if (playerViewClass.isInstance(parentView)) {
                    return parentView;
                }
            } else {
                String name = parentView.getClass().getName();
                if ("androidx.media3.ui.PlayerView".equals(name)
                        || "com.crunchyroll.player.presentation.playerview.InternalPlayerViewLayout".equals(name)) {
                    return parentView;
                }
            }
            parent = parentView.getParent();
        }
        return null;
    }

    private static Class<?> resolvePlayerViewClass(Context context) {
        Class<?> cls = cachedPlayerViewClass;
        if (cls != null) {
            return cls;
        }
        try {
            ClassLoader loader = context != null
                    ? context.getClassLoader()
                    : SubtitleStyleHelper.class.getClassLoader();
            cls = Class.forName("androidx.media3.ui.PlayerView", false, loader);
            cachedPlayerViewClass = cls;
        } catch (Exception ignored) {
        }
        return cls;
    }

    private static int readResizeMode(View playerView) {
        try {
            Method m = cachedGetResizeMode;
            if (m == null || !m.getDeclaringClass().isInstance(playerView)) {
                m = playerView.getClass().getMethod("getResizeMode");
                cachedGetResizeMode = m;
            }
            Object res = m.invoke(playerView);
            if (res instanceof Integer) {
                return (Integer) res;
            }
        } catch (Exception ignored) {
        }
        return RESIZE_MODE_FIT;
    }

    private static float readVideoAspectRatio(View playerView, Context context) {
        int frameId = resolveExoContentFrameId(context);
        View contentFrame = playerView.findViewById(frameId);
        if (contentFrame == null) {
            return -1f;
        }

        try {
            Field f = cachedAspectRatioField;
            if (f == null || f.getDeclaringClass() != contentFrame.getClass()) {
                f = findAspectRatioFloatField(contentFrame.getClass());
                cachedAspectRatioField = f;
            }
            if (f != null) {
                return f.getFloat(contentFrame);
            }
        } catch (Exception ignored) {
        }
        return -1f;
    }

    private static Field findAspectRatioFloatField(Class<?> cls) {
        try {
            Field bField = cls.getDeclaredField("b");
            if (bField.getType() == float.class) {
                bField.setAccessible(true);
                return bField;
            }
        } catch (NoSuchFieldException ignored) {
        }
        for (Field f : cls.getDeclaredFields()) {
            if (f.getType() == float.class) {
                f.setAccessible(true);
                return f;
            }
        }
        return null;
    }

    private static View findSubtitlesView(View playerView) {
        int id = resolveSubtitlesRendererId(playerView.getContext());
        View found = playerView.findViewById(id);
        if (found != null) {
            return found;
        }
        if (playerView instanceof ViewGroup) {
            return findSubtitlesViewRecursive((ViewGroup) playerView);
        }
        return null;
    }

    private static View findSubtitlesViewRecursive(ViewGroup root) {
        int count = root.getChildCount();
        for (int i = 0; i < count; i++) {
            View child = root.getChildAt(i);
            if ("com.crunchyroll.subtitles.SubtitlesView".equals(child.getClass().getName())) {
                return child;
            }
            if (child instanceof ViewGroup) {
                View nested = findSubtitlesViewRecursive((ViewGroup) child);
                if (nested != null) {
                    return nested;
                }
            }
        }
        return null;
    }

    private static int resolveExoContentFrameId(Context context) {
        int id = cachedExoContentFrameId;
        if (id != 0) {
            return id;
        }
        if (context != null) {
            id = context.getResources().getIdentifier("exo_content_frame", "id", context.getPackageName());
        }
        if (id == 0) {
            id = FALLBACK_EXO_CONTENT_FRAME_ID;
        }
        cachedExoContentFrameId = id;
        return id;
    }

    private static int resolveSubtitlesRendererId(Context context) {
        int id = cachedSubtitlesRendererId;
        if (id != 0) {
            return id;
        }
        if (context != null) {
            id = context.getResources().getIdentifier("subtitles_renderer", "id", context.getPackageName());
        }
        if (id == 0) {
            id = FALLBACK_SUBTITLES_RENDERER_ID;
        }
        cachedSubtitlesRendererId = id;
        return id;
    }

    private static void invokeSetMargins(Object renderer, int top, int bottom, int left, int right) {
        try {
            Method m = cachedSetMargins;
            if (m == null || !m.getDeclaringClass().isInstance(renderer)) {
                m = renderer.getClass().getMethod("setMargins", int.class, int.class, int.class, int.class);
                cachedSetMargins = m;
            }
            m.invoke(renderer, top, bottom, left, right);
        } catch (Exception ignored) {
        }
    }

    private static void invokeSetFrameSize(Object renderer, int width, int height) {
        try {
            Method m = cachedSetFrameSize;
            if (m == null || !m.getDeclaringClass().isInstance(renderer)) {
                m = renderer.getClass().getMethod("setFrameSize", int.class, int.class);
                cachedSetFrameSize = m;
            }
            m.invoke(renderer, width, height);
        } catch (Exception ignored) {
        }
    }

    private static boolean hasPositioningTag(String text) {
        int len = text.length();
        boolean inOverride = false;
        for (int i = 0; i < len; i++) {
            char c = text.charAt(i);
            if (c == '{') {
                inOverride = true;
            } else if (c == '}') {
                inOverride = false;
            } else if (inOverride && c == '\\') {
                if (matchesTagFollowedByParen(text, i + 1, "pos")
                        || matchesTagFollowedByParen(text, i + 1, "move")) {
                    return true;
                }
            }
        }
        return false;
    }

    private static boolean matchesTagFollowedByParen(String text, int start, String tag) {
        int tagLen = tag.length();
        int len = text.length();
        if (start + tagLen >= len) {
            return false;
        }
        if (!text.regionMatches(true, start, tag, 0, tagLen)) {
            return false;
        }
        int j = start + tagLen;
        while (j < len && text.charAt(j) == ' ') {
            j++;
        }
        return j < len && text.charAt(j) == '(';
    }

    private static int findInlineAlignment(String text) {
        int len = text.length();
        boolean inOverride = false;
        for (int i = 0; i < len; i++) {
            char c = text.charAt(i);
            if (c == '{') {
                inOverride = true;
            } else if (c == '}') {
                inOverride = false;
            } else if (inOverride && c == '\\' && i + 3 < len) {
                char c1 = text.charAt(i + 1);
                char c2 = text.charAt(i + 2);
                char c3 = text.charAt(i + 3);
                if ((c1 == 'a' || c1 == 'A') && (c2 == 'n' || c2 == 'N') && c3 >= '1' && c3 <= '9') {
                    return c3 - '0';
                }
            }
        }
        return -1;
    }

    private static String scaleInlineFsTags(String text, float fontScale) {
        int firstBrace = text.indexOf('{');
        if (firstBrace < 0) {
            return text;
        }

        StringBuilder sb = null;
        int len = text.length();
        boolean inOverride = false;
        int copiedUpTo = 0;

        for (int i = firstBrace; i < len; i++) {
            char c = text.charAt(i);
            if (c == '{') {
                inOverride = true;
            } else if (c == '}') {
                inOverride = false;
            } else if (inOverride && c == '\\' && i + 3 < len) {
                char c1 = text.charAt(i + 1);
                char c2 = text.charAt(i + 2);
                if ((c1 == 'f' || c1 == 'F') && (c2 == 's' || c2 == 'S')) {
                    int numStart = i + 3;
                    int scan = numStart;
                    char signChar = '\0';
                    char next = text.charAt(scan);
                    if (next == '+' || next == '-') {
                        signChar = next;
                        scan++;
                    }
                    int digitsStart = scan;
                    boolean hasDot = false;
                    while (scan < len) {
                        char ch = text.charAt(scan);
                        if (ch >= '0' && ch <= '9') {
                            scan++;
                        } else if (ch == '.' && !hasDot) {
                            hasDot = true;
                            scan++;
                        } else {
                            break;
                        }
                    }
                    if (scan > digitsStart) {
                        float val = parseFloatSafe(text.substring(digitsStart, scan), -1f);
                        if (val > 0f) {
                            if (sb == null) {
                                sb = new StringBuilder(len + 16);
                            }
                            sb.append(text, copiedUpTo, numStart);
                            if (signChar != '\0') {
                                sb.append(signChar);
                            }
                            sb.append(formatAssNumber(val * fontScale));
                            copiedUpTo = scan;
                            i = scan - 1;
                        }
                    }
                }
            }
        }

        if (sb == null) {
            return text;
        }
        sb.append(text, copiedUpTo, len);
        return sb.toString();
    }

    private static String normalizeAssColor(String raw) {
        if (raw == null) {
            return "";
        }
        String trimmed = raw.trim();
        if (trimmed.isEmpty() || "default".equalsIgnoreCase(trimmed)) {
            return "";
        }
        if (trimmed.startsWith("&H") || trimmed.startsWith("&h")) {
            return trimmed.toUpperCase(Locale.US);
        }
        if (trimmed.startsWith("#")) {
            String hex = trimmed.substring(1).toUpperCase(Locale.US);
            if (hex.length() == 6) {
                // #RRGGBB -> &H00BBGGRR
                String rr = hex.substring(0, 2);
                String gg = hex.substring(2, 4);
                String bb = hex.substring(4, 6);
                return "&H00" + bb + gg + rr;
            } else if (hex.length() == 8) {
                // #AARRGGBB (Android alpha: FF=opaque) -> &HAABBGGRR (ASS alpha: 00=opaque)
                int alpha = parseHexByte(hex.substring(0, 2));
                if (alpha >= 0) {
                    int assAlpha = 255 - alpha;
                    String rr = hex.substring(2, 4);
                    String gg = hex.substring(4, 6);
                    String bb = hex.substring(6, 8);
                    return String.format(Locale.US, "&H%02X%s%s%s", assAlpha, bb, gg, rr);
                }
            }
        }
        return "";
    }

    private static int parseHexByte(String hex) {
        try {
            return Integer.parseInt(hex, 16) & 0xFF;
        } catch (NumberFormatException ignored) {
            return -1;
        }
    }

    private static String formatAssNumber(float value) {
        float roundedInt = Math.round(value);
        if (Math.abs(value - roundedInt) < 0.05f) {
            return String.valueOf((int) roundedInt);
        }
        float roundedTenth = Math.round(value * 10f) / 10f;
        if (Math.abs(value - roundedTenth) < 0.01f) {
            return String.format(Locale.US, "%.1f", roundedTenth);
        }
        return String.format(Locale.US, "%.2f", value);
    }

    private static String formatEventMarginV(int value, String original) {
        if (original.length() >= 4 && original.charAt(0) == '0') {
            return String.format(Locale.US, "%04d", value);
        }
        return String.valueOf(value);
    }

    private static String[] splitBounded(String s, char delim, int maxCols) {
        String[] result = new String[maxCols];
        int col = 0;
        int start = 0;
        int len = s.length();
        while (col < maxCols - 1) {
            int idx = s.indexOf(delim, start);
            if (idx < 0) {
                break;
            }
            result[col++] = s.substring(start, idx);
            start = idx + 1;
        }
        result[col++] = start <= len ? s.substring(start) : "";
        if (col == maxCols) {
            return result;
        }
        String[] trimmed = new String[col];
        System.arraycopy(result, 0, trimmed, 0, col);
        return trimmed;
    }

    private static void appendJoined(StringBuilder sb, String[] parts, char delim) {
        for (int i = 0; i < parts.length; i++) {
            if (i > 0) {
                sb.append(delim);
            }
            if (parts[i] != null) {
                sb.append(parts[i]);
            }
        }
    }

    private static String extractLeadingSpace(String s) {
        int i = 0;
        int len = s.length();
        while (i < len && (s.charAt(i) == ' ' || s.charAt(i) == '\t')) {
            i++;
        }
        return i == 0 ? "" : s.substring(0, i);
    }

    private static boolean startsWithIgnoreCase(String s, String prefix) {
        return s.length() >= prefix.length() && s.regionMatches(true, 0, prefix, 0, prefix.length());
    }

    private static float parseFloatSafe(String s, float fallback) {
        if (s.isEmpty()) {
            return fallback;
        }
        try {
            return Float.parseFloat(s);
        } catch (NumberFormatException ignored) {
            return fallback;
        }
    }

    private static int parseIntSafe(String s, int fallback) {
        if (s.isEmpty()) {
            return fallback;
        }
        try {
            return Integer.parseInt(s);
        } catch (NumberFormatException ignored) {
            return fallback;
        }
    }
}
