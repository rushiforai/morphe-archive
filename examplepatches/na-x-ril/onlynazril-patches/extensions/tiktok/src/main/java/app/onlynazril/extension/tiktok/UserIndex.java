package app.onlynazril.extension.tiktok;

import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * The two lookups that together give a reply line its handle.
 *
 * The person a comment replies to arrives without one. The comment carries their uid but no handle,
 * and the user object the app builds for their name carries neither: its uniqueId reads back as the
 * nickname, which is why stamping it produced an @ in front of a nickname. Neither lookup is sent
 * with the payload, so both are learned from what does arrive: every comment names the person it
 * replies to, and every real user rendered names their own handle against their uid.
 *
 * The nickname is the only thing the half built user carries that can join the two, so it is also
 * the weak point: two people can share one. A nickname therefore keeps every uid seen against it,
 * and answers only while a single candidate is left. With two the answer would be a guess, and a
 * guessed handle is worse than the name TikTok drew.
 *
 * Bounded on purpose: the comment list is unbounded, and only recent entries are ever asked for.
 */
public final class UserIndex {
    private static final int MAX_ENTRIES = 512;

    private static final Map<String, Set<String>> UIDS_BY_NICKNAME = new ConcurrentHashMap<>();
    private static final Map<String, String> HANDLE_BY_UID = new ConcurrentHashMap<>();

    private UserIndex() {}

    /** Called with every comment that names the person it replies to. */
    public static void learnReply(String nickname, String uid) {
        if (nickname == null || uid == null) return;
        String key = nickname.trim().toLowerCase(Locale.ROOT);
        if (key.isEmpty()) return;
        if (UIDS_BY_NICKNAME.size() >= MAX_ENTRIES) UIDS_BY_NICKNAME.clear();
        UIDS_BY_NICKNAME.computeIfAbsent(key, ignored -> ConcurrentHashMap.newKeySet()).add(uid);
    }

    /** Called with every real user, the ones a payload fills in completely. */
    public static void learnUser(String uid, String handle) {
        if (uid == null || handle == null) return;
        if (HANDLE_BY_UID.size() >= MAX_ENTRIES) HANDLE_BY_UID.clear();
        HANDLE_BY_UID.put(uid, handle);
    }

    /** The handle behind a reply name, or null when the chain is incomplete or ambiguous. */
    public static String handleOfReply(String nickname) {
        if (nickname == null) return null;
        String key = nickname.trim().toLowerCase(Locale.ROOT);
        if (key.isEmpty()) return null;
        Set<String> uids = UIDS_BY_NICKNAME.get(key);
        if (uids == null || uids.size() != 1) return null;
        return HANDLE_BY_UID.get(uids.iterator().next());
    }
}
