package io.github.bryceaspringfield.morphe.extension.youtube;


import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Channel IDs, handles, and names seen together in one buffer, so a rule naming a channel one way matches an item
 * stating it another way (a lockup states the ID or the handle, rarely both).
 */
final class Channels {

    private static final Map<String, String> HANDLE_BY_ID = new ConcurrentHashMap<>();
    private static final Map<String, String> ID_BY_HANDLE = new ConcurrentHashMap<>();
    private static final Map<String, String> ID_BY_NAME = new ConcurrentHashMap<>();

    private Channels() {
    }

    /** Channels seen in feeds, newest last (ID, @handle, name; any may be null), for the filter editor's suggestions. */
    private static final Map<String, String[]> SEEN = java.util.Collections.synchronizedMap(
            new java.util.LinkedHashMap<String, String[]>(128, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, String[]> e) {
                    return size() > 500;
                }
            });

    static java.util.List<String[]> seen() {
        synchronized (SEEN) {
            java.util.List<String[]> out = new java.util.ArrayList<>(SEEN.values());
            java.util.Collections.reverse(out);
            return out;
        }
    }

    static void learn(VideoItem item) {
        if (item.channelName != null || item.handle != null) {
            String key = item.channelId != null ? item.channelId : item.handle != null ? "@" + item.handle : item.channelName.toLowerCase();
            String[] old = SEEN.get(key);
            SEEN.put(key, new String[]{item.channelId,
                    item.handle != null ? item.handle : old == null ? null : old[1],
                    item.channelName != null ? VideoItem.cleanName(item.channelName) : old == null ? null : old[2]});
        }
        if (item.channelId != null && item.handle != null) {
            HANDLE_BY_ID.put(item.channelId, item.handle);
            ID_BY_HANDLE.put(item.handle, item.channelId);
        }
        if (item.channelId != null && item.channelName != null) {
            ID_BY_NAME.put(item.channelName.toLowerCase(), item.channelId);
        }
    }

    
    static String handleOf(String channelId) {
        return channelId == null ? null : HANDLE_BY_ID.get(channelId);
    }

    
    static String idOf(String handle) {
        return handle == null ? null : ID_BY_HANDLE.get(handle);
    }

    
    static String idOfName(String name) {
        return name == null ? null : ID_BY_NAME.get(name.toLowerCase());
    }
}
