package app.afterglow.extension.menus;

import java.nio.ByteBuffer;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import app.afterglow.extension.settings.ThemeJson;

/** Raw metadata and identity rules for the Description header's explicit copy actions. */
public final class DescriptionHeaderPolicy {
    public static final String PANEL = "video-description-ep-identifier";
    public static final int MAX_RESPONSE = 1024 * 1024;
    public static final int MAX_TEXT = 131072;
    private DescriptionHeaderPolicy() {}

    public static boolean titleHeader(String identifier, String path) {
        return identifier != null && identifier.startsWith("video_title_header.eml-fe|")
                && path != null && path.equals(identifier + "|CellType|ContainerType|TextType|");
    }

    public static boolean videoId(String id) { return id != null && id.matches("[A-Za-z0-9_-]{11}"); }
    public static boolean current(boolean enabled, boolean attached, boolean shown, boolean ad,
                                  Object expectedGeneration, Object actualGeneration,
                                  Object expectedPanel, Object actualPanel, String panelId,
                                  String expectedVideo, String currentVideo) {
        return enabled && attached && shown && !ad && expectedGeneration != null
                && expectedGeneration == actualGeneration && expectedPanel != null && expectedPanel == actualPanel
                && PANEL.equals(panelId) && videoId(expectedVideo) && expectedVideo.equals(currentVideo);
    }
    public static final class Metadata {
        public final String videoId, title, description;
        Metadata(String id, String title, String description) { videoId = id; this.title = title; this.description = description; }
    }
    /** Missing and empty descriptions differ: empty is valid, missing never overwrites the clipboard. */
    public static Metadata parse(String requestedId, byte[] bytes) throws Exception {
        if (!videoId(requestedId) || bytes == null || bytes.length == 0 || bytes.length > MAX_RESPONSE)
            throw new IllegalArgumentException("The video details could not be read.");
        String json = StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
                .onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(bytes)).toString();
        Object raw = ThemeJson.parse(json);
        if (!(raw instanceof Map) || !(((Map<?, ?>) raw).get("videoDetails") instanceof Map))
            throw new IllegalArgumentException("The full description is unavailable for this video.");
        Map<?, ?> details = (Map<?, ?>) ((Map<?, ?>) raw).get("videoDetails");
        if (!requestedId.equals(details.get("videoId"))) throw new IllegalArgumentException("The video changed. Try again.");
        Object title = details.get("title"), description = details.get("shortDescription");
        if (!(title instanceof String) || ((String) title).length() > MAX_TEXT
                || !(description instanceof String) || ((String) description).length() > MAX_TEXT)
            throw new IllegalArgumentException("The full description is unavailable for this video.");
        return new Metadata(requestedId, (String) title, (String) description);
    }
}
