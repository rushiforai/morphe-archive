package app.morphe.extension.syncforreddit.http;

import app.morphe.extension.syncforreddit.http.imgur.ImgurIds;

/**
 * Offline regression checks for reading an Imgur id out of a slug.
 *
 * <p>Imgur writes an album as a title with the id on the end, and Sync takes everything up to the
 * first dash, so it asks for an album named after the first word of the title. What is read here
 * is the ending instead, and anything that does not look like an id is left exactly as it came,
 * since handing back a guess is worse than handing back the original.
 */
public final class ImgurIdsTest {
    private static int checks;

    public static void main(String[] args) {
        // The id is what follows the last dash, where that looks like an id.
        check("abc123".equals(ImgurIds.fromSlug("some-long-title-abc123")), "Lost the id after the title");
        check("abcd".equals(ImgurIds.fromSlug("a-abcd")), "Lost the shortest id that counts");
        check("abcdefghijkl".equals(ImgurIds.fromSlug("t-abcdefghijkl")), "Lost the longest id that counts");
        check("abc123".equals(ImgurIds.fromSlug("title-abc123?utm=1")), "Did not cut the query off");
        check("abc123".equals(ImgurIds.fromSlug("title-abc123#top")), "Did not cut the fragment off");
        check("abc123".equals(ImgurIds.fromSlug("title-abc123#top?utm=1")), "Did not cut both off");

        // Anything that is not an id is handed back whole rather than guessed at.
        String[] unchanged = {
                "abc123",            // nothing to cut
                "title-abc",         // too short to be an id
                "title-abcdefghijklm", // too long to be an id
                "title-abc_123",     // not the characters an id is written in
                "title-abc-",        // nothing after the last dash
                "-",                 // a dash and nothing else
                "",                  // nothing at all
        };
        for (String slug : unchanged) {
            check(slug.equals(ImgurIds.fromSlug(slug)), "Changed a slug that is not an id: " + slug);
        }
        check(ImgurIds.fromSlug(null) == null, "Invented a slug from nothing");

        System.out.println("Passed " + checks + " Imgur id checks.");
    }

    private static void check(boolean passed, String failure) {
        if (!passed) {
            throw new AssertionError(failure);
        }
        checks++;
    }
}
