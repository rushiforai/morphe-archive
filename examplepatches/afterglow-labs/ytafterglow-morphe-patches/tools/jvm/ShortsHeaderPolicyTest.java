package app.afterglow.extension.litho;

import java.nio.charset.StandardCharsets;
import java.util.Objects;

/** Boundaries observed in the 21.43.523 Shorts and Home component traces. */
public final class ShortsHeaderPolicyTest {
    private static final String ROOT = "top_bar.eml-fe|26776315dd5bf096";
    private static final String BUTTON = "|ContainerType|ContainerType|ContainerType|top_bar_conditional_button.eml-fe|37cfc022bab6be71|ImageType|";
    private static final String SEARCH = "yt_delhi_search_24dp Search top_bar_conditional_button_image_yt_delhi_search_24dp";
    private static int checks;

    public static void main(String[] args) {
        check("hideShortsSearch", ROOT + BUTTON, "", SEARCH);
        check("hideShortsMore", ROOT + BUTTON, "id.reel_more_button", "overflow_horizontal");
        check("hideShortsMore", ROOT + BUTTON, "id.reel_more_button", SEARCH);
        // Root models contain every descendant's icon: never bind the whole toolbar.
        check(null, ROOT + "|ContainerType|", "eml.top_bar", SEARCH);
        check(null, ROOT + "|toggle_button.eml|button.eml|ImageType|", "id.elements.button", SEARCH);
        check(null, "unrelated.eml" + BUTTON, "id.reel_more_button", SEARCH);
        check(null, ROOT + BUTTON, "", "yt_delhi_search_24dp");
        check(null, ROOT + BUTTON, "id.elements.button", "shorts_mute_toggle");
        check(null, ROOT + BUTTON, "", "");
        // No translated text is needed to identify these exact renderer roles.
        check("hideShortsSearch", ROOT + BUTTON, "", "top_bar_conditional_button_image_yt_delhi_search_24dp");
        check("hideShortsMore", ROOT + BUTTON, "id.reel_more_button", "");
        ElementProto failIfRead = () -> { throw new AssertionError("Unrelated proto encoded"); };
        same(null, ShortsHeaderPolicy.key(null, failIfRead, ""));
        same(null, ShortsHeaderPolicy.key(context(null), failIfRead, ""));
        same(null, ShortsHeaderPolicy.key(context("home.eml|ImageType|"), failIfRead, ""));
        same(null, ShortsHeaderPolicy.key(context(ROOT), failIfRead, ""));
        for (String icon : new String[]{"SEARCH", "SEARCH_LARGE", "SEARCH_WITH_CIRCLE", "SEARCH_FILLED",
                "SEARCH_BOLD", "SEARCH_PROMINENT", "SHORTS_SEARCH", "SEARCH_TAB_LARGE", "SEARCH_CAIRO"})
            same("hideShortsSearch", ShortsHeaderPolicy.nativeKey(icon));
        for (String icon : new String[]{"FAB_CAMERA", "PHOTO_CAMERA", "VIDEO_CAMERA", "CAMERA_ALT",
                "OUTLINE_CAMERA_20", "OUTLINE_CAMERA_24", "PHOTO_CAMERA_OUTLINE", "SHORTS_HEADER_CAMERA",
                "SHORTS_HEADER_CAMERA_BOLD", "PHOTO_CAMERA_OUTLINE_LARGE"})
            same("hideShortsCamera", ShortsHeaderPolicy.nativeKey(icon));
        for (String icon : new String[]{"MORE_VERT", "MORE_VERT_BOLD", "MORE_HORIZ", "MORE_HORIZ_LIGHT"})
            same("hideShortsMore", ShortsHeaderPolicy.nativeKey(icon));
        for (String icon : new String[]{null, "", "VOICE_SEARCH", "SEARCH_HISTORY", "GOOGLE_LENS_CAMERA",
                "CAMERA_REMIX", "VIDEO_CAMERA_DISABLED", "PHOTO_CAMERA_LIGHT"})
            same(null, ShortsHeaderPolicy.nativeKey(icon));
        System.out.println("PASS Shorts header identity: " + checks + "/" + checks + " checks");
    }

    private static void check(String expected, String path, String accessibility, String proto) {
        LithoContext context = context(path);
        ElementProto element = () -> proto.getBytes(StandardCharsets.UTF_8);
        same(expected, ShortsHeaderPolicy.key(context, element, accessibility));
        same(path, context.afterglow_getPathBuilder().toString());
    }

    private static LithoContext context(String path) {
        StringBuilder builder = path == null ? null : new StringBuilder(path);
        return new LithoContext() {
            public String afterglow_getIdentifier() { return ROOT; }
            public StringBuilder afterglow_getPathBuilder() { return builder; }
            public Integer afterglow_getHeightConstraint() { return null; }
            public Object afterglow_getSwipeProtector() { return null; }
        };
    }

    private static void same(String expected, String actual) {
        checks++;
        if (!Objects.equals(expected, actual)) throw new AssertionError("expected=" + expected + " actual=" + actual);
    }
}
