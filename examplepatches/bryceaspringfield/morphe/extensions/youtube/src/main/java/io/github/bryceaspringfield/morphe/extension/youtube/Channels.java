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

    static void learn(VideoItem item) {
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
