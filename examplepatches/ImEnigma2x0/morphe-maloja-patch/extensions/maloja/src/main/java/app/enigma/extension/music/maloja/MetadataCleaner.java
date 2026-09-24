package app.enigma.extension.music.maloja;

import app.morphe.extension.shared.Logger;

/**
 * Same title, artist and album cleanup as the official Morphe scrobbling patch.
 */
final class MetadataCleaner {

    static String cleanTitle(String title) {
        if (title == null) return null;
        String clean = title;
        if (MalojaSettings.METADATA_CLEANUP.get()) {
            clean = clean.replaceAll("(?i)\\s*[（(\\[](official\\s+)?(video|audio|music\\s+video|lyric\\s+video|visualizer)[）)\\]]", "");
            clean = clean.replaceAll("(?i)\\s*[（(\\[](\\d{4}\\s+)?remaster(ed)?(\\s+\\d{4})?[）)\\]]", "");
            clean = clean.replaceAll("(?i)\\s*[（(\\[]live(\\s+at\\s+.*|\\s+\\d{4})?[）)\\]]", "");
            clean = clean.replaceAll("(?i)\\s*[（(\\[](mono|stereo|hq|hd)[）)\\]]", "");
            clean = applyCustomRegex(clean);
        }
        return clean.replaceAll("\\s+", " ").trim();
    }

    static String cleanArtist(String artist) {
        if (artist == null) return null;
        String clean = artist;
        if (MalojaSettings.METADATA_CLEANUP.get()) {
            clean = clean.replaceAll("(?i)\\s*-\\s*topic$", "");
            clean = applyCustomRegex(clean);
        }
        return clean.replaceAll("\\s+", " ").trim();
    }

    static String cleanAlbum(String album) {
        if (album == null) return null;
        String clean = album;
        if (MalojaSettings.METADATA_CLEANUP.get()) {
            clean = clean.replaceAll("(?i)\\s*[（(\\[](\\d{4}\\s+)?remaster(ed)?(\\s+\\d{4})?[）)\\]]", "");
            clean = applyCustomRegex(clean);
        }
        return clean.replaceAll("\\s+", " ").trim();
    }

    /**
     * @return Cleaned {title, artist}. When enabled, an "Artist - Title" title overrides both.
     */
    static String[] resolveTitleAndArtist(String rawTitle, String rawArtist) {
        String title = cleanTitle(rawTitle);
        String artist = cleanArtist(rawArtist);

        if (MalojaSettings.PARSE_TITLE.get() && rawTitle != null) {
            final String separator = " - ";
            final int separatorIndex = rawTitle.indexOf(separator);
            if (separatorIndex > 0 && separatorIndex < rawTitle.length() - separator.length()) {
                String parsedArtist = cleanArtist(rawTitle.substring(0, separatorIndex).trim());
                String parsedTrack = cleanTitle(rawTitle.substring(separatorIndex + separator.length()).trim());
                if (!parsedArtist.isEmpty() && !parsedTrack.isEmpty()) {
                    title = parsedTrack;
                    artist = parsedArtist;
                }
            }
        }

        return new String[]{title, artist};
    }

    private static String applyCustomRegex(String input) {
        final String customRegex = MalojaSettings.CUSTOM_REGEX.get();
        if (customRegex.isBlank()) return input;
        try {
            return input.replaceAll(customRegex, "");
        } catch (Exception ex) {
            Logger.printException(() -> "Error applying custom regex: " + customRegex, ex);
            return input;
        }
    }

    private MetadataCleaner() {
    }
}
