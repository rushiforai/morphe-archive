package com.anderson.applemusic.one.media;

import java.util.List;
import java.util.Locale;

/**
 * Catalogue lookups by name, shared by Biblioteca, the "Ver tudo" browser and the search.
 *
 * <p>A library row only carries a persistent id (no catalogue id), so opening it means
 * resolving the name through amp-api. The screens used to repeat the same
 * find + artwork-fallback + miss callbacks; this class keeps the matching normalisation
 * ({@link #pick}) and the three lookups in one place, while each screen still decides what
 * to show when the name is missing.
 */
public final class CatalogResolver {

    /** Result of a by-name lookup: the catalogue id + artwork, or a miss. */
    public interface Match {
        void onMatch(String id, String artworkUrl);

        void onMiss(String message);
    }

    private final CatalogSearch catalog;

    public CatalogResolver(CatalogSearch catalog) {
        this.catalog = catalog;
    }

    public void artist(String name, String fallbackArtwork, Match match) {
        catalog.findArtist(name, callback(fallbackArtwork, match));
    }

    public void album(String title, String artist, String fallbackArtwork, Match match) {
        catalog.findAlbumMatch(title, artist, callback(fallbackArtwork, match));
    }

    public void playlist(String title, String curator, String fallbackArtwork, Match match) {
        catalog.findPlaylistMatch(title, curator, callback(fallbackArtwork, match));
    }

    private static CatalogSearch.MatchCallback callback(final String fallbackArtwork,
                                                        final Match match) {
        return new CatalogSearch.MatchCallback() {
            @Override
            public void onMatch(CatalogSearch.Result result) {
                match.onMatch(result.id,
                        result.artworkUrl != null ? result.artworkUrl : fallbackArtwork);
            }

            @Override
            public void onFailure(String message) {
                match.onMiss(message);
            }
        };
    }

    /** Last segment of a browse id: the library entity type and its persistent id. */
    public static String lastSegment(String id) {
        if (id == null) return "";
        int slash = id.lastIndexOf('/');
        return slash < 0 ? id : id.substring(slash + 1);
    }

    /**
     * Best catalogue match for a browse item: same title (case/spacing insensitive) and,
     * when the browse item carries an artist, the same artist. Library titles often add a
     * " - Single"/" - EP" suffix or a "(Deluxe Version)"/"(Remastered)" qualifier the
     * catalogue name does not carry, so those are compared base-to-base before giving up.
     * Returns null instead of guessing, so the UI degrades to "play the whole collection"
     * rather than showing the tracks of a different album.
     */
    public static CatalogSearch.Result pick(List<CatalogSearch.Result> items, String title,
                                            String artist) {
        String want = normalize(title);
        String wantBase = stripQualifiers(want);
        String who = clean(artist).toLowerCase(Locale.ROOT);
        CatalogSearch.Result base = null;
        for (CatalogSearch.Result item : items) {
            String itemTitle = normalize(item.title);
            boolean sameArtist = who.length() == 0
                    || clean(item.artist).toLowerCase(Locale.ROOT).equals(who);
            if (itemTitle.equals(want) && sameArtist) return item;
            if (base == null && sameArtist
                    && stripQualifiers(itemTitle).equals(wantBase)) {
                base = item;
            }
        }
        if (base != null) return base;
        for (CatalogSearch.Result item : items) {
            if (normalize(item.title).equals(want)) return item;
        }
        for (CatalogSearch.Result item : items) {
            if (stripQualifiers(normalize(item.title)).equals(wantBase)) return item;
        }
        return null;
    }

    static String clean(String value) {
        return value == null ? "" : value.replaceAll("\\s+", " ").trim();
    }

    /**
     * The library titles singles/EPs with a " - Single"/" - EP" suffix the catalogue name
     * does not carry; strip it before comparing so "A Capella - Single" matches "A Capella".
     */
    static String normalize(String value) {
        String text = clean(value).toLowerCase(Locale.ROOT);
        if (text.endsWith(" - single")) {
            text = text.substring(0, text.length() - " - single".length()).trim();
        } else if (text.endsWith(" - ep")) {
            text = text.substring(0, text.length() - " - ep".length()).trim();
        }
        return text;
    }

    /** Drops trailing "(Deluxe Version)"/"[Remastered]"-style qualifiers. */
    static String stripQualifiers(String value) {
        String text = value == null ? "" : value.trim();
        while (true) {
            int end = -1;
            if (text.endsWith(")")) end = text.lastIndexOf('(');
            else if (text.endsWith("]")) end = text.lastIndexOf('[');
            if (end <= 0) return text;
            text = text.substring(0, end).trim();
        }
    }
}
