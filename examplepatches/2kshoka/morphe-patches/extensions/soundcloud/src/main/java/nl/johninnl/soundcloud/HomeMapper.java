package nl.johninnl.soundcloud;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Converts SoundCloud's phone Home response (ApiSectionsResult) into car media items.
 *
 * The response model is read through its Jackson-retained getters, so the mapper does not
 * depend on R8-renamed methods. Sections keep their order; every item carries its section
 * title as the car group title.
 */
final class HomeMapper {
    static final int PER_SECTION = 12;
    static final int MAX_ITEMS = 120;

    /** Creates SoundCloud's own media items; implemented by the patched app bridges. */
    interface Items {
        Object playable(String mediaId, String title, String subtitle, String artwork);
        Object browsable(String mediaId, String title, String subtitle, String artwork);
        void group(Object item, String title);
        String mediaId(String urnContent);
    }

    private HomeMapper() {}

    static List<Object> map(Object result, Items items) {
        List<Object> out = new ArrayList<>();
        Object sections = call(result, "getSections");
        Object entities = call(result, "getEntities");
        if (!(sections instanceof Collection) || !(entities instanceof Map)) return out;
        Map<?, ?> byUrn = (Map<?, ?>) entities;
        Set<String> seen = new HashSet<>();
        for (Object section : (Collection<?>) sections) {
            Object data = call(section, "getData");
            Object results = call(data, "getResults");
            if (!(results instanceof Collection)) continue;
            String title = text(call(data, "getTitle"));
            if (title == null) title = text(call(data, "getSubtitle"));
            int added = 0;
            for (Object urn : (Collection<?>) results) {
                Object entity = byUrn.get(urn);
                Object item = entity == null ? null : item(call(entity, "getData"), items, seen);
                if (item == null) continue;
                if (title != null) items.group(item, title);
                out.add(item);
                if (out.size() >= MAX_ITEMS) return out;
                if (++added >= PER_SECTION) break;
            }
        }
        return out;
    }

    private static Object item(Object entity, Items items, Set<String> seen) {
        Object track = call(entity, "getTrack");
        if (track == null) track = call(call(entity, "getTrackRepost"), "getTrack");
        if (track != null) {
            String id = id(call(track, "getUrn"), items, seen);
            Object user = call(track, "getUser");
            String art = text(call(track, "getArtworkUrlTemplate"));
            if (art == null) art = text(call(user, "getAvatarUrlTemplate"));
            return id == null ? null : items.playable(id, title(call(track, "getTitle")), text(call(user, "getUsername")), art);
        }
        Object playlist = call(entity, "getPlaylist");
        if (playlist != null) {
            Object urn = call(playlist, "getUrn");
            String id = id(urn, items, seen);
            if (id == null) return null;
            Object user = call(playlist, "getUser");
            String art = text(call(playlist, "getArtworkUrlTemplate"));
            if (art == null) art = text(call(user, "getAvatarUrlTemplate"));
            String title = title(call(playlist, "getTitle"));
            String subtitle = text(call(user, "getUsername"));
            // System playlists (mixes, Daily Drops) are played directly; SoundCloud's car
            // playlist browser only resolves ordinary playlists and albums.
            return Boolean.TRUE.equals(call(urn, "isSystemPlaylist"))
                ? items.playable(id, title, subtitle, art)
                : items.browsable(id, title, subtitle, art);
        }
        Object user = call(entity, "getUser");
        if (user != null) {
            String id = id(call(user, "getUrn"), items, seen);
            return id == null ? null : items.playable(id, title(call(user, "getUsername")), null, text(call(user, "getAvatarUrlTemplate")));
        }
        return null;
    }

    private static String id(Object urn, Items items, Set<String> seen) {
        String content = text(call(urn, "getContent"));
        if (content == null || !seen.add(content)) return null;
        return items.mediaId(content);
    }

    private static String title(Object value) {
        String text = text(value);
        return text == null ? "" : text;
    }

    private static String text(Object value) {
        if (!(value instanceof String)) return null;
        String text = ((String) value).trim();
        return text.isEmpty() ? null : text;
    }

    static Object call(Object target, String name) {
        if (target == null) return null;
        try {
            Method method = target.getClass().getMethod(name);
            return method.invoke(target);
        } catch (ReflectiveOperationException | RuntimeException unavailable) {
            return null;
        }
    }
}
