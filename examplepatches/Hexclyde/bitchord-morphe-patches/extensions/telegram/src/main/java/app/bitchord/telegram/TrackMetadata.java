package app.bitchord.telegram;

import org.drinkless.tdlib.TdApi;
import org.json.JSONObject;

import java.util.Locale;
import java.util.Set;

/** Converts TDLib messages into addon track metadata. */
public final class TrackMetadata {
    private TrackMetadata() {}

    public interface MessageLookup {
        TdApi.Message get(long chat, long message) throws Exception;
    }

    static String text(String value) {
        return value == null ? "" : value;
    }

    public static JSONObject from(TdApi.Message m) throws Exception {
        if (m == null || m.chatId == 0 || m.id <= 0 || !MediaPolicy.savable(m)) return null;
        TdApi.File file;
        String title, artist = "", name, mime;
        int duration = 0;
        boolean tagged = false;
        TdApi.Thumbnail cover = null;
        if (m.content instanceof TdApi.MessageAudio) {
            TdApi.Audio a = ((TdApi.MessageAudio) m.content).audio;
            if (a == null) return null;
            file = a.audio;
            title = text(a.title);
            artist = text(a.performer);
            name = text(a.fileName);
            mime = text(a.mimeType);
            duration = a.duration;
            tagged = !title.trim().isEmpty();
            cover = a.albumCoverThumbnail;
            if (cover == null && a.externalAlbumCovers != null)
                for (TdApi.Thumbnail external : a.externalAlbumCovers)
                    if (external != null && (cover == null || external.width > cover.width))
                        cover = external;
        } else if (m.content instanceof TdApi.MessageDocument) {
            TdApi.Document d = ((TdApi.MessageDocument) m.content).document;
            if (d == null) return null;
            file = d.document;
            name = text(d.fileName);
            mime = text(d.mimeType);
            title = "";
            cover = d.thumbnail;
            if (!name.toLowerCase(Locale.ROOT)
                    .matches(
                            ".*\\.(flac|mp3|m4a|aac|ogg|opus|wav|alac|aiff|ac3|eac3|ec3|ac4|mka)$"))
                return null;
        } else return null;
        if (file == null) return null;
        if (title.isEmpty()) title = name;
        String format =
                name.contains(".")
                        ? name.substring(name.lastIndexOf('.') + 1).toLowerCase(Locale.ROOT)
                        : "";
        JSONObject row =
                new JSONObject()
                        .put("id", m.chatId + "_" + m.id)
                        .put("chat", m.chatId)
                        .put("message", m.id)
                        .put("file", file.id)
                        .put("size", file.size)
                        .put("title", title)
                        .put("artist", artist)
                        .put("duration", duration)
                        .put("format", format)
                        .put("mime", mime)
                        .put("fileName", name)
                        .put("tagged", tagged);
        // Songs Telegram posted together as one album share this.
        if (m.mediaAlbumId != 0) row.put("mediaAlbum", m.mediaAlbumId);
        // The same for every copy of the file, in any chat: what duplicates are told apart by.
        String unique = file.remote == null ? "" : text(file.remote.uniqueId);
        if (!unique.isEmpty()) row.put("unique", unique);
        if (cover != null && cover.file != null && cover.file.id != 0) {
            String key = cover.file.remote == null ? "" : text(cover.file.remote.uniqueId);
            row.put("cover", cover.file.id)
                    .put("coverKey", key.isEmpty() ? "file" + cover.file.id : key);
        }
        return row;
    }

    public static JSONObject resolve(String id, Set<Long> selected, MessageLookup lookup)
            throws Exception {
        if (id == null || id.length() > 42 || !id.matches("-?[0-9]+_[0-9]+")) return null;
        int split = id.indexOf('_');
        long chat, message;
        try {
            chat = Long.parseLong(id.substring(0, split));
            message = Long.parseLong(id.substring(split + 1));
        } catch (NumberFormatException e) {
            return null;
        }
        if (chat == 0
                || message <= 0
                || !id.equals(chat + "_" + message)
                || !selected.contains(chat)) return null;
        TdApi.Message found = lookup.get(chat, message);
        if (!selected.contains(chat)
                || found == null
                || found.chatId != chat
                || found.id != message) return null;
        return from(found);
    }
}
