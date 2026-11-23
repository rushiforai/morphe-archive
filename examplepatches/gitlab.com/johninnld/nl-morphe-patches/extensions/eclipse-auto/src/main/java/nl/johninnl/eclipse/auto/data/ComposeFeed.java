package nl.johninnl.eclipse.auto.data;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * The compose feed as the server sends it, reduced to what the car shows. Parsed from the wire
 * JSON (stable and captured), never from the app's obfuscated row objects.
 */
public final class ComposeFeed {
    /** One entry of a row, a card or a mix. Fields a kind does not use stay null. */
    public static final class Item {
        public final String title;
        public final String subtitle;
        public final String artUrl;
        public final String playlistId;
        public final String appleMusicPlaylistId;
        public final String appleMusicAlbumId;
        public final String appleMusicArtistId;
        public final String mixId;
        public final String stationId;
        public final boolean favorites;
        public final Integer trackCount;
        public final String releaseDate;
        public final String genre;
        public final Boolean explicit;
        public final String nowTitle;
        public final String nowArtist;
        public final String nowCover;
        /** The entry exactly as sent, kept for tracks so the app's own parser can read it. */
        public final String json;
        /** The songs a mix carries inline. */
        public final List<Item> tracks;
        /** The linked list id ({@code ytmusic-...}) of a linked playlist card, or null. */
        public final String linkedListId;
        /** For a linked-library playlist ({@code type: linked_playlist}): the provider and its playlist id. */
        public final String provider;
        public final String providerPlaylistId;
        /** The linked track id ({@code linked_ytmusic_...}) of a linked service's song, or null. */
        public final String linkedTrackId;

        Item(Builder b) {
            this.title = b.title;
            this.subtitle = b.subtitle;
            this.artUrl = b.artUrl;
            this.playlistId = b.playlistId;
            this.appleMusicPlaylistId = b.appleMusicPlaylistId;
            this.appleMusicAlbumId = b.appleMusicAlbumId;
            this.appleMusicArtistId = b.appleMusicArtistId;
            this.mixId = b.mixId;
            this.stationId = b.stationId;
            this.favorites = b.favorites;
            this.trackCount = b.trackCount;
            this.releaseDate = b.releaseDate;
            this.genre = b.genre;
            this.explicit = b.explicit;
            this.nowTitle = b.nowTitle;
            this.nowArtist = b.nowArtist;
            this.nowCover = b.nowCover;
            this.json = b.json;
            this.tracks = Collections.unmodifiableList(new ArrayList<>(b.tracks));
            this.linkedListId = b.linkedListId;
            this.provider = b.provider;
            this.providerPlaylistId = b.providerPlaylistId;
            this.linkedTrackId = b.linkedTrackId;
        }

        /** A song for display and playback: title and artist are what the app's parser requires. */
        public Model.Track toTrack() {
            if (linkedTrackId != null) {
                return Model.Track.deferredLinked(json, title, subtitle, null, artUrl, linkedTrackId, Boolean.TRUE.equals(explicit));
            }
            return Model.Track.deferred(json, title, subtitle, null, artUrl);
        }

        static final class Builder {
            String title, subtitle, artUrl, playlistId, appleMusicPlaylistId, appleMusicAlbumId, appleMusicArtistId, mixId,
                stationId, releaseDate, genre, nowTitle, nowArtist, nowCover, json, linkedListId, provider, providerPlaylistId,
                linkedTrackId;
            boolean favorites;
            Integer trackCount;
            Boolean explicit;
            List<Item> tracks = new ArrayList<>();
        }
    }

    /** One Home row. */
    public static final class Row {
        public final String key;
        public final String kind;
        public final String title;
        public final String provenance;
        public final List<Item> items;
        /** The artwork the server names for a native row's cards ({@code made_for_you}: replay, top_songs, ...). */
        public final Map<String, String> art;

        public Row(String key, String kind, String title, String provenance, List<Item> items) {
            this(key, kind, title, provenance, items, Collections.<String, String>emptyMap());
        }

        public Row(String key, String kind, String title, String provenance, List<Item> items, Map<String, String> art) {
            this.key = key == null ? "" : key;
            this.kind = kind == null ? "" : kind;
            this.title = title == null ? "" : title;
            this.provenance = provenance;
            this.items = Collections.unmodifiableList(new ArrayList<>(items));
            this.art = Collections.unmodifiableMap(new LinkedHashMap<>(art));
        }

        public Row withTitle(String newTitle) { return new Row(key, kind, newTitle, provenance, items, art); }
    }

    /** The Home feed. */
    public static final class Home {
        public final List<Row> rows;

        public Home(List<Row> rows) { this.rows = Collections.unmodifiableList(new ArrayList<>(rows)); }
    }

    /** One Discover card: art, text, signals and the songs it opens with. */
    public static final class Card {
        public final String id;
        public final String title;
        public final String subtitle;
        public final String artUrl;
        public final List<String> signals;
        public final List<Item> tracks;

        public Card(String id, String title, String subtitle, String artUrl, List<String> signals, List<Item> tracks) {
            this.id = id == null ? "" : id;
            this.title = title == null ? "" : title;
            this.subtitle = subtitle == null ? "" : subtitle;
            this.artUrl = artUrl;
            this.signals = Collections.unmodifiableList(new ArrayList<>(signals));
            this.tracks = Collections.unmodifiableList(new ArrayList<>(tracks));
        }
    }

    /** One Discover section: a layout ("hero", or anything else) and its cards. */
    public static final class Section {
        public final String key;
        public final String title;
        public final String layout;
        public final List<Card> cards;

        public Section(String key, String title, String layout, List<Card> cards) {
            this.key = key == null ? "" : key;
            this.title = title == null ? "" : title;
            this.layout = layout == null ? "" : layout;
            this.cards = Collections.unmodifiableList(new ArrayList<>(cards));
        }
    }

    /** The Discover feed: a different shape from Home. */
    public static final class Discover {
        public final List<Section> sections;

        public Discover(List<Section> sections) { this.sections = Collections.unmodifiableList(new ArrayList<>(sections)); }
    }

    private ComposeFeed() { }
}
