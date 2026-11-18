package io.github.sabopura.morphe.extension.twitch.ads;

import java.util.Map;

/** Keeps the shared list of live sessions small without dropping the stream that is playing. */
final class SessionLimit {
    interface Used {
        /** When the session's playlist was last polled; 0 when never. */
        long lastUsed();
    }

    private SessionLimit() {
    }

    /**
     * Drops the sessions polled longest ago until {@code limit} remain. The home feed opens a
     * session for every stream it previews, so age alone would push out the stream being watched;
     * that one is polled every two seconds. {@code newest} stays although nothing has polled it yet.
     */
    static <S extends Used> void trim(Map<String, S> sessions, String newest, int limit) {
        while (sessions.size() > limit) {
            String stale = null;
            long staleUsed = Long.MAX_VALUE;
            for (Map.Entry<String, S> entry : sessions.entrySet()) {
                long used = entry.getValue().lastUsed();
                if (!entry.getKey().equals(newest) && used < staleUsed) {
                    stale = entry.getKey();
                    staleUsed = used;
                }
            }
            if (stale == null) return;
            sessions.remove(stale);
        }
    }
}
