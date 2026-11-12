package app.spicetify.extension.spotify.localserver;

import java.io.IOException;
import java.net.URI;
import java.util.*;
import java.util.function.*;
import org.json.*;

final class Jellyfin implements ProviderSession {
    private static final int PAGE_SIZE = 500;
    private static final int MAX_TRACKS = 50000;
    private static final Set<String> AUDIO_CONTAINERS = Collections.unmodifiableSet(new HashSet<>(
            Arrays.asList("mp3", "m4a", "aac", "flac", "ogg", "oga", "opus", "wav", "mp4", "m4b")));
    private final JellyfinConnection config;
    private final JellyfinClient client;
    private final BooleanSupplier active;
    private final BiConsumer<Integer, Integer> progress;
    private final StrictRangeReader reader;
    private int skipped;

    Jellyfin(JellyfinConnection config, BooleanSupplier active) { this(config, active, (completed, total) -> {}); }
    Jellyfin(JellyfinConnection config, BooleanSupplier active, BiConsumer<Integer, Integer> progress) {
        this.config = config; this.active = active; this.progress = progress;
        client = new JellyfinClient(config.account(), active);
        reader = new StrictRangeReader(client::resolve, JellyfinClient.authorization(config.deviceId(), config.token()), active,
                JellyfinClient::checkStatus, true);
    }
    private void check(long deadline) throws IOException {
        if (!active.getAsBoolean() || Thread.currentThread().isInterrupted() || System.nanoTime() > deadline)
            throw new IOException("Jellyfin scanning was cancelled or exceeded ten minutes.");
    }
    @Override public List<RemoteTrack> scan() throws IOException {
        skipped = 0;
        long deadline = System.nanoTime() + 600_000_000_000L;
        List<RemoteTrack> tracks = new ArrayList<>(); Set<String> ids = new HashSet<>();
        int start = 0, total = -1;
        for (int page = 0; page <= MAX_TRACKS / PAGE_SIZE; page++) {
            check(deadline);
            URI endpoint = client.endpoint("Items", "userId", config.userId, "parentId", config.libraryId,
                    "recursive", "true", "includeItemTypes", "Audio", "startIndex", Integer.toString(start),
                    "limit", Integer.toString(PAGE_SIZE), "fields", "MediaSources", "sortBy", "SortName", "sortOrder", "Ascending",
                    "enableImages", "false", "enableUserData", "false");
            JSONObject result = client.request("GET", endpoint, null, config.account(), deadline);
            try {
                int count = integer(result, "TotalRecordCount", 0, MAX_TRACKS);
                if (integer(result, "StartIndex", 0, MAX_TRACKS) != start || (total >= 0 && count != total))
                    throw new IOException("The music library changed during scanning. Scan again.");
                total = count;
                JSONArray items = result.getJSONArray("Items");
                if (items.length() > PAGE_SIZE || start + items.length() > total || (items.length() == 0 && start < total))
                    throw new IOException("Jellyfin returned an incomplete music-library page.");
                for (int i = 0; i < items.length(); i++) {
                    check(deadline);
                    JSONObject item = items.getJSONObject(i);
                    String itemId = JellyfinClient.id(JellyfinClient.string(item, "Id"));
                    if (!ids.add(itemId)) throw new IOException("Jellyfin returned duplicate tracks. Scan again.");
                    RemoteTrack track = track(item, itemId);
                    if (track == null) skipped++; else tracks.add(track);
                }
                start += items.length();
                check(deadline); progress.accept(start, total); check(deadline);
                if (start == total) return Collections.unmodifiableList(tracks);
            } catch (JSONException | IllegalArgumentException ex) { throw new IOException("Jellyfin returned an invalid music-library page."); }
        }
        throw new IOException("The music library has too many pages. Choose a smaller library.");
    }
    private RemoteTrack track(JSONObject item, String itemId) throws JSONException, IOException {
        if (!"Audio".equals(JellyfinClient.string(item, "Type"))) throw new IOException("Jellyfin returned a non-audio item.");
        if (item.isNull("MediaSources")) return null;
        JSONArray sources = item.getJSONArray("MediaSources");
        if (sources.length() > 32) throw new IOException("The track has too many media sources.");
        JSONObject selected = null; String container = null, sourceId = null; long size = 0;
        for (int i = 0; i < sources.length(); i++) {
            JSONObject source = sources.getJSONObject(i);
            String extension = source.optString("Container", "").toLowerCase(Locale.ROOT);
            if (!AUDIO_CONTAINERS.contains(extension)
                    || !"File".equals(source.optString("Protocol")) || source.optBoolean("IsRemote", false)) continue;
            if (source.isNull("Size")) continue;
            long length = longInteger(source, "Size", 0, Long.MAX_VALUE);
            if (length == 0 || length > 2L * 1024 * 1024 * 1024) continue;
            if (source.isNull("Id")) continue;
            String identity = JellyfinClient.string(source, "Id");
            if (identity.isEmpty() || identity.length() > 512 || identity.chars().anyMatch(c -> c < 32 || c == 127))
                throw new IOException("The track has an invalid media source.");
            selected = source; container = extension; sourceId = identity; size = length; break;
        }
        if (selected == null) return null;
        URI stream = client.endpoint("Audio/" + itemId + "/stream", "static", "true", "mediaSourceId", sourceId);
        String title = text(item, "Name"), album = text(item, "Album");
        JSONArray artists = item.optJSONArray("Artists"); StringBuilder artist = new StringBuilder();
        if (artists != null) {
            if (artists.length() > 100) throw new IOException("A track has too many artists.");
            for (int i = 0; i < artists.length() && artist.length() < 512; i++) {
                Object name = artists.get(i);
                if (!(name instanceof String)) throw new IOException("The track has invalid artist metadata.");
                if (i > 0) artist.append(", "); artist.append((String) name);
            }
        }
        int duration = item.isNull("RunTimeTicks") ? 0
                : (int) Math.min(Integer.MAX_VALUE, longInteger(item, "RunTimeTicks", 0, Long.MAX_VALUE) / 10000000L);
        List<BrowseMetadata.ArtistCredit> artistsWithIds = credits(item, "ArtistItems");
        if (artistsWithIds.isEmpty() && artists != null) {
            for (int i = 0; i < artists.length(); i++)
                artistsWithIds.add(new BrowseMetadata.ArtistCredit("", bounded(artists.getString(i))));
        }
        List<BrowseMetadata.ArtistCredit> albumArtists = credits(item, "AlbumArtists");
        String albumArtist = shortText(item, "AlbumArtist");
        if (albumArtist.isEmpty() && !albumArtists.isEmpty()) albumArtist = albumArtists.get(0).name;
        if (albumArtist.isEmpty() && !artistsWithIds.isEmpty()) albumArtist = artistsWithIds.get(0).name;
        BrowseMetadata browse = new BrowseMetadata(optionalId(item, "AlbumId"), optionalId(item, "ParentId"),
                albumArtist, shortText(item, "AlbumPrimaryImageTag"), artistsWithIds, albumArtists,
                optionalIndex(item, "ParentIndexNumber"), optionalIndex(item, "IndexNumber"), optionalIndex(item, "ProductionYear"));
        return new RemoteTrack(config, stream, itemId, sourceId, size, text(selected, "ETag"), container,
                title, album, artist.toString(), duration, browse);
    }
    private static List<BrowseMetadata.ArtistCredit> credits(JSONObject item, String key) throws JSONException, IOException {
        List<BrowseMetadata.ArtistCredit> result = new ArrayList<>();
        if (item.isNull(key)) return result;
        JSONArray values = item.getJSONArray(key);
        if (values.length() > 100) throw new IOException("A track has too many artist credits.");
        for (int i = 0; i < values.length(); i++) {
            JSONObject value = values.getJSONObject(i);
            String name = shortText(value, "Name");
            if (!name.isEmpty()) result.add(new BrowseMetadata.ArtistCredit(optionalId(value, "Id"), name));
        }
        return result;
    }
    private static String optionalId(JSONObject item, String key) throws JSONException, IOException {
        if (item.isNull(key)) return "";
        Object value = item.get(key);
        if (!(value instanceof String)) throw new IOException("Jellyfin returned an invalid music item ID.");
        if (((String) value).isEmpty()) return "";
        return JellyfinClient.id((String) value);
    }
    private static int optionalIndex(JSONObject item, String key) throws JSONException, IOException {
        return item.isNull(key) ? 0 : integer(item, key, 0, 10000);
    }
    private static String text(JSONObject object, String key) throws JSONException, IOException {
        if (object.isNull(key)) return "";
        Object value = object.get(key);
        if (!(value instanceof String) || ((String) value).length() > 16384) throw new IOException("Jellyfin returned invalid text metadata.");
        return (String) value;
    }
    private static String shortText(JSONObject object, String key) throws JSONException, IOException {
        return bounded(text(object, key));
    }
    private static String bounded(String value) { return value.substring(0, Math.min(value.length(), 512)); }
    private static int integer(JSONObject object, String key, int min, int max) throws JSONException, IOException {
        return (int) longInteger(object, key, min, max);
    }
    private static long longInteger(JSONObject object, String key, long min, long max) throws JSONException, IOException {
        Object value = object.get(key);
        if (!(value instanceof Integer) && !(value instanceof Long)) throw new IOException("Jellyfin returned an invalid number.");
        long number = ((Number) value).longValue();
        if (number < min || number > max) throw new IOException("The music library exceeds supported limits or reports an invalid size.");
        return number;
    }
    @Override public int skippedTracks() { return skipped; }
    @Override public int read(RemoteTrack track, long offset, int size, byte[] data) throws IOException {
        if (!config.identity().equals(track.providerIdentity)) throw new IOException("This track belongs to another server library.");
        return reader.read(track.url, track.size, null, offset, size, data);
    }
}
