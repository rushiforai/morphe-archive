package app.bitchord.telegram;

import org.json.*;

import java.io.IOException;
import java.net.URI;
import java.net.URLDecoder;
import java.util.List;

/** Compatibility identifiers for the host's addon models. Never sent over a network. */
public final class InternalAddon {
    public static final String ORIGIN = "https://telegram.bitchord.invalid/";

    private InternalAddon() {}

    public static boolean reserved(String value) {
        try {
            return "telegram.bitchord.invalid".equalsIgnoreCase(new URI(value).getHost());
        } catch (Exception e) {
            return false;
        }
    }

    static URI checked(String value) throws IOException {
        try {
            URI uri = new URI(value);
            if (!"https".equals(uri.getScheme())
                    || !"telegram.bitchord.invalid".equals(uri.getRawAuthority())
                    || uri.getRawFragment() != null)
                throw new IOException("Invalid internal Telegram identifier");
            return uri;
        } catch (java.net.URISyntaxException e) {
            throw new IOException("Invalid internal Telegram identifier", e);
        }
    }

    static String route(TelegramBridge bridge, String value) throws IOException {
        URI uri = checked(value);
        String path = uri.getRawPath(), prefix = "/" + bridge.sessionTag + "/";
        if (path == null || !path.startsWith(prefix))
            throw new IOException("Telegram session changed. Search again.");
        return path.substring(prefix.length());
    }

    static TelegramBridge bridge() throws IOException {
        TelegramBridge bridge = TelegramBridge.instance;
        if (bridge == null) throw new IOException("Telegram integration is unavailable");
        return bridge;
    }

    /**
     * Runs inside the original AddonClient Dispatchers.IO block; null leaves external addons
     * untouched.
     */
    public static String bodyOrNull(String value) throws Exception {
        return reserved(value) ? body(bridge(), value) : null;
    }

    static String body(TelegramBridge bridge, String value) throws Exception {
        URI uri = checked(value);
        long generation = bridge.generation;
        String tag = bridge.sessionTag;
        String path = route(bridge, value);
        if (path.equals("manifest.json"))
            return new JSONObject()
                    .put("id", "bitchord.telegram.native")
                    .put("name", "Unofficial Telegram")
                    .put("version", "1.0.20")
                    .put("description", "Private on-device Telegram audio")
                    .put("allowDownloads", true)
                    .put("checkValidLossless", false)
                    .toString();
        bridge.requireReady();
        if (path.equals("search")) {
            String query = "";
            boolean seen = false;
            if (uri.getRawQuery() != null)
                for (String item : uri.getRawQuery().split("&")) {
                    String[] kv = item.split("=", 2);
                    if (kv[0].equals("q")) {
                        if (seen) throw new IOException("Duplicate search query");
                        seen = true;
                        query = URLDecoder.decode(kv.length == 2 ? kv[1] : "", "UTF-8");
                    }
                }
            JSONArray tracks = new JSONArray();
            List<JSONObject> rows = bridge.searchTracks(query);
            bridge.decorate(rows);
            StringBuilder found = new StringBuilder();
            for (int i = 0; i < Math.min(3, rows.size()); i++)
                found.append(i == 0 ? ": " : "; ")
                        .append(rows.get(i).optString("title"))
                        .append(" — ")
                        .append(rows.get(i).optString("artist"))
                        .append(" (")
                        .append(HostLog.length(rows.get(i).optInt("duration")))
                        .append(")");
            HostLog.d(
                    "Unofficial Telegram search '"
                            + query
                            + "' found "
                            + rows.size()
                            + (rows.size() == 1 ? " file" : " files")
                            + found);
            for (JSONObject row : rows) {
                JSONObject header = bridge.formats.get(row.getString("id"));
                JSONObject track =
                        new JSONObject()
                                .put("id", row.getString("id"))
                                .put("title", row.optString("title"))
                                .put("artist", row.optString("artist"))
                                .put("duration", duration(row, query))
                                .put("format", format(row));
                if (!row.optString("artworkURL").isEmpty())
                    track.put("artworkURL", row.getString("artworkURL"));
                // BitChord shows its own Dolby Atmos badge and ranks those copies for it.
                if (atmos(header)) track.put("atmos", true);
                String quality = bridge.reportQuality() ? quality(row, header) : "";
                if (!quality.isEmpty()) track.put("audioQuality", quality);
                tracks.put(track);
            }
            bridge.requireReady();
            if (generation != bridge.generation || !tag.equals(bridge.sessionTag))
                throw new IOException("Telegram session changed");
            return new JSONObject().put("tracks", tracks).toString();
        }
        if (path.startsWith("stream/")) {
            String id = path.substring(7);
            JSONObject row = bridge.resolveTrack(id);
            if (row == null) throw new IOException("Telegram track is unavailable");
            bridge.requireReady();
            if (generation != bridge.generation
                    || !tag.equals(bridge.sessionTag)
                    || !bridge.selected.contains(row.getLong("chat")))
                throw new IOException("Telegram selection changed");
            JSONObject header = bridge.formats.get(row.getString("id"));
            if (header == null) bridge.probeLater(row);
            JSONObject stream =
                    new JSONObject()
                            .put("url", ORIGIN + tag + "/audio/" + row.getString("id"))
                            .put("format", format(row))
                            .put("mimeType", row.optString("mime"))
                            .put("manifest", "none")
                            .put("encrypted", false);
            String codec = header == null ? "" : header.optString("codec");
            if (DolbyHeader.dolby(codec)) stream.put("codec", atmos(header) ? "eac3-joc" : codec);
            String quality = bridge.reportQuality() ? quality(row, header) : "";
            if (!quality.isEmpty()) {
                stream.put("audioQuality", quality);
                int kbps = TrackDetails.kbps(row.optLong("size"), row.optInt("duration"));
                // In bits a second: BitChord takes a value over 3,000 as that and divides it by
                // 1,000, so a hi-res FLAC's 5,000 kbps sent as kbps showed as "5 kbps".
                if (kbps > 0) stream.put("bitrate", kbps * 1000L);
            }
            if (header != null && header.optInt("bits") > 0)
                stream.put(
                                "bitDepth",
                                LosslessCheck.bits(
                                        header.optInt("bits"), LosslessCheck.of(row, header)))
                        .put("sampleRate", header.optInt("rate"));
            FileChecks checks = FileChecks.active;
            if (checks != null) checks.played(row);
            return stream.toString();
        }
        throw new IOException("Unknown internal Telegram operation");
    }

