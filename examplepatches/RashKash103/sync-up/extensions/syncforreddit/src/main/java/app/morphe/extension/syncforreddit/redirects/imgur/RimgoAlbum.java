package app.morphe.extension.syncforreddit.redirects.imgur;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.syncforreddit.redirects.RedirectSettings;

/**
 * What an album holds, read from a Rimgo instance rather than from Imgur.
 *
 * <p>An album's contents cannot be worked out from its id, so the page has to be read, and in a
 * region Imgur refuses there is no page to read: the album page, the embed of it and Imgur's own
 * API are all refused together. The archive still answers, but only for an album someone
 * captured, which leaves everything recent unopenable.
 *
 * <p>A Rimgo instance serves the album as a page of its own, and writes each item as
 * {@code src="/<id>.<ext>"} — its own media path. So the ids are simply there to be read, and
 * they are Imgur's own ids, which is what the rest of the app wants to be given.
 *
 * <p><b>Serving media and serving an album are two different abilities.</b> Measured across the
 * twenty-three published instances: one served an album page whole, two served media perfectly
 * while answering 403 to every album, and the rest were rate limited, refusing or gone. The
 * instance in use is chosen by whether it serves a picture, which says nothing about albums —
 * so an album is asked of each chosen instance in turn rather than of that one alone, and a
 * 403 from the one carrying the pictures is not the end of it.
 */
public final class RimgoAlbum {
    /**
     * How many instances an album is asked of before giving up.
     *
     * <p>Bounded on purpose. Each one costs a connection and up to five seconds, and this runs
     * while Sync holds the album waiting to be told what is in it — so a long list of dead
     * instances must not turn into a long wait before the archive is even tried.
     */
    private static final int MOST_INSTANCES = 3;

    /**
     * How long an instance that cannot serve albums is left out of the asking.
     *
     * <p>Without this, an instance that answers 403 to every album is asked again for the next
     * album, and the one after — two requests and up to ten seconds thrown away each time,
     * while Sync holds the album. It is not counted as failing, since it may well be serving
     * every picture in the feed; it is only known not to do albums, and that is remembered for
     * as long as anything else here is.
     */
    private static final long RESTED_FOR_MS = 5 * 60 * 1000L;

    /** When each instance last said nothing about an album. */
    private static final Map<String, Long> noAlbumsAt =
            Collections.synchronizedMap(new LinkedHashMap<String, Long>());

    private RimgoAlbum() {}

    /** @return Whether there is any point asking: Rimgo has to be on and have an instance. */
    public static boolean available() {
        return RedirectSettings.redirecting() && RedirectSettings.usingRimgo()
                && !RimgoInstances.chosen().isEmpty();
    }

    /**
     * @return Each item of the album as {@code <id>.<extension>}, in the order the page lists
     *         them, or an empty list where nothing could be read. Never throws: this is one of
     *         several ways an album is looked for, and the others are still to be tried.
     */
    public static List<String> mediaIn(String albumId) {
        if (!available()) {
            return new ArrayList<>();
        }

        for (String instance : toAsk()) {
            List<String> media = askOne(instance, albumId);
            if (media.isEmpty()) {
                noAlbumsAt.put(instance, System.currentTimeMillis());
            } else {
                noAlbumsAt.remove(instance);
            }
            if (!media.isEmpty()) {
                return media;
            }
        }
        return new ArrayList<>();
    }

    /**
     * @return The instances to ask, the one already carrying the pictures first since it is
     *         known to be answering at all, then the rest of the chosen ones in order.
     */
    private static List<String> toAsk() {
        List<String> asking = new ArrayList<>();
        String carrying = RimgoInstances.inUse();
        if (carrying != null && !resting(carrying)) {
            asking.add(carrying);
        }
        for (String each : RimgoInstances.chosen()) {
            if (asking.size() >= MOST_INSTANCES) {
                break;
            }
            if (!asking.contains(each) && !resting(each)) {
                asking.add(each);
            }
        }
        return asking;
    }

    private static boolean resting(String instance) {
        Long said = noAlbumsAt.get(instance);
        return said != null && System.currentTimeMillis() - said < RESTED_FOR_MS;
    }

    /** @return What this one instance says the album holds, empty where it says nothing. */
    private static List<String> askOne(String instance, String albumId) {
        for (String page : ImgurRoutes.rimgoAlbumPages(instance, albumId)) {
            try {
                String html = RimgoInstances.fetch(page, "text/html", instance);
                List<String> media = ImgurRoutes.mediaInRimgoAlbum(html);
                if (!media.isEmpty()) {
                    Logger.printInfo(() -> "rimgo: album " + albumId + " holds " + media.size()
                            + " item(s), read from " + page);
                    RimgoInstances.worked(instance);
                    return media;
                }
                // A page that is an error rather than an album says nothing about the
                // instance's media route, so it is not counted against it.
                Logger.printInfo(() -> "rimgo: " + page + " named no media; it is "
                        + html.length() + " characters");
            } catch (Exception ex) {
                Logger.printInfo(() -> "rimgo: could not read " + page + ": " + ex);
            }
        }
        return new ArrayList<>();
    }
}
