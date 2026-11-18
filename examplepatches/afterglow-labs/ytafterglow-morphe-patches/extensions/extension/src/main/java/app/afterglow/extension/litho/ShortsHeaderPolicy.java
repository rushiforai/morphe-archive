package app.afterglow.extension.litho;

/** Exact 21.43.523 toolbar identities, independent of translated button labels. */
public final class ShortsHeaderPolicy {
    private static final ByteArrayFilterGroup SEARCH = ByteArrayFilterGroup.always(
            "top_bar_conditional_button_image_yt_delhi_search_24dp");

    private ShortsHeaderPolicy() {}

    /** iOS header icon roles, using the names present in Android's 21.43.523 enum. */
    public static String nativeKey(String icon) {
        if (icon == null) return null;
        switch (icon) {
            case "SEARCH": case "SEARCH_LARGE": case "SEARCH_WITH_CIRCLE":
            case "SEARCH_FILLED": case "SEARCH_BOLD": case "SEARCH_PROMINENT":
            case "SHORTS_SEARCH": case "SEARCH_TAB_LARGE": case "SEARCH_CAIRO":
                return "hideShortsSearch";
            case "FAB_CAMERA": case "PHOTO_CAMERA": case "VIDEO_CAMERA":
            case "CAMERA_ALT": case "OUTLINE_CAMERA_20": case "OUTLINE_CAMERA_24":
            case "PHOTO_CAMERA_OUTLINE": case "SHORTS_HEADER_CAMERA":
            case "SHORTS_HEADER_CAMERA_BOLD": case "PHOTO_CAMERA_OUTLINE_LARGE":
                return "hideShortsCamera";
            case "MORE_VERT": case "MORE_VERT_BOLD": case "MORE_HORIZ": case "MORE_HORIZ_LIGHT":
                return "hideShortsMore";
            default: return null;
        }
    }

    public static String key(LithoContext context, Object element, String accessibilityId) {
        if (context == null) return null;
        StringBuilder path = context.afterglow_getPathBuilder();
        if (path == null || path.indexOf("top_bar.e") != 0
                || path.indexOf("top_bar_conditional_button.e") < 0) return null;
        LithoComponent component = new LithoComponent();
        component.reset(context, element, context.afterglow_getIdentifier(), path, accessibilityId, "");
        try { return key(component); }
        finally { component.clear(); }
    }

    public static String key(LithoComponent component) {
        if (!component.pathStartsWith("top_bar.e")
                || !component.pathContains("top_bar_conditional_button.e")) return null;
        if ("id.reel_more_button".equals(component.accessibilityId())) return "hideShortsMore";
        return SEARCH.matches(component) ? "hideShortsSearch" : null;
    }
}
