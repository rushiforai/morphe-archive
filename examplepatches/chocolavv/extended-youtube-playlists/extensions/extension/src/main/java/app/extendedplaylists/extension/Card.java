package app.extendedplaylists.extension;

import androidx.annotation.Nullable;

import java.nio.charset.StandardCharsets;

/** A playlist card the server sent, cloned for another playlist by swapping its strings. */
final class Card {
    /** The playlist view model, and the path from an item of the item section to it. */
    private static final int VIEW_MODEL = 202672916;
    private static final int[] CARD = {153515154, 172660663, 1, 168777401, 5, VIEW_MODEL, 16};
    /** Where the APK bundles its EML templates, and the name of the playlist card one. */
    private static final String EML = "mainapp_filegroup/_srs_resources_eml_bundle", TEMPLATE = "compact_playlist.eml_";

    private final byte[] item;
    private final String id, count, countText, thumbnail;
    /** "Обновлено вчера": only when the tab is sorted by update date. */
    @Nullable private final String updated;
    final String title, subtitle;

    private Card(byte[] item, String id, String title, String subtitle, String count, String countText,
                 String thumbnail, @Nullable String updated) {
        this.item = item;
        this.id = id;
        this.title = title;
        this.subtitle = subtitle;
        this.count = count;
        this.countText = countText;
        this.thumbnail = thumbnail;
        this.updated = updated;
    }

    /** Null when the item is not a playlist card. */
    @Nullable static Card of(byte[] item) {
        Proto p = Proto.parse(item);
        Proto card = p == null ? null : p.open(CARD);
        if (card == null) return null;
        String browseId = card.text(3, 169495254, 48687626, 2);
        String title = card.text(2, 1), subtitle = card.text(2, 2), updated = card.text(2, 3);
        String count = card.text(1, 6), countText = card.text(1, 43), thumbnail = card.text(1, 1, 1, 1);
        if (browseId == null || !browseId.startsWith("VL") || title == null || title.isEmpty() || subtitle == null
                || count == null || countText == null || thumbnail == null) return null;
        return new Card(item, browseId.substring(2), title, subtitle, count, countText, thumbnail,
                updated == null || updated.isEmpty() ? null : updated);
    }

    /** A copy of the item for another playlist. */
    byte[] clone(InnerTube.Playlist p) {
        return swap(item, p);
    }

    /**
     * An item made only from our data, for a channel whose response has no card to clone. The app
     * draws it on the card template it bundles: asset "compact_playlist.eml_<hash>" has the key
     * "compact_playlist.eml|<hash>". Without a menu the card has no three dots.
     */
    @Nullable static byte[] build(InnerTube.Playlist p, byte[] response) {
        String asset = App.asset(EML, TEMPLATE);
        String label = App.string("playlist_label");
        String theme = key(response, "theme|"), capabilities = key(response, "capabilities|");
        if (asset == null || label == null || p.owner == null || theme == null || capabilities == null) return null;
        String key = asset.substring(0, asset.lastIndexOf('_')) + "|" + asset.substring(asset.lastIndexOf('_') + 1);
        // Strings as the server writes them on its own cards: "LTT · Плейлист", "Плейлист - X - LTT - 2 видео".
        byte[] card = Proto.message(
                1, Proto.message(
                        1, Proto.message(1, Proto.message(1, p.thumbnail, 4, p.width, 5, p.height)),
                        6, p.count, 7, 1, 8, 0, 13, 1, 36, 4, 43, p.countText),
                2, Proto.message(1, p.title, 2, p.owner + " · " + label, 7, 3, 8, 1, 11, 1),
                3, Proto.message(169495254, Proto.message(48687626, Proto.message(2, "VL" + p.id))),
                5, label + " - " + p.title + " - " + p.owner + " - " + p.countText,
                10, "https://www.youtube.com/playlist?list=" + p.id);
        // Without the theme the template draws no text, and with a wrong key it draws nothing. The
        // view model config (18) names the theme and capabilities of the response.
        byte[] config = Proto.message(470784583, Proto.message(1, theme), 516665666, capabilities);
        byte[] view = Proto.message(
                3, Proto.message(172035250, Proto.message(1, key)),
                5, Proto.message(VIEW_MODEL, Proto.message(16, card, 18, config)));
        return Proto.message(153515154, Proto.message(
                172660663, Proto.message(1, Proto.message(168777401, view), 2, Proto.message(183314536, Proto.message(1, key)))));
    }

    /**
     * A resource key the response names, "theme|<hex>": every EML item of a response carries the
     * same. The key is a whole string field, so its length is the byte before it.
     */
    @Nullable private static String key(byte[] response, String prefix) {
        int at = Proto.indexOf(response, prefix.getBytes(StandardCharsets.UTF_8));
        int length = at > 0 ? response[at - 1] : -1;
        if (length <= prefix.length() || at + length > response.length) return null;
        return new String(response, at, length, StandardCharsets.UTF_8);
    }

    /** The playlist id also hides in base64 messages of the card menu; the walk opens those too. */
    private byte[] swap(byte[] item, InnerTube.Playlist p) {
        return Proto.walk(item, null, s -> {
            if (s.equals(count)) return p.count;
            String t = s.replace(id, p.id).replace(thumbnail, p.thumbnail)
                    .replace(title, p.title).replace(countText, p.countText);
            return updated == null ? t : t.replace(updated, p.updated == null ? "" : p.updated);
        });
    }
}
