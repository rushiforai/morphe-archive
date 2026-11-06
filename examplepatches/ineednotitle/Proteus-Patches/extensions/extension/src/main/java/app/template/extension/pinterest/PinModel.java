// Adapted from archivesteak/Quest Pinterest patches (GPL-3.0).
package app.template.extension.pinterest;

import java.util.List;
import java.util.Map;

/**
 * Accessors for Pinterest's Pin model. The model class and its getters are obfuscated,
 * so every method here is implemented by the patch.
 */
@SuppressWarnings("unused")
public final class PinModel {
    /**
     * Video encodings of the Pin keyed by encoding name, or null if the Pin has no video.
     */
    public static Map<String, ?> getVideoList(Object pin) {
        return null;
    }

    /**
     * Pages of the Pin if it's an Idea Pin, or null.
     */
    public static List<?> getStoryPages(Object pin) {
        return null;
    }

    /**
     * Preview of the pages of the Pin if it's an Idea Pin, or null.
     * Pins in feeds can have only this.
     */
    public static List<?> getStoryPagesPreview(Object pin) {
        return null;
    }

    public static List<?> getPageBlocks(Object page) {
        return null;
    }

    /**
     * Video encodings of an Idea Pin page, like {@link #getVideoList(Object)}.
     */
    public static Map<String, ?> getPageVideoList(Object page) {
        return null;
    }

    /**
     * Video encodings of an Idea Pin page block, or null if it isn't a video block.
     */
    public static Map<String, ?> getBlockVideoList(Object block) {
        return null;
    }

    public static String getVideoUrl(Object videoEncoding) {
        return null;
    }
}
