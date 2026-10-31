package app.morphe.extension.syncforreddit.http.imgur;

import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;

/**
 * Reads the id out of an Imgur address that carries a title as well.
 *
 * <p>Imgur writes an album as <code>imgur.com/gallery/some-title-words-rE6KsRD</code>, with the
 * id on the end. Sync was written before that and takes everything up to the first dash, which
 * leaves it asking for an album called after the first word of the title. Nothing has that name,
 * so the album cannot be opened at all.
 *
 * @noinspection unused
 */
public final class ImgurIds {
    /** What an Imgur id looks like: letters and digits, and not many of them. */
    private static final Pattern AN_ID = Pattern.compile("[A-Za-z0-9]{4,12}");

    private ImgurIds() {}

    /**
     * @param value What Sync is about to take the id from.
     * @return The id where the value is a title with one on the end, and the value untouched
     *         otherwise, so that everything Sync already reads correctly is left alone.
     */
    public static String fromSlug(String value) {
        try {
            if (value == null) {
                return null;
            }
            String withoutTheRest = cutAt(cutAt(value, '#'), '?');
            int lastDash = withoutTheRest.lastIndexOf('-');
            if (lastDash < 0) {
                return value;
            }
            String ending = withoutTheRest.substring(lastDash + 1);
            return AN_ID.matcher(ending).matches() ? ending : value;
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not read the Imgur id from " + value + ": " + ex);
            return value;
        }
    }

    private static String cutAt(String value, char mark) {
        int at = value.indexOf(mark);
        return at < 0 ? value : value.substring(0, at);
    }
}
