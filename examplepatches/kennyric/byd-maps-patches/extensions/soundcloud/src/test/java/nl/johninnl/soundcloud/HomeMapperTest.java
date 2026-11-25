package nl.johninnl.soundcloud;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.junit.Test;

public final class HomeMapperTest {
    // Fakes expose the same Jackson-retained getter names as SoundCloud's response model.
    public static final class Urn {
        private final String content;
        public Urn(String content) { this.content = content; }
        public String getContent() { return content; }
        public boolean isSystemPlaylist() { return content.contains(":system-playlists:"); }
        @Override public boolean equals(Object other) { return other instanceof Urn && ((Urn) other).content.equals(content); }
        @Override public int hashCode() { return content.hashCode(); }
    }
    public static final class User {
        private final Urn urn; private final String name;
        public User(String id, String name) { this.urn = new Urn("soundcloud:users:" + id); this.name = name; }
        public Urn getUrn() { return urn; }
        public String getUsername() { return name; }
        public String getAvatarUrlTemplate() { return "avatar-{size}"; }
    }
    public static final class Track {
        private final Urn urn; private final String title; private final User user; private final String art;
        public Track(String id, String title, User user, String art) { this.urn = new Urn("soundcloud:tracks:" + id); this.title = title; this.user = user; this.art = art; }
        public Urn getUrn() { return urn; }
        public String getTitle() { return title; }
        public User getUser() { return user; }
        public String getArtworkUrlTemplate() { return art; }
    }
    public static final class Playlist {
        private final Urn urn; private final String title; private final User user;
        public Playlist(String urn, String title, User user) { this.urn = new Urn(urn); this.title = title; this.user = user; }
        public Urn getUrn() { return urn; }
        public String getTitle() { return title; }
        public User getUser() { return user; }
        public String getArtworkUrlTemplate() { return "art-{size}"; }
    }
    public static final class Repost {
        private final Track track;
        public Repost(Track track) { this.track = track; }
        public Track getTrack() { return track; }
    }
    public static final class TrackEntity { private final Track t; public TrackEntity(Track t) { this.t = t; } public Track getTrack() { return t; } }
    public static final class PlaylistEntity { private final Playlist p; public PlaylistEntity(Playlist p) { this.p = p; } public Playlist getPlaylist() { return p; } }
    public static final class UserEntity { private final User u; public UserEntity(User u) { this.u = u; } public User getUser() { return u; } }
    public static final class RepostEntity { private final Repost r; public RepostEntity(Repost r) { this.r = r; } public Repost getTrackRepost() { return r; } }
    public static final class Item { private final Object data; public Item(Object data) { this.data = data; } public Object getData() { return data; } }
    public static final class Carousel {
        private final String title; private final List<Urn> results;
        public Carousel(String title, Urn... results) { this.title = title; this.results = Arrays.asList(results); }
        public String getTitle() { return title; }
        public List<Urn> getResults() { return results; }
    }
    public static final class Banner { public String getTitle() { return "Upgrade"; } }
    public static final class Section { private final Object data; public Section(Object data) { this.data = data; } public Object getData() { return data; } }
    public static final class Result {
        final List<Section> sections = new ArrayList<>(); final Map<Urn, Item> entities = new LinkedHashMap<>();
        public List<Section> getSections() { return sections; }
        public Map<Urn, Item> getEntities() { return entities; }
    }

    static final class Recorder implements HomeMapper.Items {
        final List<String> calls = new ArrayList<>();
        @Override public Object playable(String id, String title, String subtitle, String art) { String s = "play|" + id + "|" + title + "|" + subtitle + "|" + art; calls.add(s); return new StringBuilder(s); }
        @Override public Object browsable(String id, String title, String subtitle, String art) { String s = "browse|" + id + "|" + title + "|" + subtitle + "|" + art; calls.add(s); return new StringBuilder(s); }
        @Override public void group(Object item, String title) { ((StringBuilder) item).append("#").append(title); }
        @Override public String mediaId(String content) { return "id:" + content; }
    }

    private static Result home() {
        User artist = new User("7", "Artist");
        Track track = new Track("1", "Song", artist, null);
        Playlist playlist = new Playlist("soundcloud:playlists:2", "Road trip", artist);
        Playlist mix = new Playlist("soundcloud:system-playlists:daily", "Daily Drops", new User("8", "SoundCloud"));
        Track reposted = new Track("3", "Repost", artist, "track-{size}");
        Urn repostKey = new Urn("soundcloud:track-reposts:3");
        Result result = new Result();
        result.entities.put(track.getUrn(), new Item(new TrackEntity(track)));
        result.entities.put(playlist.getUrn(), new Item(new PlaylistEntity(playlist)));
        result.entities.put(mix.getUrn(), new Item(new PlaylistEntity(mix)));
        result.entities.put(artist.getUrn(), new Item(new UserEntity(artist)));
        result.entities.put(repostKey, new Item(new RepostEntity(new Repost(reposted))));
        result.sections.add(new Section(new Banner()));
        result.sections.add(new Section(new Carousel("More of what you like", track.getUrn(), playlist.getUrn(), new Urn("soundcloud:tracks:missing"))));
        result.sections.add(new Section(new Carousel("Mixed for you", mix.getUrn(), track.getUrn(), artist.getUrn(), repostKey)));
        return result;
    }

    @Test public void mapsSectionsInOrderWithGroupTitles() {
        Recorder recorder = new Recorder();
        List<Object> items = HomeMapper.map(home(), recorder);
        List<String> rendered = new ArrayList<>();
        for (Object item : items) rendered.add(item.toString());
        assertEquals(Arrays.asList(
            "play|id:soundcloud:tracks:1|Song|Artist|avatar-{size}#More of what you like",
            "browse|id:soundcloud:playlists:2|Road trip|Artist|art-{size}#More of what you like",
            "play|id:soundcloud:system-playlists:daily|Daily Drops|SoundCloud|art-{size}#Mixed for you",
            "play|id:soundcloud:users:7|Artist|null|avatar-{size}#Mixed for you",
            "play|id:soundcloud:tracks:3|Repost|Artist|track-{size}#Mixed for you"), rendered);
    }

    @Test public void duplicateTracksAppearOnce() {
        Recorder recorder = new Recorder();
        HomeMapper.map(home(), recorder);
        assertEquals(1, recorder.calls.stream().filter(c -> c.contains("tracks:1|")).count());
    }

    @Test public void limitsEachSection() {
        Result result = new Result();
        User artist = new User("1", "A");
        Urn[] urns = new Urn[HomeMapper.PER_SECTION + 5];
        for (int i = 0; i < urns.length; i++) {
            Track track = new Track(String.valueOf(100 + i), "T" + i, artist, null);
            urns[i] = track.getUrn();
            result.entities.put(track.getUrn(), new Item(new TrackEntity(track)));
        }
        result.sections.add(new Section(new Carousel("Many", urns)));
        assertEquals(HomeMapper.PER_SECTION, HomeMapper.map(result, new Recorder()).size());
    }

    @Test public void unexpectedShapesProduceNoItems() {
        assertTrue(HomeMapper.map(new Object(), new Recorder()).isEmpty());
        assertTrue(HomeMapper.map(null, new Recorder()).isEmpty());
    }

    @Test public void onlyKotlinSuspensionMarkerCountsAsSuspended() {
        assertFalse(HomeSections.isSuspended("COROUTINE_SUSPENDED"));
        assertFalse(HomeSections.isSuspended(null));
    }
}
