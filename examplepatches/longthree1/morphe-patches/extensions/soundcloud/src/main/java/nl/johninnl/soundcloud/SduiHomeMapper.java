package nl.johninnl.soundcloud;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Maps the phone Home's GraphQL SDUI payload, rather than the library banner feed. */
final class SduiHomeMapper {
    private SduiHomeMapper() {}

    static List<Object> map(Object response, HomeMapper.Items items) {
        List<Object> out = new ArrayList<>();
        Set<String> seen = new HashSet<>();
        Object sections = value(value(response, "homeSdui"), "sections");
        if (!(sections instanceof Collection)) return out;
        for (Object section : (Collection<?>) sections) {
            Object results = value(section, "results");
            add(out, value(section, "main"), items, seen);
            add(out, value(section, "mainResult"), items, seen);
            if (results instanceof Collection) {
                for (Object result : (Collection<?>) results) {
                    Object entity = value(result, "result");
                    if (entity == null) entity = result;
                    add(out, entity, items, seen);
                }
            } else {
                add(out, value(section, "result"), items, seen);
            }
        }
        return out;
    }

    private static void add(List<Object> out, Object entity, HomeMapper.Items items, Set<String> seen) {
        if (entity == null) return;
        if (entity.getClass().getName().endsWith("ApiSDUIEntity$Repost")) {
            entity = value(entity, "target");
            if (entity == null) return;
        }
        String type = entity.getClass().getName();
        boolean track = type.endsWith("ApiSDUIEntity$Track");
        boolean playlist = type.endsWith("ApiSDUIEntity$Playlist");
        boolean user = type.endsWith("ApiSDUIEntity$User");
        // Cached refs, navigation links and placeholders are not playable entity descriptions.
        if (!track && !playlist && !user) return;
        String urn = text(HomeMapper.call(value(entity, "urn"), "getContent"));
        String title = text(value(entity, track ? "trackTitle" : playlist ? "playlistTitle" : "username"));
        if (urn == null || title == null || !seen.add(urn)) return;
        Object creator = user ? entity : value(entity, track ? "trackUser" : "playlistUser");
        String subtitle = user ? null : text(value(creator, "username"));
        String artwork = text(value(entity, track ? "trackArtworkUrlTemplate" : playlist ? "playlistArtworkUrlTemplate" : "userAvatarUrlTemplate"));
        if (artwork == null) artwork = text(value(creator, "userAvatarUrlTemplate"));
        if (artwork == null) artwork = text(value(creator, "avatarUrl"));
        String id = items.mediaId(urn);
        Object item = playlist && !urn.startsWith("soundcloud:system-playlists:")
            ? items.browsable(id, title, subtitle, artwork)
            : items.playable(id, title, subtitle, artwork);
        if (item != null) {
            out.add(item);
        }
    }

    private static String text(Object value) {
        return value instanceof String && !((String) value).trim().isEmpty() ? (String) value : null;
    }

    /** Bound to the shipped JSON constructor properties at patch time; no guessed R8 names. */
    static Object value(Object owner, String property) {
        return null;
    }
}