    /**
     * A row's length, or the song's when the sound check found the file is that song's recording,
     * so BitChord's length checks take it.
     */
    static int duration(JSONObject row, String query) {
        SoundCheck sound = SoundCheck.active;
        Integer song = sound == null ? null : sound.seconds(row.optString("id"), query);
        return song != null ? song : row.optInt("duration");
    }

    static String quality(JSONObject row) {
        return quality(row, null);
    }

    /**
     * As above; a header read from the file says what's inside an .m4a or .mka, so Dolby Digital
     * Plus in an .m4a isn't taken for ALAC from its bitrate, and Dolby TrueHD counts as lossless. A
     * FLAC file made from an MP3 is ranked as that MP3.
     */
    static String quality(JSONObject row, JSONObject header) {
        String codec = header == null ? "" : header.optString("codec");
        return LosslessCheck.quality(
                TrackDetails.quality(
                        codec.isEmpty() ? row.optString("format") : codec,
                        row.optString("mime"),
                        row.optLong("size"),
                        row.optInt("duration"),
                        row.optInt("bits")),
                LosslessCheck.of(row, header));
    }

    /** A Dolby Atmos file BitChord will play as Atmos; otherwise it goes as Dolby Digital Plus. */
    static boolean atmos(JSONObject header) {
        return header != null && header.optBoolean("atmos") && DolbySupport.atmosAccepted();
    }

    /**
     * The file's type for BitChord. A .ec3 file is reported as "eac3": BitChord takes "ec3" in a
     * track's type for Dolby Atmos, which only the file's header can tell.
     */
    static String format(JSONObject row) {
        String format = row.optString("format");
        return format.equalsIgnoreCase("ec3") ? "eac3" : format;
    }

    static String audioId(TelegramBridge bridge, String value) throws IOException {
        URI uri = checked(value);
        String path = route(bridge, value);
        if (uri.getRawQuery() != null || !path.startsWith("audio/"))
            throw new IOException("Invalid Telegram audio identifier");
        String id = path.substring(6);
        if (!(id.matches("-?(?:0|[1-9][0-9]*)_(?:[1-9][0-9]*)") && id.length() <= 42)
                && !ZipAlbums.validId(id))
            throw new IOException("Invalid Telegram track reference");
        return id;
    }
}
